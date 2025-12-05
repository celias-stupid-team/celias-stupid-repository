// Based on vol's heat start menu, credits to him (Voluptua) and Pawkkie
#include "option_menu.h"
#include "rotom_menu.h"
#include "global.h"
#include "bg.h"
#include "battle_message.h"
#include "decompress.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "event_object_lock.h"
#include "event_scripts.h"
#include "fieldmap.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "field_specials.h"
#include "field_weather.h"
#include "field_screen_effect.h"
#include "gpu_regs.h"
#include "item_menu.h"
#include "link.h"
#include "load_save.h"
#include "main.h"
#include "malloc.h"
#include "menu.h"
#include "new_game.h"
#include "new_menu_helpers.h"
#include "option_menu.h"
#include "overworld.h"
#include "palette.h"
#include "party_menu.h"
#include "pokedex.h"
#include "pokedex_screen.h"
#include "pokemon_storage_system_internal.h"
#include "pokemon_storage_system.h"
#include "safari_zone.h"
#include "save.h"
#include "save_menu_util.h"
#include "scanline_effect.h"
#include "script.h"
#include "sprite.h"
#include "sound.h"
#include "start_menu.h"
#include "strings.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "text_window.h"
#include "trainer_card.h"
#include "window.h"
#include "union_room.h"
#include "constants/rgb.h"
#include "constants/songs.h"
#include "event_object_movement.h"
#include "gba/isagbprint.h"

/* CALLBACKS */
static void SpriteCB_IconPokedex(struct Sprite* sprite);
static void SpriteCB_IconParty(struct Sprite* sprite);
static void SpriteCB_IconPC(struct Sprite* sprite);
static void SpriteCB_IconBag(struct Sprite* sprite);
static void SpriteCB_IconTrainerCard(struct Sprite* sprite);
static void SpriteCB_IconSave(struct Sprite* sprite);
static void SpriteCB_IconOptions(struct Sprite* sprite);
static void SpriteCB_IconFlag(struct Sprite* sprite);

/* TASKs */
static void Task_RotomStartMenu_HandleMainInput(u8 taskId);
static void Task_RotomStartMenu_SafariZone_HandleMainInput(u8 taskId);
static void Task_HandleSave(u8 taskId);

/* OTHER FUNCTIONS */
static void RotomStartMenu_LoadSprites(void);
static void RotomStartMenu_CreateSprites(void);
static void RotomStartMenu_SafariZone_CreateSprites(void);
static void RotomStartMenu_LoadBgGfx(void);
static void RotomStartMenu_UpdateMenuName(void);
static u8 RunSaveCallback(void);
static u8 SaveDoSaveCallback(void);
static void HideSaveInfoWindow(void);
static void HideSaveMessageWindow(void);
static u8 SaveOverwriteInputCallback(void);
static u8 SaveConfirmOverwriteDefaultNoCallback(void);
static u8 SaveConfirmOverwriteCallback(void);
static void ShowSaveMessage(const u8 *message, u8 (*saveCallback)(void));
static u8 SaveFileExistsCallback(void);
static u8 SaveSavingMessageCallback(void);
static u8 SaveConfirmInputCallback(void);
static u8 SaveYesNoCallback(void);
static void ShowSaveInfoWindow(void);
static u8 SaveConfirmSaveCallback(void);
static void InitSave(void);

/* ENUMs */
enum MenuOption {
    MENU_POKEDEX,
    MENU_PARTY,
    MENU_PC,
    MENU_BAG,
    MENU_TRAINER_CARD,
    MENU_SAVE,
    MENU_OPTIONS,
    MENU_RETIRE,
};

enum SaveStates {
    SAVE_IN_PROGRESS,
    SAVE_SUCCESS,
    SAVE_CANCELED,
    SAVE_ERROR
};

/* STRUCTs */
struct RotomStartMenu {
    u8 optionSelected;
    u8 iconAnimStarted;
    u16 sMenuNameWindowId;
    u16 sSafariBallsWindowId;

    u8 spriteIdPokedex;
    u8 spriteIdParty;
    u8 spriteIdBag;
    u8 spriteIdPC;
    u8 spriteIdTrainerCard;
    u8 spriteIdSave;
    u8 spriteIdOptions;
    u8 spriteIdFlag;
};

static EWRAM_DATA struct RotomStartMenu *sRotomStartMenu = NULL;
static EWRAM_DATA u8 sMenuSelected = 0;
static EWRAM_DATA u8 (*sSaveDialogCallback)(void) = NULL;
static EWRAM_DATA u8 sSaveDialogTimer = 0;
static EWRAM_DATA u8 sSaveInfoWindowId = 0;

// --BG-GFX--
static const u32 sStartMenuTiles[] = INCBIN_U32("graphics/rotom_menu/bg.4bpp.lz");
static const u32 sStartMenuTilemap[] = INCBIN_U32("graphics/rotom_menu/bg.bin.lz");
static const u32 sStartMenuTilemapSafari[] = INCBIN_U32("graphics/rotom_menu/bg_safari.bin.lz");
static const u16 sStartMenuPalette[] = INCBIN_U16("graphics/rotom_menu/bg.gbapal");
static const u16 sStandardMenuPalette[] = INCBIN_U16("graphics/interface/std_menu.gbapal");

//--SPRITE-GFX--
#define TAG_ICON_GFX 1234
#define TAG_ICON_PAL 0x4654

static const u32 sIconGfx[] = INCBIN_U32("graphics/rotom_menu/icons.4bpp.lz");
static const u16 sIconPal[] = INCBIN_U16("graphics/rotom_menu/icons.gbapal");

static const struct WindowTemplate sSaveInfoWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 14,
    .height = 10,
    .paletteNum = 15,
    .baseBlock = 8
};

static const struct WindowTemplate sWindowTemplate_MenuName = {
    .bg = 0,
    .tilemapLeft = 16,
    .tilemapTop = 17,
    .width = 7,
    .height = 2,
    .paletteNum = 15,
    .baseBlock = 0x30 + (12*2)
};

static const struct WindowTemplate sWindowTemplate_SafariBalls = {
    .bg = 0,
    .tilemapLeft = 2,
    .tilemapTop = 1,
    .width = 7,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = (0x30 + (12*2)) + (7*2)
};

