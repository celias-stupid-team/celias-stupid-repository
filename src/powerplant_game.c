#include "global.h"
#include "bg.h"
#include "decompress.h"
#include "event_data.h"
#include "event_object_lock.h"
#include "event_object_movement.h"
#include "field_camera.h"
#include "field_control_avatar.h"
#include "field_player_avatar.h"
#include "field_screen_effect.h"
#include "gpu_regs.h"
#include "item.h"
#include "main.h"
#include "malloc.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "palette.h"
#include "pokedex.h"
#include "pokemon_icon.h"
#include "powerplant_game.h"
#include "random.h"
#include "scanline_effect.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "strings.h"
#include "task.h"
#include "text.h"
#include "text_window.h"
#include "window.h"
#include "constants/event_objects.h"
#include "constants/items.h"
#include "constants/rgb.h"
#include "constants/songs.h"

static void LoadPowerplantSpritesheets(void);
static void CreateMinigameSprites(u8 taskId);

static const u32 gPowerplantGameControls_Gfx[] = INCBIN_U32("graphics/powerplant_game/controls.4bpp.lz");
static const u16 gPowerplantGameControls_Pal[] = INCBIN_U16("graphics/powerplant_game/controls.gbapal");
static const u32 gPowerplantGameControls_Tilemap[] = INCBIN_U32("graphics/powerplant_game/controls.bin.lz");
static const u32 gScoreMeter_Gfx[] = INCBIN_U32("graphics/powerplant_game/score_meter_8x8.4bpp.lz");
static const u32 gScoreMeterOWBehind_Gfx[] = INCBIN_U32("graphics/powerplant_game/score_meter_ow_behind.4bpp.lz");
static const u16 sPowerplantBar_Pal[] = INCBIN_U16("graphics/powerplant_game/progress_bar.gbapal");

// palette data for the changing lights
#define LIGHTS_PAL   10 // pal that is only used for the lights metatile
#define PALETTE_SIZE 16
static u16 sOriginalPalette[PALETTE_SIZE];


static void Task_PowerplantGame(u8 taskId);
static void Task_PowerplantPauseUntilFadeIn(u8 taskId);
static void LoadPowerplantSpritesheets(void);
static void CreateControlsHUD(void);
static void CreateMinigameSprites(u8 taskId);
static void ModifyPalette(u8 taskId, u8 paletteId);
static void BackupPalette(u8 paletteId);
static void RestorePalette(u8 paletteId);
static u8 CalculateInitialScoreMeterInterval(void);
static void ChangeScoreMeterColor(u8 interval, u8 pal);
static void Task_PowerplantGame(u8 taskId);
static void Task_PowerplantPauseUntilFadeIn(u8 taskId);
static void SpriteCB_ScoreMeter(struct Sprite *sprite);
static void SpriteCB_ScoreMeterAdditional(struct Sprite *sprite);
static void SpriteCB_Other(struct Sprite *sprite);
static void SetEngineColors(u8 taskId);
static void Task_HandlePowerplantGameInput(u8 taskId);
static void HandleScore(u8 taskId);
static void Task_AskWantToQuit(u8 taskId);
static void Task_HandleConfirmQuitInput(u8 taskId);
static void Task_QuitGame(u8 taskId);
static void Task_Victory(u8 taskId);
static void Task_NoB_Button(u8 taskId);
static void UpdateOverworldProgressBar(struct Sprite *sprite, u8 current, u8 max);


// Sprite data
static const struct SpritePalette sSpritePalettes_PowerplantGame[] =
{
    {
        .data = sPowerplantBar_Pal,
        .tag = TAG_POWERPLANT_BAR
    },
    {NULL},
};

static const struct CompressedSpriteSheet sSpriteSheets_PowerplantGame[] =
{
    [SCORE_METER] = {
        .data = gScoreMeter_Gfx,
        .size = 64,
        .tag = TAG_SCORE_METER
    },
    [SCORE_METER_BACKING] = {
        .data = gScoreMeterOWBehind_Gfx,
        .size = 1024,
        .tag = TAG_SCORE_BACKING
    },
};

