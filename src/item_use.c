#include "global.h"
#include "gflib.h"
#include "help_system.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_interface.h"
#include "berry_pouch.h"
#include "sandwich_case.h"
#include "bike.h"
#include "coins.h"
#include "event_data.h"
#include "field_effect.h"
#include "field_fadetransition.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "field_specials.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "help_system.h"
#include "item.h"
#include "item_menu.h"
#include "item_use.h"
#include "itemfinder.h"
#include "mail.h"
#include "event_object_lock.h"
#include "metatile_behavior.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "party_menu.h"
#include "pokedex_screen.h"
#include "pokemon.h"
#include "quest_log.h"
#include "random.h"
#include "region_map.h"
#include "script.h"
#include "script_pokemon_util.h"
#include "strings.h"
#include "task.h"
#include "tm_case.h"
#include "fldeff.h"

#include "constants/sound.h"
#include "constants/event_object_movement.h"
#include "constants/event_objects.h"
#include "constants/items.h"
#include "constants/item_effects.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/field_weather.h"


static EWRAM_DATA void (*sItemUseOnFieldCB)(u8 taskId) = NULL;
EWRAM_DATA bool8 gUsingRegisteredPartyMenuItem = FALSE;
static EWRAM_DATA bool8 sTriggerZubatEvo = FALSE;

static void FieldCB_FadeInFromBlack(void);
static void Task_WaitFadeIn_CallItemUseOnFieldCB(u8 taskId);
static void Task_ItemUse_CloseMessageBoxAndReturnToField(u8 taskId);
static void Task_ItemUseWaitForFade(u8 taskId);
static bool8 FieldCB2_UseItemFromField(void);
static void CB2_CheckMail(void);
static void ItemUseOnFieldCB_Bicycle(u8 taskId);
static bool8 CanFish(void);
static void ItemUseOnFieldCB_Rod(u8 taskId);
static void Task_PlayPokeFlute(u8 taskId);
static void Task_DisplayPokeFluteMessage(u8 taskId);
static void InitTMCaseFromBag(void);
static void Task_InitTMCaseFromField(u8 taskId);
static void InitBerryPouchFromBag(void);
static void Task_InitBerryPouchFromField(u8 taskId);
static void InitSandwichCaseFromBag(void);
static void Task_InitSandwichCaseFromField(u8 taskId);
static void InitBerryPouchFromBattle(void);
static void Task_UseRepel(u8 taskId);
static void Task_UseMaxRepel(u8 taskId);
static void RemoveUsedItem(void);
static void Task_UsedBlackWhiteFlute(u8 taskId);
static void ItemUseOnFieldCB_EscapeRope(u8 taskId);
static void UseTownMapFromBag(void);
static void Task_UseTownMapFromField(u8 taskId);
static void UseFameCheckerFromBag(void);
static void Task_UseFameCheckerFromField(u8 taskId);
static void Task_BattleUse_StatBooster_DelayAndPrint(u8 taskId);
static void Task_BattleUse_StatBooster_WaitButton_ReturnToBattle(u8 taskId);
static void LWPEmblem_EquipOutfit(void);
static void ItemUseOnFieldCB_LWPEmblem(u8 taskId);
static void Task_UseLWPEmblemOnField(u8 taskId);
static void Task_UseWEmblemEvolveOnField(u8 taskId);
static void StartLWPEmblemFieldEffect(void);
static void Task_LWPEmblemWarpOut(u8 taskId);
static void LWPEmblemWarpOutEffect_Init(struct Task *task);
static void LWPEmblemWarpOutEffect_Spin(struct Task *task);
static void ItemUseOnFieldCB_GenderFluid(u8 taskId);
static void Task_UseGenderFluidOnField(u8 taskId);
static void StartGenderFluidFieldEffect(void);
static void Task_GenderFluidWarpOut(u8 taskId);
static void GenderFluidWarpOutEffect_Init(struct Task *task);
static void GenderFluidWarpOutEffect_Spin(struct Task *task);
static void TryToTransTheNidotrans(u8 taskId);
static void TransTheNidotrans(u8 taskId);
void RemoveShoesFromToedy();
void CurePorygonVirus();
void ZygardeSwitcheroo();

static u16 FindSpeciesInParty(u16 species);
static void ItemUseOnFieldCB_MoveRelearner(u8 taskId);
static void Task_UseMoveRelearnerOnField(u8 taskId);
static void Task_InitPartyMenuFromRegisteredItem(u8 taskId);
void PrintKorokDebug(void);

bool8 CanUseStairOrbOnCurrMap(void);
static void ItemUseOnFieldCB_StairOrb(u8 taskId);
void Task_UseStairOrbOnField(u8 taskId);



// unknown unused data.
// It's curiously about the size of an array of values indexed by species (including padding),
// but the arrangement of values is not sensible (e.g., not giving all "old unown" the same value).
static const u8 sUnused[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x40, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x20, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x04, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x10, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x20, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x43, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x20, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x21, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x10, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x40, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x40, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x40, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x30, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x40, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x23, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x10, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x1f, 0x00, 0xe0, 0x03, 0x00, 0x7c,
    0xff, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

static void (*const sExitCallbackByItemType[])(void) = {
    [ITEM_TYPE_PARTY_MENU - 1] = CB2_ShowPartyMenuForItemUse,
    [ITEM_TYPE_FIELD      - 1] = CB2_ReturnToField,
    [ITEM_TYPE_UNUSED     - 1] = NULL,
    [ITEM_TYPE_BAG_MENU   - 1] = NULL,
};

#define tUsingRegisteredKeyItem data[3]

static void SetUpItemUseCallback(u8 taskId)
{
    u8 itemType;
    if (gSpecialVar_ItemId == ITEM_ENIGMA_BERRY)
        itemType = gTasks[taskId].data[4] - 1;
    else
        itemType = ItemId_GetType(gSpecialVar_ItemId) - 1;
    if (GetPocketByItemId(gSpecialVar_ItemId) == POCKET_BERRY_POUCH)
    {
        BerryPouch_SetExitCallback(sExitCallbackByItemType[itemType]);
        BerryPouch_StartFadeToExitCallback(taskId);
    }
    else
    {
        // yeah I know this is kinda silly, but I don't want a redundant call to get the item type
        // blame GF for their silly array indexing
        if (gTasks[taskId].tUsingRegisteredKeyItem && itemType == (ITEM_TYPE_PARTY_MENU - 1))
        {
            StopPokemonLeagueLightingEffectTask();
            FadeScreen(FADE_TO_BLACK, 0);
            gUsingRegisteredPartyMenuItem = TRUE;
            gTasks[taskId].func = Task_InitPartyMenuFromRegisteredItem;
        }
        else
        {
            ItemMenu_SetExitCallback(sExitCallbackByItemType[itemType]);
            if (itemType == ITEM_TYPE_FIELD - 1)
                Bag_BeginCloseWin0Animation();
            
            ItemMenu_StartFadeToExitCallback(taskId);
        }
    }
}

static void Task_InitPartyMenuFromRegisteredItem(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        SetMainCallback2(CB2_ShowPartyMenuForItemUse);
        DestroyTask(taskId);
    }
}

static void SetUpItemUseOnFieldCallback(u8 taskId)
{
    if (gTasks[taskId].data[3] != 1)
    {
        gFieldCallback = FieldCB_FadeInFromBlack;
        SetUpItemUseCallback(taskId);
    }
    else
        sItemUseOnFieldCB(taskId);
}

static void FieldCB_FadeInFromBlack(void)
{
    FadeInFromBlack();
    CreateTask(Task_WaitFadeIn_CallItemUseOnFieldCB, 8);
}

static void Task_WaitFadeIn_CallItemUseOnFieldCB(u8 taskId)
{
    if (IsWeatherNotFadingIn() == TRUE)
        sItemUseOnFieldCB(taskId);
}

static void DisplayItemMessageInCurrentContext(u8 taskId, bool8 inField, u8 fontId, const u8 *str)
{
    StringExpandPlaceholders(gStringVar4, str);
    if (inField == FALSE)
        DisplayItemMessageInBag(taskId, fontId, gStringVar4, Task_ReturnToBagFromContextMenu);
    else
        DisplayItemMessageOnField(taskId, fontId, gStringVar4, Task_ItemUse_CloseMessageBoxAndReturnToField);
}

static void PrintNotTheTimeToUseThat(u8 taskId, bool8 inField)
{
    DisplayItemMessageInCurrentContext(taskId, inField, FONT_MALE, gText_OakForbidsUseOfItemHere);
}

