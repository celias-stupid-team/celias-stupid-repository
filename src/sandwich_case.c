#include "global.h"
#include "malloc.h"
#include "bg.h"
#include "decompress.h"
#include "gpu_regs.h"
#include "palette.h"
#include "text.h"
#include "sandwich_case.h"
#include "item_menu.h"
#include "menu_helpers.h"
#include "new_menu_helpers.h"
#include "scanline_effect.h"
#include "item_menu_icons.h"
#include "list_menu.h"
#include "graphics.h"
#include "item.h"
#include "text_window.h"
#include "strings.h"
#include "string_util.h"
#include "sound.h"
#include "menu.h"
#include "event_data.h"
#include "constants/items.h"
#include "constants/songs.h"
#include "constants/flags.h"

#define SANDWICH_CASE_NUM_INGREDIENTS 6

struct SandwichCaseResources
{
    void (*exitCallback)(void);
    u8  listMenuMaxShowed;
    u8  ingredientSpriteIds[SANDWICH_CASE_NUM_INGREDIENTS];
    u8  itemIconSpriteId;
    u8  ALIGNED(4) bg1TilemapBuffer[BG_SCREEN_SIZE];
    s16 data[4];
};

struct SandwichCaseState
{
    void (*savedCallback)(void);
    u16 listMenuSelectedRow;
    u16 listMenuScrollOffset;
};

static EWRAM_DATA struct SandwichCaseResources *sResources = NULL;
static EWRAM_DATA struct SandwichCaseState sState = {};
static EWRAM_DATA struct ListMenuItem *sListItems = NULL;
static EWRAM_DATA u8 *sListStrbuf = NULL;
static EWRAM_DATA u8 sSpriteId = 0;

static void CB2_InitSandwichCase(void);
static bool8 RunSandwichCaseInit(void);
static void SandwichCaseInitBgs(void);
static bool8 SandwichCaseLoadGfx(void);
static bool8 AllocateSandwichCaseListBuffers(void);
static void SetUpSandwichCaseListMenu(void);
static void SandwichCaseMoveCursorFunc(s32 itemIndex, bool8 onInit, struct ListMenu *list);
static void SandwichCaseItemPrintFunc(u8 windowId, u32 itemId, u8 y);
static void PrintSandwichCaseHeader(void);
static void PrintSandwichCaseDescription(s32 itemIdx);
static void SandwichCaseInitWindows(void);
static void SandwichCasePrint(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx);
static void SandwichCase_DestroyResources(void);
static void Task_SandwichCaseFadeOutCallback(u8 taskId);
static void Task_SandwichCaseMain(u8 taskId);
static void SandwichCase_StartFadeToExitCallback(u8 taskId);
static void CreateSandwichCaseSprite(void);
static void CreateIngredientSprites(void);
static void StartSandwichCaseSpriteWobbleAnim(void);
static void SpriteCB_SandwichCaseWaitWobbleAnim(struct Sprite *sprite);
static void AbortSandwichCaseLoading(void);
static void Task_AbortSandwichCaseLoading_WaitFade(u8 taskId);

static const u16 sSandwichFlags[SANDWICH_CASE_NUM_INGREDIENTS] = {
    FLAG_SANDWICH_GOT_BREAD,
    FLAG_SANDWICH_GOT_SESAME_SEED,
    FLAG_SANDWICH_GOT_MEAT,
    FLAG_SANDWICH_GOT_CHEESE,
    FLAG_SANDWICH_GOT_LETTUCE,
    FLAG_SANDWICH_GOT_PICKLES,
};

static const u8 sSandwichName_Bread[]      = _("BREAD");
static const u8 sSandwichName_SesameSeeds[] = _("SESAME SEED");
static const u8 sSandwichName_Meat[]       = _("MEAT");
static const u8 sSandwichName_Cheese[]     = _("CHEESE");
static const u8 sSandwichName_Lettuce[]    = _("LETTUCE");
static const u8 sSandwichName_Pickles[]    = _("PICKLES");