static const struct OamData sOam_ScoreMeterBacking =
{
    .y = DISPLAY_HEIGHT,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x32),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0,
};

static const struct OamData sOam_ScoreMeter =
{
    .y = DISPLAY_HEIGHT,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(8x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x8),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0,
};

static const struct SpriteTemplate sSpriteTemplate_ScoreMeter =
{
    .tileTag = TAG_SCORE_METER,
    .paletteTag = TAG_POWERPLANT_BAR,
    .oam = &sOam_ScoreMeter,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_ScoreMeter
};

static const struct SpriteTemplate sSpriteTemplate_ScoreMeterBacking =
{
    .tileTag = TAG_SCORE_BACKING,
    .paletteTag = TAG_POWERPLANT_BAR,
    .oam = &sOam_ScoreMeterBacking,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_Other
};


// Actual functions

// Data for Tasks
#define tFrameCounter       data[0]
#define tScoreMeterSpriteId data[1]
#define tScore              data[2]
#define tScoreDirection     data[3]
#define tGameStateBits      data[4]
#define tChargeUpColor      data[5]
#define tFlagButtonInput    data[6]
#define tColorIsDark        data[7]

// Data for all sprites
#define sTaskId             data[0]

// Data for Score Meter sprites
#define sScorePosition      data[1]
#define sScoreWinCheck      data[2]
#define sCurrColorInterval  data[3]
#define sScoreThird         data[4]
#define sTextCooldown       data[5]

#define taskData            gTasks[taskId]

void Task_InitPowerplantGame(u8 taskId)
{
    LoadSpritePalettes(sSpritePalettes_PowerplantGame);
    CreateControlsHUD();
    LoadPowerplantSpritesheets();

    CreateMinigameSprites(taskId);
    BackupPalette(LIGHTS_PAL);
    
    taskData.func = Task_PowerplantGame;
}

static void LoadPowerplantSpritesheets(void)
{
    LoadCompressedSpriteSheet(&sSpriteSheets_PowerplantGame[SCORE_METER]);
    LoadCompressedSpriteSheet(&sSpriteSheets_PowerplantGame[SCORE_METER_BACKING]);
}

static const struct WindowTemplate sWindowTemplate_AskQuit =
{
    .bg = 0,
    .tilemapLeft = 24,
    .tilemapTop = 9,
    .width = 5,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x0260
};

#define spriteData  gSprites[spriteId]

static void CreateControlsHUD(void)
{
    void *tilemapBuffer;
    u32 size = 0;

    tilemapBuffer = MallocAndDecompress(gPowerplantGameControls_Gfx, &size);
    CopyToBgTilemapBuffer(0, gPowerplantGameControls_Tilemap, 0, 0);
    CopyBgTilemapBufferToVram(0);
    LoadPalette(gPowerplantGameControls_Pal, BG_PLTT_ID(13), PLTT_SIZE_4BPP);
    LoadBgTiles(0, tilemapBuffer, size, 0);
}

static void CreateMinigameSprites(u8 taskId)
{
    u8 spriteId;
    u8 y, y2;
    u8 i;
    u8 sections = NUM_SCORE_SECTIONS;

    // Create score meter sprite.
    taskData.tScore = STARTING_SCORE; // Set the starting score.
    y = SCORE_SECTION_Y;
    y2 = y + 12; //backing sprite is 16px high, progress sprite only 8px
   
    spriteId = CreateSprite(&sSpriteTemplate_ScoreMeter, SCORE_SECTION_INIT_X, y2, 0);
    spriteData.sTaskId = taskId;
    spriteData.sScorePosition = (taskData.tScore / SCORE_INTERVAL);
    spriteData.sScoreThird = (spriteData.sScorePosition / SCORE_THIRD_SIZE);
    spriteData.sCurrColorInterval = CalculateInitialScoreMeterInterval();
    taskData.tScoreMeterSpriteId = spriteId;

    // Create enough score meter sprites to fill the whole score area.
    if (SCORE_AREA_WIDTH > SCORE_SECTION_WIDTH)
    {
        if (((SCORE_AREA_WIDTH * 100) % SCORE_SECTION_WIDTH) > 0)
            sections++;

        for (i = 0; i <= (sections - 1); i++)
        {
            spriteId = CreateSprite(&sSpriteTemplate_ScoreMeter, (SCORE_SECTION_LAST_X - (SCORE_SECTION_WIDTH * i)), y2, 0);
            spriteData.callback = SpriteCB_ScoreMeterAdditional;
            spriteData.sTaskId = taskId;
            // make invisible to reflect current score
            if (i < (NUM_SCORE_SECTIONS - SCORE_CURRENT_SECTION))
                spriteData.invisible = TRUE;
        }
    }
            
    // Create gray sprites as backing to score meter in OW.
    for (i = 1; i <= 2; i++)
    {
        spriteId = CreateSprite(&sSpriteTemplate_ScoreMeterBacking, ((64 * i) + 24), y, 3);
        spriteData.sTaskId = taskId;
    }
}