static void Task_ItemUse_CloseMessageBoxAndReturnToField(u8 taskId)
{
    ClearDialogWindowAndFrame(0, 1);
    DestroyTask(taskId);
    ClearPlayerHeldMovementAndUnfreezeObjectEvents();
    UnlockPlayerFieldControls();
}

u8 CheckIfItemIsTMHMOrEvolutionStone(u16 itemId)
{
    if (ItemId_GetPocket(itemId) == POCKET_TM_CASE)
        return 1;
    else if (ItemId_GetFieldFunc(itemId) == FieldUseFunc_EvoItem || itemId == ITEM_W_EMBLEM) // zubat evolves when in party and using W emblem
        return 2;
    else
        return 0;
}

static void SetFieldCallback2ForItemUse(void)
{
    gFieldCallback2 = FieldCB2_UseItemFromField;
}

static bool8 FieldCB2_UseItemFromField(void)
{
    FreezeObjectEvents();
    LockPlayerFieldControls();
    FadeInFromBlack();
    CreateTask(Task_ItemUseWaitForFade, 10);
    gExitStairsMovementDisabled = FALSE;
    return TRUE;
}

static void Task_ItemUseWaitForFade(u8 taskId)
{
    if (IsWeatherNotFadingIn() == TRUE)
    {
        UnfreezeObjectEvents();
        UnlockPlayerFieldControls();
        DestroyTask(taskId);
    }
}

void FieldUseFunc_Mail(u8 taskId)
{
    ItemMenu_SetExitCallback(CB2_CheckMail);
    ItemMenu_StartFadeToExitCallback(taskId);
}

static void CB2_CheckMail(void)
{
    struct Mail mail;

    mail.itemId = gSpecialVar_ItemId;
    ReadMail(&mail, CB2_BagMenuFromStartMenu, FALSE);
}

void FieldUseFunc_Bike(u8 taskId)
{
    s16 x, y;
    u8 behavior;

    PlayerGetDestCoords(&x, &y);
    behavior = MapGridGetMetatileBehaviorAt(x, y);

    if (FlagGet(FLAG_SYS_ON_CYCLING_ROAD) == TRUE
     || MetatileBehavior_IsVerticalRail(behavior) == TRUE
     || MetatileBehavior_IsHorizontalRail(behavior) == TRUE
     || MetatileBehavior_IsIsolatedVerticalRail(behavior) == TRUE
     || MetatileBehavior_IsIsolatedHorizontalRail(behavior) == TRUE)
        DisplayItemMessageInCurrentContext(taskId, gTasks[taskId].data[3], FONT_NORMAL, gText_CantDismountBike);
    else if (Overworld_IsBikingAllowed() == TRUE && !IsBikingDisallowedByPlayer())
    {
        sItemUseOnFieldCB = ItemUseOnFieldCB_Bicycle;
        SetUpItemUseOnFieldCallback(taskId);
    }
    else
        PrintNotTheTimeToUseThat(taskId, gTasks[taskId].data[3]);
}

static void ItemUseOnFieldCB_Bicycle(u8 taskId)
{
    if (!TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE)) {
            if(gSpecialVar_ItemId == ITEM_SHINY_BIKE) {
                FlagSet(FLAG_SYS_ON_SHINY_BIKE);
            } else {
                FlagClear(FLAG_SYS_ON_SHINY_BIKE);
            }
            PlaySE(SE_BIKE_BELL);
        
    }
        
    GetOnOffBike(PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE);
    ClearPlayerHeldMovementAndUnfreezeObjectEvents();
    UnlockPlayerFieldControls();
    DestroyTask(taskId);
}

void FieldUseFunc_Rod(u8 taskId)
{
    if (CanFish() == TRUE)
    {
        if(gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_VIRIDIAN_FOREST) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_VIRIDIAN_FOREST)) {
            FlagSet(FLAG_SHINY_CREATION);
        }
        sItemUseOnFieldCB = ItemUseOnFieldCB_Rod;
        SetUpItemUseOnFieldCallback(taskId);
    }
    else
        PrintNotTheTimeToUseThat(taskId, gTasks[taskId].data[3]);
}

static bool8 CanFish(void)
{
    s16 x, y;
    u16 behavior;
    
    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    behavior = MapGridGetMetatileBehaviorAt(x, y);
    if (MetatileBehavior_IsGirlHole(behavior)) {
            //DebugPrintf("true");
            FlagSet(FLAG_SYS_GIRL_HOLE);
            return TRUE;

    }
    if (MetatileBehavior_IsFishableStatue(behavior)) {
            //DebugPrintf("true");
            //FlagSet(FLAG_SYS_GIRL_HOLE);
            return TRUE;

    }
    if (CheckObjectGraphicsInFrontOfPlayer(OBJ_EVENT_GFX_PENCIL)) {
            //DebugPrintf("true");
            FlagSet(FLAG_SYS_ZAPDOS_STATUE);
            //FlagSet(FLAG_SHINY_CREATION);
            return TRUE;

    }
    if (MetatileBehavior_IsLuvdiscTile(behavior)) {
            //DebugPrintf("true");
            VarSet(VAR_LUVDISC_TILE, 1);
            return TRUE;

    }
    if (MetatileBehavior_IsNormalLuvdiscTile(behavior)) {
            //DebugPrintf("true");
            VarSet(VAR_LUVDISC_TILE, 2);
            return TRUE;

    }

    if (MetatileBehavior_IsWaterfall(behavior))
        return FALSE;
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_UNDERWATER))
        return FALSE;
    if (!TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
    {
        if (IsPlayerFacingSurfableFishableWater())
            return TRUE;
    }
    else
    {
         
        
        if (MetatileBehavior_IsSurfable(behavior) && MapGridGetCollisionAt(x, y) == 0)
            return TRUE;
        if (MetatileBehavior_IsBridge(behavior) == TRUE)
            return TRUE;
    }
    return FALSE;
}

static void ItemUseOnFieldCB_Rod(u8 taskId)
{
    StartFishing(ItemId_GetSecondaryId(gSpecialVar_ItemId));
    DestroyTask(taskId);
}

void ItemUseOutOfBattle_Itemfinder(u8 taskId)
{
    IncrementGameStat(GAME_STAT_USED_ITEMFINDER);
    sItemUseOnFieldCB = ItemUseOnFieldCB_Itemfinder;
    SetUpItemUseOnFieldCallback(taskId);
}

void FieldUseFunc_CoinCase(u8 taskId)
{
    ConvertIntToDecimalStringN(gStringVar1, GetCoins(), STR_CONV_MODE_LEFT_ALIGN, 4);
    StringExpandPlaceholders(gStringVar4, gText_CoinCase);
    ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].data[3] == 0)
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gStringVar4, Task_ReturnToBagFromContextMenu);
    else
        DisplayItemMessageOnField(taskId, FONT_NORMAL, gStringVar4, Task_ItemUse_CloseMessageBoxAndReturnToField);
}

void FieldUseFunc_PowderJar(u8 taskId)
{
    ConvertIntToDecimalStringN(gStringVar1, 0, STR_CONV_MODE_LEFT_ALIGN, 5);
    StringExpandPlaceholders(gStringVar4, gText_PowderQty);
    ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].data[3] == 0)
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gStringVar4, Task_ReturnToBagFromContextMenu);
    else
        DisplayItemMessageOnField(taskId, FONT_NORMAL, gStringVar4, Task_ItemUse_CloseMessageBoxAndReturnToField);
}

void FieldUseFunc_PokeFlute(u8 taskId)
{
    bool8 wokeSomeoneUp = FALSE;
    u8 i;

    for (i = 0; i < CalculatePlayerPartyCount(); i++)
    {
        if (!ExecuteTableBasedItemEffect(&gPlayerParty[i], ITEM_AWAKENING, i, 0))
            wokeSomeoneUp = TRUE;
    }
    VarSet(VAR_USED_POKE_FLUTE, 1);
    if (wokeSomeoneUp)
    {
        ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
        if (gTasks[taskId].data[3] == 0)
            DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_PlayedPokeFlute, Task_PlayPokeFlute);
        else
            DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_PlayedPokeFlute, Task_PlayPokeFlute);
    }
    else
    {
        if (gTasks[taskId].data[3] == 0)
            DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_PlayedPokeFluteCatchy, Task_ReturnToBagFromContextMenu);
        else
            DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_PlayedPokeFluteCatchy, Task_ItemUse_CloseMessageBoxAndReturnToField);
    }
}