static const u8 * const sSandwichIngredientNames[SANDWICH_CASE_NUM_INGREDIENTS] = {
    sSandwichName_Bread,
    sSandwichName_SesameSeeds,
    sSandwichName_Meat,
    sSandwichName_Cheese,
    sSandwichName_Lettuce,
    sSandwichName_Pickles,
};

// Text colors: { bg/transparent, fg, shadow }
static const u8 sTextColors[][3] = {
    { TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GRAY,  TEXT_COLOR_LIGHT_GRAY  },
    { TEXT_COLOR_TRANSPARENT, TEXT_COLOR_WHITE,      TEXT_COLOR_DARK_GRAY   },
    { TEXT_COLOR_TRANSPARENT, TEXT_COLOR_LIGHT_GRAY, TEXT_COLOR_DARK_GRAY   },
    { TEXT_COLOR_TRANSPARENT, TEXT_COLOR_GREEN,      TEXT_COLOR_LIGHT_GREEN },
};

static const u8 sText_CheckMark[] = _("OK");
static const u8 * const sSandwichIngredientDescriptions[SANDWICH_CASE_NUM_INGREDIENTS] = {
    gText_IngredientBread,
    gText_IngredientSesameSeed,
    gText_IngredientMeat,
    gText_IngredientCheese,
    gText_IngredientLettuce,
    gText_IngredientPickles,
};
static const u8 * const sSandwichIngredientDescriptionsObtained[SANDWICH_CASE_NUM_INGREDIENTS] = {
    gText_IngredientBreadObtained,
    gText_IngredientSesameSeedObtained,
    gText_IngredientMeatObtained,
    gText_IngredientCheeseObtained,
    gText_IngredientLettuceObtained,
    gText_IngredientPicklesObtained,
};

static const struct BgTemplate sBgTemplates[] = {
    {
        .bg             = 0,
        .charBaseIndex  = 0,
        .mapBaseIndex   = 31,
        .screenSize     = 0,
        .paletteMode    = 0,
        .priority       = 1,
        .baseTile       = 0x000
    }, {
        .bg             = 1,
        .charBaseIndex  = 3,
        .mapBaseIndex   = 30,
        .screenSize     = 0,
        .paletteMode    = 0,
        .priority       = 2,
        .baseTile       = 0x000
    }, {
        .bg             = 2,
        .charBaseIndex  = 0,
        .mapBaseIndex   = 29,
        .screenSize     = 0,
        .paletteMode    = 0,
        .priority       = 0,
        .baseTile       = 0x000
    }
};

static const struct WindowTemplate sWindowTemplates[] = {
    // scrollable list
    {
        .bg         = 0,
        .tilemapLeft = 11,
        .tilemapTop  = 1,
        .width      = 18,
        .height     = 14,
        .paletteNum = 15,
        .baseBlock  = 0x027
    },
    // descriptions
    {
        .bg         = 0,
        .tilemapLeft = 5,
        .tilemapTop  = 16,
        .width      = 25,
        .height     = 4,
        .paletteNum = 15,
        .baseBlock  = 0x123
    },
    // header
    {
        .bg         = 2,
        .tilemapLeft = 1,
        .tilemapTop  = 1,
        .width      = 9,
        .height     = 2,
        .paletteNum = 15,
        .baseBlock  = 0x187
    },
    DUMMY_WIN_TEMPLATE
};

static const struct OamData sOamData = {
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .shape      = ST_OAM_SQUARE,
    .size       = ST_OAM_SIZE_3,
    .priority   = 1
};

static const struct OamData sOamData_IngredientIcon = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .shape      = ST_OAM_SQUARE,
    .size       = ST_OAM_SIZE_2,
    .priority   = 1
};