static void ModifyPalette(u8 taskId, u8 paletteId)
{
    u16 offset = PLTT_ID(paletteId);

    // Get pointers to the palette in both internal and hardware buffers
    u16* unfaded = &gPlttBufferUnfaded[offset];
    u16* faded   = &gPlttBufferFaded[offset];
    u16* vram    = &((u16*)BG_PLTT)[offset];

    if (taskData.tChargeUpColor == CHARGE_UP_COLOR_BLUE_A)
    {
        if (taskData.tColorIsDark)
        {
            unfaded[12] = RGB(6, 11, 20);
            unfaded[13] = RGB(3, 19, 31);
            unfaded[14] = RGB(12, 25, 31);
            unfaded[15] = RGB(19, 28, 31);
        }
        else
        {
            unfaded[12] = RGB(4, 9, 15);
            unfaded[13] = RGB(2, 15, 23);
            unfaded[14] = RGB(9, 18, 23);
            unfaded[15] = RGB(15, 21, 23);
        }
    }
    else
    {
        if (taskData.tColorIsDark)
        {
            unfaded[12] = RGB(7, 16, 8);
            unfaded[13] = RGB(6, 25, 5);
            unfaded[14] = RGB(7, 30, 11);
            unfaded[15] = RGB(21, 31, 22);
        }
        else
        {
            unfaded[12] = RGB(5, 13, 6);
            unfaded[13] = RGB(5, 20, 3);
            unfaded[14] = RGB(9, 23, 10);
            unfaded[15] = RGB(16, 23, 16);
        }
    }

    faded[12] = unfaded[12];
    faded[13] = unfaded[13];
    faded[14] = unfaded[14];
    faded[15] = unfaded[15];

    vram[12] = unfaded[12];
    vram[13] = unfaded[13];
    vram[14] = unfaded[14];
    vram[15] = unfaded[15];
}

static void BackupPalette(u8 paletteId)
{
    CpuCopy16(&((u16*)BG_PLTT)[paletteId * PALETTE_SIZE], sOriginalPalette, PALETTE_SIZE * sizeof(u16));
}

static void RestorePalette(u8 paletteId)
{
    u16 offset = PLTT_ID(paletteId);

    // Restore to game engine buffers
    CpuCopy16(sOriginalPalette, &gPlttBufferUnfaded[offset], PALETTE_SIZE * sizeof(u16));
    CpuCopy16(sOriginalPalette, &gPlttBufferFaded[offset], PALETTE_SIZE * sizeof(u16));

    // Restore to hardware VRAM (optional for immediate redraw)
    CpuCopy16(sOriginalPalette, &((u16 *)BG_PLTT)[offset], PALETTE_SIZE * sizeof(u16));
}

#define palStart       OBJ_PLTT_ID(IndexOfSpritePaletteTag(TAG_POWERPLANT_BAR))