static void Task_PlayPokeFlute(u8 taskId)
{
    PlayFanfareByFanfareNum(FANFARE_POKE_FLUTE);
    gTasks[taskId].func = Task_DisplayPokeFluteMessage;
}

static void Task_DisplayPokeFluteMessage(u8 taskId)
{
    if (WaitFanfare(FALSE))
    {
        if (gTasks[taskId].data[3] == 0)
            DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_PokeFluteAwakenedMon, Task_ReturnToBagFromContextMenu);
        else
            DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_PokeFluteAwakenedMon, Task_ItemUse_CloseMessageBoxAndReturnToField);
    }
}

static void DoSetUpItemUseCallback(u8 taskId)
{
    SetUpItemUseCallback(taskId);
}

void FieldUseFunc_Medicine(u8 taskId)
{
    gItemUseCB = ItemUseCB_Medicine;
    DoSetUpItemUseCallback(taskId);
}

void FieldUseFunc_Ether(u8 taskId)
{
    gItemUseCB = ItemUseCB_TryRestorePP;
    DoSetUpItemUseCallback(taskId);
}

void FieldUseFunc_PpUp(u8 taskId)
{
    gItemUseCB = ItemUseCB_PPUp;
    DoSetUpItemUseCallback(taskId);
}

void FieldUseFunc_RareCandy(u8 taskId)
{
    gItemUseCB = ItemUseCB_RareCandy;
    DoSetUpItemUseCallback(taskId);
}

void FieldUseFunc_EvoItem(u8 taskId)
{
    gItemUseCB = ItemUseCB_EvolutionStone;
    DoSetUpItemUseCallback(taskId);
}

void FieldUseFunc_SacredAsh(u8 taskId)
{
    gItemUseCB = ItemUseCB_SacredAsh;
    SetUpItemUseCallback(taskId);
}

void FieldUseFunc_TmCase(u8 taskId)
{
    if (gTasks[taskId].data[3] == 0)
    {
        ItemMenu_SetExitCallback(InitTMCaseFromBag);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        StopPokemonLeagueLightingEffectTask();
        FadeScreen(FADE_TO_BLACK, 0);
        gTasks[taskId].func = Task_InitTMCaseFromField;
    }
}

static void InitTMCaseFromBag(void)
{
    InitTMCase(TMCASE_FIELD, CB2_BagMenuFromStartMenu, FALSE);
}

static void Task_InitTMCaseFromField(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        SetFieldCallback2ForItemUse();
        InitTMCase(TMCASE_FIELD, CB2_ReturnToField, TRUE);
        DestroyTask(taskId);
    }
}

void FieldUseFunc_BerryPouch(u8 taskId)
{
    if (gTasks[taskId].data[3] == 0)
    {
        ItemMenu_SetExitCallback(InitBerryPouchFromBag);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        StopPokemonLeagueLightingEffectTask();
        FadeScreen(FADE_TO_BLACK, 0);
        gTasks[taskId].func = Task_InitBerryPouchFromField;
    }
}

static void InitBerryPouchFromBag(void)
{
    InitBerryPouch(BERRYPOUCH_FROMFIELD, CB2_BagMenuFromStartMenu, 0);
}

static void Task_InitBerryPouchFromField(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        SetFieldCallback2ForItemUse();
        InitBerryPouch(BERRYPOUCH_FROMFIELD, CB2_ReturnToField, 1);
        DestroyTask(taskId);
    }
}

void FieldUseFunc_SandwichCase(u8 taskId)
{
    if (gTasks[taskId].data[3] == 0)
    {
        ItemMenu_SetExitCallback(InitSandwichCaseFromBag);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        StopPokemonLeagueLightingEffectTask();
        FadeScreen(FADE_TO_BLACK, 0);
        gTasks[taskId].func = Task_InitSandwichCaseFromField;
    }
}

static void InitSandwichCaseFromBag(void)
{
    InitSandwichCase(CB2_BagMenuFromStartMenu);
}

static void Task_InitSandwichCaseFromField(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        SetFieldCallback2ForItemUse();
        InitSandwichCase(CB2_ReturnToField);
        DestroyTask(taskId);
    }
}

void BattleUseFunc_BerryPouch(u8 taskId)
{
    ItemMenu_SetExitCallback(InitBerryPouchFromBattle);
    ItemMenu_StartFadeToExitCallback(taskId);
}

static void InitBerryPouchFromBattle(void)
{
    InitBerryPouch(BERRYPOUCH_FROMBATTLE, CB2_BagMenuFromBattle, 0);
}

void FieldUseFunc_Repel(u8 taskId)
{
    if (gSpecialVar_ItemId == ITEM_MAX_REPEL) {
        if(FlagGet(FLAG_CSR_POWER_IS_ON) || FlagGet(FLAG_UNLEASHED_ENERGY)) {
            if(FlagGet(FLAG_SYS_MAX_REPEL)) {
                FlagClear(FLAG_SYS_MAX_REPEL);
                DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_MaxRepelTurnedOff, Task_ReturnToBagFromContextMenu);

            } else {
                VarSet(VAR_REPEL_STEP_COUNT, 0);
                FlagSet(FLAG_SYS_MAX_REPEL);
                PlaySE(SE_REPEL);
                gTasks[taskId].func = Task_UseMaxRepel;
            }
            
        } else {
            DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_MaxRepelDoesntWork, Task_ReturnToBagFromContextMenu);

        }

    } else if (VarGet(VAR_REPEL_STEP_COUNT) == 0 || FlagGet(FLAG_SYS_MAX_REPEL))
    {
        PlaySE(SE_REPEL);
        gTasks[taskId].func = Task_UseRepel;
    }
    else
        // An earlier repel is still in effect
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_RepelEffectsLingered, Task_ReturnToBagFromContextMenu);
}

void FieldUseFunc_RunningScrews(u8 taskId)
{
    PlaySE(SE_FLEE);
    RemoveUsedItem();
    DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_RunningScrews, Task_ReturnToBagFromContextMenu);
}

void FieldUseFunc_Mesprit(u8 taskId)
{
    PlayCry_Normal(SPECIES_MESPRIT, CRY_MODE_DEFAULT);

    RemoveUsedItem();
    DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_MespritRan, Task_ReturnToBagFromContextMenu);
}


void FieldUseFunc_Ligma(u8 taskId)
{
    //PlaySE(SE_FLEE);
    //RemoveUsedItem();
    DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_Ligma, Task_ReturnToBagFromContextMenu);
}

static void ItemUseOnFieldCB_Unlock(u8 taskId)
{
    ClearPlayerHeldMovementAndUnfreezeObjectEvents();
    UnlockPlayerFieldControls();
    DestroyTask(taskId);
}

void Task_ReturnToFieldFromBagMenu(u8 taskId)
{
    gFieldCallback = FieldCB_FadeInFromBlack;
    sItemUseOnFieldCB = ItemUseOnFieldCB_Unlock;
    ItemMenu_SetExitCallback(CB2_ReturnToField);
    Bag_BeginCloseWin0Animation();
    ItemMenu_StartFadeToExitCallback(taskId);
}

void FieldUseFunc_CopycatTM(u8 taskId)
{
    VarSet(VAR_COPYCAT_USED, 1);
    if(gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_SAFFRON_CITY_COPYCATS_HOUSE_1F) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_SAFFRON_CITY_COPYCATS_HOUSE_1F)) {
        PlaySE(SE_PC_LOGIN);
        RemoveUsedItem();
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_TMContainedCopycat, Task_ReturnToFieldFromBagMenu);
    } else {
        PlaySE(SE_PC_LOGIN);
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_TMContainedCopycat, Task_ReturnToBagFromContextMenu);
    }
}
void FieldUseFunc_CeliaMessage(u8 taskId)
{
    
    RemoveUsedItem();
    DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_CeliaMessage, Task_ReturnToFieldFromBagMenu);
}

void FieldUseFunc_Ruby(u8 taskId)
{
    if(VarGet(VAR_READY_FOR_TORNADO) == 1) {
        VarSet(VAR_READY_FOR_TORNADO, 2);
        RemoveUsedItem();
        DisplayItemMessageInCurrentContext(taskId, gTasks[taskId].data[3], FONT_MALE, gText_HeldRuby);
    } else {
        DisplayItemMessageInCurrentContext(taskId, gTasks[taskId].data[3], FONT_MALE, gText_HeldRuby);
    }
}

