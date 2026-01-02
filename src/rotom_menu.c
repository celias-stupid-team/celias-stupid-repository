// Based on vol's heat start menu, credits to him (Voluptua) and Pawkkie
#include "rotom_menu.h"

#include "global.h"

#include "constants/event_objects.h"
#include "constants/map_groups.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/rgb.h"
#include "constants/songs.h"
#include "constants/sound.h"

#include "gba/isagbprint.h"

#include "battle_message.h"
#include "bg.h"
#include "comfy_anim.h"
#include "data.h"
#include "decompress.h"
#include "event_data.h"
#include "event_object_lock.h"
#include "event_object_movement.h"
#include "event_scripts.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "field_screen_effect.h"
#include "field_specials.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "fldeff.h"
#include "gpu_regs.h"
#include "item_menu.h"
#include "link.h"
#include "load_save.h"
#include "main.h"
#include "malloc.h"
#include "menu.h"
#include "metatile_behavior.h"
#include "new_game.h"
#include "new_menu_helpers.h"
#include "option_menu.h"
#include "overworld.h"
#include "palette.h"
#include "party_menu.h"
#include "pokedex.h"
#include "pokedex_screen.h"
#include "pokemon.h"
#include "pokemon_storage_system.h"
#include "pokemon_storage_system_internal.h"
#include "region_map.h"
#include "save.h"
#include "save_menu_util.h"
#include "scanline_effect.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "start_menu.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "text.h"
#include "text_window.h"
#include "trainer_card.h"
#include "union_room.h"
#include "window.h"

/* CALLBACKS */
static void SpriteCB_IconPokedex(struct Sprite *sprite);
static void SpriteCB_IconParty(struct Sprite *sprite);
static void SpriteCB_IconPC(struct Sprite *sprite);
static void SpriteCB_IconBag(struct Sprite *sprite);
static void SpriteCB_IconTrainerCard(struct Sprite *sprite);
static void SpriteCB_IconSave(struct Sprite *sprite);
static void SpriteCB_IconOptions(struct Sprite *sprite);
static void SpriteCB_IconBagF(struct Sprite *sprite);
static void SpriteCB_RotomEyes(struct Sprite *sprite);
static void SpriteCB_MoveSelectorMask(struct Sprite *sprite);

/* TASKs */
static void Task_RotomStartMenu_HandleMainInput(u8 taskId);
static void Task_HandleSave(u8 taskId);

/* OTHER FUNCTIONS */
static void RotomStartMenu_LoadSprites(void);
static void RotomStartMenu_CreateSprites(void);
static void RotomStartMenu_CreateSpriteMasks(void);
static void RotomStartMenu_DisableSpriteAffineModes(void);
static void RotomStartMenu_LoadBgGfx(void);
static void RotomStartMenu_PrintDexNumbers(void);
static void RotomStartMenu_DestroySprites(void);
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
static void PopulateMoveMonSpecies(void);

/* Field move funcs */
static bool32 SetupFunc_Surf(void);
static void FieldMoveFunc_Surf(void);
static bool32 SetupFunc_Waterfall(void);
static void FieldMoveFunc_Waterfall(void);
static bool32 SetupFunc_RockClimb(void); // placeholder
static void FieldMoveFunc_RockClimb(void); // placeholder
static bool32 SetupFunc_Strength(void);
static void FieldMoveFunc_Strength(void);
static bool32 SetupFunc_Cut(void);
static void FieldMoveFunc_Cut(void);
static bool32 SetupFunc_Fly(void);
static void FieldMoveFunc_Fly(void);
static bool32 SetupFunc_Whirlpool(void); // placeholder
static void FieldMoveFunc_Whirlpool(void); // placeholder
static bool32 SetupFunc_Guillotine(void); // placeholder
static void FieldMoveFunc_Guillotine(void); // placeholder
static bool32 SetupFunc_BrickBreak(void); // placeholder
static void FieldMoveFunc_BrickBreak(void); // placeholder
static bool32 SetupFunc_TailGlow(void);
static void FieldMoveFunc_TailGlow(void);
static bool32 SetupFunc_Rest(void); // placeholder
static void FieldMoveFunc_Rest(void); // placeholder
static bool32 SetupFunc_Retreat(void);
static void FieldMoveFunc_Retreat(void);

/* ENUMs */
enum MenuOption
{
    MENU_OPTION_TOP,
    MENU_POKEDEX = MENU_OPTION_TOP,
    MENU_PARTY,
    MENU_BAG,
    MENU_PC,
    MENU_TRAINER_CARD,
    MENU_SAVE,
    MENU_OPTIONS,
    MENU_OPTION_BOTTOM = MENU_OPTIONS,
    // add new options here
    MENU_NONE,
};

enum SaveStates
{
    SAVE_IN_PROGRESS,
    SAVE_SUCCESS,
    SAVE_CANCELED,
    SAVE_ERROR
};

enum ComfyAnimStatus
{
    COMFY_ANIM_NONE,
    COMFY_ANIM_STARTED,
    COMFY_ANIM_COMPLETED,
};

enum RotomMoveMessage
{
    ROTOM_MSG_NONE,
    ROTOM_MSG_NOTHING_TO_CUT,
    ROTOM_MSG_CANT_SURF_HERE,
    ROTOM_MSG_ALREADY_SURFING,
    ROTOM_MSG_CURRENT_TOO_FAST,
    ROTOM_MSG_ALREADY_IN_USE,
    ROTOM_MSG_CANT_USE_HERE,
    ROTOM_MSG_CANT_USE_RETREAT,
    ROTOM_MSG_NO_RETREAT,
    ROTOM_MSG_COUNT,
};

enum RotomMonIcon
{
    ICON_GHOLDENGO,
    ICON_GOLDEEN,
    ICON_MACHAMP,
    ICON_BIDOOF,
    ICON_FARFETCHD,
    ICON_GOLURK,
    ICON_SMEARGLE,
    ICON_EXEGGUTOR,
    ICON_KANGASKHAN,
    ICON_AMPHAROS_MEGA,
    ICON_MR_MIME,
    ICON_SCYTHER,
    ICON_KRABBY,
    ICON_AMPHAROS,
    MON_ICON_COUNT,
};

enum RotomSpriteID
{
    SPRITE_ROTOM_EYE_TOP,
    SPRITE_ROTOM_EYE_BOTTOM,
    SPRITE_DEX_NUM_WIN_L,
    SPRITE_DEX_NUM_WIN_R,
    SPRITE_MOVE_SELECTOR_L,
    SPRITE_MOVE_SELECTOR_R,
    SPRITE_MON_ICON_0,
    SPRITE_MON_ICON_1,
    SPRITE_MON_ICON_2,
    SPRITE_MON_ICON_3,
    SPRITE_MON_ICON_4,
    SPRITE_MON_ICON_5,
    ROTOM_SPRITE_AFFINE_START,
    SPRITE_POKEDEX = ROTOM_SPRITE_AFFINE_START,
    SPRITE_PARTY,
    SPRITE_BAG,
    SPRITE_PC,
    SPRITE_TRAINER_CARD,
    SPRITE_SAVE,
    SPRITE_OPTIONS,
    ROTOM_SPRITE_COUNT,
    ROTOM_SPRITE_MASKS_START = ROTOM_SPRITE_COUNT,
};

#define ROTOM_SPRITE_COUNT_WITH_MASKS (ROTOM_SPRITE_COUNT * 2)

enum RotomMoveID
{
    ROTOM_MOVE_TOP_ROW_MIN,
    ROTOM_MOVE_SURF = ROTOM_MOVE_TOP_ROW_MIN,
    ROTOM_MOVE_WATERFALL,
    ROTOM_MOVE_ROCK_CLIMB,
    ROTOM_MOVE_STRENGTH,
    ROTOM_MOVE_CUT,
    ROTOM_MOVE_FLY,
    ROTOM_MOVE_TOP_ROW_MAX = ROTOM_MOVE_FLY,
    ROTOM_MOVE_BOTTOM_ROW_MIN,
    ROTOM_MOVE_WHIRLPOOL = ROTOM_MOVE_BOTTOM_ROW_MIN,
    ROTOM_MOVE_GUILLOTINE,
    ROTOM_MOVE_BRICK_BREAK,
    ROTOM_MOVE_TAIL_GLOW,
    ROTOM_MOVE_REST,
    ROTOM_MOVE_RETREAT,
    ROTOM_MOVE_BOTTOM_ROW_MAX = ROTOM_MOVE_RETREAT,
    ROTOM_MOVE_COUNT,
    ROTOM_MOVE_NONE = ROTOM_MOVE_COUNT,
};

#define ROTOM_MOVE_ROW_SIZE    (ROTOM_MOVE_TOP_ROW_MAX + 1)
#define MOVE_SELECTOR_R_OFFSET 32
#define MOVE_SELECTOR_Y_POS    107

#define BLINK_TIMER_START_VALUE   100
#define BLINK_TIMER_FRAMES_ACTIVE 5
#define LOOK_TIMER_FRAMES         40
#define NUM_DIZZY_LOOPS           3 // Number of times to wraparound while in autoscroll mode before transitioning to Dizzy state
#define DIZZY_CLOSE_EYE_TIMER     30 // How long the rotom's eyes will be closed before turning dizzy
#define DIZZY_EYES_TIMER          90 // How long rotom's eyes stay dizzy
#define OBTAINABLE_EYES_TIMER     90 // How long rotom's eyes look at new obtainable number
#define OBTAINABLE_LOOK_DELAY     60 // How long to wait after opening to look at new obtainable number

#define ROTOMSE_MENU_CURSOR    SE_DEX_SCROLL
#define ROTOMSE_MOVE_CURSOR    SE_DEX_SCROLL
#define ROTOMSE_MOVE_PAGE      SE_DEX_PAGE
#define ROTOMSE_MENU_CLOSE     SE_POKENAV_OFF
#define ROTOMSE_MENU_SELECTION SE_SELECT
#define ROTOMSE_NEW_OBTAINABLE SE_PIN

#define ROTOM_MENU_REPEAT_DELAY 25

static const u8 *const sRotomMoveMessages[ROTOM_MSG_COUNT] = {
    [ROTOM_MSG_NONE] = gText_EmptyString3,
    [ROTOM_MSG_NOTHING_TO_CUT] = gText_NothingToCut,
    [ROTOM_MSG_CANT_SURF_HERE] = gText_CantSurfHere,
    [ROTOM_MSG_ALREADY_SURFING] = gText_AlreadySurfing,
    [ROTOM_MSG_CURRENT_TOO_FAST] = gText_CurrentIsTooFast,
    [ROTOM_MSG_ALREADY_IN_USE] = gText_InUseAlready_PM,
    [ROTOM_MSG_CANT_USE_HERE] = gText_CantUseHere,
    [ROTOM_MSG_CANT_USE_RETREAT] = gText_CantUseRetreat,
    [ROTOM_MSG_NO_RETREAT] = gText_NoRetreat,
};

struct RotomMove
{
    u32 move;
    u32 spriteXPos;
    u32 monXPos;
    const u8 *name;
    bool32 (*setupFunc)(void);
    void (*fieldMoveFunc)(void);
};