static u8 CalculateInitialScoreMeterInterval(void)
{
    u8 i;
    u8 startColorInterval = 0;
    u8 r = 31; // Max out the red level.
    u8 g = 0;

    for (i = 0; i <= (STARTING_SCORE / SCORE_INTERVAL); i += SCORE_COLOR_INTERVAL) // Set the starting color interval based on the starting score.
    {
        startColorInterval++;
    }

    if (startColorInterval < (NUM_COLOR_INTERVALS / 2)) // If the starting score interval is less than half of the total number of intervals.
    {
        g = (startColorInterval); // Set the green level to match the interval.
    }
    else
    {
        g = 31; // Max out the green level.
        r -= (startColorInterval - (NUM_COLOR_INTERVALS / 2)); // Set the red level to match the interval.
    }

    FillPalette(RGB(r, g, 0), (palStart + SCORE_COLOR_NUM), PLTT_SIZEOF(1)); // Set the score meter palette to the new color value.

    return startColorInterval;
}

static void ChangeScoreMeterColor(u8 interval, u8 pal)
{
    u8 r = 31;
    u8 g = 0;

    if (interval > NUM_COLOR_INTERVALS) // Cannot exceed the maximum color interval.
        interval = NUM_COLOR_INTERVALS;

    if (interval <= (NUM_COLOR_INTERVALS / 2)) // If the score meter is less than half full.
    {
        g = (interval - 1); // Set the green level to match the interval.
    }
    else
    {
        g = 31; // Max out the green level.
        r -= ((interval - 1) - (NUM_COLOR_INTERVALS / 2)); // Set the red level to match the interval.
    }

    FillPalette(RGB(r, g, 0), (palStart + pal), PLTT_SIZEOF(1)); // Set the score meter palette to the new color value.
}


// Task handling

static void Task_PowerplantGame(u8 taskId)
{
    taskData.func = Task_PowerplantPauseUntilFadeIn;
}

static void Task_PowerplantPauseUntilFadeIn(u8 taskId)
{
    RunTextPrinters();

    if (taskData.tFrameCounter == OW_PAUSE_BEFORE_START)
    {
        taskData.tGameStateBits &= ~FG_PAUSED;
        taskData.func = Task_HandlePowerplantGameInput;
        taskData.tFrameCounter = 0;
        taskData.tFlagButtonInput = FALSE;
    }
    taskData.tFrameCounter++;
}

static void SetEngineColors(u8 taskId)
{
    if (taskData.tFrameCounter % COLOR_SWITCH_FRAMES == 0) // change colors every x frames
    {
        u8 random = Random() % 2;

        // force an early green light if the player doesn't have the B button yet

        if (taskData.tFrameCounter < COLOR_SWITCH_FRAMES * 2) //&& taskData.tFrameCounter % 300
            random = 1;
        if (taskData.tFrameCounter == COLOR_SWITCH_FRAMES * 2) //&& taskData.tFrameCounter % 300
            random = 0;
        

        if (random && taskData.tChargeUpColor == CHARGE_UP_COLOR_GREEN_B && CheckBagHasItem(ITEM_EVERSTONE, 1))
        {
            ModifyPalette(taskId, LIGHTS_PAL);
            taskData.tChargeUpColor = CHARGE_UP_COLOR_BLUE_A;
        }
        else if (!random && taskData.tChargeUpColor == CHARGE_UP_COLOR_BLUE_A)
        {
            ModifyPalette(taskId, LIGHTS_PAL);
            taskData.tChargeUpColor = CHARGE_UP_COLOR_GREEN_B;
        }
    }

    if (taskData.tFrameCounter % COLOR_BLINKING_FRAMES == 0) // update pal for pulse effect
    {
        ModifyPalette(taskId, LIGHTS_PAL);

        if (taskData.tColorIsDark)
            taskData.tColorIsDark = FALSE;
        else
            taskData.tColorIsDark = TRUE;
    }
}