void FieldUseFunc_Cigarette(u8 taskId)
{

        PlaySE(SE_M_EMBER);
        RemoveUsedItem();
        if(gSpecialVar_ItemId == ITEM_PREMIERCIGAR) {
            DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_PlayerPremierCancer, Task_ReturnToBagFromContextMenu);

        } else {
            DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_PlayerCancer, Task_ReturnToBagFromContextMenu);
        }
        
    
}

static void Task_UseRepel(u8 taskId)
{
    if (!IsSEPlaying())
    {
        ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
        VarSet(VAR_REPEL_STEP_COUNT, ItemId_GetHoldEffectParam(gSpecialVar_ItemId));
        VarSet(VAR_REPEL_LAST_USED, gSpecialVar_ItemId);
        RemoveUsedItem();
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gStringVar4, Task_ReturnToBagFromContextMenu);
    }
}

static void Task_UseMaxRepel(u8 taskId) {
    if (!IsSEPlaying())
    {
        ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_MaxRepelWorks, Task_ReturnToBagFromContextMenu);
    }
}

static void RemoveUsedItem(void)
{
    RemoveBagItem(gSpecialVar_ItemId, 1);
    Pocket_CalculateNItemsAndMaxShowed(ItemId_GetPocket(gSpecialVar_ItemId));
    PocketCalculateInitialCursorPosAndItemsAbove(ItemId_GetPocket(gSpecialVar_ItemId));
    CopyItemName(gSpecialVar_ItemId, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gText_PlayerUsedVar2);
}

void FieldUseFunc_BlackWhiteFlute(u8 taskId)
{
    ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gSpecialVar_ItemId == ITEM_WHITE_FLUTE)
    {
        FlagSet(FLAG_SYS_WHITE_FLUTE_ACTIVE);
        FlagClear(FLAG_SYS_BLACK_FLUTE_ACTIVE);
        CopyItemName(gSpecialVar_ItemId, gStringVar2);
        StringExpandPlaceholders(gStringVar4, gText_UsedVar2WildLured);
        gTasks[taskId].func = Task_UsedBlackWhiteFlute;
        gTasks[taskId].data[8] = 0;
    }
    else if (gSpecialVar_ItemId == ITEM_BLACK_FLUTE)
    {
        FlagSet(FLAG_SYS_BLACK_FLUTE_ACTIVE);
        FlagClear(FLAG_SYS_WHITE_FLUTE_ACTIVE);
        CopyItemName(gSpecialVar_ItemId, gStringVar2);
        StringExpandPlaceholders(gStringVar4, gText_UsedVar2WildRepelled);
        gTasks[taskId].func = Task_UsedBlackWhiteFlute;
        gTasks[taskId].data[8] = 0;
    }
}

static void Task_UsedBlackWhiteFlute(u8 taskId)
{
    if (++gTasks[taskId].data[8] > 7)
    {
        PlaySE(SE_GLASS_FLUTE);
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gStringVar4, Task_ReturnToBagFromContextMenu);
    }
}

bool8 CanUseEscapeRopeOnCurrMap(void)
{
    if(gSpecialVar_ItemId == ITEM_STAIR_ORB) {
        if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_SILPH_CO_2F) &&
            (gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_SILPH_CO_2F))) {
                SetEscapeWarp(MAP_GROUP(MAP_SILPH_UNFINISHED_FLOOR), MAP_NUM(MAP_SILPH_UNFINISHED_FLOOR), 0, 4, 5);
                return TRUE;

        }
        if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_SKY_TOWER_3F) &&
            (gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_SKY_TOWER_3F))) {
                SetEscapeWarp(MAP_GROUP(MAP_SKY_TOWER_3F), MAP_NUM(MAP_SKY_TOWER_3F), 3, 50, 37);
                return TRUE;

        }
        if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_SKY_TOWER_2F) &&
            (gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_SKY_TOWER_2F))) {
                SetEscapeWarp(MAP_GROUP(MAP_SKY_TOWER_2F), MAP_NUM(MAP_SKY_TOWER_2F), 2, 22, 27);
                return TRUE;

        } else
            return FALSE;

    }
    else if (gMapHeader.allowEscaping)
        return TRUE;
    else
        return FALSE;
}

void ItemUseOutOfBattle_EscapeRope(u8 taskId)
{
    if (CanUseEscapeRopeOnCurrMap() == TRUE)
    {
        ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, gMapHeader.regionMapSectionId);
        sItemUseOnFieldCB = ItemUseOnFieldCB_EscapeRope;
        SetUpItemUseOnFieldCallback(taskId);
    }
    else
        PrintNotTheTimeToUseThat(taskId, gTasks[taskId].data[3]);
}

static void ItemUseOnFieldCB_EscapeRope(u8 taskId)
{
    Overworld_ResetStateAfterDigEscRope();
    RemoveUsedItem();
    gTasks[taskId].data[0] = 0;
    DisplayItemMessageOnField(taskId, FONT_NORMAL, gStringVar4, Task_UseDigEscapeRopeOnField);
}

void Task_UseDigEscapeRopeOnField(u8 taskId)
{
    ResetInitialPlayerAvatarState();
    StartEscapeRopeFieldEffect();
    DestroyTask(taskId);
}

void FieldUseFunc_TownMap(u8 taskId)
{
    if (gTasks[taskId].data[3] == 0)
    {
        ItemMenu_SetExitCallback(UseTownMapFromBag);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        StopPokemonLeagueLightingEffectTask();
        FadeScreen(FADE_TO_BLACK, 0);
        gTasks[taskId].func = Task_UseTownMapFromField;
    }
}

static void UseTownMapFromBag(void)
{
    InitRegionMapWithExitCB(REGIONMAP_TYPE_NORMAL, CB2_BagMenuFromStartMenu);
}

static void Task_UseTownMapFromField(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        SetFieldCallback2ForItemUse();
        InitRegionMapWithExitCB(REGIONMAP_TYPE_NORMAL, CB2_ReturnToField);
        DestroyTask(taskId);
    }
}

void FieldUseFunc_FameChecker(u8 taskId)
{
    ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].data[3] == 0)
    {
        ItemMenu_SetExitCallback(UseFameCheckerFromBag);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        StopPokemonLeagueLightingEffectTask();
        FadeScreen(FADE_TO_BLACK, 0);
        gTasks[taskId].func = Task_UseFameCheckerFromField;
    }
}

static void UseFameCheckerFromBag(void)
{
    UseFameChecker(CB2_BagMenuFromStartMenu);
}

static void Task_UseFameCheckerFromField(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        SetFieldCallback2ForItemUse();
        UseFameChecker(CB2_ReturnToField);
        DestroyTask(taskId);
    }
}

void BattleUseFunc_PokeBallEtc(u8 taskId)
{
    if (!IsPlayerPartyAndPokemonStorageFull())
    {
        if(gSpecialVar_ItemId == ITEM_SEAL_CASE && gBattleMons[gBattlerTarget].species == SPECIES_SEEL) {
            
        }
        RemoveBagItem(gSpecialVar_ItemId, 1);
        Bag_BeginCloseWin0Animation();
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_BoxFull, Task_ReturnToBagFromContextMenu);
}

void BattleUseFunc_PokeFlute(u8 taskId)
{
    Bag_BeginCloseWin0Animation();
    ItemMenu_StartFadeToExitCallback(taskId);
}

void BattleUseFunc_StatBooster(u8 taskId)
{
    if (ExecuteTableBasedItemEffect(&gPlayerParty[gBattlerPartyIndexes[gBattlerInMenuId]], gSpecialVar_ItemId, gBattlerPartyIndexes[gBattlerInMenuId], 0))
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_WontHaveEffect, Task_ReturnToBagFromContextMenu);
    else
    {
        gTasks[taskId].data[8] = 0;
        gTasks[taskId].func = Task_BattleUse_StatBooster_DelayAndPrint;
    }
}

static void Task_BattleUse_StatBooster_DelayAndPrint(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (++data[8] > 7)
    {
        u16 itemId = gSpecialVar_ItemId;
        PlaySE(SE_USE_ITEM);
        RemoveBagItem(itemId, 1);
        DisplayItemMessageInBag(taskId, FONT_NORMAL, Battle_PrintStatBoosterEffectMessage(itemId), Task_BattleUse_StatBooster_WaitButton_ReturnToBattle);
    }
}

static void Task_BattleUse_StatBooster_WaitButton_ReturnToBattle(u8 taskId)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        Bag_BeginCloseWin0Animation();
        ItemMenu_StartFadeToExitCallback(taskId);
    }
}