static const struct SpritePalette sSpritePal_Icon[] =
{
    {sIconPal, TAG_ICON_PAL},
    {NULL},
};

static const struct CompressedSpriteSheet sSpriteSheet_Icon[] =
{
    {sIconGfx, 32*512/2 , TAG_ICON_GFX},
    {NULL},
};

static const struct OamData gOamIcon = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .objMode = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
};

static const union AnimCmd gAnimCmdPokedex_NotSelected[] = {
    ANIMCMD_FRAME(128, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd gAnimCmdPokedex_Selected[] = {
    ANIMCMD_FRAME(16, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const gIconPokedexAnim[] = {
    gAnimCmdPokedex_NotSelected,
    gAnimCmdPokedex_Selected,
};

static const union AnimCmd gAnimCmdParty_NotSelected[] = {
    ANIMCMD_FRAME(144, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd gAnimCmdParty_Selected[] = {
    ANIMCMD_FRAME(32, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const gIconPartyAnim[] = {
    gAnimCmdParty_NotSelected,
    gAnimCmdParty_Selected,
};

static const union AnimCmd gAnimCmdPC_NotSelected[] = {
    ANIMCMD_FRAME(112, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd gAnimCmdPC_Selected[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const gIconPCAnim[] = {
    gAnimCmdPC_NotSelected,
    gAnimCmdPC_Selected,
};

static const union AnimCmd gAnimCmdBag_NotSelected[] = {
    ANIMCMD_FRAME(160, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd gAnimCmdBag_Selected[] = {
    ANIMCMD_FRAME(48, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const gIconBagAnim[] = {
    gAnimCmdBag_NotSelected,
    gAnimCmdBag_Selected,
};

static const union AnimCmd gAnimCmdTrainerCard_NotSelected[] = {
    ANIMCMD_FRAME(176, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd gAnimCmdTrainerCard_Selected[] = {
    ANIMCMD_FRAME(64, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const gIconTrainerCardAnim[] = {
    gAnimCmdTrainerCard_NotSelected,
    gAnimCmdTrainerCard_Selected,
};

static const union AnimCmd gAnimCmdSave_NotSelected[] = {
    ANIMCMD_FRAME(192, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd gAnimCmdSave_Selected[] = {
    ANIMCMD_FRAME(80, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const gIconSaveAnim[] = {
    gAnimCmdSave_NotSelected,
    gAnimCmdSave_Selected,
};

static const union AnimCmd gAnimCmdOptions_NotSelected[] = {
    ANIMCMD_FRAME(208, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd gAnimCmdOptions_Selected[] = {
    ANIMCMD_FRAME(96, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const gIconOptionsAnim[] = {
    gAnimCmdOptions_NotSelected,
    gAnimCmdOptions_Selected,
};

static const union AnimCmd gAnimCmdFlag_NotSelected[] = {
    ANIMCMD_FRAME(240, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd gAnimCmdFlag_Selected[] = {
    ANIMCMD_FRAME(224, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const gIconFlagAnim[] = {
    gAnimCmdFlag_NotSelected,
    gAnimCmdFlag_Selected,
};

static const union AffineAnimCmd sAffineAnimIcon_NoAnim[] =
{
    AFFINEANIMCMD_FRAME(0,0, 0, 60),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sAffineAnimIcon_Anim[] =
{
    AFFINEANIMCMD_FRAME(20, 20, 0, 5),    // Scale big
    AFFINEANIMCMD_FRAME(-10, -10, 0, 10), // Scale smol
    AFFINEANIMCMD_FRAME(0, 0, 1, 4),      // Begin rotating

    AFFINEANIMCMD_FRAME(0, 0, -1, 4),     // Loop starts from here ; Rotate/Tilt left
    AFFINEANIMCMD_FRAME(0, 0, 0, 2),
    AFFINEANIMCMD_FRAME(0, 0, -1, 4),
    AFFINEANIMCMD_FRAME(0, 0, 0, 2),
    AFFINEANIMCMD_FRAME(0, 0, -1, 4),

    AFFINEANIMCMD_FRAME(0, 0, 1, 4),      // Rotate/Tilt Right
    AFFINEANIMCMD_FRAME(0, 0, 0, 2),
    AFFINEANIMCMD_FRAME(0, 0, 1, 4),
    AFFINEANIMCMD_FRAME(0, 0, 0, 2),
    AFFINEANIMCMD_FRAME(0, 0, 1, 4),

    AFFINEANIMCMD_JUMP(3),
};

static const union AffineAnimCmd *const sAffineAnimsIcon[] =
{
    sAffineAnimIcon_NoAnim,
    sAffineAnimIcon_Anim,
};

static const struct SpriteTemplate gSpriteIconPokedex = {
    .tileTag = TAG_ICON_GFX,
    .paletteTag = TAG_ICON_PAL,
    .oam = &gOamIcon,
    .anims = gIconPokedexAnim,
    .images = NULL,
    .affineAnims = sAffineAnimsIcon,
    .callback = SpriteCB_IconPokedex,
};

static const struct SpriteTemplate gSpriteIconParty = {
    .tileTag = TAG_ICON_GFX,
    .paletteTag = TAG_ICON_PAL,
    .oam = &gOamIcon,
    .anims = gIconPartyAnim,
    .images = NULL,
    .affineAnims = sAffineAnimsIcon,
    .callback = SpriteCB_IconParty,
};

static const struct SpriteTemplate gSpriteIconPC = {
    .tileTag = TAG_ICON_GFX,
    .paletteTag = TAG_ICON_PAL,
    .oam = &gOamIcon,
    .anims = gIconPCAnim,
    .images = NULL,
    .affineAnims = sAffineAnimsIcon,
    .callback = SpriteCB_IconPC,
};

static const struct SpriteTemplate gSpriteIconBag = {
    .tileTag = TAG_ICON_GFX,
    .paletteTag = TAG_ICON_PAL,
    .oam = &gOamIcon,
    .anims = gIconBagAnim,
    .images = NULL,
    .affineAnims = sAffineAnimsIcon,
    .callback = SpriteCB_IconBag,
};

static const struct SpriteTemplate gSpriteIconTrainerCard = {
    .tileTag = TAG_ICON_GFX,
    .paletteTag = TAG_ICON_PAL,
    .oam = &gOamIcon,
    .anims = gIconTrainerCardAnim,
    .images = NULL,
    .affineAnims = sAffineAnimsIcon,
    .callback = SpriteCB_IconTrainerCard,
};

static const struct SpriteTemplate gSpriteIconSave = {
    .tileTag = TAG_ICON_GFX,
    .paletteTag = TAG_ICON_PAL,
    .oam = &gOamIcon,
    .anims = gIconSaveAnim,
    .images = NULL,
    .affineAnims = sAffineAnimsIcon,
    .callback = SpriteCB_IconSave,
};

static const struct SpriteTemplate gSpriteIconOptions = {
    .tileTag = TAG_ICON_GFX,
    .paletteTag = TAG_ICON_PAL,
    .oam = &gOamIcon,
    .anims = gIconOptionsAnim,
    .images = NULL,
    .affineAnims = sAffineAnimsIcon,
    .callback = SpriteCB_IconOptions,
};

static const struct SpriteTemplate gSpriteIconFlag = {
    .tileTag = TAG_ICON_GFX,
    .paletteTag = TAG_ICON_PAL,
    .oam = &gOamIcon,
    .anims = gIconFlagAnim,
    .images = NULL,
    .affineAnims = sAffineAnimsIcon,
    .callback = SpriteCB_IconFlag,
};

static void SpriteCB_IconPokedex(struct Sprite* sprite) {
    if (sMenuSelected == MENU_POKEDEX && !sRotomStartMenu->iconAnimStarted) {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    } else if (sMenuSelected != MENU_POKEDEX) {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SpriteCB_IconParty(struct Sprite* sprite) {
    if (sMenuSelected == MENU_PARTY && !sRotomStartMenu->iconAnimStarted) {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    } else if (sMenuSelected != MENU_PARTY) {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SpriteCB_IconPC(struct Sprite* sprite) {
    if (sMenuSelected == MENU_PC && !sRotomStartMenu->iconAnimStarted) {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    } else if (sMenuSelected != MENU_PC) {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SpriteCB_IconBag(struct Sprite* sprite) {
    if (sMenuSelected == MENU_BAG && !sRotomStartMenu->iconAnimStarted) {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    } else if (sMenuSelected != MENU_BAG) {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SpriteCB_IconTrainerCard(struct Sprite* sprite) {
    if (sMenuSelected == MENU_TRAINER_CARD && !sRotomStartMenu->iconAnimStarted) {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    } else if (sMenuSelected != MENU_TRAINER_CARD) {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SpriteCB_IconSave(struct Sprite* sprite) {
    if (sMenuSelected == MENU_SAVE && !sRotomStartMenu->iconAnimStarted) {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    } else if (sMenuSelected != MENU_SAVE) {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SpriteCB_IconOptions(struct Sprite* sprite) {
    if (sMenuSelected == MENU_OPTIONS && !sRotomStartMenu->iconAnimStarted) {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    } else if (sMenuSelected != MENU_OPTIONS) {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SpriteCB_IconFlag(struct Sprite* sprite) {
    if (sMenuSelected == MENU_RETIRE && !sRotomStartMenu->iconAnimStarted) {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    } else if (sMenuSelected != MENU_RETIRE) {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SetSelectedMenu(void) {
    if (FlagGet(FLAG_SYS_POKEDEX_GET)) {
        sMenuSelected = MENU_POKEDEX;
    } else if (FlagGet(FLAG_SYS_POKEMON_GET)) {
        sMenuSelected = MENU_PARTY;
    } else {
        sMenuSelected = MENU_BAG;
    }
}

static void ShowSafariBallsWindow(void)
{
    sRotomStartMenu->sSafariBallsWindowId = AddWindow(&sWindowTemplate_SafariBalls);
    FillWindowPixelBuffer(sRotomStartMenu->sSafariBallsWindowId, PIXEL_FILL(TEXT_COLOR_WHITE));
    PutWindowTilemap(sRotomStartMenu->sSafariBallsWindowId);
    ConvertIntToDecimalStringN(gStringVar1, gNumSafariBalls, STR_CONV_MODE_RIGHT_ALIGN, 2);
    StringExpandPlaceholders(gStringVar4, gText_SafariBalls);
    AddTextPrinterParameterized(sRotomStartMenu->sSafariBallsWindowId, FONT_SMALL, gStringVar4, 0, 1, TEXT_SKIP_DRAW, NULL);
    CopyWindowToVram(sRotomStartMenu->sSafariBallsWindowId, COPYWIN_GFX);
}

void RotomStartMenu_Init(void) {
    if (!IsUpdateLinkStateCBActive()) {
        FreezeObjectEvents();
        HandleEnforcedLookDirectionOnPlayerStopMoving();
        StopPlayerAvatar();
    }

    LockPlayerFieldControls();

    if (sRotomStartMenu == NULL) {
        sRotomStartMenu = AllocZeroed(sizeof(struct RotomStartMenu));
    }

    if (sRotomStartMenu == NULL) {
        SetMainCallback2(CB2_ReturnToFieldWithOpenMenu);
        return;
    }

    sRotomStartMenu->optionSelected = FALSE;
    sRotomStartMenu->iconAnimStarted = FALSE;

    if (!GetSafariZoneFlag()) {
        if (sMenuSelected == MENU_RETIRE) {
            sMenuSelected = MENU_POKEDEX;
        }

        if (sMenuSelected == 255) {
            SetSelectedMenu();
        }

        RotomStartMenu_LoadSprites();
        RotomStartMenu_CreateSprites();
        RotomStartMenu_LoadBgGfx();
        sRotomStartMenu->sMenuNameWindowId = AddWindow(&sWindowTemplate_MenuName);
        RotomStartMenu_UpdateMenuName();
        CreateTask(Task_RotomStartMenu_HandleMainInput, 0);
    } else {
        if (sMenuSelected == 255 || sMenuSelected == MENU_SAVE) {
            sMenuSelected = MENU_RETIRE;
        }

        RotomStartMenu_LoadSprites();
        RotomStartMenu_SafariZone_CreateSprites();
        RotomStartMenu_LoadBgGfx();
        ShowSafariBallsWindow();
        sRotomStartMenu->sMenuNameWindowId = AddWindow(&sWindowTemplate_MenuName);
        RotomStartMenu_UpdateMenuName();
        CreateTask(Task_RotomStartMenu_SafariZone_HandleMainInput, 0);
    }
}

static void RotomStartMenu_LoadSprites(void) {
    u32 index;
    LoadSpritePalette(sSpritePal_Icon);
    index = IndexOfSpritePaletteTag(TAG_ICON_PAL);
    LoadPalette(sIconPal, OBJ_PLTT_ID(index), PLTT_SIZE_4BPP);
    LoadCompressedSpriteSheet(sSpriteSheet_Icon);
}

static void RotomStartMenu_CreateSprites(void) {
    u32 x = 224;
    u32 y1 = 14;
    u32 y2 = 38;
    u32 y3 = 60;
    u32 y4 = 84;
    u32 y5 = 109;
    u32 y6 = 130;
    u32 y7 = 150;

    if (FlagGet(FLAG_SYS_POKEDEX_GET)) {
        sRotomStartMenu->spriteIdPokedex = CreateSprite(&gSpriteIconPokedex, x-1, y1-2, 0);
        sRotomStartMenu->spriteIdParty = CreateSprite(&gSpriteIconParty, x, y2-3, 0);
        sRotomStartMenu->spriteIdPC = CreateSprite(&gSpriteIconPC, x, y3, 0);
        sRotomStartMenu->spriteIdBag     = CreateSprite(&gSpriteIconBag, x, y4+1, 0);
        sRotomStartMenu->spriteIdTrainerCard = CreateSprite(&gSpriteIconTrainerCard, x, y5, 0);
        sRotomStartMenu->spriteIdSave    = CreateSprite(&gSpriteIconSave, x, y6, 0);
        sRotomStartMenu->spriteIdOptions = CreateSprite(&gSpriteIconOptions, x, y7, 0);
        return;
    } else if (FlagGet(FLAG_SYS_POKEMON_GET)) {
        sRotomStartMenu->spriteIdParty = CreateSprite(&gSpriteIconParty, x, y1, 0);
        sRotomStartMenu->spriteIdBag     = CreateSprite(&gSpriteIconBag, x, y2 + 1, 0);
        sRotomStartMenu->spriteIdTrainerCard = CreateSprite(&gSpriteIconTrainerCard, x, y3 + 3, 0);
        sRotomStartMenu->spriteIdSave    = CreateSprite(&gSpriteIconSave, x, y4 + 1, 0);
        sRotomStartMenu->spriteIdOptions = CreateSprite(&gSpriteIconOptions, x, y5 - 4, 0);
        return;
    } else {
        sRotomStartMenu->spriteIdBag     = CreateSprite(&gSpriteIconBag, x, y1, 0);
        sRotomStartMenu->spriteIdTrainerCard = CreateSprite(&gSpriteIconTrainerCard, x, y2 + 1, 0);
        sRotomStartMenu->spriteIdSave    = CreateSprite(&gSpriteIconSave, x, y3 + 3, 0);
        sRotomStartMenu->spriteIdOptions = CreateSprite(&gSpriteIconOptions, x, y4 + 1, 0);
    }
}

static void RotomStartMenu_SafariZone_CreateSprites(void) {
    u32 x = 224;
    u32 y1 = 14;
    u32 y2 = 38;
    u32 y3 = 60;
    u32 y4 = 84;
    u32 y5 = 109;
    u32 y6 = 130;

    sRotomStartMenu->spriteIdFlag = CreateSprite(&gSpriteIconFlag, x, y1, 0);
    sRotomStartMenu->spriteIdPokedex = CreateSprite(&gSpriteIconPokedex, x-1, y2, 0);
    sRotomStartMenu->spriteIdParty   = CreateSprite(&gSpriteIconParty, x, y3, 0);
    sRotomStartMenu->spriteIdBag     = CreateSprite(&gSpriteIconBag, x, y4, 0);
    sRotomStartMenu->spriteIdTrainerCard = CreateSprite(&gSpriteIconTrainerCard, x, y5, 0);
    sRotomStartMenu->spriteIdOptions = CreateSprite(&gSpriteIconOptions, x, y6, 0);
}

static void RotomStartMenu_LoadBgGfx(void) {
    u8* buf = GetBgTilemapBuffer(0);
    LoadBgTilemap(0, 0, 0, 0);
    DecompressAndCopyTileDataToVram(0, sStartMenuTiles, 0, 0, 0);
    if (!GetSafariZoneFlag()) {
        LZDecompressWram(sStartMenuTilemap, buf);
    } else {
        LZDecompressWram(sStartMenuTilemapSafari, buf);
    }
    LoadPalette(sStandardMenuPalette, BG_PLTT_ID(15), PLTT_SIZE_4BPP);
    LoadPalette(sStartMenuPalette, BG_PLTT_ID(14), PLTT_SIZE_4BPP);
    ScheduleBgCopyTilemapToVram(0);
}

static const u8 sText_Pokedex[] = _("  Pokédex");
static const u8 sText_Party[]   = _("    Party ");
static const u8 sText_Bag[]     = _("      Bag  ");
static const u8 sText_PC[]      = _("       PC  ");
static const u8 sText_Trainer[] = _("   Trainer");
static const u8 sText_Save[]    = _("     Save  ");
static const u8 sText_Options[] = _("   Options");
static const u8 sText_Retire[]    = _("   Retire");

static void RotomStartMenu_UpdateMenuName(void) {
    FillWindowPixelBuffer(sRotomStartMenu->sMenuNameWindowId, PIXEL_FILL(TEXT_COLOR_WHITE));
    PutWindowTilemap(sRotomStartMenu->sMenuNameWindowId);

    switch(sMenuSelected) {
    case MENU_POKEDEX:
        AddTextPrinterParameterized(sRotomStartMenu->sMenuNameWindowId, 1, sText_Pokedex, 1, 0, 0xFF, NULL);
        break;
    case MENU_PARTY:
        AddTextPrinterParameterized(sRotomStartMenu->sMenuNameWindowId, 1, sText_Party, 1, 0, 0xFF, NULL);
        break;
    case MENU_PC:
        AddTextPrinterParameterized(sRotomStartMenu->sMenuNameWindowId, 1, sText_PC, 1, 0, 0xFF, NULL);
        break;
    case MENU_BAG:
        AddTextPrinterParameterized(sRotomStartMenu->sMenuNameWindowId, 1, sText_Bag, 1, 0, 0xFF, NULL);
        break;
    case MENU_TRAINER_CARD:
        AddTextPrinterParameterized(sRotomStartMenu->sMenuNameWindowId, 1, sText_Trainer, 1, 0, 0xFF, NULL);
        break;
    case MENU_SAVE:
        AddTextPrinterParameterized(sRotomStartMenu->sMenuNameWindowId, 1, sText_Save, 1, 0, 0xFF, NULL);
        break;
    case MENU_OPTIONS:
        AddTextPrinterParameterized(sRotomStartMenu->sMenuNameWindowId, 1, sText_Options, 1, 0, 0xFF, NULL);
        break;
    case MENU_RETIRE:
        AddTextPrinterParameterized(sRotomStartMenu->sMenuNameWindowId, 1, sText_Retire, 1, 0, 0xFF, NULL);
        break;
    }
    CopyWindowToVram(sRotomStartMenu->sMenuNameWindowId, COPYWIN_GFX);
}

static void RotomStartMenu_ExitAndClearTilemap(void) {
    u32 i;
    u8 *buf = GetBgTilemapBuffer(0);

    FillWindowPixelBuffer(sRotomStartMenu->sMenuNameWindowId, PIXEL_FILL(TEXT_COLOR_TRANSPARENT));
    ClearWindowTilemap(sRotomStartMenu->sMenuNameWindowId);
    CopyWindowToVram(sRotomStartMenu->sMenuNameWindowId, COPYWIN_GFX);
    RemoveWindow(sRotomStartMenu->sMenuNameWindowId);

    if (GetSafariZoneFlag()) {
        FillWindowPixelBuffer(sRotomStartMenu->sSafariBallsWindowId, PIXEL_FILL(TEXT_COLOR_TRANSPARENT));
        ClearWindowTilemap(sRotomStartMenu->sSafariBallsWindowId);
        CopyWindowToVram(sRotomStartMenu->sSafariBallsWindowId, COPYWIN_GFX);
        RemoveWindow(sRotomStartMenu->sSafariBallsWindowId);
    }

    for(i=0; i<2048; i++) {
        buf[i] = 0;
    }

    ScheduleBgCopyTilemapToVram(0);

    if (FlagGet(FLAG_SYS_POKEDEX_GET)) {
        FreeSpriteOamMatrix(&gSprites[sRotomStartMenu->spriteIdPokedex]);
        DestroySprite(&gSprites[sRotomStartMenu->spriteIdPokedex]);
    }
    if (FlagGet(FLAG_SYS_POKEMON_GET)) {
        FreeSpriteOamMatrix(&gSprites[sRotomStartMenu->spriteIdParty]);
        DestroySprite(&gSprites[sRotomStartMenu->spriteIdParty]);
    }

    if (!GetSafariZoneFlag()) {
        FreeSpriteOamMatrix(&gSprites[sRotomStartMenu->spriteIdSave]);
        DestroySprite(&gSprites[sRotomStartMenu->spriteIdSave]);
        FreeSpriteOamMatrix(&gSprites[sRotomStartMenu->spriteIdPC]);
        DestroySprite(&gSprites[sRotomStartMenu->spriteIdPC]);
    } else {
        FreeSpriteOamMatrix(&gSprites[sRotomStartMenu->spriteIdFlag]);
        DestroySprite(&gSprites[sRotomStartMenu->spriteIdFlag]);
    }

    FreeSpriteOamMatrix(&gSprites[sRotomStartMenu->spriteIdBag]);
    FreeSpriteOamMatrix(&gSprites[sRotomStartMenu->spriteIdTrainerCard]);
    FreeSpriteOamMatrix(&gSprites[sRotomStartMenu->spriteIdOptions]);
    DestroySprite(&gSprites[sRotomStartMenu->spriteIdBag]);
    DestroySprite(&gSprites[sRotomStartMenu->spriteIdTrainerCard]);
    DestroySprite(&gSprites[sRotomStartMenu->spriteIdOptions]);

    if (sRotomStartMenu != NULL) {
        FreeSpriteTilesByTag(TAG_ICON_GFX);
        Free(sRotomStartMenu);
        sRotomStartMenu = NULL;
    }

    ClearPlayerHeldMovementAndUnfreezeObjectEvents();
    UnlockPlayerFieldControls();
}

static void DoCleanUpAndChangeCallback(MainCallback callback) {
    if (!gPaletteFade.active) {
        DestroyTask(FindTaskIdByFunc(Task_RotomStartMenu_HandleMainInput));
        PlayRainStoppingSoundEffect();
        RotomStartMenu_ExitAndClearTilemap();
        CleanupOverworldWindowsAndTilemaps();
        SetMainCallback2(callback);
        gMain.savedCallback = CB2_ReturnToFieldWithOpenMenu;
    }
}

static void DoCleanUpAndOpenTrainerCard(void) {
    if (!gPaletteFade.active) {
        PlayRainStoppingSoundEffect();
        RotomStartMenu_ExitAndClearTilemap();
        CleanupOverworldWindowsAndTilemaps();
        ShowPlayerTrainerCard(CB2_ReturnToFieldWithOpenMenu); // Display trainer card
        DestroyTask(FindTaskIdByFunc(Task_RotomStartMenu_HandleMainInput));
    }
}

static void DoCleanUpAndOpenPC(void) {
    if (!gPaletteFade.active) {
        PlayRainStoppingSoundEffect();
        RotomStartMenu_ExitAndClearTilemap();
        CleanupOverworldWindowsAndTilemaps();
        gOpenedPCFromRotomMenu = TRUE;
        EnterPokeStorage(OPTION_MOVE_MONS);
        DestroyTask(FindTaskIdByFunc(Task_RotomStartMenu_HandleMainInput));
    }
}

static u8 RunSaveCallback(void)
{
    // True if text is still printing
    if (RunTextPrinters_CheckPrinter0Active())
    {
        return SAVE_IN_PROGRESS;
    }

    return sSaveDialogCallback();
}

static void SaveStartTimer(void)
{
    sSaveDialogTimer = 60;
}

static bool8 SaveSuccesTimer(void)
{
    sSaveDialogTimer--;


    if (JOY_HELD(A_BUTTON) || JOY_HELD(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        return TRUE;
    }
    if (sSaveDialogTimer == 0)
    {
        return TRUE;
    }

    return FALSE;
}

static bool8 SaveErrorTimer(void)
{
    if (sSaveDialogTimer != 0)
    {
        sSaveDialogTimer--;
    }
    else if (JOY_HELD(A_BUTTON))
    {
        return TRUE;
    }

    return FALSE;
}

static u8 SaveReturnSuccessCallback(void)
{
    if (!IsSEPlaying() && SaveSuccesTimer())
    {
        HideSaveInfoWindow();
        return SAVE_SUCCESS;
    }
    else
    {
        return SAVE_IN_PROGRESS;
    }
}

static u8 SaveSuccessCallback(void)
{
    if (!IsTextPrinterActive(0))
    {
        PlaySE(SE_SAVE);
        sSaveDialogCallback = SaveReturnSuccessCallback;
    }

    return SAVE_IN_PROGRESS;
}

static u8 SaveReturnErrorCallback(void)
{
    if (!SaveErrorTimer())
    {
        return SAVE_IN_PROGRESS;
    }
    else
    {
        HideSaveInfoWindow();
        return SAVE_ERROR;
    }
}

static u8 SaveErrorCallback(void)
{
    if (!IsTextPrinterActive(0))
    {
        PlaySE(SE_BOO);
        sSaveDialogCallback = SaveReturnErrorCallback;
    }

    return SAVE_IN_PROGRESS;
}

static u8 SaveDoSaveCallback(void)
{
    u8 saveStatus;

    IncrementGameStat(GAME_STAT_SAVED_GAME);

    if (gDifferentSaveFile)
    {
        saveStatus = TrySavingData(SAVE_OVERWRITE_DIFFERENT_FILE);
        gDifferentSaveFile = FALSE;
    }
    else
    {
        saveStatus = TrySavingData(SAVE_NORMAL);
    }

    if (saveStatus == SAVE_STATUS_OK)
        ShowSaveMessage(gText_PlayerSavedTheGame, SaveSuccessCallback);
    else
        ShowSaveMessage(gText_SaveError_PleaseExchangeBackupMemory, SaveErrorCallback);

    SaveStartTimer();
    return SAVE_IN_PROGRESS;
}

static void HideSaveInfoWindow(void) {
    ClearStdWindowAndFrame(sSaveInfoWindowId, FALSE);
    RemoveWindow(sSaveInfoWindowId);
}

static void HideSaveMessageWindow(void) {
    ClearDialogWindowAndFrame(0, TRUE);
}

static u8 SaveOverwriteInputCallback(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0: // Yes
        sSaveDialogCallback = SaveSavingMessageCallback;
        return SAVE_IN_PROGRESS;
    case MENU_B_PRESSED:
    case 1: // No
        HideSaveInfoWindow();
        HideSaveMessageWindow();
        return SAVE_CANCELED;
    }

    return SAVE_IN_PROGRESS;
}

static u8 SaveConfirmOverwriteDefaultNoCallback(void)
{
    DisplayYesNoMenuDefaultNo();
    sSaveDialogCallback = SaveOverwriteInputCallback;
    return SAVE_IN_PROGRESS;
}

static u8 SaveConfirmOverwriteCallback(void)
{
    DisplayYesNoMenuDefaultYes(); // Show Yes/No menu
    sSaveDialogCallback = SaveOverwriteInputCallback;
    return SAVE_IN_PROGRESS;
}

static void ShowSaveMessage(const u8 *message, u8 (*saveCallback)(void)) {
    StringExpandPlaceholders(gStringVar4, message);
    LoadMessageBoxAndFrameGfx(0, TRUE);
    AddTextPrinterForMessage(TRUE);
    sSaveDialogCallback = saveCallback;
}

static u8 SaveFileExistsCallback(void)
{
    if (gDifferentSaveFile)
    {
        ShowSaveMessage(gText_DifferentGameFile, SaveConfirmOverwriteDefaultNoCallback);
    }
    else
    {
        sSaveDialogCallback = SaveSavingMessageCallback;
    }

    return SAVE_IN_PROGRESS;
}

static u8 SaveSavingMessageCallback(void) {
    ShowSaveMessage(gText_SavingDontTurnOffThePower, SaveDoSaveCallback);
    return SAVE_IN_PROGRESS;
}

static u8 SaveConfirmInputCallback(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0: // Yes
        switch (gSaveFileStatus)
        {
        case SAVE_STATUS_EMPTY:
        case SAVE_STATUS_INVALID:
            if (!gDifferentSaveFile)
            {
                sSaveDialogCallback = SaveFileExistsCallback;
                return SAVE_IN_PROGRESS;
            }

            sSaveDialogCallback = SaveSavingMessageCallback;
            return SAVE_IN_PROGRESS;
        default:
            sSaveDialogCallback = SaveFileExistsCallback;
            return SAVE_IN_PROGRESS;
        }
    case MENU_B_PRESSED: // No break, thats smart
    case 1: // No
        HideSaveInfoWindow();
        HideSaveMessageWindow();
        return SAVE_CANCELED;
    }

    return SAVE_IN_PROGRESS;
}

static u8 SaveYesNoCallback(void) {
    DisplayYesNoMenuDefaultYes(); // Show Yes/No menu
    sSaveDialogCallback = SaveConfirmInputCallback;
    return SAVE_IN_PROGRESS;
}

static ALIGNED(2) const u8 sTextColor_StatName[] = { 1, 2, 3 };
static ALIGNED(2) const u8 sTextColor_StatValue[] = { 1, 4, 5 };
static ALIGNED(2) const u8 sTextColor_LocationHeader[] = { 1, 6, 7 };

static void ShowSaveInfoWindow(void) {
    struct WindowTemplate saveInfoWindow = sSaveInfoWindowTemplate;
    u8 gender, color;
    u32 x, y;
    const u8 *suffix;
    u8 *alignedSuffix = gStringVar3;

    if (!FlagGet(FLAG_SYS_POKEDEX_GET))
    {
        saveInfoWindow.height -= 2;
    }

    sSaveInfoWindowId = AddWindow(&saveInfoWindow);
    LoadStdWindowGfx(sSaveInfoWindowId, 0x21D, BG_PLTT_ID(13));
    DrawStdFrameWithCustomTileAndPalette(sSaveInfoWindowId, FALSE, 0x21D, 13);

    SaveStatToString(SAVE_STAT_LOCATION, gStringVar4, 8);
    x = (u32)(112 - GetStringWidth(FONT_NORMAL, gStringVar4, -1)) / 2;
    AddTextPrinterParameterized3(sSaveInfoWindowId, FONT_NORMAL, x, 0, sTextColor_LocationHeader, -1, gStringVar4);

    x = (u32)(112 - GetStringWidth(FONT_NORMAL, gStringVar4, -1)) / 2;
    AddTextPrinterParameterized3(sSaveInfoWindowId, FONT_SMALL, 2, 14, sTextColor_StatName, -1, gSaveStatName_Player);

    SaveStatToString(SAVE_STAT_NAME, gStringVar4, 2);
    Menu_PrintFormatIntlPlayerName(sSaveInfoWindowId, gStringVar4, 60, 14);
    AddTextPrinterParameterized3(sSaveInfoWindowId, FONT_SMALL, 2, 28, sTextColor_StatName, -1, gSaveStatName_Badges);

    SaveStatToString(SAVE_STAT_BADGES, gStringVar4, 2);
    AddTextPrinterParameterized3(sSaveInfoWindowId, FONT_SMALL, 60, 28, sTextColor_StatValue, -1, gStringVar4);
    y = 42;
    if (FlagGet(FLAG_SYS_POKEDEX_GET) == TRUE)
    {
        AddTextPrinterParameterized3(sSaveInfoWindowId, FONT_SMALL, 2, 42, sTextColor_StatName, -1, gSaveStatName_Pokedex);
        SaveStatToString(SAVE_STAT_POKEDEX, gStringVar4, 2);
        AddTextPrinterParameterized3(sSaveInfoWindowId, FONT_SMALL, 60, 42, sTextColor_StatValue, -1, gStringVar4);
        y = 56;
    }
    AddTextPrinterParameterized3(sSaveInfoWindowId, FONT_SMALL, 2, y, sTextColor_StatName, -1, gSaveStatName_Time);

    SaveStatToString(SAVE_STAT_TIME, gStringVar4, 2);
    AddTextPrinterParameterized3(sSaveInfoWindowId, FONT_SMALL, 60, y, sTextColor_StatValue, -1, gStringVar4);
    CopyWindowToVram(sSaveInfoWindowId, COPYWIN_GFX);
}

static u8 SaveConfirmSaveCallback(void) {
    ClearStdWindowAndFrame(GetStartMenuWindowId(), FALSE);
    ShowSaveInfoWindow();

    ShowSaveMessage(gText_WouldYouLikeToSaveTheGame, SaveYesNoCallback);
    return SAVE_IN_PROGRESS;
}

static void InitSave(void)
{
    SaveMapView();
    sSaveDialogCallback = SaveConfirmSaveCallback;
}

static void Task_HandleSave(u8 taskId) {
    switch (RunSaveCallback()) {
    case SAVE_IN_PROGRESS:
        break;
    case SAVE_CANCELED: // Back to start menu
        ClearDialogWindowAndFrameToTransparent(0, TRUE);
        // ClearPlayerHeldMovementAndUnfreezeObjectEvents();
        // UnlockPlayerFieldControls();
        // FieldClearVBlankHBlankCallbacks();
        RotomStartMenu_Init();
        // CB2_ReturnToField();
        // SetMainCallback2(CB2_ReturnToField);
        // CreateTask(Task_RotomStartMenu_HandleMainInput, 0);
        DestroyTask(taskId);
        break;
    case SAVE_SUCCESS:
    case SAVE_ERROR:    // Close start menu
        ClearDialogWindowAndFrameToTransparent(0, TRUE);
        ClearPlayerHeldMovementAndUnfreezeObjectEvents();
        UnlockPlayerFieldControls();
        DestroyTask(taskId);
        break;
    }
}

static void DoCleanUpAndStartSaveMenu(void) {
    // if (!gPaletteFade.active) {
    //     RotomStartMenu_ExitAndClearTilemap();
    //     FreezeObjectEvents();
    //     LoadUserWindowGfx(sSaveInfoWindowId, STD_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(STD_WINDOW_PALETTE_NUM));
    //     LockPlayerFieldControls();
    //     DestroyTask(FindTaskIdByFunc(Task_RotomStartMenu_HandleMainInput));
    //     InitSave();
    //     CreateTask(Task_HandleSave, 0x80);
    // }
    RotomStartMenu_ExitAndClearTilemap();
    FreezeObjectEvents();
    LoadUserWindowGfx(sSaveInfoWindowId, STD_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(STD_WINDOW_PALETTE_NUM));
    LockPlayerFieldControls();
    DestroyTask(FindTaskIdByFunc(Task_RotomStartMenu_HandleMainInput));
    InitSave();
    CreateTask(Task_HandleSave, 0x80);
}

static void DoCleanUpAndStartSafariZoneRetire(void) {
    if (!gPaletteFade.active) {
        RotomStartMenu_ExitAndClearTilemap();
        FreezeObjectEvents();
        LockPlayerFieldControls();
        DestroyTask(FindTaskIdByFunc(Task_RotomStartMenu_SafariZone_HandleMainInput));
        SafariZoneRetirePrompt();
    }
}

static void RotomStartMenu_OpenMenu(void) {
    switch (sMenuSelected) {
    case MENU_POKEDEX:
        DoCleanUpAndChangeCallback(CB2_OpenPokedexFromStartMenu);
        break;
    case MENU_PARTY:
        DoCleanUpAndChangeCallback(CB2_PartyMenuFromStartMenu);
        break;
    case MENU_PC:
        DoCleanUpAndOpenPC();
        break;
    case MENU_BAG:
        DoCleanUpAndChangeCallback(CB2_BagMenuFromStartMenu);
        break;
    case MENU_TRAINER_CARD:
        DoCleanUpAndOpenTrainerCard();
        break;
    case MENU_SAVE:
        DoCleanUpAndStartSaveMenu();
        break;
    case MENU_OPTIONS:
        DoCleanUpAndChangeCallback(CB2_OptionsMenuFromStartMenu);
        break;
    }
}

static void RotomStartMenu_HandleInput_DPadDown(void) {
    // Needs to be set to 0 so that the selected icons change in the frontend
    sRotomStartMenu->iconAnimStarted = FALSE;

    switch (sMenuSelected) {
    case MENU_OPTIONS:
        PlaySE(SE_SELECT);
        if (FlagGet(FLAG_SYS_POKEDEX_GET)) {
            sMenuSelected = MENU_POKEDEX;
        } else if (FlagGet(FLAG_SYS_POKEMON_GET)) {
            sMenuSelected = MENU_PARTY;
        } else {
            sMenuSelected = MENU_BAG;
        }
        break;
    default:
        sMenuSelected++;
        PlaySE(SE_SELECT);
        if (!FlagGet(FLAG_SYS_POKEMON_GET) && sMenuSelected == MENU_PARTY) {
            sMenuSelected++;
      }
      break;
    }

    RotomStartMenu_UpdateMenuName();
}

static void RotomStartMenu_HandleInput_DPadUp(void) {
    sRotomStartMenu->iconAnimStarted = FALSE;

    switch (sMenuSelected) {
    case MENU_POKEDEX:
        PlaySE(SE_SELECT);
        sMenuSelected = MENU_OPTIONS;
        break;
    default:
        PlaySE(SE_SELECT);
        if ((!FlagGet(FLAG_SYS_POKEMON_GET) && sMenuSelected == MENU_BAG)
            || (!FlagGet(FLAG_SYS_POKEDEX_GET) && sMenuSelected == MENU_PARTY)) {
            sMenuSelected = MENU_OPTIONS;
            break;
        } else {
            sMenuSelected--;
        }
        break;
    }

    RotomStartMenu_UpdateMenuName();
}

static void Task_RotomStartMenu_HandleMainInput(u8 taskId) {
    u32 index;
    if (!sRotomStartMenu->optionSelected && !gPaletteFade.active) {
        index = IndexOfSpritePaletteTag(TAG_ICON_PAL);
        LoadPalette(sIconPal, OBJ_PLTT_ID(index), PLTT_SIZE_4BPP);
    }

    if (JOY_NEW(A_BUTTON)) {
        if (!sRotomStartMenu->optionSelected) {
            if (sMenuSelected != MENU_SAVE) {
                FadeScreen(FADE_TO_BLACK, 0);
            }
            sRotomStartMenu->optionSelected = TRUE;
        }
    } else if (JOY_NEW(B_BUTTON) && !sRotomStartMenu->optionSelected) {
        PlaySE(SE_SELECT);
        RotomStartMenu_ExitAndClearTilemap();
        DestroyTask(taskId);
    } else if (JOY_NEW(DPAD_DOWN) && !sRotomStartMenu->optionSelected) {
        RotomStartMenu_HandleInput_DPadDown();
    } else if (JOY_NEW(DPAD_UP) && !sRotomStartMenu->optionSelected) {
        RotomStartMenu_HandleInput_DPadUp();
    } else if (sRotomStartMenu->optionSelected) {
        RotomStartMenu_OpenMenu();
    }
}

static void RotomStartMenu_SafariZone_HandleInput_DPadDown(void) {
    sRotomStartMenu->iconAnimStarted = FALSE;

    switch (sMenuSelected) {
    case MENU_OPTIONS:
        sMenuSelected = MENU_RETIRE;
        break;
    default:
        PlaySE(SE_SELECT);
        if (sMenuSelected == MENU_RETIRE) {
            sMenuSelected = MENU_POKEDEX;
        } else if (sMenuSelected == MENU_BAG) {
            sMenuSelected = MENU_TRAINER_CARD;
        } else if (sMenuSelected == MENU_TRAINER_CARD) {
            sMenuSelected = MENU_OPTIONS;
        } else {
            sMenuSelected++;
        }
        break;
    }

    RotomStartMenu_UpdateMenuName();
}

static void RotomStartMenu_SafariZone_HandleInput_DPadUp(void) {
    sRotomStartMenu->iconAnimStarted = FALSE;

    switch (sMenuSelected) {
    case MENU_RETIRE:
        sMenuSelected = MENU_OPTIONS;
        break;
    default:
        PlaySE(SE_SELECT);
        if (sMenuSelected == MENU_POKEDEX) {
            sMenuSelected = MENU_RETIRE;
        } else if (sMenuSelected == MENU_OPTIONS) {
            sMenuSelected = MENU_TRAINER_CARD;
        } else if (sMenuSelected == MENU_TRAINER_CARD) {
            sMenuSelected = MENU_BAG;
        } else {
            sMenuSelected--;
        }
        break;
    }

    RotomStartMenu_UpdateMenuName();
}

static void Task_RotomStartMenu_SafariZone_HandleMainInput(u8 taskId) {
    u32 index;
    if (!sRotomStartMenu->optionSelected && !gPaletteFade.active) {
        index = IndexOfSpritePaletteTag(TAG_ICON_PAL);
        LoadPalette(sIconPal, OBJ_PLTT_ID(index), PLTT_SIZE_4BPP);
    }

    if (JOY_NEW(A_BUTTON)) {
        if (!sRotomStartMenu->optionSelected) {
            if (sMenuSelected != MENU_RETIRE) {
                FadeScreen(FADE_TO_BLACK, 0);
            }
            sRotomStartMenu->optionSelected = TRUE;
        }
    } else if (JOY_NEW(B_BUTTON) && !sRotomStartMenu->optionSelected) {
        PlaySE(SE_SELECT);
        RotomStartMenu_ExitAndClearTilemap();
        DestroyTask(taskId);
    } else if (JOY_NEW(DPAD_DOWN) && !sRotomStartMenu->optionSelected) {
        RotomStartMenu_SafariZone_HandleInput_DPadDown();
    } else if (JOY_NEW(DPAD_UP) && !sRotomStartMenu->optionSelected) {
        RotomStartMenu_SafariZone_HandleInput_DPadUp();
    } else if (sRotomStartMenu->optionSelected) {
        if (sMenuSelected != MENU_RETIRE) {
            RotomStartMenu_OpenMenu();
        } else {
            DoCleanUpAndStartSafariZoneRetire();
        }
    }
}