static void Task_HandlePowerplantGameInput(u8 taskId)
{
    RunTextPrinters();
    SetEngineColors(taskId);

    if (JOY_NEW(START_BUTTON))
    {
        taskData.tGameStateBits |= FG_PAUSED; // Pause/Unpause the game.
        taskData.func = Task_AskWantToQuit;
    }

    if (taskData.tFlagButtonInput == FALSE) // only consider button input once every x frames
    {
        s8 increment = 0;

        if (JOY_NEW(A_BUTTON))
        {
            if (taskData.tChargeUpColor == CHARGE_UP_COLOR_BLUE_A)
            {
                PlaySE(SE_SUCCESS);
                increment = SCORE_INCREASE;
            }
            else
            {
                
                PlaySE(SE_BOO);
                //increment = SCORE_DECREASE;
                
            }

            taskData.tFlagButtonInput = TRUE;
        }

        if (JOY_NEW(B_BUTTON))
        {
            if (CheckBagHasItem(ITEM_EVERSTONE, 1))
            {
                if (taskData.tChargeUpColor == CHARGE_UP_COLOR_GREEN_B)
                {
                    PlaySE(SE_SUCCESS);
                    increment = SCORE_INCREASE;
                }
                else
                {
                    
                    PlaySE(SE_BOO);
                    //increment = SCORE_DECREASE;
                    
                }

                taskData.tFlagButtonInput = TRUE;
            }
            else
            {
                if (taskData.tChargeUpColor == CHARGE_UP_COLOR_GREEN_B)
                {
                    ClearDialogWindowAndFrame(0, TRUE);
                    taskData.func = Task_NoB_Button;   

                    
                }
            }
        }

        if (taskData.tScore < SCORE_MAX)
        {
            if ((taskData.tScore + increment) > SCORE_MAX)
            {
                taskData.tScore = SCORE_MAX;
            }
            else if ((taskData.tScore + increment) < 0)
            {
                taskData.tScore = 0;
            }
            else
            {
                taskData.tScore += increment;
            }
        }
    }

    if (!(taskData.tGameStateBits & FG_PAUSED))
    {
        taskData.tFrameCounter++;

        // reset button input flag
        if (taskData.tFrameCounter % SCORE_INPUT_FRAME_OFFSET == 0)
            taskData.tFlagButtonInput = FALSE;
    }

    HandleScore(taskId);
}

static void HandleScore(u8 taskId)
{
    if (taskData.tScore >= SCORE_MAX) // If the score goal has been achieved.
    {
        taskData.tGameStateBits |= FG_PAUSED; // Freeze all sprite animations/movements.
        taskData.tFrameCounter = 0; // Reset the frame counter.
        taskData.func = Task_Victory;
    }

    if (taskData.tScore <= 0) // If the score has hit 0.
    {
        taskData.tGameStateBits |= FG_PAUSED; // Freeze all sprite animations/movements.
        taskData.tFrameCounter = 0; // Reset the frame counter.
        taskData.func = Task_QuitGame;
    }
}

static void Task_AskWantToQuit(u8 taskId)
{
    LoadMessageBoxAndFrameGfx(0, TRUE);
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    AddTextPrinterParameterized(0, FONT_NORMAL, sText_WantToQuit, 0, 1, 1, NULL); // Ask to quit the game.
    RunTextPrinters();
    CreateYesNoMenu(&sWindowTemplate_AskQuit, FONT_NORMAL, 0, 2, 0x2A8, 14, 0);
    taskData.func = Task_HandleConfirmQuitInput;
}

static void Task_HandleConfirmQuitInput(u8 taskId)
{
    RunTextPrinters();
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0:  // YES
        ClearDialogWindowAndFrame(0, TRUE);
        PlaySE(SE_FLEE);
        taskData.func = Task_QuitGame;
        break;
    case 1:  // NO
    case MENU_B_PRESSED:
        ClearDialogWindowAndFrame(0, TRUE);
        PlaySE(SE_SELECT);
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        CreateControlsHUD();
        taskData.tGameStateBits &= ~FG_PAUSED; // Unpause the game.
        taskData.func = Task_HandlePowerplantGameInput;
        break;
    }
}