static const struct RotomMove sRotomMoves[ROTOM_MOVE_COUNT + 1] = {
    [ROTOM_MOVE_SURF] = {
        .move = MOVE_SURF,
        .spriteXPos = 6,
        .monXPos = 21,
        .name = gLongMoveNames[MOVE_SURF],
        .setupFunc = SetupFunc_Surf,
        .fieldMoveFunc = FieldMoveFunc_Surf,
    },
    [ROTOM_MOVE_WATERFALL] = {
        .move = MOVE_WATERFALL,
        .spriteXPos = 38,
        .monXPos = 53,
        .name = gLongMoveNames[MOVE_WATERFALL],
        .setupFunc = SetupFunc_Waterfall,
        .fieldMoveFunc = FieldMoveFunc_Waterfall,
    },
    [ROTOM_MOVE_ROCK_CLIMB] = {
        .move = MOVE_ROCK_CLIMB,
        .spriteXPos = 70,
        .monXPos = 85,
        .name = gLongMoveNames[MOVE_ROCK_CLIMB],
        .setupFunc = SetupFunc_RockClimb,
        .fieldMoveFunc = FieldMoveFunc_RockClimb,
    },
    [ROTOM_MOVE_STRENGTH] = {
        .move = MOVE_STRENGTH,
        .spriteXPos = 102,
        .monXPos = 117,
        .name = gLongMoveNames[MOVE_STRENGTH],
        .setupFunc = SetupFunc_Strength,
        .fieldMoveFunc = FieldMoveFunc_Strength,
    },
    [ROTOM_MOVE_CUT] = {
        .move = MOVE_CUT,
        .spriteXPos = 134,
        .monXPos = 149,
        .name = gLongMoveNames[MOVE_CUT],
        .setupFunc = SetupFunc_Cut,
        .fieldMoveFunc = FieldMoveFunc_Cut,
    },
    [ROTOM_MOVE_FLY] = {
        .move = MOVE_FLY,
        .spriteXPos = 166,
        .monXPos = 181,
        .name = gLongMoveNames[MOVE_FLY],
        .setupFunc = SetupFunc_Fly,
        .fieldMoveFunc = FieldMoveFunc_Fly,
    },
    [ROTOM_MOVE_WHIRLPOOL] = {
        .move = MOVE_WHIRLPOOL,
        .spriteXPos = 6,
        .monXPos = 21,
        .name = gLongMoveNames[MOVE_WHIRLPOOL],
        .setupFunc = SetupFunc_Whirlpool,
        .fieldMoveFunc = FieldMoveFunc_Whirlpool,
    },
    [ROTOM_MOVE_GUILLOTINE] = {
        .move = MOVE_GUILLOTINE,
        .spriteXPos = 38,
        .monXPos = 53,
        .name = gLongMoveNames[MOVE_GUILLOTINE],
        .setupFunc = SetupFunc_Guillotine,
        .fieldMoveFunc = FieldMoveFunc_Guillotine,
    },
    [ROTOM_MOVE_BRICK_BREAK] = {
        .move = MOVE_BRICK_BREAK,
        .spriteXPos = 70,
        .monXPos = 85,
        .name = gLongMoveNames[MOVE_BRICK_BREAK],
        .setupFunc = SetupFunc_BrickBreak,
        .fieldMoveFunc = FieldMoveFunc_BrickBreak,
    },
    [ROTOM_MOVE_TAIL_GLOW] = {
        .move = MOVE_TAIL_GLOW,
        .spriteXPos = 102,
        .monXPos = 117,
        .name = gLongMoveNames[MOVE_TAIL_GLOW],
        .setupFunc = SetupFunc_TailGlow,
        .fieldMoveFunc = FieldMoveFunc_TailGlow,
    },
    [ROTOM_MOVE_REST] = {
        .move = MOVE_REST,
        .spriteXPos = 134,
        .monXPos = 149,
        .name = gLongMoveNames[MOVE_REST],
        .setupFunc = SetupFunc_Rest,
        .fieldMoveFunc = FieldMoveFunc_Rest,
    },
    [ROTOM_MOVE_RETREAT] = {
        .move = MOVE_RETREAT,
        .spriteXPos = 166,
        .monXPos = 181,
        .name = gLongMoveNames[MOVE_RETREAT],
        .setupFunc = SetupFunc_Retreat,
        .fieldMoveFunc = FieldMoveFunc_Retreat,
    },
    [ROTOM_MOVE_NONE] = {
        .move = MOVE_NONE,
        .spriteXPos = 218,
        .monXPos = 0,
        .name = gText_EmptyString3,
        .setupFunc = NULL,
        .fieldMoveFunc = NULL,
    },
};

/* STRUCTs */
struct RotomStartMenu
{
    u16 sDexNumbersWindowID;
    u16 sMoveNameWindowId;
    u16 keyRepeatStartDelayBackup;
    u16 monSpecies[ROTOM_MOVE_COUNT];
    u16 monSlotOrBoxPos[ROTOM_MOVE_COUNT];
    u8 spriteIDs[ROTOM_SPRITE_COUNT_WITH_MASKS];
    u8 blinkTimer;
    u8 rotomEyesStateTimer;
    u8 rotomEyesState;
    u8 rotomMoveMsgID;
    u8 iconAnimStarted:1;
    u8 optionSelected:1;
    u8 storedMenuOption:4;
    u8 filler:2;
    u8 fieldMoveCursor:4;
    u8 comfyAnimStatus:2;
    u8 screenWraparoundCounter:2;
};

static const u16 sRotomMonIconToSpecies[] = {
    [ICON_GHOLDENGO] = SPECIES_GHOLDENGO,
    [ICON_GOLDEEN] = SPECIES_GOLDEEN,
    [ICON_MACHAMP] = SPECIES_MACHAMP,
    [ICON_BIDOOF] = SPECIES_BIDOOF,
    [ICON_FARFETCHD] = SPECIES_FARFETCHD,
    [ICON_GOLURK] = SPECIES_GOLURK,
    [ICON_SMEARGLE] = SPECIES_SMEARGLE,
    [ICON_EXEGGUTOR] = SPECIES_EXEGGUTOR,
    [ICON_KANGASKHAN] = SPECIES_KANGASKHAN,
    [ICON_AMPHAROS_MEGA] = SPECIES_AMPHAROS_MEGA,
    [ICON_MR_MIME] = SPECIES_MR_MIME,
    [ICON_SCYTHER] = SPECIES_SCYTHER,
    [ICON_KRABBY] = SPECIES_KRABBY,
    [ICON_AMPHAROS] = SPECIES_AMPHAROS,
};

EWRAM_DATA bool8 gUsingRotomMenuMove = 0;
EWRAM_DATA u16 gRotomMoveSlotOrBoxPos = 0;
static EWRAM_DATA struct RotomStartMenu *sRotomStartMenu = NULL;
static EWRAM_DATA u8 sFieldMoveData = 0;
static EWRAM_DATA u8 sMenuSelected = 0;
static EWRAM_DATA u8 sStoredMoveRow = 0;
static EWRAM_DATA u8 (*sSaveDialogCallback)(void) = NULL;
static EWRAM_DATA u8 sSaveDialogTimer = 0;
static EWRAM_DATA u8 sSaveInfoWindowId = 0;

// --BG-GFX--
static const u32 sStartMenuTiles[] = INCBIN_U32("graphics/rotom_menu/rotom_new.4bpp.lz");
static const u32 sStartMenuTilemap[] = INCBIN_U32("graphics/rotom_menu/rotom_new.bin.lz");
static const u16 sStartMenuPalette[] = INCBIN_U16("graphics/rotom_menu/rotom_new.gbapal");
static const u16 sStandardMenuPalette[] = INCBIN_U16("graphics/interface/std_menu.gbapal");

//--SPRITE-GFX--
#define TAG_ICON_GFX                 1234
#define TAG_ICON_PAL                 0x4654
#define TAG_MOVE_SELECTOR_GFX        1235
#define TAG_MOVE_SELECTOR_PAL        0x4655
#define TAG_ROTOM_EYES_GFX           1236
#define TAG_MON_ICON_GFX             1237
#define TAG_MON_ICON_PAL             0x4656
#define TAG_MOVE_SELECTOR_MIDDLE_GFX 1238

static const u32 sIconGfx[] = INCBIN_U32("graphics/rotom_menu/icons.4bpp.lz");
static const u16 sIconPal[] = INCBIN_U16("graphics/rotom_menu/icons.gbapal");
static const u32 sMoveSelectorGfx[] = INCBIN_U32("graphics/rotom_menu/move_selector.4bpp.lz");
static const u32 sMoveSelectorMiddleGfx[] = INCBIN_U32("graphics/rotom_menu/move_selector_middle.4bpp.lz");
static const u16 sMoveSelectorPal[] = INCBIN_U16("graphics/rotom_menu/rotom_new.gbapal");
static const u32 sRotomEyesGfx[] = INCBIN_U32("graphics/rotom_menu/rotom_eyes.4bpp.lz");
static const u32 sMonIconGfx[] = INCBIN_U32("graphics/rotom_menu/mon_icons.4bpp.lz");
static const u16 sMonIconPal[] = INCBIN_U16("graphics/rotom_menu/mon_icons.gbapal");

static const struct WindowTemplate sSaveInfoWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 14,
    .height = 10,
    .paletteNum = 15,
    .baseBlock = 8
};

static const struct WindowTemplate sWindowTemplate_DexNumbers = {
    .bg = 0,
    .tilemapLeft = 20,
    .tilemapTop = 0,
    .width = 5,
    .height = 2,
    .paletteNum = 15,
    .baseBlock = 248
};

static const struct WindowTemplate sWindowTemplate_MoveNames = {
    .bg = 0,
    .tilemapLeft = 0,
    .tilemapTop = 13,
    .width = 25,
    .height = 2,
    .paletteNum = 15,
    .baseBlock = 258
};

#define MON_ICON_FRAME_SIZE      32
#define MON_ICON_TILES_PER_FRAME 16