static void ItemUse_SwitchToPartyMenuInBattle(u8 taskId)
{
    if (GetPocketByItemId(gSpecialVar_ItemId) == POCKET_BERRY_POUCH)
    {
        BerryPouch_SetExitCallback(EnterPartyFromItemMenuInBattle);
        BerryPouch_StartFadeToExitCallback(taskId);
    }
    else
    {
        ItemMenu_SetExitCallback(EnterPartyFromItemMenuInBattle);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
}

void BattleUseFunc_Medicine(u8 taskId)
{
    gItemUseCB = ItemUseCB_MedicineStep;
    ItemUse_SwitchToPartyMenuInBattle(taskId);
}

// Unused. Sacred Ash cannot be used in battle
static void BattleUseFunc_SacredAsh(u8 taskId)
{
    gItemUseCB = ItemUseCB_SacredAsh;
    ItemUse_SwitchToPartyMenuInBattle(taskId);
}

void BattleUseFunc_Ether(u8 taskId)
{
    gItemUseCB = ItemUseCB_TryRestorePP;
    ItemUse_SwitchToPartyMenuInBattle(taskId);
}

void BattleUseFunc_PokeDoll(u8 taskId)
{
    if (!(gBattleTypeFlags & BATTLE_TYPE_TRAINER))
    {
        RemoveUsedItem();
        ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, 0, gSpecialVar_ItemId, 0xFFFF);
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gStringVar4, ItemMenu_StartFadeToExitCallback);
    }
    else
        PrintNotTheTimeToUseThat(taskId, 0);
}

void BattleUseFunc_CreateKoraidon(u8 taskId)
{
    struct Pokemon *mon;
    u16 species = SPECIES_KORAIDON;
    u16 item = ITEM_LIECHI_BERRY;
    u8 i;

    FlagClear(FLAG_ROTOM_BATTLE_UI);
    gBattleSwitchFromPSS = FALSE;

    // send all mons to the PC
    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES, NULL) == SPECIES_NONE)
            break;
        else
        {
            if (SendMonToPC(&gPlayerParty[i]))
            {
                ZeroMonData(&gPlayerParty[i]);
            }
        }
    }
    // create Koraidon in the first party slot
    mon = &gPlayerParty[gBattlerPartyIndexes[0]];
    gBattleMons[0].species = species;
    if (gSpecialVar_ItemId == ITEM_SHINY_BIKE)
        FlagSet(FLAG_SHINY_CREATION);
    CreateMonWithGenderNatureLetter(mon, species, 50, USE_RANDOM_IVS, MON_GENDERLESS, GetNature(mon));
    SetMonData(mon, MON_DATA_HELD_ITEM, &item);
    CopyPlayerPartyMonToBattleData(0, 0);

    gPlayerPartyCount = 1;

    // make initial Koraidon sprite invisible
    gBattleSpritesDataPtr->battlerData[gBattlerInMenuId].invisible = TRUE;
    gBattleStruct->switchInAfterItemUse = TRUE;
    //reset for battle string
    gTemporaryBattlePlayerText = FALSE;

    Bag_BeginCloseWin0Animation();
    ItemMenu_StartFadeToExitCallback(taskId);
}

void ItemUseOutOfBattle_EnigmaBerry(u8 taskId)
{
    switch (GetItemEffectType(gSpecialVar_ItemId))
    {
    case ITEM_EFFECT_HEAL_HP:
    case ITEM_EFFECT_CURE_POISON:
    case ITEM_EFFECT_CURE_SLEEP:
    case ITEM_EFFECT_CURE_BURN:
    case ITEM_EFFECT_CURE_FREEZE:
    case ITEM_EFFECT_CURE_PARALYSIS:
    case ITEM_EFFECT_CURE_ALL_STATUS:
    case ITEM_EFFECT_ATK_EV:
    case ITEM_EFFECT_HP_EV:
    case ITEM_EFFECT_SPATK_EV:
    case ITEM_EFFECT_SPDEF_EV:
    case ITEM_EFFECT_SPEED_EV:
    case ITEM_EFFECT_DEF_EV:
        gTasks[taskId].data[4] = 1;
        FieldUseFunc_Medicine(taskId);
        break;
    case ITEM_EFFECT_SACRED_ASH:
        gTasks[taskId].data[4] = 1;
        FieldUseFunc_SacredAsh(taskId);
        break;
    case ITEM_EFFECT_RAISE_LEVEL:
        gTasks[taskId].data[4] = 1;
        FieldUseFunc_RareCandy(taskId);
        break;
    case ITEM_EFFECT_PP_UP:
    case ITEM_EFFECT_PP_MAX:
        gTasks[taskId].data[4] = 1;
        FieldUseFunc_PpUp(taskId);
        break;
    case ITEM_EFFECT_HEAL_PP:
        gTasks[taskId].data[4] = 1;
        FieldUseFunc_Ether(taskId);
        break;
    default:
        gTasks[taskId].data[4] = 4;
        FieldUseFunc_OakStopsYou(taskId);
    }
}

void ItemUseInBattle_EnigmaBerry(u8 taskId)
{
    switch (GetItemEffectType(gSpecialVar_ItemId))
    {
    case ITEM_EFFECT_X_ITEM:
        BattleUseFunc_StatBooster(taskId);
        break;
    case ITEM_EFFECT_HEAL_HP:
    case ITEM_EFFECT_CURE_POISON:
    case ITEM_EFFECT_CURE_SLEEP:
    case ITEM_EFFECT_CURE_BURN:
    case ITEM_EFFECT_CURE_FREEZE:
    case ITEM_EFFECT_CURE_PARALYSIS:
    case ITEM_EFFECT_CURE_CONFUSION:
    case ITEM_EFFECT_CURE_INFATUATION:
    case ITEM_EFFECT_CURE_ALL_STATUS:
        BattleUseFunc_Medicine(taskId);
        break;
    case ITEM_EFFECT_HEAL_PP:
        BattleUseFunc_Ether(taskId);
        break;
    default:
        FieldUseFunc_OakStopsYou(taskId);
    }
}

void FieldUseFunc_OakStopsYou(u8 taskId)
{
    if (GetPocketByItemId(gSpecialVar_ItemId) == POCKET_BERRY_POUCH)
    {
        StringExpandPlaceholders(gStringVar4, gText_OakForbidsUseOfItemHere);
        DisplayItemMessageInBerryPouch(taskId, FONT_MALE, gStringVar4, Task_BerryPouch_DestroyDialogueWindowAndRefreshListMenu);
    }
    else
        PrintNotTheTimeToUseThat(taskId, gTasks[taskId].data[3]);
}


void FieldUseFunc_Nothing(u8 taskId)
{
    DisplayItemMessageInCurrentContext(taskId, gTasks[taskId].data[3], FONT_MALE, gText_NothingHappened);
}


#define STATE_PAYDAY_SENTTOPC 4

static void Task_PayDayTM_WaitCry(u8 taskId)
{
    if (IsCryFinished())
        SetUpItemUseOnFieldCallback(taskId);
}

static void Task_PayDayTM_PlayCry(u8 taskId)
{
    PlayCry_Normal(SPECIES_GIMMIGHOUL, CRY_MODE_DEFAULT);
    gTasks[taskId].func = Task_PayDayTM_WaitCry;
}

static void ItemUseOnFieldCB_GiveMon(u8 taskId)
{
    RemoveUsedItem();
    if (gSpecialVar_Result != STATE_PAYDAY_SENTTOPC)
        PlayFanfare(MUS_LEVEL_UP);

    if (gSpecialVar_Result == STATE_PAYDAY_SENTTOPC) //special state to handle PC message
        DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_SentToPC, Task_ItemUse_CloseMessageBoxAndReturnToField);
    else if (gSpecialVar_Result == MON_GIVEN_TO_PC)
    {
        DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_ReceivedPokemon, ItemUseOnFieldCB_GiveMon);
        gSpecialVar_Result = STATE_PAYDAY_SENTTOPC;
    }
    else
        DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_ReceivedPokemon, Task_ItemUse_CloseMessageBoxAndReturnToField);
}