static void Task_QuitGame(u8 taskId)
{
    VarSet(VAR_CSR_TURNED_ON_POWER, POWER_OFF);
    
    RunTextPrinters();
    if (!gPaletteFade.active) // If the screen has fully faded to black.
    {
        void *blankTileBuffer = AllocZeroed(0x800);
        
        if (blankTileBuffer == NULL)
            return; // Safety check in case memory allocation fails
        LoadBgTiles(0, blankTileBuffer, 0x800, 0); // Load to tile offset 0
        Free(blankTileBuffer);
        FillBgTilemapBufferRect(0, 0, 0, 0, 32, 32, 0);
        CopyBgTilemapBufferToVram(0);

        //restore pal for lights metatile
        RestorePalette(LIGHTS_PAL);

        gFieldCallback2 = NULL;
        taskData.tGameStateBits |= FG_GAME_ENDED;
        taskData.func = Task_PowerplantGame;

        if (!IsTextPrinterActive(0))
        {
            gPlayerAvatar.preventStep = FALSE;
            UnlockPlayerFieldControls();
            UnfreezeObjectEvents();
            ClearDialogWindowAndFrame(0, TRUE);
            DestroyTask(FindTaskIdByFunc(Task_PowerplantGame));
            ScriptContext_Enable();
        }
    }
}

static void Task_Victory(u8 taskId)
{
    VarSet(VAR_CSR_TURNED_ON_POWER, POWER_ON);

    RunTextPrinters();
    if (!gPaletteFade.active) // If the screen has fully faded to black.
    {
        void *blankTileBuffer = AllocZeroed(0x800);
        
        if (blankTileBuffer == NULL)
            return; // Safety check in case memory allocation fails
        LoadBgTiles(0, blankTileBuffer, 0x800, 0); // Load to tile offset 0
        Free(blankTileBuffer);
        FillBgTilemapBufferRect(0, 0, 0, 0, 32, 32, 0);
        CopyBgTilemapBufferToVram(0);

        //restore pal for lights metatile
        RestorePalette(LIGHTS_PAL);

        gFieldCallback2 = NULL;
        taskData.tGameStateBits |= FG_GAME_ENDED;
        taskData.func = Task_PowerplantGame;

        if (!IsTextPrinterActive(0))
        {
            gPlayerAvatar.preventStep = FALSE;
            UnlockPlayerFieldControls();
            UnfreezeObjectEvents();
            ClearDialogWindowAndFrame(0, TRUE);
            DestroyTask(FindTaskIdByFunc(Task_PowerplantGame));
            ScriptContext_Enable();
        }
    }
}

static void Task_NoB_Button(u8 taskId, u8 musicDelay)
{
    VarSet(VAR_CSR_TURNED_ON_POWER, NO_B_BUTTON);
    
    Overworld_ChangeMusicTo(MUS_NONE);

    RunTextPrinters();
    if (!gPaletteFade.active) // If the screen has fully faded to black.
    {
        void *blankTileBuffer = AllocZeroed(0x800);
        
        if (blankTileBuffer == NULL)
            return; // Safety check in case memory allocation fails
        LoadBgTiles(0, blankTileBuffer, 0x800, 0); // Load to tile offset 0
        Free(blankTileBuffer);
        FillBgTilemapBufferRect(0, 0, 0, 0, 32, 32, 0);
        CopyBgTilemapBufferToVram(0);

        //restore pal for lights metatile
        RestorePalette(LIGHTS_PAL);

        gFieldCallback2 = NULL;
        taskData.tGameStateBits |= FG_GAME_ENDED;
        taskData.func = Task_PowerplantGame;

        if (!IsTextPrinterActive(0))
        {
            gPlayerAvatar.preventStep = FALSE;
            UnlockPlayerFieldControls();
            UnfreezeObjectEvents();
            ClearDialogWindowAndFrame(0, TRUE);
            DestroyTask(FindTaskIdByFunc(Task_PowerplantGame));
            ScriptContext_Enable();
        }
    }
}


// Sprite Callbacks