static const union AnimCmd sAnimCmd[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

static const union AnimCmd *const sAnimTable[] = {
    sAnimCmd
};

static const union AffineAnimCmd sAffineAnim_Static[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_Wobble[] = {
    AFFINEANIMCMD_FRAME(0, 0, -2, 2),
    AFFINEANIMCMD_FRAME(0, 0,  2, 4),
    AFFINEANIMCMD_FRAME(0, 0, -2, 4),
    AFFINEANIMCMD_FRAME(0, 0,  2, 2),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnimTable[] = {
    sAffineAnim_Static,
    sAffineAnim_Wobble
};

static const struct CompressedSpriteSheet sSpriteSheet = {
    gSandwichCaseSpriteTiles, 0x800, TAG_SANDWICH_CASE
};

static const struct CompressedSpritePalette sSpritePal = {
    gSandwichCaseSpritePalette, TAG_SANDWICH_CASE
};

static const struct SpriteTemplate sSpriteTemplate_SandwichCase = {
    TAG_SANDWICH_CASE, TAG_SANDWICH_CASE,
    &sOamData, sAnimTable, NULL, sAffineAnimTable,
    SpriteCallbackDummy
};

static const struct CompressedSpriteSheet sIngredientSpriteSheets[SANDWICH_CASE_NUM_INGREDIENTS] = {
    { gSCSpriteSheet_Bread,   0x120, TAG_SC_INGREDIENT_BREAD   },
    { gSCSpriteSheet_Sesame,  0x120, TAG_SC_INGREDIENT_SESAME  },
    { gSCSpriteSheet_Meat,    0x120, TAG_SC_INGREDIENT_MEAT    },
    { gSCSpriteSheet_Cheese,  0x120, TAG_SC_INGREDIENT_CHEESE  },
    { gSCSpriteSheet_Lettuce, 0x120, TAG_SC_INGREDIENT_LETTUCE },
    { gSCSpriteSheet_Pickles, 0x120, TAG_SC_INGREDIENT_PICKLES },
};

static const struct CompressedSpritePalette sIngredientSpritePals[SANDWICH_CASE_NUM_INGREDIENTS] = {
    { gSCSpritePal_Bread,   TAG_SC_INGREDIENT_BREAD   },
    { gSCSpritePal_Sesame,  TAG_SC_INGREDIENT_SESAME  },
    { gSCSpritePal_Meat,    TAG_SC_INGREDIENT_MEAT    },
    { gSCSpritePal_Cheese,  TAG_SC_INGREDIENT_CHEESE  },
    { gSCSpritePal_Lettuce, TAG_SC_INGREDIENT_LETTUCE },
    { gSCSpritePal_Pickles, TAG_SC_INGREDIENT_PICKLES },
};

static const struct SpriteTemplate sSpriteTemplates_Ingredients[SANDWICH_CASE_NUM_INGREDIENTS] = {
    { TAG_SC_INGREDIENT_BREAD,   TAG_SC_INGREDIENT_BREAD,   &sOamData_IngredientIcon, sAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy },
    { TAG_SC_INGREDIENT_SESAME,  TAG_SC_INGREDIENT_SESAME,  &sOamData_IngredientIcon, sAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy },
    { TAG_SC_INGREDIENT_MEAT,    TAG_SC_INGREDIENT_MEAT,    &sOamData_IngredientIcon, sAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy },
    { TAG_SC_INGREDIENT_CHEESE,  TAG_SC_INGREDIENT_CHEESE,  &sOamData_IngredientIcon, sAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy },
    { TAG_SC_INGREDIENT_LETTUCE, TAG_SC_INGREDIENT_LETTUCE, &sOamData_IngredientIcon, sAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy },
    { TAG_SC_INGREDIENT_PICKLES, TAG_SC_INGREDIENT_PICKLES, &sOamData_IngredientIcon, sAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy },
};

// ### actual functions ###

void InitSandwichCase(void (*savedCallback)(void))
{
    u8 i;

    sResources = Alloc(sizeof(struct SandwichCaseResources));
    if (sResources == NULL)
    {
        SetMainCallback2(savedCallback);
        return;
    }

    if (savedCallback != NULL)
        sState.savedCallback = savedCallback;
    sResources->exitCallback    = NULL;
    sResources->itemIconSpriteId = SPRITE_NONE;
    for (i = 0; i < SANDWICH_CASE_NUM_INGREDIENTS; i++)
        sResources->ingredientSpriteIds[i] = SPRITE_NONE;
    for (i = 0; i < 4; i++)
        sResources->data[i] = 0;
    gTextFlags.autoScroll = FALSE;
    SetMainCallback2(CB2_InitSandwichCase);
}

static void CB2_SC_Idle(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    DoScheduledBgTilemapCopiesToVram();
    UpdatePaletteFade();
}

static void VBlankCB_SC_Idle(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void CB2_InitSandwichCase(void)
{
    while (1)
    {
        if (RunSandwichCaseInit() == TRUE)
            break;
    }
}

static bool8 RunSandwichCaseInit(void)
{
    u8 taskId;

    switch (gMain.state)
    {
    case 0:
        SetVBlankHBlankCallbacksToNull();
        ClearScheduledBgCopiesToVram();
        gMain.state++;
        break;
    case 1:
        ScanlineEffect_Stop();
        gMain.state++;
        break;
    case 2:
        FreeAllSpritePalettes();
        gMain.state++;
        break;
    case 3:
        ResetPaletteFade();
        gMain.state++;
        break;
    case 4:
        ResetSpriteData();
        gMain.state++;
        break;
    case 5:
        ResetItemMenuIconState();
        gMain.state++;
        break;
    case 6:
        ResetTasks();
        gMain.state++;
        break;
    case 7:
        SandwichCaseInitBgs();
        sResources->data[0] = 0;
        gMain.state++;
        break;
    case 8:
        if (SandwichCaseLoadGfx())
            gMain.state++;
        break;
    case 9:
        SandwichCaseInitWindows();
        gMain.state++;
        break;
    case 10:
        sResources->listMenuMaxShowed = SANDWICH_CASE_NUM_INGREDIENTS + 1;
        gMain.state++;
        break;
    case 11:
        if (!AllocateSandwichCaseListBuffers())
        {
            AbortSandwichCaseLoading();
            return TRUE;
        }
        gMain.state++;
        break;
    case 12:
        SetUpSandwichCaseListMenu();
        gMain.state++;
        break;
    case 13:
        PrintSandwichCaseHeader();
        gMain.state++;
        break;
    case 14:
        CreateSandwichCaseSprite(); // large background sprite
        CreateIngredientSprites();
        gMain.state++;
        break;
    case 15:
        taskId = CreateTask(Task_SandwichCaseMain, 0);
        gTasks[taskId].data[0] = ListMenuInit(&gMultiuseListMenuTemplate, sState.listMenuScrollOffset, sState.listMenuSelectedRow);
        gMain.state++;
        break;
    case 16:
        BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
        gMain.state++;
        break;
    case 17:
        BeginNormalPaletteFade(PALETTES_ALL, -2, 16, 0, RGB_BLACK);
        gMain.state++;
        break;
    default:
        SetVBlankCallback(VBlankCB_SC_Idle);
        SetMainCallback2(CB2_SC_Idle);
        return TRUE;
    }

    return FALSE;
}

static void AbortSandwichCaseLoading(void)
{
    BeginNormalPaletteFade(PALETTES_ALL, -2, 0, 16, RGB_BLACK);
    CreateTask(Task_AbortSandwichCaseLoading_WaitFade, 0);
    SetVBlankCallback(VBlankCB_SC_Idle);
    SetMainCallback2(CB2_SC_Idle);
}

static void Task_AbortSandwichCaseLoading_WaitFade(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(sState.savedCallback);
        SandwichCase_DestroyResources();
        DestroyTask(taskId);
    }
}

static void SandwichCaseInitBgs(void)
{
    ResetAllBgsCoordinatesAndBgCntRegs();
    memset(sResources->bg1TilemapBuffer, 0, BG_SCREEN_SIZE);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sBgTemplates, NELEMS(sBgTemplates));
    SetBgTilemapBuffer(1, sResources->bg1TilemapBuffer);
    ScheduleBgCopyTilemapToVram(1);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
}

static bool8 SandwichCaseLoadGfx(void)
{
    u8 i;
    switch (sResources->data[0])
    {
    case 0:
        ResetTempTileDataBuffers();
        DecompressAndCopyTileDataToVram(1, gBerryPouchBgGfx, 0, 0, 0);
        sResources->data[0]++;
        break;
    case 1:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            LZDecompressWram(gBerryPouchBg1Tilemap, sResources->bg1TilemapBuffer);
            sResources->data[0]++;
        }
        break;
    case 2:
        LoadCompressedPalette(gBerryPouchBgPals, BG_PLTT_ID(0), 3 * PLTT_SIZE_4BPP);
        if (gSaveBlock2Ptr->playerGender != MALE)
            LoadCompressedPalette(gBerryPouchBgPal0FemaleOverride, BG_PLTT_ID(0), PLTT_SIZE_4BPP);
        sResources->data[0]++;
        break;
    case 3:
        LoadCompressedSpriteSheet(&sSpriteSheet);
        sResources->data[0]++;
        break;
    case 4:
        LoadCompressedSpritePalette(&sSpritePal);
        sResources->data[0]++;
        break;
    default:
        {
            // copy the behavior of AddItemIconObject()
            void *rawTiles = AllocZeroed(0x120);
            void *paddedTiles = AllocZeroed(0x200);
            struct SpriteSheet sheet;
            u8 row;

            if (rawTiles != NULL && paddedTiles != NULL)
            {
                for (i = 0; i < SANDWICH_CASE_NUM_INGREDIENTS; i++)
                {
                    LZDecompressWram(sIngredientSpriteSheets[i].data, rawTiles);
                    memset(paddedTiles, 0, 0x200);
                    for (row = 0; row < 3; row++)
                        CpuCopy16((u8 *)rawTiles + 0x60 * row, (u8 *)paddedTiles + 0x80 * row, 0x60);
                    sheet.data = paddedTiles;
                    sheet.size = 0x200;
                    sheet.tag = sIngredientSpriteSheets[i].tag;
                    LoadSpriteSheet(&sheet);
                    LoadCompressedSpritePalette(&sIngredientSpritePals[i]);
                }
            }
            if (rawTiles != NULL)
                Free(rawTiles);
            if (paddedTiles != NULL)
                Free(paddedTiles);
        }
        sResources->data[0] = 0;
        return TRUE;
    }
    return FALSE;
}

static void SandwichCaseInitWindows(void)
{
    u8 i;
    InitWindows(sWindowTemplates);
    DeactivateAllTextPrinters();
    LoadUserWindowGfx(0, 0x001, BG_PLTT_ID(14));
    LoadMenuMessageWindowGfx(0, 0x013, BG_PLTT_ID(13));
    LoadStdWindowGfx(0, 0x00A, BG_PLTT_ID(12));
    LoadPalette(gStandardMenuPalette, BG_PLTT_ID(15), PLTT_SIZE_4BPP);
    for (i = 0; i < 3; i++)
        FillWindowPixelBuffer(i, PIXEL_FILL(0));
    PutWindowTilemap(0);
    PutWindowTilemap(1);
    PutWindowTilemap(2);
    ScheduleBgCopyTilemapToVram(0);
    ScheduleBgCopyTilemapToVram(2);
}

static bool8 AllocateSandwichCaseListBuffers(void)
{
    // 7 entries (6 ingredients + CLOSE), 27 bytes each
    sListItems  = Alloc((SANDWICH_CASE_NUM_INGREDIENTS + 1) * sizeof(struct ListMenuItem));
    if (sListItems == NULL)
        return FALSE;
    sListStrbuf = Alloc((SANDWICH_CASE_NUM_INGREDIENTS + 1) * 27);
    if (sListStrbuf == NULL)
        return FALSE;
    return TRUE;
}

static void SetUpSandwichCaseListMenu(void)
{
    u16 i;
    for (i = 0; i < SANDWICH_CASE_NUM_INGREDIENTS; i++)
    {
        StringCopy(&sListStrbuf[i * 27], sSandwichIngredientNames[i]);
        sListItems[i].label = &sListStrbuf[i * 27];
        sListItems[i].index = i;
    }
    sListItems[i].label = gText_Close;
    sListItems[i].index = i;

    gMultiuseListMenuTemplate.items               = sListItems;
    gMultiuseListMenuTemplate.totalItems          = SANDWICH_CASE_NUM_INGREDIENTS + 1;
    gMultiuseListMenuTemplate.windowId            = 0;
    gMultiuseListMenuTemplate.header_X            = 0;
    gMultiuseListMenuTemplate.item_X              = 9;
    gMultiuseListMenuTemplate.cursor_X            = 1;
    gMultiuseListMenuTemplate.lettersSpacing      = 0;
    gMultiuseListMenuTemplate.itemVerticalPadding = 2;
    gMultiuseListMenuTemplate.upText_Y            = 2;
    gMultiuseListMenuTemplate.maxShowed           = sResources->listMenuMaxShowed;
    gMultiuseListMenuTemplate.fontId              = FONT_NORMAL;
    gMultiuseListMenuTemplate.cursorPal           = 2;
    gMultiuseListMenuTemplate.fillValue           = 0;
    gMultiuseListMenuTemplate.cursorShadowPal     = 3;
    gMultiuseListMenuTemplate.moveCursorFunc      = SandwichCaseMoveCursorFunc;
    gMultiuseListMenuTemplate.itemPrintFunc       = SandwichCaseItemPrintFunc;
    gMultiuseListMenuTemplate.cursorKind          = 0;
    gMultiuseListMenuTemplate.scrollMultiple      = 0;
}

static void SandwichCaseMoveCursorFunc(s32 itemIndex, bool8 onInit, struct ListMenu *list)
{
    u8 i;
    if (onInit != TRUE)
    {
        PlaySE(SE_BAG_CURSOR);
        StartSandwichCaseSpriteWobbleAnim();
    }
    // Toggle item icon thumbnail: visible for ingredients, hidden for CLOSE
    if (sResources->itemIconSpriteId != SPRITE_NONE)
        gSprites[sResources->itemIconSpriteId].invisible = (itemIndex >= SANDWICH_CASE_NUM_INGREDIENTS);
    // Hide all ingredient sprites before showing the right one
    for (i = 0; i < SANDWICH_CASE_NUM_INGREDIENTS; i++)
        gSprites[sResources->ingredientSpriteIds[i]].invisible = TRUE;
    switch (itemIndex)
    {
    case 0: // BREAD
        gSprites[sResources->ingredientSpriteIds[0]].invisible = FALSE;
        break;
    case 1: // SESAME SEED
        gSprites[sResources->ingredientSpriteIds[1]].invisible = FALSE;
        break;
    case 2: // MEAT
        gSprites[sResources->ingredientSpriteIds[2]].invisible = FALSE;
        break;
    case 3: // CHEESE
        gSprites[sResources->ingredientSpriteIds[3]].invisible = FALSE;
        break;
    case 4: // LETTUCE
        gSprites[sResources->ingredientSpriteIds[4]].invisible = FALSE;
        break;
    case 5: // PICKLES
        gSprites[sResources->ingredientSpriteIds[5]].invisible = FALSE;
        break;
    default: // CLOSE row — no ingredient sprite
        break;
    }
    PrintSandwichCaseDescription(itemIndex);
}

static void SandwichCaseItemPrintFunc(u8 windowId, u32 itemId, u8 y)
{
    // itemId == (u32)-2 signals a dummy/separator call – skip it
    if (itemId == (u32)-2 || itemId >= (u32)SANDWICH_CASE_NUM_INGREDIENTS)
        return;
    if (FlagGet(sSandwichFlags[itemId]))
        SandwichCasePrint(windowId, FONT_NORMAL, sText_CheckMark, 123, y, 0, 0, 0xFF, 3);
}

static void SandwichCasePrint(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx)
{
    AddTextPrinterParameterized4(windowId, fontId, x, y, letterSpacing, lineSpacing, sTextColors[colorIdx], speed, str);
}

static void PrintSandwichCaseHeader(void)
{
    u32 slack = 72 - GetStringWidth(FONT_SMALL, gText_SandwichCase, 0);
    SandwichCasePrint(2, FONT_SMALL, gText_SandwichCase, slack / 2, 1, 0, 0, 0, 1);
}

static void PrintSandwichCaseDescription(s32 itemIdx)
{
    const u8 *str;
    if (itemIdx >= SANDWICH_CASE_NUM_INGREDIENTS)
        str = gText_TheSandwichCaseWillBePutAway;
    else if (FlagGet(sSandwichFlags[itemIdx]))
        str = sSandwichIngredientDescriptionsObtained[itemIdx];
    else
        str = sSandwichIngredientDescriptions[itemIdx];
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    SandwichCasePrint(1, FONT_NORMAL, str, 0, 2, 2, 0, 0, 1);
}

static void CreateSandwichCaseSprite(void)
{
    sSpriteId = CreateSprite(&sSpriteTemplate_SandwichCase, 40, 76, 0);
}

static void CreateIngredientSprites(void)
{
    u8 i;
    for (i = 0; i < SANDWICH_CASE_NUM_INGREDIENTS; i++)
    {
        sResources->ingredientSpriteIds[i] = CreateSprite(&sSpriteTemplates_Ingredients[i], 24, 147, 0);
        gSprites[sResources->ingredientSpriteIds[i]].invisible = TRUE;
    }
}

static void StartSandwichCaseSpriteWobbleAnim(void)
{
    struct Sprite *sprite = &gSprites[sSpriteId];
    if (sprite->affineAnimEnded)
    {
        StartSpriteAffineAnim(sprite, 1);
        sprite->callback = SpriteCB_SandwichCaseWaitWobbleAnim;
    }
}

static void SpriteCB_SandwichCaseWaitWobbleAnim(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        StartSpriteAffineAnim(sprite, 0);
        sprite->callback = SpriteCallbackDummy;
    }
}