static const union AnimCmd sAnimCmd_MonIcon_Gholdengo[] = {
    ANIMCMD_FRAME((ICON_GHOLDENGO * MON_ICON_TILES_PER_FRAME), 0),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sAnimCmd_MonIcon_Goldeen[] = {
    ANIMCMD_FRAME((ICON_GOLDEEN * MON_ICON_TILES_PER_FRAME), 0),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sAnimCmd_MonIcon_Machamp[] = {
    ANIMCMD_FRAME((ICON_MACHAMP * MON_ICON_TILES_PER_FRAME), 0),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sAnimCmd_MonIcon_Bidoof[] = {
    ANIMCMD_FRAME((ICON_BIDOOF * MON_ICON_TILES_PER_FRAME), 0),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sAnimCmd_MonIcon_Farfetchd[] = {
    ANIMCMD_FRAME((ICON_FARFETCHD * MON_ICON_TILES_PER_FRAME), 0),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sAnimCmd_MonIcon_Golurk[] = {
    ANIMCMD_FRAME((ICON_GOLURK * MON_ICON_TILES_PER_FRAME), 0),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sAnimCmd_MonIcon_Smeargle[] = {
    ANIMCMD_FRAME((ICON_SMEARGLE * MON_ICON_TILES_PER_FRAME), 0),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sAnimCmd_MonIcon_Exeggutor[] = {
    ANIMCMD_FRAME((ICON_EXEGGUTOR * MON_ICON_TILES_PER_FRAME), 0),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sAnimCmd_MonIcon_Kangaskhan[] = {
    ANIMCMD_FRAME((ICON_KANGASKHAN * MON_ICON_TILES_PER_FRAME), 0),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sAnimCmd_MonIcon_AmpharosMega[] = {
    ANIMCMD_FRAME((ICON_AMPHAROS_MEGA * MON_ICON_TILES_PER_FRAME), 0),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sAnimCmd_MonIcon_MrMime[] = {
    ANIMCMD_FRAME((ICON_MR_MIME * MON_ICON_TILES_PER_FRAME), 0),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sAnimCmd_MonIcon_Scyther[] = {
    ANIMCMD_FRAME((ICON_SCYTHER * MON_ICON_TILES_PER_FRAME), 0),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sAnimCmd_MonIcon_Krabby[] = {
    ANIMCMD_FRAME((ICON_KRABBY * MON_ICON_TILES_PER_FRAME), 0),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sAnimCmd_MonIcon_Ampharos[] = {
    ANIMCMD_FRAME((ICON_AMPHAROS * MON_ICON_TILES_PER_FRAME), 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sMonIconAnimTable[MON_ICON_COUNT] = {
    [ICON_GHOLDENGO] = sAnimCmd_MonIcon_Gholdengo,
    [ICON_GOLDEEN] = sAnimCmd_MonIcon_Goldeen,
    [ICON_MACHAMP] = sAnimCmd_MonIcon_Machamp,
    [ICON_BIDOOF] = sAnimCmd_MonIcon_Bidoof,
    [ICON_FARFETCHD] = sAnimCmd_MonIcon_Farfetchd,
    [ICON_GOLURK] = sAnimCmd_MonIcon_Golurk,
    [ICON_SMEARGLE] = sAnimCmd_MonIcon_Smeargle,
    [ICON_EXEGGUTOR] = sAnimCmd_MonIcon_Exeggutor,
    [ICON_KANGASKHAN] = sAnimCmd_MonIcon_Kangaskhan,
    [ICON_AMPHAROS_MEGA] = sAnimCmd_MonIcon_AmpharosMega,
    [ICON_MR_MIME] = sAnimCmd_MonIcon_MrMime,
    [ICON_SCYTHER] = sAnimCmd_MonIcon_Scyther,
    [ICON_KRABBY] = sAnimCmd_MonIcon_Krabby,
    [ICON_AMPHAROS] = sAnimCmd_MonIcon_Ampharos,
};

static const struct SpritePalette sSpritePal_MonIcon[] = {
    { sMonIconPal, TAG_MON_ICON_PAL },
    { NULL },
};

static const struct CompressedSpriteSheet sSpriteSheet_MonIcon[] = {
    { sMonIconGfx, (MON_ICON_FRAME_SIZE * MON_ICON_FRAME_SIZE * MON_ICON_COUNT) / 2, TAG_MON_ICON_GFX },
    { NULL },
};

static const struct OamData sOamMonIcon = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
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

static const struct SpriteTemplate sSpriteMonIcon = {
    .tileTag = TAG_MON_ICON_GFX,
    .paletteTag = TAG_MON_ICON_PAL,
    .oam = &sOamMonIcon,
    .anims = sMonIconAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpritePalette sSpritePal_Icon[] = {
    { sIconPal, TAG_ICON_PAL },
    { NULL },
};

#define ROTOM_ICON_SIZE 32

static const struct CompressedSpriteSheet sSpriteSheet_Icon[] = {
    { sIconGfx, (ROTOM_ICON_SIZE * ROTOM_ICON_SIZE * 16) / 2, TAG_ICON_GFX },
    { NULL },
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

static const struct SpritePalette sSpritePal_MoveSelector[] = {
    { sIconPal, TAG_MOVE_SELECTOR_PAL },
    { NULL },
};

static const struct CompressedSpriteSheet sSpriteSheet_MoveSelector[] = {
    { sMoveSelectorGfx, (64 * 32) / 2, TAG_MOVE_SELECTOR_GFX },
    { NULL },
};

static const struct OamData sOamMoveSelector = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x32),
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
};

static const struct SpriteTemplate sSpriteMoveSelector = {
    .tileTag = TAG_MOVE_SELECTOR_GFX,
    .paletteTag = TAG_MOVE_SELECTOR_PAL,
    .oam = &sOamMoveSelector,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct CompressedSpriteSheet sSpriteSheet_MoveSelectorMiddle[] = {
    { sMoveSelectorMiddleGfx, (32 * 32) / 2, TAG_MOVE_SELECTOR_MIDDLE_GFX },
    { NULL },
};

static const struct OamData sOamMoveSelectorMiddle = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
};

static const struct SpriteTemplate sSpriteMoveSelectorMiddle = {
    .tileTag = TAG_MOVE_SELECTOR_MIDDLE_GFX,
    .paletteTag = TAG_MOVE_SELECTOR_PAL,
    .oam = &sOamMoveSelectorMiddle,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

#define ROTOM_EYES_FRAME_SIZE      16
#define ROTOM_EYES_TILES_PER_FRAME 4

enum RotomEyesStates
{
    EYE_STATE_NORMAL,
    EYE_STATE_TRACKING,
    EYE_STATE_DIZZY_CLOSED,
    EYE_STATE_DIZZY,
    EYE_STATE_NEW_OBTAINABLE,
};

enum RotomEyesFrame
{
    ROTOM_EYES_DEFAULT,
    ROTOM_EYES_POKEDEX,
    ROTOM_EYES_PARTY,
    ROTOM_EYES_BAG,
    ROTOM_EYES_PC,
    ROTOM_EYES_TRAINER_CARD,
    ROTOM_EYES_SAVE,
    ROTOM_EYES_OPTIONS,
    ROTOM_EYES_FIELD_MOVE_0,
    ROTOM_EYES_FIELD_MOVE_1,
    ROTOM_EYES_FIELD_MOVE_2,
    ROTOM_EYES_FIELD_MOVE_3,
    ROTOM_EYES_FIELD_MOVE_4,
    ROTOM_EYES_FIELD_MOVE_5,
    ROTOM_EYES_CLOSED,
    ROTOM_EYES_DIZZY,
    ROTOM_EYES_FRAME_COUNT,
    // the obtainable eyes are the field move 0 eyes flipped vertically
    ROTOM_EYES_OBTAINABLE = ROTOM_EYES_FRAME_COUNT,
    ROTOM_EYES_ANIM_COUNT,
};

static const struct CompressedSpriteSheet sSpriteSheet_RotomEyes[] = {
    { sRotomEyesGfx, (ROTOM_EYES_FRAME_SIZE * ROTOM_EYES_FRAME_SIZE * ROTOM_EYES_FRAME_COUNT) / 2, TAG_ROTOM_EYES_GFX },
    { NULL }
};

static const struct OamData sOamRotomEyes = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
};

static const union AnimCmd sAnimCmdRotomEyes_Default[] = {
    ANIMCMD_FRAME(ROTOM_EYES_DEFAULT * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_Pokedex[] = {
    ANIMCMD_FRAME(ROTOM_EYES_POKEDEX * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sAnimCmdRotomEyes_Party[] = {
    ANIMCMD_FRAME(ROTOM_EYES_PARTY * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_PC[] = {
    ANIMCMD_FRAME(ROTOM_EYES_PC * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_Bag[] = {
    ANIMCMD_FRAME(ROTOM_EYES_BAG * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_TrainerCard[] = {
    ANIMCMD_FRAME(ROTOM_EYES_TRAINER_CARD * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_Save[] = {
    ANIMCMD_FRAME(ROTOM_EYES_SAVE * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_Options[] = {
    ANIMCMD_FRAME(ROTOM_EYES_OPTIONS * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_FieldMove0[] = {
    ANIMCMD_FRAME(ROTOM_EYES_FIELD_MOVE_0 * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_FieldMove1[] = {
    ANIMCMD_FRAME(ROTOM_EYES_FIELD_MOVE_1 * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_FieldMove2[] = {
    ANIMCMD_FRAME(ROTOM_EYES_FIELD_MOVE_2 * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_FieldMove3[] = {
    ANIMCMD_FRAME(ROTOM_EYES_FIELD_MOVE_3 * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_FieldMove4[] = {
    ANIMCMD_FRAME(ROTOM_EYES_FIELD_MOVE_4 * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_FieldMove5[] = {
    ANIMCMD_FRAME(ROTOM_EYES_FIELD_MOVE_5 * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_Closed[] = {
    ANIMCMD_FRAME(ROTOM_EYES_CLOSED * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_Dizzy[] = {
    ANIMCMD_FRAME(ROTOM_EYES_DIZZY * ROTOM_EYES_TILES_PER_FRAME, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnimCmdRotomEyes_Obtainable[] = {
    ANIMCMD_FRAME(ROTOM_EYES_FIELD_MOVE_0 * ROTOM_EYES_TILES_PER_FRAME, 0, .vFlip = TRUE),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sRotomEyesAnim[ROTOM_EYES_ANIM_COUNT] = {
    [ROTOM_EYES_DEFAULT] = sAnimCmdRotomEyes_Default,
    [ROTOM_EYES_POKEDEX] = sAnimCmdRotomEyes_Pokedex,
    [ROTOM_EYES_PARTY] = sAnimCmdRotomEyes_Party,
    [ROTOM_EYES_BAG] = sAnimCmdRotomEyes_Bag,
    [ROTOM_EYES_PC] = sAnimCmdRotomEyes_PC,
    [ROTOM_EYES_TRAINER_CARD] = sAnimCmdRotomEyes_TrainerCard,
    [ROTOM_EYES_SAVE] = sAnimCmdRotomEyes_Save,
    [ROTOM_EYES_OPTIONS] = sAnimCmdRotomEyes_Options,
    [ROTOM_EYES_FIELD_MOVE_0] = sAnimCmdRotomEyes_FieldMove0,
    [ROTOM_EYES_FIELD_MOVE_1] = sAnimCmdRotomEyes_FieldMove1,
    [ROTOM_EYES_FIELD_MOVE_2] = sAnimCmdRotomEyes_FieldMove2,
    [ROTOM_EYES_FIELD_MOVE_3] = sAnimCmdRotomEyes_FieldMove3,
    [ROTOM_EYES_FIELD_MOVE_4] = sAnimCmdRotomEyes_FieldMove4,
    [ROTOM_EYES_FIELD_MOVE_5] = sAnimCmdRotomEyes_FieldMove5,
    [ROTOM_EYES_CLOSED] = sAnimCmdRotomEyes_Closed,
    [ROTOM_EYES_DIZZY] = sAnimCmdRotomEyes_Dizzy,
    [ROTOM_EYES_OBTAINABLE] = sAnimCmdRotomEyes_Obtainable,
};

static const struct SpriteTemplate sSpriteRotomEyes = {
    .tileTag = TAG_ROTOM_EYES_GFX,
    .paletteTag = TAG_MOVE_SELECTOR_PAL,
    .oam = &sOamRotomEyes,
    .anims = sRotomEyesAnim,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_RotomEyes,
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

static const union AnimCmd gAnimCmdBagF_NotSelected[] = {
    ANIMCMD_FRAME(240, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd gAnimCmdBagF_Selected[] = {
    ANIMCMD_FRAME(224, 0),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const gIconBagFAnim[] = {
    gAnimCmdBagF_NotSelected,
    gAnimCmdBagF_Selected,
};

static const union AffineAnimCmd sAffineAnimIcon_NoAnim[] = {
    AFFINEANIMCMD_FRAME(0, 0, 0, 60),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sAffineAnimIcon_Anim[] = {
    AFFINEANIMCMD_FRAME(20, 20, 0, 5), // Scale big
    AFFINEANIMCMD_FRAME(-10, -10, 0, 10), // Scale smol
    AFFINEANIMCMD_FRAME(0, 0, 1, 4), // Begin rotating

    AFFINEANIMCMD_FRAME(0, 0, -1, 4), // Loop starts from here ; Rotate/Tilt left
    AFFINEANIMCMD_FRAME(0, 0, 0, 2),
    AFFINEANIMCMD_FRAME(0, 0, -1, 4),
    AFFINEANIMCMD_FRAME(0, 0, 0, 2),
    AFFINEANIMCMD_FRAME(0, 0, -1, 4),

    AFFINEANIMCMD_FRAME(0, 0, 1, 4), // Rotate/Tilt Right
    AFFINEANIMCMD_FRAME(0, 0, 0, 2),
    AFFINEANIMCMD_FRAME(0, 0, 1, 4),
    AFFINEANIMCMD_FRAME(0, 0, 0, 2),
    AFFINEANIMCMD_FRAME(0, 0, 1, 4),

    AFFINEANIMCMD_JUMP(3),
};

static const union AffineAnimCmd *const sAffineAnimsIcon[] = {
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

static const struct SpriteTemplate gSpriteIconBagF = {
    .tileTag = TAG_ICON_GFX,
    .paletteTag = TAG_ICON_PAL,
    .oam = &gOamIcon,
    .anims = gIconBagFAnim,
    .images = NULL,
    .affineAnims = sAffineAnimsIcon,
    .callback = SpriteCB_IconBagF,
};

static const u32 sRotomMenuCursorToEyeState[] = {
    [MENU_POKEDEX] = ROTOM_EYES_POKEDEX,
    [MENU_PARTY] = ROTOM_EYES_PARTY,
    [MENU_BAG] = ROTOM_EYES_BAG,
    [MENU_PC] = ROTOM_EYES_PC,
    [MENU_TRAINER_CARD] = ROTOM_EYES_TRAINER_CARD,
    [MENU_SAVE] = ROTOM_EYES_SAVE,
    [MENU_OPTIONS] = ROTOM_EYES_OPTIONS,
};

static const u32 sRotomMoveCursorToEyeState[] = {
    [ROTOM_MOVE_SURF] = ROTOM_EYES_FIELD_MOVE_0,
    [ROTOM_MOVE_WATERFALL] = ROTOM_EYES_FIELD_MOVE_1,
    [ROTOM_MOVE_ROCK_CLIMB] = ROTOM_EYES_FIELD_MOVE_2,
    [ROTOM_MOVE_STRENGTH] = ROTOM_EYES_FIELD_MOVE_3,
    [ROTOM_MOVE_CUT] = ROTOM_EYES_FIELD_MOVE_4,
    [ROTOM_MOVE_FLY] = ROTOM_EYES_FIELD_MOVE_5,
    [ROTOM_MOVE_WHIRLPOOL] = ROTOM_EYES_FIELD_MOVE_0,
    [ROTOM_MOVE_GUILLOTINE] = ROTOM_EYES_FIELD_MOVE_1,
    [ROTOM_MOVE_BRICK_BREAK] = ROTOM_EYES_FIELD_MOVE_2,
    [ROTOM_MOVE_TAIL_GLOW] = ROTOM_EYES_FIELD_MOVE_3,
    [ROTOM_MOVE_REST] = ROTOM_EYES_FIELD_MOVE_4,
    [ROTOM_MOVE_RETREAT] = ROTOM_EYES_FIELD_MOVE_5,
};

static void Task_RotomEyeController(u8 taskId)
{
    if (sRotomStartMenu->rotomEyesState != EYE_STATE_NORMAL 
        && sRotomStartMenu->rotomEyesStateTimer > 0)
    {
        sRotomStartMenu->rotomEyesStateTimer--;
    }

    sRotomStartMenu->blinkTimer--;

    switch (sRotomStartMenu->rotomEyesState)
    {
    case EYE_STATE_NORMAL:
        sRotomStartMenu->screenWraparoundCounter = 0;
        break;
    case EYE_STATE_TRACKING:
    case EYE_STATE_NEW_OBTAINABLE:
        if (sRotomStartMenu->rotomEyesStateTimer == 0)
        {
            sRotomStartMenu->rotomEyesState = EYE_STATE_NORMAL;
        }
        break;
    case EYE_STATE_DIZZY_CLOSED:
        if (sRotomStartMenu->rotomEyesStateTimer == 0)
        {
            PlayCry_Normal(SPECIES_ROTOM, 0);
            sRotomStartMenu->rotomEyesState = EYE_STATE_DIZZY;
            sRotomStartMenu->rotomEyesStateTimer = DIZZY_EYES_TIMER;
        }
        break;
    case EYE_STATE_DIZZY:
        if (sRotomStartMenu->rotomEyesStateTimer == 0)
        {
            sRotomStartMenu->rotomEyesState = EYE_STATE_NORMAL;
            sRotomStartMenu->screenWraparoundCounter = 0;
        }
        break;
    }
}

#define spStoredYPos data[1]

static void SpriteCB_RotomEyes(struct Sprite *sprite)
{
    // avoids getting sprite stuck invisible if you happen to
    // input during blink frames
    sprite->invisible = FALSE;
    
    // the original Y pos has to be restored after the obtainable state
    sprite->y = sprite->spStoredYPos;

    switch (sRotomStartMenu->rotomEyesState)
    {
    case EYE_STATE_NORMAL:
        StartSpriteAnim(sprite, ROTOM_EYES_DEFAULT);
        sprite->invisible = sRotomStartMenu->blinkTimer < BLINK_TIMER_FRAMES_ACTIVE; // Translates to "The sprite's invisibility is set to the result of that inequality" (don't judge me for commenting this :( -Celia <3)
        break;
    case EYE_STATE_TRACKING:
        if (sRotomStartMenu->fieldMoveCursor == ROTOM_MOVE_NONE)
        {
            StartSpriteAnim(sprite, sRotomMenuCursorToEyeState[sMenuSelected]);
        }
        else
        {
            StartSpriteAnim(sprite, sRotomMoveCursorToEyeState[sRotomStartMenu->fieldMoveCursor]);
        }
        break;
    case EYE_STATE_DIZZY_CLOSED:
        StartSpriteAnim(sprite, ROTOM_EYES_CLOSED);
        break;
    case EYE_STATE_DIZZY:
        StartSpriteAnim(sprite, ROTOM_EYES_DIZZY);
        break;
    case EYE_STATE_NEW_OBTAINABLE:
        StartSpriteAnim(sprite, ROTOM_EYES_OBTAINABLE);
        sprite->y -= 6; // the sprites are offset after being v-flipped
        break;
    }
}

static void RotomMenu_TryStartEyesLook(void)
{
    if (sRotomStartMenu->rotomEyesState == EYE_STATE_NORMAL
        ||  sRotomStartMenu->rotomEyesState == EYE_STATE_TRACKING)
    {
        sRotomStartMenu->rotomEyesStateTimer = LOOK_TIMER_FRAMES;
        sRotomStartMenu->rotomEyesState = EYE_STATE_TRACKING;
    }
}

static void RotomMenu_TryMakeDizzy(void)
{
    // the cursor has wrapped around the edge
    if ((JOY_REPT(DPAD_UP) && sMenuSelected == MENU_OPTION_BOTTOM)
        || (JOY_REPT(DPAD_DOWN) && sMenuSelected == MENU_OPTION_TOP)
        || (JOY_REPT(DPAD_RIGHT) && sRotomStartMenu->fieldMoveCursor == ROTOM_MOVE_TOP_ROW_MIN)
        || (JOY_REPT(DPAD_RIGHT) && sRotomStartMenu->fieldMoveCursor == ROTOM_MOVE_BOTTOM_ROW_MIN)
        || (JOY_REPT(DPAD_LEFT) && sRotomStartMenu->fieldMoveCursor == ROTOM_MOVE_NONE))
    {
        if (sRotomStartMenu->screenWraparoundCounter < NUM_DIZZY_LOOPS)
        {
            sRotomStartMenu->screenWraparoundCounter++;
        }
        else if (sRotomStartMenu->rotomEyesState == EYE_STATE_TRACKING)
        {
            sRotomStartMenu->rotomEyesState = EYE_STATE_DIZZY_CLOSED;
            sRotomStartMenu->rotomEyesStateTimer = DIZZY_CLOSE_EYE_TIMER;
        }
        else if (sRotomStartMenu->rotomEyesState == EYE_STATE_DIZZY)
        {
            // if rotom is already dizzy, just extend the timer
            sRotomStartMenu->rotomEyesStateTimer = DIZZY_EYES_TIMER;
        }
    }
}

static void SpriteCB_IconPokedex(struct Sprite *sprite)
{
    if (sMenuSelected == MENU_POKEDEX && !sRotomStartMenu->iconAnimStarted)
    {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    }
    else if (sMenuSelected != MENU_POKEDEX)
    {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SpriteCB_IconParty(struct Sprite *sprite)
{
    if (sMenuSelected == MENU_PARTY && !sRotomStartMenu->iconAnimStarted)
    {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    }
    else if (sMenuSelected != MENU_PARTY)
    {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SpriteCB_IconPC(struct Sprite *sprite)
{
    if (sMenuSelected == MENU_PC && !sRotomStartMenu->iconAnimStarted)
    {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    }
    else if (sMenuSelected != MENU_PC)
    {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SpriteCB_IconBag(struct Sprite *sprite)
{
    if (sMenuSelected == MENU_BAG && !sRotomStartMenu->iconAnimStarted)
    {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    }
    else if (sMenuSelected != MENU_BAG)
    {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SpriteCB_IconTrainerCard(struct Sprite *sprite)
{
    if (sMenuSelected == MENU_TRAINER_CARD && !sRotomStartMenu->iconAnimStarted)
    {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    }
    else if (sMenuSelected != MENU_TRAINER_CARD)
    {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SpriteCB_IconSave(struct Sprite *sprite)
{
    if (sMenuSelected == MENU_SAVE && !sRotomStartMenu->iconAnimStarted)
    {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    }
    else if (sMenuSelected != MENU_SAVE)
    {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SpriteCB_IconOptions(struct Sprite *sprite)
{
    if (sMenuSelected == MENU_OPTIONS && !sRotomStartMenu->iconAnimStarted)
    {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    }
    else if (sMenuSelected != MENU_OPTIONS)
    {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void SpriteCB_IconBagF(struct Sprite *sprite)
{
    if (sMenuSelected == MENU_BAG && !sRotomStartMenu->iconAnimStarted)
    {
        sRotomStartMenu->iconAnimStarted = TRUE;
        StartSpriteAnim(sprite, 1);
        StartSpriteAffineAnim(sprite, 1);
    }
    else if (sMenuSelected != MENU_BAG)
    {
        StartSpriteAnim(sprite, 0);
        StartSpriteAffineAnim(sprite, 0);
    }
}

static void ClearMoveSelectorText(void)
{
    FillWindowPixelBuffer(sRotomStartMenu->sMoveNameWindowId, PIXEL_FILL(TEXT_COLOR_TRANSPARENT));
    ClearWindowTilemap(sRotomStartMenu->sMoveNameWindowId);
    CopyWindowToVram(sRotomStartMenu->sMoveNameWindowId, COPYWIN_GFX);
    ScheduleBgCopyTilemapToVram(0);
}

static const u8 sMoveTextColor[3] = { 0, 2, 3 };

#define MOVE_SELECTOR_WIDTH       56
// yeah I know this shit's hella janky
// the gist is just "offset ONLY the whirlpool text by one pixel otherwise it looks weird"
#define MOVE_SELECTOR_TEXT_OFFSET ((sRotomStartMenu->fieldMoveCursor == ROTOM_MOVE_WHIRLPOOL && sRotomStartMenu->monSpecies[sRotomStartMenu->fieldMoveCursor] != SPECIES_NONE) ? 11 : 12)

static inline void PrintStringToMoveSelector(const u8 *str)
{
    AddTextPrinterParameterized3(sRotomStartMenu->sMoveNameWindowId,
                                 FONT_SMALL,
                                 GetStringCenterAlignXOffset(FONT_SMALL, str, MOVE_SELECTOR_WIDTH) + sRotomMoves[sRotomStartMenu->fieldMoveCursor].spriteXPos - MOVE_SELECTOR_TEXT_OFFSET,
                                 2,
                                 sMoveTextColor,
                                 TEXT_SKIP_DRAW,
                                 str);
}

static void UpdateMoveSelectorText(void)
{
    FillWindowPixelBuffer(sRotomStartMenu->sMoveNameWindowId, PIXEL_FILL(TEXT_COLOR_TRANSPARENT));
    PutWindowTilemap(sRotomStartMenu->sMoveNameWindowId);

    if (sRotomStartMenu->fieldMoveCursor == ROTOM_MOVE_NONE)
    {
        ClearWindowTilemap(sRotomStartMenu->sMoveNameWindowId);
    }
    else if (sRotomStartMenu->monSpecies[sRotomStartMenu->fieldMoveCursor] == SPECIES_NONE)
    {
        PrintStringToMoveSelector(gText_ThreeHyphens);
    }
    else
    {
        PrintStringToMoveSelector(sRotomMoves[sRotomStartMenu->fieldMoveCursor].name);
    }

    CopyWindowToVram(sRotomStartMenu->sMoveNameWindowId, COPYWIN_GFX);
    ScheduleBgCopyTilemapToVram(0);
}

void RotomStartMenu_Init(void)
{
    if (!IsUpdateLinkStateCBActive())
    {
        FreezeObjectEvents();
        HandleEnforcedLookDirectionOnPlayerStopMoving();
        StopPlayerAvatar();
    }

    LockPlayerFieldControls();

    if (sRotomStartMenu == NULL)
    {
        sRotomStartMenu = AllocZeroed(sizeof(struct RotomStartMenu));
    }

    if (sRotomStartMenu == NULL)
    {
        SetMainCallback2(CB2_ReturnToFieldWithOpenMenu);
        return;
    }

    sRotomStartMenu->keyRepeatStartDelayBackup = gKeyRepeatStartDelay;
    gKeyRepeatStartDelay = ROTOM_MENU_REPEAT_DELAY;
    sFieldMoveData = 0;
    sRotomStartMenu->optionSelected = FALSE;
    sRotomStartMenu->iconAnimStarted = FALSE;
    sRotomStartMenu->fieldMoveCursor = ROTOM_MOVE_NONE;
    sRotomStartMenu->rotomMoveMsgID = ROTOM_MSG_NONE;

    sRotomStartMenu->rotomEyesStateTimer = LOOK_TIMER_FRAMES;
    sRotomStartMenu->blinkTimer = BLINK_TIMER_START_VALUE;
    CreateTask(Task_RotomEyeController, 1);

    sRotomStartMenu->sMoveNameWindowId = AddWindow(&sWindowTemplate_MoveNames);

    PopulateMoveMonSpecies();

    RotomStartMenu_LoadSprites();
    memset(sRotomStartMenu->spriteIDs, SPRITE_NONE, ROTOM_SPRITE_COUNT_WITH_MASKS);
    RotomStartMenu_CreateSprites();
    if (Overworld_GetFlashLevel())
    {
        RotomStartMenu_CreateSpriteMasks();
        RotomStartMenu_DisableSpriteAffineModes();
    }

    RotomStartMenu_LoadBgGfx();
    sRotomStartMenu->sDexNumbersWindowID = AddWindow(&sWindowTemplate_DexNumbers);
    CreateTask(Task_RotomStartMenu_HandleMainInput, 0);
    RotomStartMenu_PrintDexNumbers();
}

static void RotomStartMenu_LoadSprites(void)
{
    u32 index;
    LoadSpritePalette(sSpritePal_Icon);
    index = IndexOfSpritePaletteTag(TAG_ICON_PAL);
    LoadPalette(sIconPal, OBJ_PLTT_ID(index), PLTT_SIZE_4BPP);
    LoadCompressedSpriteSheet(sSpriteSheet_Icon);

    LoadSpritePalette(sSpritePal_MoveSelector);
    index = IndexOfSpritePaletteTag(TAG_MOVE_SELECTOR_PAL);
    LoadPalette(sMoveSelectorPal, OBJ_PLTT_ID(index), PLTT_SIZE_4BPP);
    LoadCompressedSpriteSheet(sSpriteSheet_MoveSelector);
    LoadCompressedSpriteSheet(sSpriteSheet_MoveSelectorMiddle);

    LoadSpritePalette(sSpritePal_MonIcon);
    index = IndexOfSpritePaletteTag(TAG_MON_ICON_PAL);
    LoadPalette(sMonIconPal, OBJ_PLTT_ID(index), PLTT_SIZE_4BPP);
    LoadCompressedSpriteSheet(sSpriteSheet_MonIcon);

    index = IndexOfSpritePaletteTag(TAG_ROTOM_EYES_GFX);
    LoadCompressedSpriteSheet(sSpriteSheet_RotomEyes);
}

static void RotomStartMenu_UpdateMonSprites(void)
{
    u32 i, j;
    u32 rotomMoveOffset = (sRotomStartMenu->fieldMoveCursor > ROTOM_MOVE_TOP_ROW_MAX) ? ROTOM_MOVE_ROW_SIZE : 0;

    for (i = SPRITE_MON_ICON_0; i <= SPRITE_MON_ICON_5; i++)
    {
        gSprites[sRotomStartMenu->spriteIDs[i]].invisible = TRUE;
        if (Overworld_GetFlashLevel() && sRotomStartMenu->spriteIDs[i + ROTOM_SPRITE_MASKS_START] != SPRITE_NONE)
        {
            gSprites[sRotomStartMenu->spriteIDs[i + ROTOM_SPRITE_MASKS_START]].invisible = TRUE;
        }

        if (sRotomStartMenu->monSpecies[i - SPRITE_MON_ICON_0 + rotomMoveOffset] != SPECIES_NONE)
        {
            for (j = 0; j < MON_ICON_COUNT; j++)
            {
                if (sRotomMonIconToSpecies[j] == sRotomStartMenu->monSpecies[i - SPRITE_MON_ICON_0 + rotomMoveOffset])
                {
                    gSprites[sRotomStartMenu->spriteIDs[i]].invisible = FALSE;
                    StartSpriteAnim(&gSprites[sRotomStartMenu->spriteIDs[i]], j);
                    if (Overworld_GetFlashLevel() && sRotomStartMenu->spriteIDs[i + ROTOM_SPRITE_MASKS_START] != SPRITE_NONE)
                    {
                        gSprites[sRotomStartMenu->spriteIDs[i + ROTOM_SPRITE_MASKS_START]].invisible = FALSE;
                        StartSpriteAnim(&gSprites[sRotomStartMenu->spriteIDs[i + ROTOM_SPRITE_MASKS_START]], j);
                    }
                }
            }
        }
    }
}

static void RotomStartMenu_CreateSprites(void)
{
    u32 i, j, rotomMoveOffset;
    u32 rotomEyeTopID, rotomEyeBottomID;
    u32 rotomMove;
    u32 x = 224;
    u32 y1 = 14;
    u32 y2 = 38;
    u32 y3 = 60;
    u32 y4 = 84;
    u32 y5 = 109;
    u32 y6 = 130;
    u32 y7 = 150;

    sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_L] = CreateSprite(&sSpriteMoveSelector, sRotomMoves[ROTOM_MOVE_NONE].spriteXPos, MOVE_SELECTOR_Y_POS, 0);
    sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_R] = CreateSprite(&sSpriteMoveSelector, sRotomMoves[ROTOM_MOVE_NONE].spriteXPos + MOVE_SELECTOR_R_OFFSET, MOVE_SELECTOR_Y_POS, 0);
    SetSpriteOamFlipBits(&gSprites[sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_R]], 1, 0);

    sRotomStartMenu->spriteIDs[SPRITE_DEX_NUM_WIN_L] = CreateSprite(&sSpriteMoveSelector, 176, 14, 0);
    SetSpriteOamFlipBits(&gSprites[sRotomStartMenu->spriteIDs[SPRITE_DEX_NUM_WIN_L]], 0, 1);
    sRotomStartMenu->spriteIDs[SPRITE_DEX_NUM_WIN_R] = CreateSprite(&sSpriteMoveSelector, 176 + MOVE_SELECTOR_R_OFFSET, 14, 0);
    SetSpriteOamFlipBits(&gSprites[sRotomStartMenu->spriteIDs[SPRITE_DEX_NUM_WIN_R]], 1, 1);

    rotomEyeTopID = CreateSprite(&sSpriteRotomEyes, 205, 29, 0);
    rotomEyeBottomID = CreateSprite(&sSpriteRotomEyes, 205, 42, 0);
    sRotomStartMenu->spriteIDs[SPRITE_ROTOM_EYE_TOP] = rotomEyeTopID;
    sRotomStartMenu->spriteIDs[SPRITE_ROTOM_EYE_BOTTOM] = rotomEyeBottomID;
    gSprites[rotomEyeTopID].spStoredYPos = gSprites[rotomEyeTopID].y;
    gSprites[rotomEyeBottomID].spStoredYPos = gSprites[rotomEyeBottomID].y;

    rotomMoveOffset = sStoredMoveRow == 1 ? ROTOM_MOVE_ROW_SIZE : 0;

    for (i = SPRITE_MON_ICON_0; i <= SPRITE_MON_ICON_5; i++)
    {
        rotomMove = i - SPRITE_MON_ICON_0 + rotomMoveOffset;
        sRotomStartMenu->spriteIDs[i] = CreateSprite(&sSpriteMonIcon, sRotomMoves[rotomMove].monXPos, 141, 0);
        gSprites[sRotomStartMenu->spriteIDs[i]].invisible = TRUE;

        if (sRotomStartMenu->monSpecies[rotomMove] != SPECIES_NONE)
        {
            for (j = 0; j < MON_ICON_COUNT; j++)
            {
                if (sRotomMonIconToSpecies[j] == sRotomStartMenu->monSpecies[i - SPRITE_MON_ICON_0 + rotomMoveOffset])
                {
                    gSprites[sRotomStartMenu->spriteIDs[i]].invisible = FALSE;
                    StartSpriteAnim(&gSprites[sRotomStartMenu->spriteIDs[i]], j);
                }
            }
        }
    }

    sRotomStartMenu->spriteIDs[SPRITE_POKEDEX] = CreateSprite(&gSpriteIconPokedex, x - 1, y1 - 2, 0);
    sRotomStartMenu->spriteIDs[SPRITE_PARTY] = CreateSprite(&gSpriteIconParty, x, y2 - 2, 0);
    if (gSaveBlock2Ptr->playerGender == FEMALE)
    {
        sRotomStartMenu->spriteIDs[SPRITE_BAG] = CreateSprite(&gSpriteIconBagF, x, y3 + 1, 0);
    }
    else
    {
        sRotomStartMenu->spriteIDs[SPRITE_BAG] = CreateSprite(&gSpriteIconBag, x, y3 - 1, 0);
    }
    sRotomStartMenu->spriteIDs[SPRITE_PC] = CreateSprite(&gSpriteIconPC, x, y4 + 1, 0);
    sRotomStartMenu->spriteIDs[SPRITE_TRAINER_CARD] = CreateSprite(&gSpriteIconTrainerCard, x, y5 - 1, 0);
    sRotomStartMenu->spriteIDs[SPRITE_SAVE] = CreateSprite(&gSpriteIconSave, x, y6, 0);
    sRotomStartMenu->spriteIDs[SPRITE_OPTIONS] = CreateSprite(&gSpriteIconOptions, x, y7, 0);
}

static void RotomStartMenu_CreateSpriteMasks(void)
{
    u32 i, spriteID, maskSpriteID;

    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJWIN_ON);
    SetGpuRegBits(REG_OFFSET_WINOUT, WINOUT_WINOBJ_OBJ);

    for (i = 0; i < ROTOM_SPRITE_COUNT; i++)
    {
        spriteID = sRotomStartMenu->spriteIDs[i];
        if (spriteID != SPRITE_NONE)
        {
            maskSpriteID = CreateSprite(gSprites[spriteID].template,
                                        gSprites[spriteID].x,
                                        gSprites[spriteID].y,
                                        gSprites[spriteID].subpriority);

            sRotomStartMenu->spriteIDs[i + ROTOM_SPRITE_MASKS_START] = maskSpriteID;

            // preserve the flip bits set for non-affine sprites
            if (!(gSprites[spriteID].oam.affineMode & ST_OAM_AFFINE_ON_MASK))
            {
                gSprites[maskSpriteID].oam.matrixNum = gSprites[spriteID].oam.matrixNum;
            }

            if (i == SPRITE_MOVE_SELECTOR_L || i == SPRITE_MOVE_SELECTOR_R)
            {
                gSprites[maskSpriteID].callback = SpriteCB_MoveSelectorMask;
            }

            if (i == SPRITE_ROTOM_EYE_TOP || i == SPRITE_ROTOM_EYE_BOTTOM)
            {
                gSprites[maskSpriteID].spStoredYPos = gSprites[maskSpriteID].y;
            }
            
            StartSpriteAnim(&gSprites[maskSpriteID], gSprites[spriteID].animNum);
            gSprites[maskSpriteID].oam.objMode = ST_OAM_OBJ_WINDOW;
        }
    }

    SetGpuRegBits(REG_OFFSET_DISPCNT, 0);
    SetGpuRegBits(REG_OFFSET_WINOUT, 0);
}

#undef spStoredYPos

static void RotomStartMenu_DisableSpriteAffineModes(void)
{
    u32 i, spriteID;
    for (i = 0; i < ROTOM_SPRITE_COUNT_WITH_MASKS; i++)
    {
        spriteID = sRotomStartMenu->spriteIDs[i];
        if (spriteID != SPRITE_NONE)
        {
            // this is hardcoded to ensure the double size sprites stay in the same place
            // even after disabling that mode
            if (gSprites[spriteID].oam.affineMode & ST_OAM_AFFINE_DOUBLE)
            {
                gSprites[spriteID].x += (ROTOM_ICON_SIZE / 2);
                gSprites[spriteID].y += (ROTOM_ICON_SIZE / 2);
            }

            gSprites[spriteID].oam.affineMode = ST_OAM_AFFINE_OFF;
        }
    }
}

static void RotomStartMenu_LoadBgGfx(void)
{
    u8 *buf = GetBgTilemapBuffer(0);
    LoadBgTilemap(0, 0, 0, 0);
    DecompressAndCopyTileDataToVram(0, sStartMenuTiles, 0, 0, 0);
    LZDecompressWram(sStartMenuTilemap, buf);
    LoadPalette(sStandardMenuPalette, BG_PLTT_ID(15), PLTT_SIZE_4BPP);
    LoadPalette(sStartMenuPalette, BG_PLTT_ID(14), PLTT_SIZE_4BPP);
    ScheduleBgCopyTilemapToVram(0);
}

#define tSoundEffect data[0]
#define tDelay data[1]

static void Task_PlaySEAndLookAfterFrames(u8 taskId)
{
    if (gTasks[taskId].tDelay <= 0)
    {
        sRotomStartMenu->rotomEyesState = EYE_STATE_NEW_OBTAINABLE;
        sRotomStartMenu->rotomEyesStateTimer = OBTAINABLE_EYES_TIMER;
        PlaySE(gTasks[taskId].tSoundEffect);
        DestroyTask(taskId);
    }
    else
    {
        gTasks[taskId].tDelay--;
    }
}

static const u8 sDexNumTextColor[3] = { 0, 2, 3 };
static const u8 sDexNumBlueTextColor[3] = { 0, 8, 9 };

#define DEX_NUM_TEXT_BASE_OFFSET 6

static void RotomStartMenu_PrintDexNumbers(void)
{
    u8 printStr[8];
    u8 obtainableStr[4];
    u32 xOffset, taskId;
    const u8 *color = sDexNumTextColor;
    u32 caught = GetCaughtAndObtainableSpeciesCount();
    u32 obtainable = DexScreen_GetDexCount(FLAG_GET_OBTAINABLE, 0);

    if (obtainable > gSaveBlock1Ptr->rotomMenuLastObtainableCount)
    {
        color = sDexNumBlueTextColor;
        gSaveBlock1Ptr->rotomMenuLastObtainableCount = obtainable;
        taskId = CreateTask(Task_PlaySEAndLookAfterFrames, 0);
        gTasks[taskId].tSoundEffect = ROTOMSE_NEW_OBTAINABLE;
        gTasks[taskId].tDelay = OBTAINABLE_LOOK_DELAY;
    }

    FillWindowPixelBuffer(sRotomStartMenu->sDexNumbersWindowID, PIXEL_FILL(TEXT_COLOR_TRANSPARENT));
    PutWindowTilemap(sRotomStartMenu->sDexNumbersWindowID);

    ConvertIntToDecimalStringN(printStr, caught, STR_CONV_MODE_RIGHT_ALIGN, 3);
    ConvertIntToDecimalStringN(obtainableStr, obtainable, STR_CONV_MODE_LEFT_ALIGN, 3);
    StringAppend(printStr, gText_Slash);
    StringAppend(printStr, obtainableStr);

    xOffset = GetStringCenterAlignXOffset(FONT_SMALL, printStr, (sWindowTemplate_DexNumbers.width * 8 - DEX_NUM_TEXT_BASE_OFFSET));
    AddTextPrinterParameterized3(sRotomStartMenu->sDexNumbersWindowID, FONT_SMALL, xOffset + DEX_NUM_TEXT_BASE_OFFSET, 0, color, TEXT_SKIP_DRAW, printStr);
    CopyWindowToVram(sRotomStartMenu->sDexNumbersWindowID, COPYWIN_GFX);
}

#undef tSoundEffect
#undef tDelay

static void RotomStartMenu_DestroySprites(void)
{
    u32 i, spriteID;
    for (i = 0; i < ROTOM_SPRITE_COUNT_WITH_MASKS; i++)
    {
        spriteID = sRotomStartMenu->spriteIDs[i];
        if (spriteID != SPRITE_NONE)
        {
            if (gSprites[spriteID].oam.affineMode & ST_OAM_AFFINE_ON_MASK)
            {
                FreeSpriteOamMatrix(&gSprites[spriteID]);
            }
            DestroySprite(&gSprites[spriteID]);
        }
    }
}

static void RotomStartMenu_ExitAndClearTilemap(void)
{
    u32 i;
    u8 *buf = GetBgTilemapBuffer(0);

    ReleaseComfyAnims();
    if (sMenuSelected == MENU_NONE && sRotomStartMenu->storedMenuOption != MENU_NONE)
    {
        sMenuSelected = sRotomStartMenu->storedMenuOption;
    }

    gKeyRepeatStartDelay = sRotomStartMenu->keyRepeatStartDelayBackup;

    FillWindowPixelBuffer(sRotomStartMenu->sDexNumbersWindowID, PIXEL_FILL(TEXT_COLOR_TRANSPARENT));
    ClearWindowTilemap(sRotomStartMenu->sDexNumbersWindowID);
    CopyWindowToVram(sRotomStartMenu->sDexNumbersWindowID, COPYWIN_GFX);
    RemoveWindow(sRotomStartMenu->sDexNumbersWindowID);

    FillWindowPixelBuffer(sRotomStartMenu->sMoveNameWindowId, PIXEL_FILL(TEXT_COLOR_TRANSPARENT));
    ClearWindowTilemap(sRotomStartMenu->sMoveNameWindowId);
    CopyWindowToVram(sRotomStartMenu->sMoveNameWindowId, COPYWIN_GFX);
    RemoveWindow(sRotomStartMenu->sMoveNameWindowId);

    for (i = 0; i < 2048; i++)
    {
        buf[i] = 0;
    }

    ScheduleBgCopyTilemapToVram(0);

    DestroyTask(FindTaskIdByFunc(Task_RotomEyeController));

    RotomStartMenu_DestroySprites();

    if (sRotomStartMenu != NULL)
    {
        FreeSpriteTilesByTag(TAG_ICON_GFX);
        FreeSpriteTilesByTag(TAG_MOVE_SELECTOR_GFX);
        FreeSpriteTilesByTag(TAG_MOVE_SELECTOR_MIDDLE_GFX);
        FreeSpriteTilesByTag(TAG_MON_ICON_GFX);
        FreeSpriteTilesByTag(TAG_ROTOM_EYES_GFX);
        Free(sRotomStartMenu);
        sRotomStartMenu = NULL;
    }

    ClearPlayerHeldMovementAndUnfreezeObjectEvents();
    UnlockPlayerFieldControls();
}

static void DoCleanUpAndChangeCallback(MainCallback callback)
{
    if (!gPaletteFade.active)
    {
        DestroyTask(FindTaskIdByFunc(Task_RotomStartMenu_HandleMainInput));
        PlayRainStoppingSoundEffect();
        RotomStartMenu_ExitAndClearTilemap();
        CleanupOverworldWindowsAndTilemaps();
        SetMainCallback2(callback);
        gMain.savedCallback = CB2_ReturnToFieldWithOpenMenu;
    }
}

static void DoCleanUpAndOpenTrainerCard(void)
{
    if (!gPaletteFade.active)
    {
        RotomStartMenu_ExitAndClearTilemap();
        DestroyTask(FindTaskIdByFunc(Task_RotomStartMenu_HandleMainInput));
        if (Overworld_GetFlashLevel())
        {
            ScriptContext_SetupScript(EventScript_TooDarkToSee);
        }
        else
        {
            PlayRainStoppingSoundEffect();
            CleanupOverworldWindowsAndTilemaps();
            ShowPlayerTrainerCard(CB2_ReturnToFieldWithOpenMenu); // Display trainer card
        }
    }
}

static void DoCleanUpAndOpenPC(void)
{
    if (!gPaletteFade.active)
    {
        PlayRainStoppingSoundEffect();
        RotomStartMenu_ExitAndClearTilemap();
        CleanupOverworldWindowsAndTilemaps();
        gOpenedPCFromRotomMenu = TRUE;
        EnterPokeStorage(OPTION_MOVE_MONS);
        DestroyTask(FindTaskIdByFunc(Task_RotomStartMenu_HandleMainInput));
    }
}

#define tRotomMove data[0]

static void Task_DoCleanUpAndExecuteFieldMove(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gTasks[taskId].tRotomMove == ROTOM_MOVE_FLY)
        {
            PlayRainStoppingSoundEffect();
            CleanupOverworldWindowsAndTilemaps();
        }
        DestroyTask(FindTaskIdByFunc(Task_RotomStartMenu_HandleMainInput));
        RotomStartMenu_ExitAndClearTilemap();
        sRotomMoves[gTasks[taskId].tRotomMove].fieldMoveFunc();
        DestroyTask(taskId);
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
    {
        ShowSaveMessage(gText_PlayerSavedTheGame, SaveSuccessCallback);
    }
    else
    {
        ShowSaveMessage(gText_SaveError_PleaseExchangeBackupMemory, SaveErrorCallback);
    }

    SaveStartTimer();
    return SAVE_IN_PROGRESS;
}

static void HideSaveInfoWindow(void)
{
    ClearStdWindowAndFrame(sSaveInfoWindowId, FALSE);
    RemoveWindow(sSaveInfoWindowId);
}

static void HideSaveMessageWindow(void)
{
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

static void ShowSaveMessage(const u8 *message, u8 (*saveCallback)(void))
{
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

static u8 SaveSavingMessageCallback(void)
{
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

static u8 SaveYesNoCallback(void)
{
    DisplayYesNoMenuDefaultYes(); // Show Yes/No menu
    sSaveDialogCallback = SaveConfirmInputCallback;
    return SAVE_IN_PROGRESS;
}

static ALIGNED(2) const u8 sTextColor_StatName[] = { 1, 2, 3 };
static ALIGNED(2) const u8 sTextColor_StatValue[] = { 1, 4, 5 };
static ALIGNED(2) const u8 sTextColor_LocationHeader[] = { 1, 6, 7 };

static void ShowSaveInfoWindow(void)
{
    struct WindowTemplate saveInfoWindow = sSaveInfoWindowTemplate;
    u8 gender, color;
    u32 x, y;
    const u8 *suffix;
    u8 *alignedSuffix = gStringVar3;

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

    AddTextPrinterParameterized3(sSaveInfoWindowId, FONT_SMALL, 2, 42, sTextColor_StatName, -1, gSaveStatName_Pokedex);
    SaveStatToString(SAVE_STAT_POKEDEX, gStringVar4, 2);
    AddTextPrinterParameterized3(sSaveInfoWindowId, FONT_SMALL, 60, 42, sTextColor_StatValue, -1, gStringVar4);
    y = 56;

    AddTextPrinterParameterized3(sSaveInfoWindowId, FONT_SMALL, 2, y, sTextColor_StatName, -1, gSaveStatName_Time);

    SaveStatToString(SAVE_STAT_TIME, gStringVar4, 2);
    AddTextPrinterParameterized3(sSaveInfoWindowId, FONT_SMALL, 60, y, sTextColor_StatValue, -1, gStringVar4);
    CopyWindowToVram(sSaveInfoWindowId, COPYWIN_GFX);
}

static u8 SaveConfirmSaveCallback(void)
{
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

static void Task_HandleSave(u8 taskId)
{
    switch (RunSaveCallback())
    {
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
    case SAVE_ERROR: // Close start menu
        ClearDialogWindowAndFrameToTransparent(0, TRUE);
        ClearPlayerHeldMovementAndUnfreezeObjectEvents();
        UnlockPlayerFieldControls();
        DestroyTask(taskId);
        break;
    }
}

#define tWaitFrames data[0]

static void Task_WaitForPreSaveCleanup(u8 taskId)
{
    if (gTasks[taskId].tWaitFrames <= 0)
    {
        LoadUserWindowGfx(sSaveInfoWindowId, STD_WINDOW_BASE_TILE_NUM, BG_PLTT_ID(STD_WINDOW_PALETTE_NUM));
        InitSave();
        CreateTask(Task_HandleSave, 0x80);
        DestroyTask(taskId);
    }
    gTasks[taskId].tWaitFrames--;
}

static void DoCleanUpAndStartSaveMenu(void)
{
    u8 taskId;
    DestroyTask(FindTaskIdByFunc(Task_RotomStartMenu_HandleMainInput));
    RotomStartMenu_ExitAndClearTilemap();
    FreezeObjectEvents();
    LockPlayerFieldControls();
    taskId = CreateTask(Task_WaitForPreSaveCleanup, 0x80);
    gTasks[taskId].tWaitFrames = 5;
}

static void RotomStartMenu_OpenMenu(void)
{
    switch (sMenuSelected)
    {
    case MENU_POKEDEX:
        DoCleanUpAndChangeCallback(CB2_OpenPokedexFromStartMenu);
        break;
    case MENU_PARTY:
        DoCleanUpAndChangeCallback(CB2_PartyMenuFromStartMenu);
        break;
    case MENU_BAG:
        DoCleanUpAndChangeCallback(CB2_BagMenuFromStartMenu);
        break;
    case MENU_PC:
        DoCleanUpAndOpenPC();
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

static void SpriteCB_MoveSelectorMask(struct Sprite *sprite)
{
    u32 spriteID;
    if (sprite->oam.matrixNum & ST_OAM_HFLIP)
    {
        spriteID = sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_R];
    }
    else
    {
        spriteID = sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_L];
    }

    if (spriteID != SPRITE_NONE)
    {
        sprite->x = gSprites[spriteID].x;
    }
}

// ravetodo collapse into one func
static void SpriteCB_MoveSelectorAnimLeft(struct Sprite *sprite)
{
    int animId = sprite->data[0];

    if (sRotomStartMenu->comfyAnimStatus == COMFY_ANIM_NONE)
    {
        sprite->callback = SpriteCallbackDummy;
    }
    else if (sRotomStartMenu->comfyAnimStatus == COMFY_ANIM_COMPLETED)
    {
        sprite->x = ReadComfyAnimValueSmooth(&gComfyAnims[animId]);
        ReleaseComfyAnim(animId);
        sRotomStartMenu->comfyAnimStatus = COMFY_ANIM_NONE;
        UpdateMoveSelectorText();
    }
    else
    {
        sprite->x = ReadComfyAnimValueSmooth(&gComfyAnims[animId]);
        if (gComfyAnims[animId].completed)
        {
            sRotomStartMenu->comfyAnimStatus = COMFY_ANIM_COMPLETED;
        }
    }
}

static void SpriteCB_MoveSelectorAnimRight(struct Sprite *sprite)
{
    int animId = sprite->data[0];

    if (sRotomStartMenu->comfyAnimStatus == COMFY_ANIM_NONE)
    {
        sprite->callback = SpriteCallbackDummy;
    }
    else if (sRotomStartMenu->comfyAnimStatus == COMFY_ANIM_COMPLETED)
    {
        sprite->x = ReadComfyAnimValueSmooth(&gComfyAnims[animId]) + MOVE_SELECTOR_R_OFFSET;
        ReleaseComfyAnim(animId);
        sRotomStartMenu->comfyAnimStatus = COMFY_ANIM_NONE;
        UpdateMoveSelectorText();
    }
    else
    {
        sprite->x = ReadComfyAnimValueSmooth(&gComfyAnims[animId]) + MOVE_SELECTOR_R_OFFSET;
        if (gComfyAnims[animId].completed)
        {
            sRotomStartMenu->comfyAnimStatus = COMFY_ANIM_COMPLETED;
        }
    }
}

static void MoveSelector_StartComfyAnims(void)
{
    struct ComfyAnimEasingConfig config;
    u32 animID;
    u32 spriteIDL = sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_L];
    u32 spriteIDR = sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_R];

    if (sRotomStartMenu->comfyAnimStatus == COMFY_ANIM_STARTED)
    {
        ReleaseComfyAnim(gSprites[sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_L]].data[0]);
        InitComfyAnimConfig_Easing(&config);
        config.durationFrames = 7;
        config.from = Q_24_8(gSprites[spriteIDL].x);
        config.to = Q_24_8(sRotomMoves[sRotomStartMenu->fieldMoveCursor].spriteXPos);
        config.easingFunc = ComfyAnimEasing_EaseOutCubic;
        animID = CreateComfyAnim_Easing(&config);
        gSprites[spriteIDL].data[0] = animID;
        gSprites[spriteIDR].data[0] = animID;
    }
    else
    {
        sRotomStartMenu->comfyAnimStatus = COMFY_ANIM_STARTED;

        ClearMoveSelectorText();

        InitComfyAnimConfig_Easing(&config);
        config.durationFrames = 20;
        config.from = Q_24_8(gSprites[spriteIDL].x);
        config.to = Q_24_8(sRotomMoves[sRotomStartMenu->fieldMoveCursor].spriteXPos);
        config.easingFunc = ComfyAnimEasing_EaseOutCubic;
        gSprites[spriteIDL].callback = SpriteCB_MoveSelectorAnimLeft;
        gSprites[spriteIDR].callback = SpriteCB_MoveSelectorAnimRight;

        animID = CreateComfyAnim_Easing(&config);
        gSprites[spriteIDL].data[0] = animID;
        gSprites[spriteIDR].data[0] = animID;
    }
}

static void RotomStartMenu_HandleInput_DPadDown(void)
{
    // Needs to be set to 0 so that the selected icons change in the frontend
    sRotomStartMenu->iconAnimStarted = FALSE;

    switch (sMenuSelected)
    {
    case MENU_NONE:
        if (sRotomStartMenu->fieldMoveCursor < ROTOM_MOVE_ROW_SIZE)
        {
            PlaySE(ROTOMSE_MOVE_PAGE);
            sRotomStartMenu->fieldMoveCursor += ROTOM_MOVE_ROW_SIZE;
            sStoredMoveRow = 1;
            UpdateMoveSelectorText();
            RotomStartMenu_UpdateMonSprites();
        }
        break;
    case MENU_OPTIONS:
        PlaySE(ROTOMSE_MENU_CURSOR);
        sMenuSelected = MENU_POKEDEX;
        break;
    default:
        PlaySE(ROTOMSE_MENU_CURSOR);
        sMenuSelected++;
        break;
    }
}

static void RotomStartMenu_HandleInput_DPadUp(void)
{
    sRotomStartMenu->iconAnimStarted = FALSE;

    switch (sMenuSelected)
    {
    case MENU_NONE:
        if (sRotomStartMenu->fieldMoveCursor >= ROTOM_MOVE_ROW_SIZE)
        {
            PlaySE(ROTOMSE_MOVE_PAGE);
            sRotomStartMenu->fieldMoveCursor -= ROTOM_MOVE_ROW_SIZE;
            sStoredMoveRow = 0;
            UpdateMoveSelectorText();
            RotomStartMenu_UpdateMonSprites();
        }
        break;
    case MENU_POKEDEX:
        PlaySE(ROTOMSE_MENU_CURSOR);
        sMenuSelected = MENU_OPTIONS;
        break;
    default:
        PlaySE(ROTOMSE_MENU_CURSOR);
        sMenuSelected--;
        break;
    }
}

#define tHideTimer data[0]

static void Task_HideMoveSelectorTmp(u8 taskId)
{
    if (gTasks[taskId].tHideTimer == 0)
    {
        gSprites[sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_L]].invisible = FALSE;
        gSprites[sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_R]].invisible = FALSE;
        DestroyTask(taskId);
    }
    else
    {
        gSprites[sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_L]].invisible = TRUE;
        gSprites[sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_R]].invisible = TRUE;
        gTasks[taskId].tHideTimer--;
    }
}

static void RotomStartMenu_HandleInput_DPadLeft(void)
{
    u32 taskId;
    if (sRotomStartMenu->fieldMoveCursor == ROTOM_MOVE_NONE)
    {
        PlaySE(ROTOMSE_MOVE_CURSOR);
        sRotomStartMenu->storedMenuOption = sMenuSelected;
        sMenuSelected = MENU_NONE;
        sRotomStartMenu->fieldMoveCursor = sStoredMoveRow == 1 ? ROTOM_MOVE_BOTTOM_ROW_MAX : ROTOM_MOVE_TOP_ROW_MAX;
    }
    else if (sRotomStartMenu->fieldMoveCursor > 0
             && sRotomStartMenu->fieldMoveCursor != ROTOM_MOVE_TOP_ROW_MAX + 1)
    {
        PlaySE(ROTOMSE_MOVE_CURSOR);
        sRotomStartMenu->fieldMoveCursor--;
    }
    else // cursor is on far left of bottom or top row of field moves
    {
        PlaySE(ROTOMSE_MOVE_CURSOR);
        sRotomStartMenu->iconAnimStarted = FALSE;
        sMenuSelected = sRotomStartMenu->storedMenuOption;
        sRotomStartMenu->fieldMoveCursor = ROTOM_MOVE_NONE;

        // hide temporarily to create a wrapping effect
        taskId = CreateTask(Task_HideMoveSelectorTmp, 0);
        gTasks[taskId].tHideTimer = sRotomStartMenu->comfyAnimStatus == COMFY_ANIM_NONE ? 15 : 5;
    }

    MoveSelector_StartComfyAnims();
}

static void RotomStartMenu_HandleInput_DPadRight(void)
{
    u32 taskId;
    if (sRotomStartMenu->fieldMoveCursor == ROTOM_MOVE_TOP_ROW_MAX
        || sRotomStartMenu->fieldMoveCursor == ROTOM_MOVE_BOTTOM_ROW_MAX)
    {
        PlaySE(ROTOMSE_MOVE_CURSOR);
        sRotomStartMenu->iconAnimStarted = FALSE;
        sMenuSelected = sRotomStartMenu->storedMenuOption;
        sRotomStartMenu->fieldMoveCursor = ROTOM_MOVE_NONE;
    }
    else if (sRotomStartMenu->fieldMoveCursor != ROTOM_MOVE_NONE)
    {
        PlaySE(ROTOMSE_MOVE_CURSOR);
        sRotomStartMenu->fieldMoveCursor++;
    }
    else // cursor is on the menu icons
    {
        PlaySE(ROTOMSE_MOVE_CURSOR);
        sRotomStartMenu->storedMenuOption = sMenuSelected;
        sMenuSelected = MENU_NONE;
        sRotomStartMenu->fieldMoveCursor = sStoredMoveRow == 1 ? ROTOM_MOVE_WHIRLPOOL : ROTOM_MOVE_SURF;

        // hide temporarily to create a wrapping effect
        taskId = CreateTask(Task_HideMoveSelectorTmp, 0);
        gTasks[taskId].tHideTimer = sRotomStartMenu->comfyAnimStatus == COMFY_ANIM_NONE ? 15 : 5;
    }

    MoveSelector_StartComfyAnims();
}

#undef tHideTimer

enum InvalidMsgState
{
    MSGSTATE_INIT,
    MSGSTATE_PRINT_MSG,
    MSGSTATE_WAIT_INPUT,
    MSGSTATE_CLOSE,
};

#define tTaskState data[0]
#define tSpriteID1 data[1]
#define tSpriteID2 data[2]
#define tSpriteID3 data[3]
#define tMaskSpriteID1 data[4]
#define tMaskSpriteID2 data[5]
#define tMaskSpriteID3 data[6]

#define MESSAGE_WINDOW_WIDTH  152
#define MESSAGE_WINDOW_OFFSET 26
#define MOVE_SEL_MIDDLE_WIDTH 32

#define MOVE_SEL_MIDDLE_POS(num) (70 + MOVE_SEL_MIDDLE_WIDTH * num)


static void Task_ShowInvalidMoveMessage(u8 taskId)
{
    switch(gTasks[taskId].tTaskState)
    {
    case MSGSTATE_INIT:
        FillWindowPixelBuffer(sRotomStartMenu->sMoveNameWindowId, PIXEL_FILL(TEXT_COLOR_TRANSPARENT));
        PutWindowTilemap(sRotomStartMenu->sMoveNameWindowId);
        CopyWindowToVram(sRotomStartMenu->sMoveNameWindowId, COPYWIN_GFX);
        ScheduleBgCopyTilemapToVram(0);
        
        gSprites[sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_L]].x = MOVE_SEL_MIDDLE_POS(0) - MOVE_SEL_MIDDLE_WIDTH;
        gSprites[sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_R]].x = MOVE_SEL_MIDDLE_POS(2) + MOVE_SEL_MIDDLE_WIDTH;

        gTasks[taskId].tSpriteID1 = CreateSprite(&sSpriteMoveSelectorMiddle, MOVE_SEL_MIDDLE_POS(0), MOVE_SELECTOR_Y_POS, 0);
        gTasks[taskId].tSpriteID2 = CreateSprite(&sSpriteMoveSelectorMiddle, MOVE_SEL_MIDDLE_POS(1), MOVE_SELECTOR_Y_POS, 0);
        gTasks[taskId].tSpriteID3 = CreateSprite(&sSpriteMoveSelectorMiddle, MOVE_SEL_MIDDLE_POS(2), MOVE_SELECTOR_Y_POS, 0);

        if (Overworld_GetFlashLevel())
        {
            SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJWIN_ON);
            SetGpuRegBits(REG_OFFSET_WINOUT, WINOUT_WINOBJ_OBJ);

            gTasks[taskId].tMaskSpriteID1 = CreateSprite(&sSpriteMoveSelectorMiddle, MOVE_SEL_MIDDLE_POS(0), MOVE_SELECTOR_Y_POS, 0);
            gSprites[gTasks[taskId].tMaskSpriteID1].oam.objMode = ST_OAM_OBJ_WINDOW;
            gTasks[taskId].tMaskSpriteID2 = CreateSprite(&sSpriteMoveSelectorMiddle, MOVE_SEL_MIDDLE_POS(1), MOVE_SELECTOR_Y_POS, 0);
            gSprites[gTasks[taskId].tMaskSpriteID2].oam.objMode = ST_OAM_OBJ_WINDOW;
            gTasks[taskId].tMaskSpriteID3 = CreateSprite(&sSpriteMoveSelectorMiddle, MOVE_SEL_MIDDLE_POS(2), MOVE_SELECTOR_Y_POS, 0);
            gSprites[gTasks[taskId].tMaskSpriteID3].oam.objMode = ST_OAM_OBJ_WINDOW;
            
            SetGpuRegBits(REG_OFFSET_DISPCNT, 0);
            SetGpuRegBits(REG_OFFSET_WINOUT, 0);
        }
        
        gTasks[taskId].tTaskState++;
        break;
    case MSGSTATE_PRINT_MSG:
        AddTextPrinterParameterized3(sRotomStartMenu->sMoveNameWindowId,
                                     FONT_SMALL,
                                     GetStringCenterAlignXOffset(FONT_SMALL, sRotomMoveMessages[sRotomStartMenu->rotomMoveMsgID], MESSAGE_WINDOW_WIDTH) + MESSAGE_WINDOW_OFFSET,
                                     3,
                                     sMoveTextColor,
                                     TEXT_SKIP_DRAW,
                                     sRotomMoveMessages[sRotomStartMenu->rotomMoveMsgID]);

        CopyWindowToVram(sRotomStartMenu->sMoveNameWindowId, COPYWIN_GFX);
        ScheduleBgCopyTilemapToVram(0);

        gTasks[taskId].tTaskState++;
        break;
    case MSGSTATE_WAIT_INPUT:
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(ROTOMSE_MENU_SELECTION);
            gTasks[taskId].tTaskState++;
        }
        break;
    case MSGSTATE_CLOSE:
        DestroySprite(&gSprites[gTasks[taskId].tSpriteID1]);
        DestroySprite(&gSprites[gTasks[taskId].tSpriteID2]);
        DestroySprite(&gSprites[gTasks[taskId].tSpriteID3]);

        if (Overworld_GetFlashLevel())
        {
            DestroySprite(&gSprites[gTasks[taskId].tMaskSpriteID1]);
            DestroySprite(&gSprites[gTasks[taskId].tMaskSpriteID2]);
            DestroySprite(&gSprites[gTasks[taskId].tMaskSpriteID3]);
        }

        UpdateMoveSelectorText();
        gSprites[sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_L]].x = sRotomMoves[sRotomStartMenu->fieldMoveCursor].spriteXPos;
        gSprites[sRotomStartMenu->spriteIDs[SPRITE_MOVE_SELECTOR_R]].x = sRotomMoves[sRotomStartMenu->fieldMoveCursor].spriteXPos + MOVE_SELECTOR_R_OFFSET;
        
        sRotomStartMenu->rotomMoveMsgID = ROTOM_MSG_NONE;
        DestroyTask(taskId);
        break;
    } 
}

#undef tTaskState
#undef tSpriteID1
#undef tSpriteID2
#undef tSpriteID3

static bool32 CheckValidFieldMoveInput(void)
{
    sFieldMoveData = 0;

    if (sRotomStartMenu->fieldMoveCursor != ROTOM_MOVE_NONE
        && sRotomStartMenu->monSpecies[sRotomStartMenu->fieldMoveCursor] != SPECIES_NONE
        && sRotomMoves[sRotomStartMenu->fieldMoveCursor].setupFunc != NULL
        && sRotomMoves[sRotomStartMenu->fieldMoveCursor].setupFunc())
    {
        return TRUE;
    }
    else
    {
        PlaySE(SE_BOO);
        if (sRotomStartMenu->rotomMoveMsgID != ROTOM_MSG_NONE)
        {
            CreateTask(Task_ShowInvalidMoveMessage, 0);
        }
        return FALSE;
    }
}

static void Task_RotomStartMenu_HandleMainInput(u8 taskId)
{
    u32 index, fieldMoveTask;

    AdvanceComfyAnimations();
    
    // stifle all input while invalid message is showing, which handles A press to close
    if (FindTaskIdByFunc(Task_ShowInvalidMoveMessage) != TASK_NONE) return;

    if (!sRotomStartMenu->optionSelected && !gPaletteFade.active)
    {
        index = IndexOfSpritePaletteTag(TAG_ICON_PAL);
        LoadPalette(sIconPal, OBJ_PLTT_ID(index), PLTT_SIZE_4BPP);
    }

    if (JOY_NEW(A_BUTTON))
    {
        if (sMenuSelected != MENU_NONE)
        {
            PlaySE(ROTOMSE_MENU_SELECTION);
            if (!sRotomStartMenu->optionSelected)
            {
                // don't fade when selecting trainer card in flash cave for
                // not able to see bit
                if (sMenuSelected != MENU_SAVE
                    && (sMenuSelected != MENU_TRAINER_CARD || !Overworld_GetFlashLevel()))
                {
                    FadeScreen(FADE_TO_BLACK, 0);
                }
                sRotomStartMenu->optionSelected = TRUE;
            }
        }
        else if (sRotomStartMenu->comfyAnimStatus == COMFY_ANIM_NONE // wait for move selector anims to finish 
                 && sRotomStartMenu->fieldMoveCursor != ROTOM_MOVE_NONE
                 && CheckValidFieldMoveInput())
        {
            PlaySE(ROTOMSE_MENU_SELECTION);
            gUsingRotomMenuMove = TRUE;
            gRotomMoveSlotOrBoxPos = sRotomStartMenu->monSlotOrBoxPos[sRotomStartMenu->fieldMoveCursor];
           
            if (sRotomStartMenu->fieldMoveCursor == ROTOM_MOVE_FLY)
            {
                FadeScreen(FADE_TO_BLACK, 0);
            }
            fieldMoveTask = CreateTask(Task_DoCleanUpAndExecuteFieldMove, 0);
            gTasks[fieldMoveTask].tRotomMove = sRotomStartMenu->fieldMoveCursor;
        }
    }
    else if (JOY_NEW(B_BUTTON) && !sRotomStartMenu->optionSelected)
    {
        PlaySE(ROTOMSE_MENU_CLOSE);
        RotomStartMenu_ExitAndClearTilemap();
        DestroyTask(taskId);
    }
    else if (JOY_REPT(DPAD_DOWN) && !sRotomStartMenu->optionSelected)
    {
        RotomStartMenu_HandleInput_DPadDown();
    }
    else if (JOY_REPT(DPAD_UP) && !sRotomStartMenu->optionSelected)
    {
        RotomStartMenu_HandleInput_DPadUp();
    }
    else if (JOY_REPT(DPAD_LEFT) && !sRotomStartMenu->optionSelected)
    {
        RotomStartMenu_HandleInput_DPadLeft();
    }
    else if (JOY_REPT(DPAD_RIGHT) && !sRotomStartMenu->optionSelected)
    {
        RotomStartMenu_HandleInput_DPadRight();
    }
    else if (sRotomStartMenu->optionSelected)
    {
        RotomStartMenu_OpenMenu();
    }

    if (JOY_REPT(DPAD_ANY))
    {
        RotomMenu_TryMakeDizzy();
        RotomMenu_TryStartEyesLook();
    }
}

#undef tRotomMove

#define SET_HIGH_BIT(num) (num | (1 << 15))

static void PopulateMoveMonSpecies(void)
{
    u32 move, box, monPos, partySlot;
    u16 species;
    // static const u16 testSpeciesInfo[] = {
    //     SPECIES_GHOLDENGO,
    //     SPECIES_GOLDEEN,
    //     SPECIES_MACHAMP,
    //     SPECIES_KRABBY,
    //     SPECIES_FARFETCHD,
    //     SPECIES_GOLURK,
    //     SPECIES_KRABBY,
    //     SPECIES_EXEGGUTOR,
    //     SPECIES_KANGASKHAN,
    //     SPECIES_AMPHAROS_MEGA,
    //     SPECIES_MR_MIME,
    //     SPECIES_SCYTHER,
    // };

    for (move = 0; move < ROTOM_MOVE_COUNT; move++)
    {
        if (FindPartyMonWithMove(sRotomMoves[move].move, &partySlot, &species))
        {
            sRotomStartMenu->monSpecies[move] = species;
            sRotomStartMenu->monSlotOrBoxPos[move] = partySlot;
        }
        else if (FindBoxMonWithMove(sRotomMoves[move].move, &box, &monPos, &species))
        {
            sRotomStartMenu->monSpecies[move] = species;
            sRotomStartMenu->monSlotOrBoxPos[move] = (u16)SET_HIGH_BIT(((box << 8) | monPos));
        }
        else
        {
            sRotomStartMenu->monSpecies[move] = SPECIES_NONE;
            sRotomStartMenu->monSlotOrBoxPos[move] = ROTOM_SLOT_POS_NONE;
        }
        // sRotomStartMenu->monSpecies[move] = testSpeciesInfo[move];
    }

    for (move = 0; move < ROTOM_MOVE_COUNT; move++) DebugPrintf("move %u species: %u, slotorpos: %x", move, sRotomStartMenu->monSpecies[move], sRotomStartMenu->monSlotOrBoxPos[move]);
}

// Field move functions

static bool32 SetupFunc_Surf(void)
{
    s16 x, y;
    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);

    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
    {
        sRotomStartMenu->rotomMoveMsgID = ROTOM_MSG_ALREADY_SURFING;
        return FALSE;
    }

    if (MetatileBehavior_IsFastWater(MapGridGetMetatileBehaviorAt(x, y)))
    { 
        sRotomStartMenu->rotomMoveMsgID = ROTOM_MSG_CURRENT_TOO_FAST;
        return FALSE;
    }

    if (!IsPlayerFacingSurfableFishableWater())
    {
        sRotomStartMenu->rotomMoveMsgID = ROTOM_MSG_CANT_SURF_HERE;
        return FALSE;
    }

    return TRUE;
}

static void FieldMoveFunc_Surf(void)
{
    FieldEffectStart(FLDEFF_USE_SURF);
}

static bool32 SetupFunc_Waterfall(void)
{
    s16 x, y;
    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);

    if (MetatileBehavior_IsWaterfall(MapGridGetMetatileBehaviorAt(x, y))
        && IsPlayerSurfingNorth())
    {
        return TRUE;
    }
    else
    {
        sRotomStartMenu->rotomMoveMsgID = ROTOM_MSG_CANT_USE_HERE;
        return FALSE; 
    }        
}

static void FieldMoveFunc_Waterfall(void)
{
    FieldEffectStart(FLDEFF_USE_WATERFALL);
}

static bool32 SetupFunc_RockClimb(void)
{
    return FALSE;
}

static void FieldMoveFunc_RockClimb(void)
{
    return;
}

static bool32 SetupFunc_Strength(void)
{
    if (FlagGet(FLAG_SYS_USE_STRENGTH))
    {
        sRotomStartMenu->rotomMoveMsgID = ROTOM_MSG_ALREADY_IN_USE;
        return FALSE; 
    }


    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING)
        || !CheckObjectGraphicsInFrontOfPlayer(OBJ_EVENT_GFX_PUSHABLE_BOULDER))
    {
        sRotomStartMenu->rotomMoveMsgID = ROTOM_MSG_CANT_USE_HERE;
        return FALSE; 
    }

    return TRUE;    
}

static void FieldMoveFunc_Strength(void)
{
    ScriptContext_SetupScript(EventScript_FldEffStrength);
}

enum CutType
{
    CUT_TYPE_NONE,
    CUT_TYPE_TREE,
    CUT_TYPE_GRASS,
};

#define CUT_SIDE 3 // same as in fldeff_cut.c

static bool32 SetupFunc_Cut(void)
{
    s16 x, y;
    u8 i, j;
    gScheduleOpenDottedHole = FALSE;
    if (CutMoveRuinValleyCheck() == TRUE)
    {
        gScheduleOpenDottedHole = TRUE;
        sFieldMoveData = CUT_TYPE_GRASS;
        return TRUE;
    }

    if (CheckObjectGraphicsInFrontOfPlayer(OBJ_EVENT_GFX_CUT_TREE) == TRUE || (CheckObjectGraphicsInFrontOfPlayer(OBJ_EVENT_GFX_WORKER_M) == TRUE && ((gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_PEWTER_CITY_MUSEUM_1F) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_PEWTER_CITY_MUSEUM_1F)) || (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_CINNABAR_ISLAND_POKEMON_LAB_RESEARCH_ROOM) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_CINNABAR_ISLAND_POKEMON_LAB_RESEARCH_ROOM)))))
    {
        sFieldMoveData = CUT_TYPE_TREE;
        return TRUE;
    }

    else
    {
        PlayerGetDestCoords(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);

        for (i = 0; i < CUT_SIDE; i++)
        {
            y = gPlayerFacingPosition.y - 1 + i;
            for (j = 0; j < CUT_SIDE; j++)
            {
                x = gPlayerFacingPosition.x - 1 + j;
                if (MapGridGetElevationAt(x, y) == gPlayerFacingPosition.elevation)
                {
                    if (MetatileAtCoordsIsGrassTile(x, y) == TRUE)
                    {
                        sFieldMoveData = CUT_TYPE_GRASS;
                        return TRUE;
                    }
                }
            }
        }

        sRotomStartMenu->rotomMoveMsgID = ROTOM_MSG_NOTHING_TO_CUT;
        return FALSE;
    }
}

static void FieldMoveFunc_Cut(void)
{
    if (sFieldMoveData == CUT_TYPE_GRASS)
    {
        FieldEffectStart(FLDEFF_USE_CUT_ON_GRASS);
    }
    else
    {
        ScriptContext_SetupScript(EventScript_FldEffCut);
    }
}

static bool32 SetupFunc_Fly(void)
{
    if (Overworld_MapTypeAllowsTeleportAndFly(gMapHeader.mapType))
    {
        return TRUE;
    }
    else
    {
        sRotomStartMenu->rotomMoveMsgID = ROTOM_MSG_CANT_USE_HERE;
        return FALSE;
    }
}

static void FieldMoveFunc_Fly(void)
{
    gMain.savedCallback = CB2_ReturnToFieldWithOpenMenu;
    SetMainCallback2(CB2_OpenFlyMap);
}

static bool32 SetupFunc_Whirlpool(void)
{
    return FALSE;
}

static void FieldMoveFunc_Whirlpool(void)
{
    return;
}

static bool32 SetupFunc_Guillotine(void)
{
    return FALSE;
}

static void FieldMoveFunc_Guillotine(void)
{
    return;
}

static bool32 SetupFunc_BrickBreak(void)
{
    return FALSE;
}

static void FieldMoveFunc_BrickBreak(void)
{
    return;
}

static bool32 SetupFunc_TailGlow(void)
{
    if (FlagGet(FLAG_SYS_FLASH_ACTIVE))
    {
        sRotomStartMenu->rotomMoveMsgID = ROTOM_MSG_ALREADY_IN_USE;
        return FALSE;
    }

    if ((VarGet(VAR_CSR_TURNED_ON_POWER) == 1 && IsCurrentMap(MAP_ROCK_TUNNEL_1F))
        || gMapHeader.cave != TRUE)
    {
        sRotomStartMenu->rotomMoveMsgID = ROTOM_MSG_CANT_USE_HERE;
        return FALSE;
    }

    return TRUE;
}

static void FieldMoveFunc_TailGlow(void)
{
    u8 taskId = CreateFieldEffectShowMon();
    FLDEFF_SET_FUNC_TO_DATA(FldEff_UseFlash);
}

static bool32 SetupFunc_Rest(void)
{
    return FALSE;
}

static void FieldMoveFunc_Rest(void)
{
    return;
}

static bool32 SetupFunc_Retreat(void)
{
    if (gSaveBlock1Ptr->lastBenchLocation.mapGroup > 0)
    {
        return TRUE;
    }
    else
    {
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_ROUTE12))
        {
            sRotomStartMenu->rotomMoveMsgID = ROTOM_MSG_NO_RETREAT;
        }
        else
        {
            sRotomStartMenu->rotomMoveMsgID = ROTOM_MSG_CANT_USE_RETREAT;
        }

        return FALSE;    
    }

    return FALSE; // just a failsafe
}

static void FieldMoveFunc_Retreat(void)
{
    Overworld_ResetStateAfterTeleport();
    FieldEffectStart(FLDEFF_USE_RETREAT);
}