void FieldUseFunc_PayDayTM(u8 taskId)
{
    u16 species;

    species = SPECIES_GIMMIGHOUL;
    FlagClear(FLAG_SHINY_CREATION);
    if(gSpecialVar_ItemId == ITEM_RAW_NUGGET) {
        FlagSet(FLAG_SHINY_CREATION);
    }
    if (!FlagGet(FLAG_IN_FUSHCIA_GYM))
    {
        gSpecialVar_Result = ScriptGiveMon(species, 19, ITEM_NONE, 0, 0, 0);
    }
    else
    {
        PrintNotTheTimeToUseThat(taskId, FALSE);
        return;
    }

    switch (gSpecialVar_Result)
    {
    case MON_CANT_GIVE: // no space in PC
        DisplayItemMessageInCurrentContext(taskId, FALSE, FONT_NORMAL, gText_AllBoxesFull);
        break;
    case MON_GIVEN_TO_PARTY:
    case MON_GIVEN_TO_PC:
        GetSpeciesName(gStringVar1, species);
        sItemUseOnFieldCB = ItemUseOnFieldCB_GiveMon;
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_PayDayTM, Task_PayDayTM_PlayCry);
        break;
    }
}

void FieldUseFunc_BalmMushroom(u8 taskId)
{
    u16 species;

    species = SPECIES_AMOONGUSS;
    FlagSet(FLAG_SHINY_CREATION);

    gSpecialVar_Result = ScriptGiveMon(species, 19, ITEM_NONE, 0, 0, 0);

    switch (gSpecialVar_Result)
    {
    case MON_CANT_GIVE: // no space in PC
        DisplayItemMessageInCurrentContext(taskId, FALSE, FONT_NORMAL, gText_AllBoxesFull);
        break;
    case MON_GIVEN_TO_PARTY:
    case MON_GIVEN_TO_PC:
        PlayCry_Normal(species, CRY_MODE_DEFAULT);
        GetSpeciesName(gStringVar1, species);
        sItemUseOnFieldCB = ItemUseOnFieldCB_GiveMon;
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_GimmieghoulTMUsed, SetUpItemUseOnFieldCallback);
        break;
    }
}

void FieldUseFunc_DragoniteBag(u8 taskId)
{
    u16 species;

    species = SPECIES_DRAGONITE;

    gSpecialVar_Result = ScriptGiveMon(species, 19, ITEM_NONE, 0, 0, 0);
    FlagClear(FLAG_SHINY_CREATION);

    switch (gSpecialVar_Result)
    {
    case MON_CANT_GIVE: // no space in PC
        DisplayItemMessageInCurrentContext(taskId, FALSE, FONT_NORMAL, gText_AllBoxesFull);
        break;
    case MON_GIVEN_TO_PARTY:
    case MON_GIVEN_TO_PC:
        PlayCry_Normal(species, CRY_MODE_DEFAULT);
        GetSpeciesName(gStringVar1, species);
        sItemUseOnFieldCB = ItemUseOnFieldCB_GiveMon;
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_GimmieghoulTMUsed, SetUpItemUseOnFieldCallback);
        break;
    }
}


void FieldUseFunc_BigNugget(u8 taskId)
{
    u16 species;

    species = SPECIES_GEODUDE;
    FlagSet(FLAG_SHINY_CREATION);

    gSpecialVar_Result = ScriptGiveMon(species, 19, ITEM_NONE, 0, 0, 0);

    switch (gSpecialVar_Result)
    {
    case MON_CANT_GIVE: // no space in PC
        DisplayItemMessageInCurrentContext(taskId, FALSE, FONT_NORMAL, gText_AllBoxesFull);
        break;
    case MON_GIVEN_TO_PARTY:
    case MON_GIVEN_TO_PC:
        RemoveUsedItem();
        PlayCry_Normal(species, CRY_MODE_DEFAULT);
        GetSpeciesName(gStringVar1, species);
        sItemUseOnFieldCB = ItemUseOnFieldCB_GiveMon;
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_GimmieghoulTMUsed, SetUpItemUseOnFieldCallback);
        break;
    }
}



static void OpenHelpSystemFromBag(void)
{
    SetMainCallback2(gBagMenuState.bagCallback);
    OpenHelpSystem();
}

void FieldUseFunc_HelixFossil(u8 taskId)
{
    ItemMenu_SetExitCallback(OpenHelpSystemFromBag);
    ItemMenu_StartFadeToExitCallback(taskId);
}

static void LWPEmblem_EquipOutfit(void)
{
    u8 outfit = OUTFIT_NONE;
    switch(gSpecialVar_ItemId)
    {
    case ITEM_L_EMBLEM:
        outfit = OUTFIT_L;
        break;
    case ITEM_W_EMBLEM:
        outfit = OUTFIT_W;
        break;
    case ITEM_P_EMBLEM:
        outfit = OUTFIT_P;
        break;
    }

    TogglePlayerOutfit(outfit);
}

void FieldUseFunc_LWPEmblem(u8 taskId)
{
    u32 zubatIndex;
    zubatIndex = PartyHasMon(SPECIES_ZUBAT);
    if (gSpecialVar_ItemId == ITEM_W_EMBLEM && zubatIndex != PARTY_SIZE)
    {
        gPartyMenu.slotId = zubatIndex;
        sTriggerZubatEvo = TRUE;
    }    
    
    LockPlayerFieldControls();
    PlaySE(SE_SELECT);
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    StringExpandPlaceholders(gStringVar4, gText_UsedTheItem);

    sItemUseOnFieldCB = ItemUseOnFieldCB_LWPEmblem;
    SetUpItemUseOnFieldCallback(taskId);
}

static void ItemUseOnFieldCB_LWPEmblem(u8 taskId)
{
    LWPEmblem_EquipOutfit();
    DisplayItemMessageOnField(taskId, FONT_NORMAL, gStringVar4, Task_UseLWPEmblemOnField);
}

static void Task_UseWEmblemEvolveOnField(u8 taskId)
{
    SetMainCallback2(CB2_UseEvolutionStone);
    DestroyTask(taskId);
}

static void Task_UseLWPEmblemOnField(u8 taskId)
{
    ResetInitialPlayerAvatarState();
    StartLWPEmblemFieldEffect();
    DestroyTask(taskId);
}

static void StartLWPEmblemFieldEffect(void)
{
    FreezeObjectEvents();
    CreateTask(Task_LWPEmblemWarpOut, 80);
}

static void (*const sLWPEmblemWarpOutEffectFuncs[])(struct Task *task) =
{
    LWPEmblemWarpOutEffect_Init,
    LWPEmblemWarpOutEffect_Spin
};

// the first 6 task data slots are used for storing party species that are nidotran family
// for the genderfluid item
#define tState       data[6]
#define tSpinDelay   data[7]
#define tNumTurns    data[8]
#define tTimer       data[9]
#define tSpinEnded   data[10]
#define tCurrentDir  data[11]
#define tStandalone  data[12] // indicates the effect is occurring without the item being used
#define tDirection   data[15]

static void Task_LWPEmblemWarpOut(u8 taskId)
{
    sLWPEmblemWarpOutEffectFuncs[gTasks[taskId].tState](&gTasks[taskId]);
}

static void LWPEmblemWarpOutEffect_Init(struct Task *task)
{
    task->tState++;
    task->tDirection = DIR_NONE;
}

#define OBJ_EVENT_PAL_TAG_PLAYER_RED   0x1100
#define OBJ_EVENT_PAL_TAG_PLAYER_GREEN 0x1110
#define LWP_PLAY_SE                    5 
#define LWP_SPIN_END                   60 
#define LWP_SHOW_MESSAGE               100 

static void LWPEmblemWarpOutEffect_Spin(struct Task *task)
{
    struct ObjectEvent *playerObj = &gObjectEvents[gPlayerAvatar.objectEventId];
    s16 *data = task->data;
    
    if (tTimer == LWP_PLAY_SE)
    {
        PlaySE(SE_M_REVERSAL);
    }
    else if (tTimer >= LWP_SPIN_END && tCurrentDir == DIR_SOUTH && !tSpinEnded)
    {
        tSpinEnded = TRUE;
        PlaySE(SE_EXP_MAX);
        LoadObjectEventPalette(gSaveBlock2Ptr->playerGender == MALE ? OBJ_EVENT_PAL_TAG_PLAYER_RED : OBJ_EVENT_PAL_TAG_PLAYER_GREEN);
    }
    else if (tSpinEnded && tTimer >= LWP_SHOW_MESSAGE)
    {
        if (sTriggerZubatEvo)
        {
            sTriggerZubatEvo = FALSE;
            StringExpandPlaceholders(gStringVar4, gText_WEmblemEvolve);
            DisplayItemMessageOnField(FindTaskIdByFunc(Task_LWPEmblemWarpOut), FONT_NORMAL, gStringVar4, Task_UseWEmblemEvolveOnField);
        }
        else
        {
            StringExpandPlaceholders(gStringVar4, gText_LWPEmblemEnd);
            DisplayItemMessageOnField(FindTaskIdByFunc(Task_LWPEmblemWarpOut), FONT_NORMAL, gStringVar4, Task_ItemUse_CloseMessageBoxAndReturnToField);
        }
    }

    if (!tSpinEnded)
        tCurrentDir = SpinObjectEvent(playerObj, &task->tSpinDelay, &task->tNumTurns);
    
    tTimer++;
}