static void SandwichCase_StartFadeToExitCallback(u8 taskId)
{
    BeginNormalPaletteFade(PALETTES_ALL, -2, 0, 16, RGB_BLACK);
    gTasks[taskId].func = Task_SandwichCaseFadeOutCallback;
}

static void Task_SandwichCaseFadeOutCallback(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!gPaletteFade.active)
    {
        DestroyListMenuTask(data[0], &sState.listMenuScrollOffset, &sState.listMenuSelectedRow);
        if (sResources->exitCallback != NULL)
            SetMainCallback2(sResources->exitCallback);
        else
            SetMainCallback2(sState.savedCallback);
        SandwichCase_DestroyResources();
        DestroyTask(taskId);
    }
}

static void Task_SandwichCaseMain(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s32 input;

    if (gPaletteFade.active)
        return;

    input = ListMenu_ProcessInput(data[0]);
    ListMenuGetScrollAndRow(data[0], &sState.listMenuScrollOffset, &sState.listMenuSelectedRow);

    switch (input)
    {
    case LIST_NOTHING_CHOSEN:
        break;
    case LIST_CANCEL:
        // B button pressed
        PlaySE(SE_SELECT);
        SandwichCase_StartFadeToExitCallback(taskId);
        break;
    default:
        PlaySE(SE_SELECT);
        if (input == SANDWICH_CASE_NUM_INGREDIENTS)
            // CLOSE entry selected
            SandwichCase_StartFadeToExitCallback(taskId);
        break;
    }
}

static void SandwichCase_DestroyResources(void)
{
    if (sResources != NULL)
    {
        Free(sResources);
        sResources = NULL;
    }
    if (sListItems != NULL)
    {
        Free(sListItems);
        sListItems = NULL;
    }
    if (sListStrbuf != NULL)
    {
        Free(sListStrbuf);
        sListStrbuf = NULL;
    }
    FreeAllWindowBuffers();
}