static void SpriteCB_ScoreMeter(struct Sprite *sprite)
{
    if (gTasks[sprite->sTaskId].tGameStateBits & FG_GAME_ENDED)
    {
        DestroySpriteAndFreeResources(sprite);
        return;
    }

    if (gTasks[sprite->sTaskId].tScore <= 0 && sprite->sScorePosition > 0) // If the current score is 0.
    {
        sprite->sScorePosition = 0;
        sprite->x2--; // Move the score meter out of the score area.
        sprite->invisible = TRUE;
    }
    else
        sprite->invisible = FALSE;

    if (gTasks[sprite->sTaskId].tGameStateBits & FG_PAUSED) // Don't do anything if paused.
        return;

    if (gTasks[sprite->sTaskId].tScore > (sprite->sScorePosition * SCORE_INTERVAL)) // If the current score has increased to a greater score interval.
    {
        sprite->sScorePosition++;
        sprite->x2++; // Increase the score meter's location by one pixel.
    }
    else if (gTasks[sprite->sTaskId].tScore < ((sprite->sScorePosition - 1) * SCORE_INTERVAL)) // If the current score has decreased to a lower score interval.
    {
        sprite->sScorePosition--;
        sprite->x2--; // Decrease the score meter's location by one pixel.
    }

    if (sprite->sScorePosition > ((sprite->sCurrColorInterval * SCORE_COLOR_INTERVAL) - 1)) // If the score meter has gone above the current color interval.
    {
        sprite->sCurrColorInterval++; // Increase the color interval by 1.
        ChangeScoreMeterColor(sprite->sCurrColorInterval, SCORE_COLOR_NUM); // Change the score meter palette to reflect the change in color interval.
    }
    else if (sprite->sScorePosition < ((sprite->sCurrColorInterval - 1) * SCORE_COLOR_INTERVAL)) // If the score meter has gone below the current color interval.
    {
        sprite->sCurrColorInterval--; // Decrease the color interval by 1.
        ChangeScoreMeterColor(sprite->sCurrColorInterval, SCORE_COLOR_NUM); // Change the score meter palette to reflect the change in color interval.
    }

    if (sprite->sScorePosition >= ((sprite->sScoreThird + 1) * SCORE_THIRD_SIZE)) // If the score position has gone above the current score third.
    {
        if (sprite->sScoreThird < 2) // If the score third isn't already at the maximum.
        {
            sprite->sScoreThird++; // Increase the score third by one.
        }
    }
    else if (sprite->sScorePosition < (((sprite->sScoreThird + 1) * SCORE_THIRD_SIZE) - SCORE_THIRD_SIZE)) // If the score position has gone below the current score third.
    {
        if (sprite->sScoreThird > 0) // If the score third isn't already at the minimum.
        {
            sprite->sScoreThird--; // Decrease the score third by one.
        }
    }
    if (sprite->sTextCooldown != 0) // If the text cooldown counter is active.
        sprite->sTextCooldown--; // Decrease the text cooldown counter by 1.
}

static void SpriteCB_ScoreMeterAdditional(struct Sprite *sprite)
{
    if (gTasks[sprite->sTaskId].tGameStateBits & FG_GAME_ENDED)
    {
        DestroySpriteAndFreeResources(sprite);
        return;
    }
    if (!(gTasks[sprite->sTaskId].tGameStateBits & FG_PAUSED)) // Don't do anything if paused.
    {
        if (sprite->x >= ((gSprites[gTasks[sprite->sTaskId].tScoreMeterSpriteId].x) + (gSprites[gTasks[sprite->sTaskId].tScoreMeterSpriteId].x2)))
            sprite->invisible = TRUE;
        else
            sprite->invisible = FALSE;
    }
}

static void SpriteCB_Other(struct Sprite *sprite)
{
    if (gTasks[sprite->sTaskId].tGameStateBits & FG_GAME_ENDED)
    {
        DestroySpriteAndFreeResources(sprite);
        return;
    }
}

static void UpdateOverworldProgressBar(struct Sprite *sprite, u8 current, u8 max)
{
    u8 fillTiles = (current * NUM_SCORE_SECTIONS) / max;
    int i;

    for (i = 0; i < NUM_SCORE_SECTIONS; i++)
    {
        sprite->invisible = (i >= fillTiles);
    }
}