void StandaloneGenderFluidEffect(void)
{
    u32 taskId;
    struct ObjectEvent *playerObj = &gObjectEvents[gPlayerAvatar.objectEventId];
    LockPlayerFieldControls();

    if (gSaveBlock2Ptr->playerGender == MALE)
    {
        gSaveBlock2Ptr->playerGender = FEMALE;
        gPlayerAvatar.gender = FEMALE;
    }
    else
    {
        gSaveBlock2Ptr->playerGender = MALE;
        gPlayerAvatar.gender = MALE;
    }
    
    ResetInitialPlayerAvatarState();
    ObjectEventSetGraphicsId(playerObj, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_NORMAL));
    //taskId = CreateTask(Task_GenderFluidWarpOut, 80);
    gTasks[taskId].tStandalone = TRUE;
}

void FieldUseFunc_GenderFluid(u8 taskId)
{
    PlaySE(SE_SELECT);
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    
    if (!TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE | PLAYER_AVATAR_FLAG_SURFING | PLAYER_AVATAR_FLAG_UNDERWATER))
    {
        LockPlayerFieldControls();
        StringExpandPlaceholders(gStringVar4, gText_UsedTheItem);
        sItemUseOnFieldCB = ItemUseOnFieldCB_GenderFluid;
        SetUpItemUseOnFieldCallback(taskId);
    }
    else
    {
        StringExpandPlaceholders(gStringVar4, gText_DontDrinkAndDrive);
        DisplayItemMessageInCurrentContext(taskId, gTasks[taskId].data[3], FONT_NORMAL, gStringVar4); // data[3] == inField
    }
}

static void ItemUseOnFieldCB_GenderFluid(u8 taskId)
{
    if (gSaveBlock2Ptr->playerGender == MALE)
    {
        gSaveBlock2Ptr->playerGender = FEMALE;
        gPlayerAvatar.gender = FEMALE;
    }
    else
    {
        gSaveBlock2Ptr->playerGender = MALE;
        gPlayerAvatar.gender = MALE;
    }
    FlagSet(FLAG_USED_GENDER_FLUID);
    if(!FlagGet(FLAG_SYS_HAS_SWITCHED_GENDERS)) {
        FlagSet(FLAG_SYS_HAS_SWITCHED_GENDERS);
    } else {
        FlagClear(FLAG_SYS_HAS_SWITCHED_GENDERS);
    }

    TryToTransTheNidotrans(taskId);
    
    DisplayItemMessageOnField(taskId, FONT_NORMAL, gStringVar4, Task_UseGenderFluidOnField);
}

static inline bool32 IsMonInNidotranFamily(u16 species)
{
    return species == SPECIES_NIDORAN_M
            || species == SPECIES_NIDORINO  
            || species == SPECIES_NIDOKING  
            || species == SPECIES_NIDORAN_F  
            || species == SPECIES_NIDORINA  
            || species == SPECIES_NIDOQUEEN;  
}

static void TryToTransTheNidotrans(u8 taskId)
{
    u32 i;
    u16 species;
    bool32 atLeastOne = FALSE;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES);
        if (IsMonInNidotranFamily(species))
        {
            gTasks[taskId].data[i] = species;
            atLeastOne = TRUE;
        }
        else
        {
            gTasks[taskId].data[i] = SPECIES_NONE;
        }
    }

    if (atLeastOne) TransTheNidotrans(taskId);
}


void CurePorygonVirus()
{
    u32 i, j;
    u32 newPersonality, otID;
    u16 newSpecies, oldSpecies;
    u8 nickname[POKEMON_NAME_LENGTH + 1];
    struct Pokemon *mon;
    s16 slot = gSpecialVar_Result;
    bool32 thisIsTrue = TRUE;
    bool8 shinyness;

    newSpecies = SPECIES_PORYGON;
    mon = &gPlayerParty[slot];

    otID = GetMonData(mon, MON_DATA_OT_ID, NULL);
    GetMonNickname(mon, nickname);
    newPersonality = Random32();
    shinyness = GetMonData(mon, MON_DATA_CSR_SHINY);
    oldSpecies = GetMonData(mon, MON_DATA_SPECIES, NULL);

    // force the mon to be shiny
    if(shinyness)
    {
        newPersonality = ((((Random() % SHINY_ODDS) ^ (HIHALF(otID) ^ LOHALF(otID))) ^ LOHALF(newPersonality)) << 16) | LOHALF(newPersonality);
    }
    
    // if player has nicknamed their nidotran, don't overwrite it
    if (StringCompare(nickname, gSpeciesNames[oldSpecies]) == 0)
    {
        SetMonData(mon, MON_DATA_NICKNAME, &gSpeciesNames[newSpecies]);
    }
    SetMonData(mon, MON_DATA_SPECIES, &newSpecies);
    GetSetPokedexFlag(SpeciesToNationalPokedexNum(newSpecies), FLAG_SET_SEEN);
    GetSetPokedexFlag(SpeciesToNationalPokedexNum(newSpecies), FLAG_SET_CAUGHT);
    if(shinyness) {
        SetMonData(mon, MON_DATA_CSR_SHINY, &thisIsTrue); 
        GetSetPokedexFlag(SpeciesToNationalPokedexNum(newSpecies), FLAG_SET_SHINY_FOUND);

    }
    
    UpdateMonPersonality(&mon->box, newPersonality);
    CalculateMonStats(mon);
    
}



void RemoveShoesFromToedy()
{
    u32 i, j;
    u32 newPersonality, otID;
    u16 newSpecies, oldSpecies;
    u8 nickname[POKEMON_NAME_LENGTH + 1];
    struct Pokemon *mon;
    s16 slot = gSpecialVar_Result;
    bool32 thisIsTrue = TRUE;

    newSpecies = SPECIES_TENTACOOL;
    mon = &gPlayerParty[slot];

    otID = GetMonData(mon, MON_DATA_OT_ID, NULL);
    oldSpecies = GetMonData(mon, MON_DATA_SPECIES, NULL);
    GetMonNickname(mon, nickname);
    newPersonality = Random32();

    // force the mon to be shiny
    newPersonality = ((((Random() % SHINY_ODDS) ^ (HIHALF(otID) ^ LOHALF(otID))) ^ LOHALF(newPersonality)) << 16) | LOHALF(newPersonality);
    
    // if player has nicknamed their nidotran, don't overwrite it
    if (StringCompare(nickname, gSpeciesNames[oldSpecies]) == 0)
    {
        SetMonData(mon, MON_DATA_NICKNAME, &gSpeciesNames[newSpecies]);
    }
    SetMonData(mon, MON_DATA_SPECIES, &newSpecies); 
    SetMonData(mon, MON_DATA_CSR_SHINY, &thisIsTrue); 
    GetSetPokedexFlag(SpeciesToNationalPokedexNum(newSpecies), FLAG_SET_SHINY_FOUND);
    UpdateMonPersonality(&mon->box, newPersonality);
    CalculateMonStats(mon);
}

void ZygardeSwitcheroo()
{
    u32 i, j;
    u32 newPersonality, otID;
    u16 newSpecies, oldSpecies;
    u8 nickname[POKEMON_NAME_LENGTH + 1];
    struct Pokemon *mon;
    s16 slot = gSpecialVar_Result;
    bool32 thisIsTrue = TRUE;

    newSpecies = SPECIES_ZYGARDE;
    mon = &gPlayerParty[slot];

    otID = GetMonData(mon, MON_DATA_OT_ID, NULL);
    oldSpecies = GetMonData(mon, MON_DATA_SPECIES, NULL);
    GetMonNickname(mon, nickname);
    newPersonality = Random32();

    // force the mon to be shiny
    newPersonality = ((((Random() % SHINY_ODDS) ^ (HIHALF(otID) ^ LOHALF(otID))) ^ LOHALF(newPersonality)) << 16) | LOHALF(newPersonality);
    
    // if player has nicknamed their nidotran, don't overwrite it
    if (StringCompare(nickname, gSpeciesNames[oldSpecies]) == 0)
    {
        SetMonData(mon, MON_DATA_NICKNAME, &gSpeciesNames[newSpecies]);
    }
    SetMonData(mon, MON_DATA_SPECIES, &newSpecies); 
    SetMonData(mon, MON_DATA_CSR_SHINY, &thisIsTrue); 
    GetSetPokedexFlag(SpeciesToNationalPokedexNum(newSpecies), FLAG_SET_SHINY_FOUND);
    UpdateMonPersonality(&mon->box, newPersonality);
    CalculateMonStats(mon);
}

static const u16 sNidotranCounterparts[6][2] = {
    {SPECIES_NIDORAN_F, SPECIES_NIDORAN_M},
    {SPECIES_NIDORINA, SPECIES_NIDORINO},
    {SPECIES_NIDOQUEEN, SPECIES_NIDOKING},
    {SPECIES_NIDORAN_M, SPECIES_NIDORAN_F},
    {SPECIES_NIDORINO, SPECIES_NIDORINA},
    {SPECIES_NIDOKING, SPECIES_NIDOQUEEN},
};

static void TransTheNidotrans(u8 taskId)
{
    u32 i, j;
    u16 newSpecies, oldSpecies;
    u8 nickname[POKEMON_NAME_LENGTH + 1];
    struct Pokemon *mon;
    s16 *data = gTasks[taskId].data;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        j = 0;
        if (data[i] == SPECIES_NONE) continue;

        oldSpecies = data[i];
        while (sNidotranCounterparts[j][0] != oldSpecies && j < 6) j++; // the bound here is just a softlock/memory failsafe
        newSpecies = sNidotranCounterparts[j][1];

        mon = &gPlayerParty[i];

        GetMonNickname(mon, nickname);

        // if player has nicknamed their nidotran, don't overwrite it
        if (StringCompare(nickname, gSpeciesNames[oldSpecies]) == 0)
        {
            SetMonData(mon, MON_DATA_NICKNAME, &gSpeciesNames[newSpecies]);
        }

        SetMonData(mon, MON_DATA_SPECIES, &newSpecies); 
        GetSetPokedexFlag(SpeciesToNationalPokedexNum(newSpecies), FLAG_SET_SEEN);
        GetSetPokedexFlag(SpeciesToNationalPokedexNum(newSpecies), FLAG_SET_CAUGHT);

        if (GetMonData(mon, MON_DATA_CSR_SHINY))
        {
            GetSetPokedexFlag(SpeciesToNationalPokedexNum(newSpecies), FLAG_SET_SHINY_FOUND);
        }

        CalculateMonStats(mon);
    } 
}

static u16 FindSpeciesInParty(u16 species)
{
    u32 i;
    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SANITY_HAS_SPECIES)
            && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG) == species)
        {
            return i;
        }
    }

    return SPECIES_NONE;
}

static void Task_UseGenderFluidOnField(u8 taskId)
{
    ResetInitialPlayerAvatarState();
    StartGenderFluidFieldEffect();
    DestroyTask(taskId);
}

static void StartGenderFluidFieldEffect(void)
{
    FreezeObjectEvents();
    CreateTask(Task_GenderFluidWarpOut, 80);
}

static void (*const sGenderFluidWarpOutEffectFuncs[])(struct Task *task) =
{
    GenderFluidWarpOutEffect_Init,
    GenderFluidWarpOutEffect_Spin
};

static void Task_GenderFluidWarpOut(u8 taskId)
{
    sGenderFluidWarpOutEffectFuncs[gTasks[taskId].tState](&gTasks[taskId]);
}

static void GenderFluidWarpOutEffect_Init(struct Task *task)
{
    task->tState++;
    task->tDirection = DIR_NONE;
}

#define GF_PLAY_SE      5 
#define GF_SPIN_END     60 
#define GF_SHOW_MESSAGE 100 

static void GenderFluidWarpOutEffect_Spin(struct Task *task)
{
    struct ObjectEvent *playerObj = &gObjectEvents[gPlayerAvatar.objectEventId];
    s16 *data = task->data;
    
    if (tTimer == GF_PLAY_SE)
    {
        PlaySE(SE_M_REVERSAL);
    }
    else if (tTimer >= GF_SPIN_END && tCurrentDir == DIR_SOUTH && !tSpinEnded)
    {
        tSpinEnded = TRUE;
        PlaySE(SE_EXP_MAX);
        ObjectEventSetGraphicsId(playerObj, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_GFX_NORMAL));
        ObjectEventClearHeldMovement(playerObj);
        PlayerFaceDirection(GetPlayerFacingDirection());
    }
    else if (tSpinEnded && tTimer >= GF_SHOW_MESSAGE)
    {
        if (tStandalone)
        {
            DestroyTask(FindTaskIdByFunc(Task_GenderFluidWarpOut));
            ScriptContext_Enable();
        }                
        else
        {
            StringExpandPlaceholders(gStringVar4, gText_GenderFluidEnd);
            DisplayItemMessageOnField(FindTaskIdByFunc(Task_GenderFluidWarpOut), FONT_NORMAL, gStringVar4, Task_ItemUse_CloseMessageBoxAndReturnToField);
        }
    }

    if (!tSpinEnded)
        tCurrentDir = SpinObjectEvent(playerObj, &task->tSpinDelay, &task->tNumTurns);
    
    tTimer++;
}

#undef tState       
#undef tSpinDelay   
#undef tNumTurns    
#undef tTimer       
#undef tSpinEnded   
#undef tCurrentDir 
#undef tDirection   

void ItemUse_SetQuestLogEvent(u8 eventId, struct Pokemon *pokemon, u16 itemId, u16 param)
{
    struct QuestLogEvent_Item *data = Alloc(sizeof(*data));

    data->itemId = itemId;
    data->itemParam = param;
    if (pokemon != NULL)
        data->species = GetMonData(pokemon, MON_DATA_SPECIES_OR_EGG);
    else
        data->species = 0xFFFF;
    SetQuestLogEvent(eventId, (void *)data);
    Free(data);
}

void FieldUseFunc_MoveRelearner(u8 taskId)
{
    LockPlayerFieldControls();
    CopyItemName(gSpecialVar_ItemId, gStringVar1);
    StringExpandPlaceholders(gStringVar4, gText_UnzippedTheItem);
    sItemUseOnFieldCB = ItemUseOnFieldCB_MoveRelearner;
    SetUpItemUseOnFieldCallback(taskId);
}

static void ItemUseOnFieldCB_MoveRelearner(u8 taskId)
{
    DisplayItemMessageOnField(taskId, FONT_NORMAL, gStringVar4, Task_UseMoveRelearnerOnField);
}

static void Task_UseMoveRelearnerOnField(u8 taskId)
{
    ChooseMonForMoveRelearnerItem();
    DestroyTask(taskId);
}


void PrintKorokDebug(void) {
    DebugPrintf("Current value: %d", VarGet(VAR_ITEM_ID));
}

bool8  CanUseStairOrbOnCurrMap(void)
{
    if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_SILPH_CO_2F) &&
        (gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_SILPH_CO_2F))) {
            SetEscapeWarp(MAP_GROUP(MAP_SILPH_UNFINISHED_FLOOR), MAP_NUM(MAP_SILPH_UNFINISHED_FLOOR), 0, 4, 5);
            return TRUE;

    }
    if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_SKY_TOWER_2F) &&
        (gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_SKY_TOWER_2F))) {
            SetEscapeWarp(MAP_GROUP(MAP_SKY_TOWER_2F), MAP_NUM(MAP_SKY_TOWER_2F), 2, 22, 27);
            return TRUE;

    }
    else
        return FALSE;
}

void ItemUseOutOfBattle_StairOrb(u8 taskId)
{
    if (CanUseStairOrbOnCurrMap() == TRUE)
    {
        ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, gMapHeader.regionMapSectionId);
        sItemUseOnFieldCB = ItemUseOnFieldCB_StairOrb;
        SetUpItemUseOnFieldCallback(taskId);
    }
    else
        PrintNotTheTimeToUseThat(taskId, gTasks[taskId].data[3]);
}

static void ItemUseOnFieldCB_StairOrb(u8 taskId)
{
    Overworld_ResetStateAfterDigEscRope();
    RemoveUsedItem();
    gTasks[taskId].data[0] = 0;
    DisplayItemMessageOnField(taskId, FONT_NORMAL, gStringVar4, Task_UseStairOrbOnField);
}

void Task_UseStairOrbOnField(u8 taskId)
{
    ResetInitialPlayerAvatarState();
    StartEscapeRopeFieldEffect();
    DestroyTask(taskId);
}
