#include "global.h"
#include "gflib.h"
#include "quest_log.h"
#include "list_menu.h"
#include "diploma.h"
#include "debug.h"
#include "decompress.h"
#include "script.h"
#include "field_player_avatar.h"
#include "overworld.h"
#include "field_message_box.h"
#include "event_data.h"
#include "strings.h"
#include "battle.h"
#include "fieldmap.h"
#include "field_specials.h"
#include "region_map.h"
#include "task.h"
#include "battle_tower.h"
#include "field_camera.h"
#include "field_effect.h"
#include "event_object_movement.h"
#include "menu_indicators.h"
#include "random.h"
#include "mail_data.h"
#include "help_system.h"
#include "pokemon_storage_system.h"
#include "script_menu.h"
#include "data.h"
#include "pokedex.h"
#include "text_window.h"
#include "menu.h"
#include "mystery_gift.h"
#include "item.h"
#include "naming_screen.h"
#include "party_menu.h"
#include "dynamic_placeholder_text_util.h"
#include "new_menu_helpers.h"
#include "config/debug.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/region_map_sections.h"
#include "constants/moves.h"
#include "constants/menu.h"
#include "constants/event_objects.h"
#include "constants/metatile_labels.h"
#include "constants/layouts.h"

static EWRAM_DATA u8 sElevatorCurrentFloorWindowId = 0;
static EWRAM_DATA u16 sElevatorScroll = 0;
static EWRAM_DATA u16 sElevatorCursorPos = 0;
static EWRAM_DATA struct ListMenuItem * sListMenuItems = NULL;
static EWRAM_DATA u8 sPCBoxToSendMon = 0;
static EWRAM_DATA u8 sBrailleTextCursorSpriteID = 0;

COMMON_DATA struct ListMenuTemplate sFieldSpecialsListMenuTemplate = {0};
COMMON_DATA u16 sFieldSpecialsListMenuScrollBuffer = 0;
EWRAM_DATA u16 gScrollableMultichoice_ScrollOffset = 0;
EWRAM_DATA u8 gChapterTitleRunning = 0;

static void Task_AnimatePcTurnOn(u8 taskId);
static void PcTurnOnUpdateMetatileId(bool16 flag);
static void Task_ShakeScreen(u8 taskId);
static void Task_EndScreenShake(u8 taskId);
static u16 SampleResortGorgeousMon(void);
static u16 SampleResortGorgeousReward(void);
static void Task_ElevatorShake(u8 taskId);
static void AnimateElevatorWindowView(u16 nfloors, bool8 direction);
static void Task_AnimateElevatorWindowView(u8 taskId);
static void Task_CreateScriptListMenu(u8 taskId);
static void CreateScriptListMenu(void);
static void ScriptListMenuMoveCursorFunction(s32 nothing, bool8 is, struct ListMenu * used);
static void Task_ListMenuHandleInput(u8 taskId);
static void Task_DestroyListMenu(u8 taskId);
static void Task_SuspendListMenu(u8 taskId);
static void Task_RedrawScrollArrowsAndWaitInput(u8 taskId);
static void Task_CreateMenuRemoveScrollIndicatorArrowPair(u8 taskId);
static void Task_ListMenuRemoveScrollIndicatorArrowPair(u8 taskId);
static u16 GetStarterSpeciesById(u16 starterIdx);
static void ChangeBoxPokemonNickname_CB(void);
static void ChangePokemonNickname_CB(void);
static void SocialSecurity_CB(void);
static void BerryPowderManDeath_CB(void);
static void BerryPowderManAlive_CB(void);
static void SayYes_CB(void);
static void Task_RunPokemonLeagueLightingEffect(u8 taskId);
static void Task_CancelPokemonLeagueLightingEffect(u8 taskId);
static void Task_DoDeoxysTriangleInteraction(u8 taskId);
static void MoveDeoxysObject(u8 num);
static void Task_WaitDeoxysFieldEffect(u8 taskId);
static void Task_WingFlapSound(u8 taskId);
void GetUnownCount(void);
extern const u8 *const gKayleeNameTable[];



static u8 *const sStringVarPtrs[] = {
    gStringVar1,
    gStringVar2,
    gStringVar3
};

void ShowDiploma(void)
{
    QuestLog_CutRecording();
    SetMainCallback2(CB2_ShowDiploma);
    LockPlayerFieldControls();
}

void ForcePlayerOntoBike(void)
{
    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ON_FOOT)
        SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_MACH_BIKE);
    if(CheckBagHasItem(ITEM_SHINY_BIKE, 1)) {
        FlagSet(FLAG_SYS_ON_SHINY_BIKE);
    }
    Overworld_SetSavedMusic(MUS_CYCLING);
    Overworld_ChangeMusicTo(MUS_CYCLING);
}

void ForcePlayerOffBike(void)
{
    if (gPlayerAvatar.flags & (PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE))
        SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);
}

void ResetCyclingRoadChallengeData(void)
{

}

u8 GetPlayerAvatarBike(void)
{
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_ACRO_BIKE))
        return 1;
    else if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE))
        return 2;
    else
        return 0;
}

void ShowFieldMessageStringVar4(void)
{
    ShowFieldMessage(gStringVar4);
}

void GetPlayerXY(void)
{
    gSpecialVar_0x8004 = gSaveBlock1Ptr->pos.x;
    gSpecialVar_0x8005 = gSaveBlock1Ptr->pos.y;
}

u8 GetPlayerTrainerIdOnesDigit(void)
{
    u16 playerId = (gSaveBlock2Ptr->playerTrainerId[1] << 8) | gSaveBlock2Ptr->playerTrainerId[0];
    return playerId % 10;
}

void BufferBigGuyOrBigGirlString(void)
{
    if (gSaveBlock2Ptr->playerGender == MALE)
        StringCopy(gStringVar1, gText_BigGuy);
    else
        StringCopy(gStringVar1, gText_BigGirl);
}

void BufferSonOrDaughterString(void)
{
    if (gSaveBlock2Ptr->playerGender == MALE)
        StringCopy(gStringVar1, gText_Daughter);
    else
        StringCopy(gStringVar1, gText_Son);
}

u8 GetBattleOutcome(void)
{
    return gBattleOutcome;
}

void SetHiddenItemFlag(void)
{
    FlagSet(gSpecialVar_0x8004);
}

u8 GetLeadMonFriendship(void)
{
    struct Pokemon * pokemon = &gPlayerParty[GetLeadMonIndex()];
    if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) == 255)
        return 6;
    else if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) >= 200)
        return 5;
    else if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) >= 150)
        return 4;
    else if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) >= 100)
        return 3;
    else if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) >= 50)
        return 2;
    else if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) > 0)
        return 1;
    else
        return 0;
}

void ShowTownMap(void)
{
    QuestLog_CutRecording();
    InitRegionMapWithExitCB(REGIONMAP_TYPE_WALL, CB2_ReturnToFieldContinueScriptPlayMapMusic);
}

bool8 PlayerHasGrassPokemonInParty(void)
{
    u8 i;
    struct Pokemon * pokemon;
    u16 species;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        pokemon = &gPlayerParty[i];
        if (GetMonData(pokemon, MON_DATA_SANITY_HAS_SPECIES)
         && !GetMonData(pokemon, MON_DATA_IS_EGG)
        )
        {
            species = GetMonData(pokemon, MON_DATA_SPECIES);
            if (gSpeciesInfo[species].types[0] == TYPE_GRASS || gSpeciesInfo[species].types[1] == TYPE_GRASS)
                return TRUE;
        }
    }
    return FALSE;
}

#define tState data[0]
#define tTimer data[1]

void AnimatePcTurnOn(void)
{
    u8 taskId;

#if DEBUG_OVERWORLD_MENU == TRUE
    if (gIsDebugPC)
        return;
#endif

    if (FuncIsActiveTask(Task_AnimatePcTurnOn) != TRUE)
    {
        taskId = CreateTask(Task_AnimatePcTurnOn, 8);
        gTasks[taskId].tState = 0;
        gTasks[taskId].tTimer = 0;
    }
}

// PC flickers on and off while turning on
static void Task_AnimatePcTurnOn(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (tTimer == 6)
    {
        PcTurnOnUpdateMetatileId(tState & 1);
        DrawWholeMapView();
        tTimer = 0;
        tState++;
        if (tState == 5)
            DestroyTask(taskId);
    }
    tTimer++;
}

#undef tState
#undef tTimer

static void PcTurnOnUpdateMetatileId(bool16 flickerOff)
{
    u16 metatileId = 0;
    s8 deltaX = 0;
    s8 deltaY = 0;
    u8 direction = GetPlayerFacingDirection();

    switch (direction)
    {
    case DIR_NORTH:
        deltaX = 0;
        deltaY = -1;
        break;
    case DIR_WEST:
        deltaX = -1;
        deltaY = -1;
        break;
    case DIR_EAST:
        deltaX = 1;
        deltaY = -1;
        break;
    }
    if (flickerOff)
    {
        if (gSpecialVar_0x8004 == 0)
            metatileId = METATILE_Building_PCOff;
        else if (gSpecialVar_0x8004 == 1)
            metatileId = METATILE_GenericBuilding1_PlayersPCOff;
        else if (gSpecialVar_0x8004 == 2)
            metatileId = METATILE_GenericBuilding1_PlayersPCOff;
    }
    else
    {
        if (gSpecialVar_0x8004 == 0)
            metatileId = METATILE_Building_PCOn;
        else if (gSpecialVar_0x8004 == 1)
            metatileId = METATILE_GenericBuilding1_PlayersPCOn;
        else if (gSpecialVar_0x8004 == 2)
            metatileId = METATILE_GenericBuilding1_PlayersPCOn;
    }
    MapGridSetMetatileIdAt(gSaveBlock1Ptr->pos.x + deltaX + MAP_OFFSET, gSaveBlock1Ptr->pos.y + deltaY + MAP_OFFSET, metatileId | MAPGRID_COLLISION_MASK);
}

void AnimatePcTurnOff()
{
    u16 metatileId = 0;
    s8 deltaX = 0;
    s8 deltaY = 0;
    u8 direction = GetPlayerFacingDirection();

#if DEBUG_OVERWORLD_MENU == TRUE
    if (gIsDebugPC)
    {
        gIsDebugPC = FALSE;
        return;
    }
#endif

    switch (direction)
    {
    case DIR_NORTH:
        deltaX = 0;
        deltaY = -1;
        break;
    case DIR_WEST:
        deltaX = -1;
        deltaY = -1;
        break;
    case DIR_EAST:
        deltaX = 1;
        deltaY = -1;
        break;
    }
    if (gSpecialVar_0x8004 == 0)
        metatileId = METATILE_Building_PCOff;
    else if (gSpecialVar_0x8004 == 1)
        metatileId = METATILE_GenericBuilding1_PlayersPCOff;
    else if (gSpecialVar_0x8004 == 2)
        metatileId = METATILE_GenericBuilding1_PlayersPCOff;
    MapGridSetMetatileIdAt(gSaveBlock1Ptr->pos.x + deltaX + MAP_OFFSET, gSaveBlock1Ptr->pos.y + deltaY + MAP_OFFSET, metatileId | MAPGRID_COLLISION_MASK);
    DrawWholeMapView();
}

void SpawnCameraObject(void)
{
    u8 objectEventId = SpawnSpecialObjectEventParameterized(OBJ_EVENT_GFX_YOUNGSTER, 8, LOCALID_CAMERA, gSaveBlock1Ptr->pos.x + MAP_OFFSET, gSaveBlock1Ptr->pos.y + MAP_OFFSET, 3);
    gObjectEvents[objectEventId].invisible = TRUE;
    CameraObjectSetFollowedObjectId(gObjectEvents[objectEventId].spriteId);
}

void RemoveCameraObject(void)
{
    CameraObjectSetFollowedObjectId(GetPlayerAvatarObjectId());
    RemoveObjectEventByLocalIdAndMap(LOCALID_CAMERA, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
}

void TeleportCamera(void)
{
    //UpdateSavedPos();
    MoveCameraAndRedrawMap(gSpecialVar_0x8004,
                           gSpecialVar_0x8005);
}

void BufferEReaderTrainerName(void)
{
    CopyEReaderTrainerName5(gStringVar1);
}

// Unused
static const u8 sSlotMachineRandomSeeds[] = {
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    12,
    2,
    4,
    5,
    1,
    8,
    7,
    11,
    3,
    10,
    9,
    6
};

static const u8 sSlotMachineIndices[] = {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    2,
    2,
    2,
    3,
    3,
    3,
    4,
    4,
    5
};

u8 GetRandomSlotMachineId(void)
{
    u16 rval = Random() % NELEMS(sSlotMachineIndices);
    return sSlotMachineIndices[rval];
}

bool8 LeadMonHasEffortRibbon(void)
{
    u8 leadMonIdx = GetLeadMonIndex();
    return GetMonData(&gPlayerParty[leadMonIdx], MON_DATA_EFFORT_RIBBON, NULL);
}

void GiveLeadMonEffortRibbon(void)
{
    u8 leadMonIdx;
    bool8 param;
    IncrementGameStat(GAME_STAT_RECEIVED_RIBBONS);
    FlagSet(FLAG_SYS_RIBBON_GET);
    param = TRUE;
    leadMonIdx = GetLeadMonIndex();
    SetMonData(&gPlayerParty[leadMonIdx], MON_DATA_EFFORT_RIBBON, &param);
}

bool8 AreLeadMonEVsMaxedOut(void)
{
    u8 leadMonIndex = GetLeadMonIndex();
    if (GetMonEVCount(&gPlayerParty[leadMonIndex]) >= 510)
        return TRUE;
    else
        return FALSE;
}

bool8 IsStarterFirstStageInParty(void)
{
    u16 species = GetStarterSpeciesById(VarGet(VAR_STARTER_MON));
    u8 partyCount = CalculatePlayerPartyCount();
    u8 i;
    for (i = 0; i < partyCount; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG, NULL) == species)
            return TRUE;
    }
    return FALSE;
}

bool8 IsThereRoomInAnyBoxForMorePokemon(void)
{
    u16 i;
    u16 j;
    for (i = 0; i < TOTAL_BOXES_COUNT; i++)
    {
        for (j = 0; j < IN_BOX_COUNT; j++)
        {
            if (GetBoxMonDataAt(i, j, MON_DATA_SPECIES) == SPECIES_NONE)
                return TRUE;
        }
    }
    return FALSE;
}

bool8 IsPokerusInParty(void)
{
    if (!CheckPartyPokerus(gPlayerParty, 0x3F))
        return FALSE;
    else
        return TRUE;
}

#define tXtrans   data[0]
#define tTimer    data[1]
#define tNremain  data[2]
#define tDuration data[3]
#define tYtrans   data[4]

void ShakeScreen(void)
{
    /*
     * 0x8004 = x translation
     * 0x8005 = y translation
     * 0x8006 = num interations
     * 0x8007 = duration of an iteration
     */
    u8 taskId = CreateTask(Task_ShakeScreen, 9);
    gTasks[taskId].tXtrans = gSpecialVar_0x8005;
    gTasks[taskId].tTimer = 0;
    gTasks[taskId].tNremain = gSpecialVar_0x8006;
    gTasks[taskId].tDuration = gSpecialVar_0x8007;
    gTasks[taskId].tYtrans = gSpecialVar_0x8004;
    SetCameraPanningCallback(NULL);
    PlaySE(SE_M_STRENGTH);
}

void ShakeScreenSilent(void)
{
    /*
     * 0x8004 = x translation
     * 0x8005 = y translation
     * 0x8006 = num interations
     * 0x8007 = duration of an iteration
     */
    u8 taskId = CreateTask(Task_ShakeScreen, 9);
    gTasks[taskId].tXtrans = gSpecialVar_0x8005;
    gTasks[taskId].tTimer = 0;
    gTasks[taskId].tNremain = gSpecialVar_0x8006;
    gTasks[taskId].tDuration = gSpecialVar_0x8007;
    gTasks[taskId].tYtrans = gSpecialVar_0x8004;
    SetCameraPanningCallback(NULL);
    //PlaySE(SE_M_STRENGTH);
}

static void Task_ShakeScreen(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    tTimer++;
    if (tTimer % tDuration == 0)
    {
        tTimer = 0;
        tNremain--;
        tXtrans = -tXtrans;
        tYtrans = -tYtrans;
        SetCameraPanning(tXtrans, tYtrans);
        if (tNremain == 0)
        {
            Task_EndScreenShake(taskId);
            InstallCameraPanAheadCallback();
        }
    }
}

static void Task_EndScreenShake(u8 taskId)
{
    DestroyTask(taskId);
    ScriptContext_Enable();
}

#undef tYtrans
#undef tDuration
#undef tNremain
#undef tTimer
#undef tXtrans

u8 GetLeadMonIndex(void)
{
    u8 partyCount = CalculatePlayerPartyCount();
    u8 i;
    struct Pokemon * pokemon;
    for (i = 0; i < partyCount; i++)
    {
        pokemon = &gPlayerParty[i];
        if (GetMonData(pokemon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG && GetMonData(pokemon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE)
            return i;
    }
    return 0;
}

u16 GetPartyMonSpecies(void)
{
    return GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_SPECIES_OR_EGG, NULL);
}

bool8 IsMonOTNameNotPlayers(void)
{
    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_OT_NAME, gStringVar1);
    
    if (!StringCompare(gSaveBlock2Ptr->playerName, gStringVar1))
        return FALSE;
    else
        return TRUE;
}

// Used to nop all the unused specials from RS
void NullFieldSpecial(void)
{

}

void DoPicboxCancel(void)
{
    u8 t = EOS;
    AddTextPrinterParameterized(0, FONT_NORMAL, &t, 0, 1, 0, NULL);
    PicboxCancel();
}

void SetVermilionTrashCans(void)
{
    u16 idx = (Random() % 15) + 1;
    gSpecialVar_0x8004 = idx;
    gSpecialVar_0x8005 = idx;
    switch (gSpecialVar_0x8004)
    {
    case 1:
        idx = Random() % 2;
        if (idx == 0)
            gSpecialVar_0x8005 += 1;
        else
            gSpecialVar_0x8005 += 5;
        break;
    case 2:
    case 3:
    case 4:
        idx = Random() % 3;
        if (idx == 0)
            gSpecialVar_0x8005 += 1;
        else if (idx == 1)
            gSpecialVar_0x8005 += 5;
        else
            gSpecialVar_0x8005 -= 1;
        break;
    case 5:
        idx = Random() % 2;
        if (idx == 0)
            gSpecialVar_0x8005 += 5;
        else
            gSpecialVar_0x8005 -= 1;
        break;
    case 6:
        idx = Random() % 3;
        if (idx == 0)
            gSpecialVar_0x8005 -= 5;
        else if (idx == 1)
            gSpecialVar_0x8005 += 1;
        else
            gSpecialVar_0x8005 += 5;
        break;
    case 7:
    case 8:
    case 9:
        idx = Random() % 4;
        if (idx == 0)
            gSpecialVar_0x8005 -= 5;
        else if (idx == 1)
            gSpecialVar_0x8005 += 1;
        else if (idx == 2)
            gSpecialVar_0x8005 += 5;
        else
            gSpecialVar_0x8005 -= 1;
        break;
    case 10:
        idx = Random() % 3;
        if (idx == 0)
            gSpecialVar_0x8005 -= 5;
        else if (idx == 1)
            gSpecialVar_0x8005 += 5;
        else
            gSpecialVar_0x8005 -= 1;
        break;
    case 11:
        idx = Random() % 2;
        if (idx == 0)
            gSpecialVar_0x8005 -= 5;
        else
            gSpecialVar_0x8005 += 1;
        break;
    case 12:
    case 13:
    case 14:
        idx = Random() % 3;
        if (idx == 0)
            gSpecialVar_0x8005 -= 5;
        else if (idx == 1)
            gSpecialVar_0x8005 += 1;
        else
            gSpecialVar_0x8005 -= 1;
        break;
    case 15:
        idx = Random() % 2;
        if (idx == 0)
            gSpecialVar_0x8005 -= 5;
        else
            gSpecialVar_0x8005 -= 1;
        break;
    }
    if (gSpecialVar_0x8005 > 15)
    {
        if (gSpecialVar_0x8004 % 5 == 1)
            gSpecialVar_0x8005 = gSpecialVar_0x8004 + 1;
        else if (gSpecialVar_0x8004 % 5 == 0)
            gSpecialVar_0x8005 = gSpecialVar_0x8004 - 1;
        else
            gSpecialVar_0x8005 = gSpecialVar_0x8004 + 1;
    }
}

static const u16 sResortGorgeousDeluxeRewards[] = {
    ITEM_BIG_PEARL,
    ITEM_PEARL,
    ITEM_STARDUST,
    ITEM_STAR_PIECE,
    ITEM_NUGGET,
    ITEM_RARE_CANDY
};

void IncrementResortGorgeousStepCounter(void)
{
    u16 var4035 = VarGet(VAR_RESORT_GOREGEOUS_STEP_COUNTER);
    if (VarGet(VAR_RESORT_GORGEOUS_REQUESTED_MON) != SPECIES_NONE)
    {
        var4035++;
        if (var4035 >= 250)
        {
            VarSet(VAR_RESORT_GORGEOUS_REQUESTED_MON, 0xFFFF);
            VarSet(VAR_RESORT_GOREGEOUS_STEP_COUNTER, 0);
        }
        else
        {
            VarSet(VAR_RESORT_GOREGEOUS_STEP_COUNTER, var4035);
        }
    }
}

void SampleResortGorgeousMonAndReward(void)
{
    u16 requestedSpecies = VarGet(VAR_RESORT_GORGEOUS_REQUESTED_MON);
    if (requestedSpecies == SPECIES_NONE || requestedSpecies == 0xFFFF)
    {
        VarSet(VAR_RESORT_GORGEOUS_REQUESTED_MON, SampleResortGorgeousMon());
        VarSet(VAR_RESORT_GORGEOUS_REWARD, SampleResortGorgeousReward());
        VarSet(VAR_RESORT_GOREGEOUS_STEP_COUNTER, 0);
    }
    StringCopy(gStringVar1, gSpeciesNames[VarGet(VAR_RESORT_GORGEOUS_REQUESTED_MON)]);
}

static u16 SampleResortGorgeousMon(void)
{
    u16 i;
    u16 species;
    for (i = 0; i < 100; i++)
    {
        species = (Random() % (NUM_SPECIES - 1)) + 1;
        if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), 0) == TRUE)
            return species;
    }
    while (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), 0) != TRUE)
    {
        if (species == SPECIES_BULBASAUR)
            species = NUM_SPECIES - 1;
        else
            species--;
    }
    return species;
}

static u16 SampleResortGorgeousReward(void)
{
    if ((Random() % 100) >= 30)
        return ITEM_LUXURY_BALL;
    else
        return sResortGorgeousDeluxeRewards[Random() % NELEMS(sResortGorgeousDeluxeRewards)];
}

bool8 CheckAddCoins(void)
{
    if (gSpecialVar_Result + gSpecialVar_0x8006 > 9999)
        return FALSE;
    else
        return TRUE;
}

static const struct WindowTemplate sElevatorCurrentFloorWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 22,
    .tilemapTop = 1,
    .width = 7,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x008
};

static const u8 *const sFloorNamePointers[] = {
    gText_B4F,
    gText_B3F,
    gText_B2F,
    gText_B1F,
    gText_1F,
    gText_2F,
    gText_3F,
    gText_4F,
    gText_5F,
    gText_6F,
    gText_7F,
    gText_8F,
    gText_9F,
    gText_10F,
    gText_11F,
    gText_Rooftop
};

// Unused
static const u8 sFloorNameWidthPadding[] = {
    26,
    26,
    26,
    26,
    30,
    30,
    30,
    30,
    30,
    30,
    30,
    30,
    30,
    26,
    26,
    18
};

static const u16 sElevatorWindowMetatilesGoingUp[][3] = {
    {
        METATILE_SilphCo_ElevatorWindow_Top0, 
        METATILE_SilphCo_ElevatorWindow_Top1, 
        METATILE_SilphCo_ElevatorWindow_Top2
    },
    {
        METATILE_SilphCo_ElevatorWindow_Mid0, 
        METATILE_SilphCo_ElevatorWindow_Mid1, 
        METATILE_SilphCo_ElevatorWindow_Mid2
    },
    {
        METATILE_SilphCo_ElevatorWindow_Bottom0, 
        METATILE_SilphCo_ElevatorWindow_Bottom1, 
        METATILE_SilphCo_ElevatorWindow_Bottom2
    }
};

static const u16 sElevatorWindowMetatilesGoingDown[][3] = {
    {
        METATILE_SilphCo_ElevatorWindow_Top0, 
        METATILE_SilphCo_ElevatorWindow_Top2, 
        METATILE_SilphCo_ElevatorWindow_Top1
    },
    {
        METATILE_SilphCo_ElevatorWindow_Mid0, 
        METATILE_SilphCo_ElevatorWindow_Mid2, 
        METATILE_SilphCo_ElevatorWindow_Mid1
    },
    {
        METATILE_SilphCo_ElevatorWindow_Bottom0, 
        METATILE_SilphCo_ElevatorWindow_Bottom2, 
        METATILE_SilphCo_ElevatorWindow_Bottom1
    }
};

static const u8 sElevatorAnimationDuration[] = {
    8,
    16,
    24,
    32,
    38,
    46,
    53,
    56,
    57
};

static const u8 sElevatorWindowAnimDuration[] = {
    3,
    6,
    9,
    12,
    15,
    18,
    21,
    24,
    27
};

void GetElevatorFloor(void)
{
    u16 floor = 4;
    if (gSaveBlock1Ptr->dynamicWarp.mapGroup == MAP_GROUP(MAP_ROCKET_HIDEOUT_B1F))
    {
        switch (gSaveBlock1Ptr->dynamicWarp.mapNum)
        {
        case MAP_NUM(MAP_SILPH_CO_1F):
            floor = 4;
            break;
        case MAP_NUM(MAP_SILPH_CO_2F):
            floor = 5;
            break;
        case MAP_NUM(MAP_SILPH_CO_3F):
            floor = 6;
            break;
        case MAP_NUM(MAP_SILPH_CO_4F):
            floor = 7;
            break;
        case MAP_NUM(MAP_SILPH_CO_5F):
            floor = 8;
            break;
        case MAP_NUM(MAP_SILPH_CO_6F):
            floor = 9;
            break;
        case MAP_NUM(MAP_SILPH_CO_7F):
            floor = 10;
            break;
        case MAP_NUM(MAP_SILPH_CO_8F):
            floor = 11;
            break;
        case MAP_NUM(MAP_SILPH_CO_9F):
            floor = 12;
            break;
        case MAP_NUM(MAP_SILPH_CO_10F):
            floor = 13;
            break;
        case MAP_NUM(MAP_SILPH_CO_11F):
            floor = 14;
            break;
        case MAP_NUM(MAP_ROCKET_HIDEOUT_B1F):
            floor = 3;
            break;
        case MAP_NUM(MAP_ROCKET_HIDEOUT_B2F):
            floor = 2;
            break;
        case MAP_NUM(MAP_ROCKET_HIDEOUT_B4F):
            floor = 0;
            break;
        }
    }
    if (gSaveBlock1Ptr->dynamicWarp.mapGroup == MAP_GROUP(MAP_CELADON_CITY_DEPARTMENT_STORE_1F))
    {
        switch (gSaveBlock1Ptr->dynamicWarp.mapNum)
        {
        case MAP_NUM(MAP_CELADON_CITY_DEPARTMENT_STORE_1F):
            floor = 4;
            break;
        case MAP_NUM(MAP_CELADON_CITY_DEPARTMENT_STORE_2F):
            floor = 5;
            break;
        case MAP_NUM(MAP_CELADON_CITY_DEPARTMENT_STORE_3F):
            floor = 6;
            break;
        case MAP_NUM(MAP_CELADON_CITY_DEPARTMENT_STORE_4F):
            floor = 7;
            break;
        case MAP_NUM(MAP_CELADON_CITY_DEPARTMENT_STORE_5F):
            floor = 8;
            break;
        }
    }
    if (gSaveBlock1Ptr->dynamicWarp.mapGroup == MAP_GROUP(MAP_TRAINER_TOWER_1F))
    {
        switch (gSaveBlock1Ptr->dynamicWarp.mapNum)
        {
        case MAP_NUM(MAP_TRAINER_TOWER_1F):
        case MAP_NUM(MAP_TRAINER_TOWER_2F):
        case MAP_NUM(MAP_TRAINER_TOWER_3F):
        case MAP_NUM(MAP_TRAINER_TOWER_4F):
        case MAP_NUM(MAP_TRAINER_TOWER_5F):
        case MAP_NUM(MAP_TRAINER_TOWER_6F):
        case MAP_NUM(MAP_TRAINER_TOWER_7F):
        case MAP_NUM(MAP_TRAINER_TOWER_8F):
        case MAP_NUM(MAP_TRAINER_TOWER_ROOF):
            floor = 15;
            break;
        case MAP_NUM(MAP_TRAINER_TOWER_LOBBY):
            floor = 3;
            break;
        }
    }
    VarSet(VAR_ELEVATOR_FLOOR, floor);
}

u16 InitElevatorFloorSelectMenuPos(void)
{
    sElevatorScroll = 0;
    sElevatorCursorPos = 0;

    if (gSaveBlock1Ptr->dynamicWarp.mapGroup == MAP_GROUP(MAP_ROCKET_HIDEOUT_B1F))
    {
        switch (gSaveBlock1Ptr->dynamicWarp.mapNum)
        {
        case MAP_NUM(MAP_SILPH_CO_11F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 0;
            break;
        case MAP_NUM(MAP_SILPH_CO_10F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 1;
            break;
        case MAP_NUM(MAP_SILPH_CO_9F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 2;
            break;
        case MAP_NUM(MAP_SILPH_CO_8F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 3;
            break;
        case MAP_NUM(MAP_SILPH_CO_7F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 4;
            break;
        case MAP_NUM(MAP_SILPH_CO_6F):
            sElevatorScroll = 1;
            sElevatorCursorPos = 4;
            break;
        case MAP_NUM(MAP_SILPH_CO_5F):
            sElevatorScroll = 2;
            sElevatorCursorPos = 4;
            break;
        case MAP_NUM(MAP_SILPH_CO_4F):
            sElevatorScroll = 3;
            sElevatorCursorPos = 4;
            break;
        case MAP_NUM(MAP_SILPH_CO_3F):
            sElevatorScroll = 4;
            sElevatorCursorPos = 4;
            break;
        case MAP_NUM(MAP_SILPH_CO_2F):
            sElevatorScroll = 5;
            sElevatorCursorPos = 4;
            break;
        case MAP_NUM(MAP_SILPH_CO_1F):
            sElevatorScroll = 5;
            sElevatorCursorPos = 5;
            break;
        case MAP_NUM(MAP_ROCKET_HIDEOUT_B1F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 0;
            break;
        case MAP_NUM(MAP_ROCKET_HIDEOUT_B2F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 1;
            break;
        case MAP_NUM(MAP_ROCKET_HIDEOUT_B4F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 2;
            break;
        }
    }
    if (gSaveBlock1Ptr->dynamicWarp.mapGroup == MAP_GROUP(MAP_CELADON_CITY_DEPARTMENT_STORE_1F))
    {
        switch (gSaveBlock1Ptr->dynamicWarp.mapNum)
        {
        case MAP_NUM(MAP_CELADON_CITY_DEPARTMENT_STORE_5F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 0;
            break;
        case MAP_NUM(MAP_CELADON_CITY_DEPARTMENT_STORE_4F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 1;
            break;
        case MAP_NUM(MAP_CELADON_CITY_DEPARTMENT_STORE_3F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 2;
            break;
        case MAP_NUM(MAP_CELADON_CITY_DEPARTMENT_STORE_2F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 3;
            break;
        case MAP_NUM(MAP_CELADON_CITY_DEPARTMENT_STORE_1F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 4;
            break;
        }
    }
    if (gSaveBlock1Ptr->dynamicWarp.mapGroup == MAP_GROUP(MAP_TRAINER_TOWER_1F))
    {
        switch (gSaveBlock1Ptr->dynamicWarp.mapNum)
        {
        case MAP_NUM(MAP_TRAINER_TOWER_1F):
        case MAP_NUM(MAP_TRAINER_TOWER_2F):
        case MAP_NUM(MAP_TRAINER_TOWER_3F):
        case MAP_NUM(MAP_TRAINER_TOWER_4F):
        case MAP_NUM(MAP_TRAINER_TOWER_5F):
        case MAP_NUM(MAP_TRAINER_TOWER_6F):
        case MAP_NUM(MAP_TRAINER_TOWER_7F):
        case MAP_NUM(MAP_TRAINER_TOWER_8F):
        case MAP_NUM(MAP_TRAINER_TOWER_ROOF):
            sElevatorScroll = 0;
            sElevatorCursorPos = 0;
            break;
        case MAP_NUM(MAP_TRAINER_TOWER_LOBBY):
            sElevatorScroll = 0;
            sElevatorCursorPos = 1;
            break;
        }
    }
    return sElevatorCursorPos;
}

void AnimateElevator(void)
{
    u16 nfloors;
    s16 *data = gTasks[CreateTask(Task_ElevatorShake, 9)].data;
    data[1] = 0;
    data[2] = 0;
    data[4] = 1;
    if (gSpecialVar_0x8005 > gSpecialVar_0x8006)
    {
        nfloors = gSpecialVar_0x8005 - gSpecialVar_0x8006;
        data[6] = 1;
    }
    else
    {
        nfloors = gSpecialVar_0x8006 - gSpecialVar_0x8005;
        data[6] = 0;
    }
    if (nfloors > 8)
        nfloors = 8;
    data[5] = sElevatorAnimationDuration[nfloors];
    SetCameraPanningCallback(NULL);
    AnimateElevatorWindowView(nfloors, data[6]);
    PlaySE(SE_ELEVATOR);
}

static void Task_ElevatorShake(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    data[1]++;
    if ((data[1] % 3) == 0)
    {
        data[1] = 0;
        data[2]++;
        data[4] = -data[4];
        SetCameraPanning(0, data[4]);
        if (data[2] == data[5])
        {
            PlaySE(SE_DING_DONG);
            DestroyTask(taskId);
            ScriptContext_Enable();
            InstallCameraPanAheadCallback();
        }
    }
}

void DrawElevatorCurrentFloorWindow(void)
{
    const u8 *floorname;
    u32 strwidth;

    if (QL_AvoidDisplay(QL_DestroyAbortedDisplay) == TRUE)
        return;

    sElevatorCurrentFloorWindowId = AddWindow(&sElevatorCurrentFloorWindowTemplate);
    LoadStdWindowGfx(sElevatorCurrentFloorWindowId, 0x21D, BG_PLTT_ID(13));
    DrawStdFrameWithCustomTileAndPalette(sElevatorCurrentFloorWindowId, FALSE, 0x21D, 13);
    AddTextPrinterParameterized(sElevatorCurrentFloorWindowId, FONT_NORMAL, gText_NowOn, 0, 2, 0xFF, NULL);
    floorname = sFloorNamePointers[gSpecialVar_0x8005];
    strwidth = GetStringWidth(FONT_NORMAL, floorname, 0);
    AddTextPrinterParameterized(sElevatorCurrentFloorWindowId, FONT_NORMAL, floorname, 56 - strwidth, 16, 0xFF, NULL);
    PutWindowTilemap(sElevatorCurrentFloorWindowId);
    CopyWindowToVram(sElevatorCurrentFloorWindowId, COPYWIN_FULL);
}

void CloseElevatorCurrentFloorWindow(void)
{
    ClearStdWindowAndFrameToTransparent(sElevatorCurrentFloorWindowId, TRUE);
    RemoveWindow(sElevatorCurrentFloorWindowId);
}

static void AnimateElevatorWindowView(u16 nfloors, u8 direction)
{
    u8 taskId;
    if (FuncIsActiveTask(Task_AnimateElevatorWindowView) != TRUE)
    {
        taskId = CreateTask(Task_AnimateElevatorWindowView, 8);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = direction;
        gTasks[taskId].data[3] = sElevatorWindowAnimDuration[nfloors];
    }
}

static void Task_AnimateElevatorWindowView(u8 taskId)
{
    u8 i;
    u8 j;
    s16 *data = gTasks[taskId].data;
    if (data[1] == 6)
    {
        data[0]++;
        if (data[2] == 0)
        {
            for (i = 0; i < 3; i++)
            {
                for (j = 0; j < 3; j++)
                    MapGridSetMetatileIdAt(j + 1 + MAP_OFFSET, i + MAP_OFFSET, sElevatorWindowMetatilesGoingUp[i][data[0] % 3] | MAPGRID_COLLISION_MASK);
            }
        }
        else
        {
            for (i = 0; i < 3; i++)
            {
                for (j = 0; j < 3; j++)
                    MapGridSetMetatileIdAt(j + 1 + MAP_OFFSET, i + MAP_OFFSET, sElevatorWindowMetatilesGoingDown[i][data[0] % 3] | MAPGRID_COLLISION_MASK);
            }
        }
        DrawWholeMapView();
        data[1] = 0;
        if (data[0] == data[3])
            DestroyTask(taskId);
    }
    data[1]++;
}

void ListMenu(void)
{
    u8 taskId;
    struct Task *task;

    if (QL_AvoidDisplay(QL_DestroyAbortedDisplay) == TRUE)
        return;
        
    taskId = CreateTask(Task_CreateScriptListMenu, 8);
    task = &gTasks[taskId];
    switch (gSpecialVar_0x8004)
    {
    case LISTMENU_BADGES:
        task->data[0] = 4;
        task->data[1] = 9;
        task->data[2] = 1;
        task->data[3] = 1;
        task->data[4] = 12;
        task->data[5] = 7;
        task->data[6] = 1;
        task->data[15] = taskId;
        break;
    case LISTMENU_SILPHCO_FLOORS:
        task->data[0] = 7;
        task->data[1] = 12;
        task->data[2] = 1;
        task->data[3] = 1;
        task->data[4] = 8;
        task->data[5] = 12;
        task->data[6] = 0;
        task->data[15] = taskId;
        task->data[7] = sElevatorScroll;
        task->data[8] = sElevatorCursorPos;
        break;
    case LISTMENU_ROCKET_HIDEOUT_FLOORS: // Multichoice used instead
        task->data[0] = 4;
        task->data[1] = 4;
        task->data[2] = 1;
        task->data[3] = 1;
        task->data[4] = 8;
        task->data[5] = 8;
        task->data[6] = 0;
        task->data[15] = taskId;
        break;
    case LISTMENU_DEPT_STORE_FLOORS: // Multichoice used instead
        task->data[0] = 4;
        task->data[1] = 6;
        task->data[2] = 1;
        task->data[3] = 1;
        task->data[4] = 8;
        task->data[5] = 8;
        task->data[6] = 0;
        task->data[15] = taskId;
        break;
    case LISTMENU_WIRELESS_LECTURE_HEADERS: // Multichoice used instead
        task->data[0] = 4;
        task->data[1] = 4;
        task->data[2] = 1;
        task->data[3] = 1;
        task->data[4] = 17;
        task->data[5] = 8;
        task->data[6] = 1;
        task->data[15] = taskId;
        break;
    case LISTMENU_BERRY_POWDER:
        task->data[0] = 7;
        task->data[1] = 12;
        task->data[2] = 16;
        task->data[3] = 1;
        task->data[4] = 17;
        task->data[5] = 12;
        task->data[6] = 0;
        task->data[15] = taskId;
        break;
    case LISTMENU_TRAINER_TOWER_FLOORS: // Mulitchoice used instead
        task->data[0] = 3;
        task->data[1] = 3;
        task->data[2] = 1;
        task->data[3] = 1;
        task->data[4] = 8;
        task->data[5] = 6;
        task->data[6] = 0;
        task->data[15] = taskId;
        break;
    case 99:
        break;
    default:
        gSpecialVar_Result = 0x7F;
        DestroyTask(taskId);
        break;
    }
}

static const u8 *const sListMenuLabels[][12] = {
    [LISTMENU_BADGES] = 
    {
        gText_BoulderBadge,
        gText_CascadeBadge,
        gText_ThunderBadge,
        gText_RainbowBadge,
        gText_SoulBadge,
        gText_MarshBadge,
        gText_VolcanoBadge,
        gText_EarthBadge,
        gOtherText_Exit,
    }, 
    [LISTMENU_SILPHCO_FLOORS] = 
    {
        gText_11F,
        gText_10F,
        gText_9F,
        gText_8F,
        gText_7F,
        gText_6F,
        gText_5F,
        gText_4F,
        gText_3F,
        gText_2F,
        gText_1F,
        gOtherText_Exit,
    }, 
    [LISTMENU_ROCKET_HIDEOUT_FLOORS] = // Unncessary, MULTICHOICE_ROCKET_HIDEOUT_ELEVATOR is used instead
    {
        gText_B4F,
        gOtherText_Exit,
    }, 
    [LISTMENU_DEPT_STORE_FLOORS] = // Unncessary, MULTICHOICE_DEPT_STORE_ELEVATOR is used instead
    {
        gText_5F,
        gText_4F,
        gText_3F,
        gText_2F,
        gText_1F,
        gOtherText_Exit,
    }, 
    [LISTMENU_WIRELESS_LECTURE_HEADERS] = // Unnecessary, MULTICHOICE_LINKED_DIRECT_UNION is used instead
    {
        gText_LinkedGamePlay,
        gText_DirectCorner,
        gText_UnionRoom,
        gOtherText_Quit,
    }, 
    [LISTMENU_BERRY_POWDER] = 
    {
        gText_Energypowder_50,
        gText_EnergyRoot_80,
        gText_HealPowder_50,
        gText_RevivalHerb_300,
        gText_Protein_1000,
        gText_Iron_1000,
        gText_Carbos_1000,
        gText_Calcium_1000,
        gText_Zinc_1000,
        gText_HpUp_1000,
        gText_PpUp_3000,
        gOtherText_Exit,
    }, 
    [LISTMENU_TRAINER_TOWER_FLOORS] = // Unnecessary, MULTICHOICE_ROOFTOP_B1F is used instead
    {
        gText_Rooftop,
        gText_B1F,
        gOtherText_Exit,
    }
};

static void Task_CreateScriptListMenu(u8 taskId)
{
    struct WindowTemplate template;
    u8 i;
    s32 width;
    s32 mwidth;
    struct Task *task = &gTasks[taskId];
    u8 windowId;
    LockPlayerFieldControls();
    if (gSpecialVar_0x8004 == LISTMENU_SILPHCO_FLOORS)
        gScrollableMultichoice_ScrollOffset = sElevatorScroll;
    else
        gScrollableMultichoice_ScrollOffset = 0;
    sListMenuItems = AllocZeroed(task->data[1] * sizeof(struct ListMenuItem));
    CreateScriptListMenu();
    mwidth = 0;
    for (i = 0; i < task->data[1]; i++)
    {
        sListMenuItems[i].label = sListMenuLabels[gSpecialVar_0x8004][i];
        sListMenuItems[i].index = i;
        width = GetStringWidth(FONT_NORMAL, sListMenuItems[i].label, 0);
        if (width > mwidth)
            mwidth = width;
    }
    task->data[4] = (mwidth + 9) / 8 + 1;
    if (task->data[2] + task->data[4] > 29)
        task->data[2] = 29 - task->data[4];
    template = SetWindowTemplateFields(0, task->data[2], task->data[3], task->data[4], task->data[5], 15, 0x038);
    task->data[13] = windowId = AddWindow(&template);
    SetStdWindowBorderStyle(task->data[13], 0);
    sFieldSpecialsListMenuTemplate.totalItems = task->data[1];
    sFieldSpecialsListMenuTemplate.maxShowed = task->data[0];
    sFieldSpecialsListMenuTemplate.windowId = task->data[13];
    Task_CreateMenuRemoveScrollIndicatorArrowPair(taskId);
    task->data[14] = ListMenuInit(&sFieldSpecialsListMenuTemplate, task->data[7], task->data[8]);
    PutWindowTilemap(task->data[13]);
    CopyWindowToVram(task->data[13], COPYWIN_FULL);
    gTasks[taskId].func = Task_ListMenuHandleInput;
}

static void CreateScriptListMenu(void)
{
    sFieldSpecialsListMenuTemplate.items = sListMenuItems;
    sFieldSpecialsListMenuTemplate.moveCursorFunc = ScriptListMenuMoveCursorFunction;
    sFieldSpecialsListMenuTemplate.itemPrintFunc = NULL;
    sFieldSpecialsListMenuTemplate.totalItems = 1;
    sFieldSpecialsListMenuTemplate.maxShowed = 1;
    sFieldSpecialsListMenuTemplate.windowId = 0;
    sFieldSpecialsListMenuTemplate.header_X = 0;
    sFieldSpecialsListMenuTemplate.item_X = 8;
    sFieldSpecialsListMenuTemplate.cursor_X = 0;
    sFieldSpecialsListMenuTemplate.upText_Y = 0;
    sFieldSpecialsListMenuTemplate.cursorPal = 2;
    sFieldSpecialsListMenuTemplate.fillValue = 1;
    sFieldSpecialsListMenuTemplate.cursorShadowPal = 3;
    sFieldSpecialsListMenuTemplate.lettersSpacing = 1;
    sFieldSpecialsListMenuTemplate.itemVerticalPadding = 0;
    sFieldSpecialsListMenuTemplate.scrollMultiple = 0;
    sFieldSpecialsListMenuTemplate.fontId = FONT_NORMAL;
    sFieldSpecialsListMenuTemplate.cursorKind = 0;
}

static void ScriptListMenuMoveCursorFunction(s32 nothing, bool8 is, struct ListMenu * used)
{
    u8 taskId;
    struct Task *task;
    PlaySE(SE_SELECT);
    taskId = FindTaskIdByFunc(Task_ListMenuHandleInput);
    if (taskId != 0xFF)
    {
        task = &gTasks[taskId];
        ListMenuGetScrollAndRow(task->data[14], &sFieldSpecialsListMenuScrollBuffer, NULL);
        gScrollableMultichoice_ScrollOffset = sFieldSpecialsListMenuScrollBuffer;
    }
}

static void Task_ListMenuHandleInput(u8 taskId)
{
    s32 input;
    struct Task *task;

    task = &gTasks[taskId];
    task++;task--;
    input = ListMenu_ProcessInput(task->data[14]);
    switch (input)
    {
    case -1:
        break;
    case -2:
        gSpecialVar_Result = 0x7F;
        PlaySE(SE_SELECT);
        Task_DestroyListMenu(taskId);
        break;
    default:
        gSpecialVar_Result = input;
        PlaySE(SE_SELECT);
        if (task->data[6] == 0 || input == task->data[1] - 1)
        {
            Task_DestroyListMenu(taskId);
        }
        else
        {
            Task_ListMenuRemoveScrollIndicatorArrowPair(taskId);
            task->func = Task_SuspendListMenu;
            ScriptContext_Enable();
        }
        break;
    }
}

static void Task_DestroyListMenu(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    Task_ListMenuRemoveScrollIndicatorArrowPair(taskId);
    DestroyListMenuTask(task->data[14], NULL, NULL);
    Free(sListMenuItems);
    ClearStdWindowAndFrameToTransparent(task->data[13], TRUE);
    FillWindowPixelBuffer(task->data[13], PIXEL_FILL(0));
    ClearWindowTilemap(task->data[13]);
    CopyWindowToVram(task->data[13], COPYWIN_GFX);
    RemoveWindow(task->data[13]);
    DestroyTask(taskId);
    ScriptContext_Enable();
}

static void Task_SuspendListMenu(u8 taskId)
{
    switch (gTasks[taskId].data[6])
    {
    case 1:
        break;
    case 2:
        gTasks[taskId].data[6] = 1;
        gTasks[taskId].func = Task_RedrawScrollArrowsAndWaitInput;
        break;
    }
}

void ReturnToListMenu(void)
{
    u8 taskId = FindTaskIdByFunc(Task_SuspendListMenu);
    if (taskId == 0xFF)
        ScriptContext_Enable();
    else
        gTasks[taskId].data[6]++;
}

static void Task_RedrawScrollArrowsAndWaitInput(u8 taskId)
{
    LockPlayerFieldControls();
    Task_CreateMenuRemoveScrollIndicatorArrowPair(taskId);
    gTasks[taskId].func = Task_ListMenuHandleInput;
}

static void Task_CreateMenuRemoveScrollIndicatorArrowPair(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    struct ScrollArrowsTemplate template = {
        .firstArrowType = 2,
        .secondArrowType = 3,
        .tileTag = 2000,
        .palTag = 100
    };
    if (task->data[0] != task->data[1])
    {
        template.firstX = 4 * task->data[4] + 8 * task->data[2];
        template.firstY = 8;
        template.secondX = 4 * task->data[4] + 8 * task->data[2];
        template.secondY = 8 * task->data[5] + 10;
        template.fullyUpThreshold = 0;
        template.fullyDownThreshold = task->data[1] - task->data[0];
        task->data[12] = AddScrollIndicatorArrowPair(&template, &gScrollableMultichoice_ScrollOffset);
    }
}

static void Task_ListMenuRemoveScrollIndicatorArrowPair(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    if (task->data[0] != task->data[1])
        RemoveScrollIndicatorArrowPair(task->data[12]);
}

void ForcePlayerToStartSurfing(void)
{
    SetHelpContext(HELPCONTEXT_SURFING);
    SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_SURFING);
}

static const u16 sStarterSpecies[] = {
    SPECIES_BULBASAUR,
    SPECIES_SQUIRTLE,
    SPECIES_CHARMANDER
};

static u16 GetStarterSpeciesById(u16 idx)
{
    if (idx >= NELEMS(sStarterSpecies))
        idx = 0;
    return sStarterSpecies[idx];
}

u16 GetStarterSpecies(void)
{
    return GetStarterSpeciesById(VarGet(VAR_STARTER_MON));
}

void SetSeenMon(void)
{
    GetSetPokedexFlag(SpeciesToNationalPokedexNum(gSpecialVar_0x8004), 2);
}

void ResetContextNpcTextColor(void)
{
    gSelectedObjectEvent = 0;
    gSpecialVar_TextColor = NPC_TEXT_COLOR_DEFAULT;
}

u8 ContextNpcGetTextColor(void)
{
    u16 gfxId;
    if (gSpecialVar_TextColor != NPC_TEXT_COLOR_DEFAULT)
    {
        // A text color has been specified, use that
        return gSpecialVar_TextColor;
    }
    else if (gSelectedObjectEvent == 0)
    {
        // No text color specified and no object selected, use neutral
        return NPC_TEXT_COLOR_NEUTRAL;
    }
    else
    {
        // An object is selected and no color has been specified.
        // Use the text color normally associated with this object's sprite.
        gfxId = gObjectEvents[gSelectedObjectEvent].graphicsId;
        if (gfxId >= OBJ_EVENT_GFX_VAR_0)
            gfxId = VarGetObjectEventGraphicsId(gfxId - OBJ_EVENT_GFX_VAR_0);
        return GetColorFromTextColorTable(gfxId);
    }
}

static bool8 HasMonBeenRenamed(u8 idx)
{
    struct Pokemon * pokemon = &gPlayerParty[idx];
    u8 language;
    GetMonData(pokemon, MON_DATA_NICKNAME, gStringVar1);
    language = GetMonData(pokemon, MON_DATA_LANGUAGE, &language);
    if (language != LANGUAGE_ENGLISH)
        return TRUE;
    else if (StringCompare(gSpeciesNames[GetMonData(pokemon, MON_DATA_SPECIES, NULL)], gStringVar1) != 0)
        return TRUE;
    else
        return FALSE;
}

bool8 HasLeadMonBeenRenamed(void)
{
    return HasMonBeenRenamed(GetLeadMonIndex());
}

void TV_PrintIntToStringVar(u8 varidx, s32 number)
{
    s32 n = CountDigits(number);
    ConvertIntToDecimalStringN(sStringVarPtrs[varidx], number, STR_CONV_MODE_LEFT_ALIGN, n);
}

s32 CountDigits(s32 number)
{
    if (number / 10 == 0)
        return 1;
    else if (number / 100 == 0)
        return 2;
    else if (number / 1000 == 0)
        return 3;
    else if (number / 10000 == 0)
        return 4;
    else if (number / 100000 == 0)
        return 5;
    else if (number / 1000000 == 0)
        return 6;
    else if (number / 10000000 == 0)
        return 7;
    else if (number / 100000000 == 0)
        return 8;
    else
        return 1;
}

bool8 NameRaterWasNicknameChanged(void)
{
    struct Pokemon * pokemon = &gPlayerParty[gSpecialVar_0x8004];
    GetMonData(pokemon, MON_DATA_NICKNAME, gStringVar1);
    if (StringCompare(gStringVar3, gStringVar1) == 0)
        return FALSE;
    else
        return TRUE;
}

void ChangeBoxPokemonNickname(void)
{
    struct BoxPokemon * pokemon = GetBoxedMonPtr(gSpecialVar_MonBoxId, gSpecialVar_MonBoxPos);
    u16 species;
    u8 gender;
    u32 personality;


    GetBoxMonData(pokemon, MON_DATA_NICKNAME, gStringVar3);
    GetBoxMonData(pokemon, MON_DATA_NICKNAME, gStringVar2);
    species = GetBoxMonData(pokemon, MON_DATA_SPECIES, NULL);
    gender = GetBoxMonGender(pokemon);
    personality = GetBoxMonData(pokemon, MON_DATA_PERSONALITY, NULL);
    DoNamingScreen(NAMING_SCREEN_NICKNAME, gStringVar2, species, gender, personality, ChangeBoxPokemonNickname_CB);
}

static void ChangeBoxPokemonNickname_CB(void)
{
    SetBoxMonNickAt(gSpecialVar_MonBoxId, gSpecialVar_MonBoxPos, gStringVar2);
    CB2_ReturnToFieldContinueScriptPlayMapMusic();
}

void ChangePokemonNickname(void)
{
    u16 species;
    u8 gender;
    u32 personality;

    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar3);
    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar2);
    species = GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_SPECIES, NULL);
    gender = GetMonGender(&gPlayerParty[gSpecialVar_0x8004]);
    personality = GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_PERSONALITY, NULL);
    DoNamingScreen(NAMING_SCREEN_NICKNAME, gStringVar2, species, gender, personality, ChangePokemonNickname_CB);
}

bool8 SocialSecurityCheck(void) {
    
    DoNamingScreen(NAMING_SCREEN_SOCIAL, gStringVar1, gSaveBlock2Ptr->playerGender, MON_MALE, 0, SocialSecurity_CB);
    return FALSE;
}


bool8 BerryPowderManCheck(void) {
    
    if(FlagGet(FLAG_BERRIED_ALIVE)) {
        DoNamingScreen(NAMING_SCREEN_BERRY_POWDER_ALIVE, gStringVar1, gSaveBlock2Ptr->playerGender, MON_MALE, 0, BerryPowderManAlive_CB);
    } else {
        DoNamingScreen(NAMING_SCREEN_BERRY_POWDER, gStringVar1, gSaveBlock2Ptr->playerGender, MON_MALE, 0, BerryPowderManDeath_CB);

    }
    return FALSE;
}


bool8 SayYesForChansey(void) {
    
    DoNamingScreen(NAMING_SCREEN_YES, gStringVar1, gSaveBlock2Ptr->playerGender, MON_MALE, 0, SayYes_CB);
    return FALSE;
}

static void SocialSecurity_CB(void) {
    ConvertIntToDecimalStringN(gStringVar2, GetPlayerTrainerId() & 0xffff, STR_CONV_MODE_LEADING_ZEROS, 5);
    if(!StringCompare(gText_Leekd, gStringVar1)) {
        //DebugPrintf("Compared %S with %S", gText_Leekd, gStringVar1);
        VarSet(VAR_RESULT, 2);

    } else {
        //DebugPrintf("Compared %S with %S", gText_Leekd, gStringVar1);
        VarSet(VAR_RESULT, !StringCompare(gStringVar2, gStringVar1));

    }
    CB2_ReturnToFieldContinueScriptPlayMapMusic();
}


static void BerryPowderManDeath_CB(void) {
    if(!StringCompare(gText_DEAD, gStringVar1) ||
        !StringCompare(gText_DeadLower, gStringVar1) ||
        !StringCompare(gText_DIED, gStringVar1) ||
        !StringCompare(gText_DiedLower, gStringVar1)) {
        VarSet(VAR_RESULT, 1);

    } else 
        VarSet(VAR_RESULT, 0);
    CB2_ReturnToFieldContinueScriptPlayMapMusic();
}
static void BerryPowderManAlive_CB(void) {
    if(!StringCompare(gText_ALIVE, gStringVar1) ||
        !StringCompare(gText_AliveLower, gStringVar1)) {
        VarSet(VAR_RESULT, 1);

    } else 
        VarSet(VAR_RESULT, 0);
    CB2_ReturnToFieldContinueScriptPlayMapMusic();
}

static void SayYes_CB(void) {
    VarSet(VAR_RESULT, 0);
    if(!StringCompare(gText_Yes, gStringVar1) ||
        !StringCompare(gText_YesLower, gStringVar1) ||
        !StringCompare(gText_YUP, gStringVar1) ||
        !StringCompare(gText_YupLower, gStringVar1) ||
        !StringCompare(gText_YEP, gStringVar1) ||
        !StringCompare(gText_YepLower, gStringVar1) ||
        !StringCompare(gText_YEA, gStringVar1) ||
        !StringCompare(gText_YeaLower, gStringVar1) ||
        !StringCompare(gText_AYE, gStringVar1) ||
        !StringCompare(gText_AyeLower, gStringVar1)) {
        VarSet(VAR_RESULT, 1);

    } else if (!StringCompare(gText_Oui, gStringVar1)) {
        VarSet(VAR_RESULT, 2);
    } else if (!StringCompare(gText_Ja, gStringVar1)) {
        VarSet(VAR_RESULT, 2);
    } else if (!StringCompare(gText_Tak, gStringVar1)) {
        VarSet(VAR_RESULT, 2);
    } else if (!StringCompare(gText_Oklahoma, gStringVar1)) {
        VarSet(VAR_RESULT, 3);
    } else if (!StringCompare(gText_Si, gStringVar1)) {
        VarSet(VAR_RESULT, 4);
    } else if (!StringCompare(gText_SiLower, gStringVar1)) {
        VarSet(VAR_RESULT, 4);
    } else if (!StringCompare(gText_SiAllLower, gStringVar1)) {
        VarSet(VAR_RESULT, 4);
    }  else {
        VarSet(VAR_RESULT, 0);

    }
    CB2_ReturnToFieldContinueScriptPlayMapMusic();
}


void IsNicknameMewtwo(void)
{
    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar3);
    //DebugPrintf("Get Trade Species %d", VarGet(VAR_0x800B));
    DebugPrintf("First check %d", VarGet(VAR_0x8009));
    DebugPrintf("Second check %d", VarGet(VAR_RESULT));
    
    if(!StringCompare(gStringVar3, COMPOUND_STRING("MEWTWO"))) {
        VarSet(VAR_0x8014, GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_SPECIES));
        VarSet(VAR_RESULT, 1);

    } else 
        
    VarSet(VAR_RESULT, 0);
    //CB2_ReturnToFieldContinueScriptPlayMapMusic();
}

static void ChangePokemonNickname_CB(void)
{
    SetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar2);
    CB2_ReturnToFieldContinueScriptPlayMapMusic();
}

void BufferMonNickname(void)
{
    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar1);
    StringGet_Nickname(gStringVar1);
}

void IsMonOTIDNotPlayers(void)
{
    if (GetPlayerTrainerId() == GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_OT_ID, NULL))
        gSpecialVar_Result = FALSE;
    else
        gSpecialVar_Result = TRUE;
}

u32 GetPlayerTrainerId(void)
{
    return (gSaveBlock2Ptr->playerTrainerId[3] << 24) | (gSaveBlock2Ptr->playerTrainerId[2] << 16) | (gSaveBlock2Ptr->playerTrainerId[1] << 8) | gSaveBlock2Ptr->playerTrainerId[0];
}

u8 GetUnlockedSeviiAreas(void)
{
    u8 result = 0; //No Sevii areas in dex
    /*
    if (FlagGet(FLAG_WORLD_MAP_ONE_ISLAND) == TRUE)
        result |= 1 << 0;
    if (FlagGet(FLAG_WORLD_MAP_TWO_ISLAND) == TRUE)
        result |= 1 << 1;
    if (FlagGet(FLAG_WORLD_MAP_THREE_ISLAND) == TRUE)
        result |= 1 << 2;
    if (FlagGet(FLAG_WORLD_MAP_FOUR_ISLAND) == TRUE)
        result |= 1 << 3;
    if (FlagGet(FLAG_WORLD_MAP_FIVE_ISLAND) == TRUE)
        result |= 1 << 4;
    if (FlagGet(FLAG_WORLD_MAP_SIX_ISLAND) == TRUE)
        result |= 1 << 5;
    if (FlagGet(FLAG_WORLD_MAP_SEVEN_ISLAND) == TRUE)
        result |= 1 << 6;
    */
    return result;
}

void UpdateTrainerCardPhotoIcons(void)
{
    u16 species[PARTY_SIZE];
    u32 personality[PARTY_SIZE];
    u8 i;
    u8 partyCount;
    for (i = 0; i < PARTY_SIZE; i++)
        species[i] = SPECIES_NONE;
    partyCount = CalculatePlayerPartyCount();
    for (i = 0; i < partyCount; i++)
    {
        species[i] = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG, NULL);
        personality[i] = GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY, NULL);
    }
    VarSet(VAR_TRAINER_CARD_MON_ICON_1, SpeciesToMailSpecies(species[0], personality[0]));
    VarSet(VAR_TRAINER_CARD_MON_ICON_2, SpeciesToMailSpecies(species[1], personality[1]));
    VarSet(VAR_TRAINER_CARD_MON_ICON_3, SpeciesToMailSpecies(species[2], personality[2]));
    VarSet(VAR_TRAINER_CARD_MON_ICON_4, SpeciesToMailSpecies(species[3], personality[3]));
    VarSet(VAR_TRAINER_CARD_MON_ICON_5, SpeciesToMailSpecies(species[4], personality[4]));
    VarSet(VAR_TRAINER_CARD_MON_ICON_6, SpeciesToMailSpecies(species[5], personality[5]));
    VarSet(VAR_TRAINER_CARD_MON_ICON_TINT_IDX, gSpecialVar_0x8004);
}

u16 StickerManGetBragFlags(void)
{
    u16 result = 0;
    u32 numEggs;
    gSpecialVar_0x8004 = GetGameStat(GAME_STAT_ENTERED_HOF);
    numEggs = GetGameStat(GAME_STAT_HATCHED_EGGS);
    gSpecialVar_0x8006 = GetGameStat(GAME_STAT_LINK_BATTLE_WINS);
    if (numEggs > 0xFFFF)
        gSpecialVar_0x8005 = 0xFFFF;
    else
        gSpecialVar_0x8005 = numEggs;
    if (gSpecialVar_0x8004 != 0)
        result |= 1 << 0;
    if (gSpecialVar_0x8005 != 0)
        result |= 1 << 1;
    if (gSpecialVar_0x8006 != 0)
        result |= 1 << 2;
    return result;
}

u16 GetHiddenItemAttr(u32 hiddenItem, u8 attr)
{
    if (attr == HIDDEN_ITEM_ITEM)
        return GET_HIDDEN_ITEM_ITEM(hiddenItem);
    else if (attr == HIDDEN_ITEM_FLAG)
        return GET_HIDDEN_ITEM_FLAG(hiddenItem) + FLAG_HIDDEN_ITEMS_START;
    else if (attr == HIDDEN_ITEM_QUANTITY)
        return GET_HIDDEN_ITEM_QUANTITY(hiddenItem);
    else if (attr == HIDDEN_ITEM_UNDERFOOT)
        return GET_HIDDEN_ITEM_UNDERFOOT(hiddenItem);
    else // Invalid
        return 1;
}

bool8 DoesPlayerPartyContainSpecies(void)
{
    u8 partyCount = CalculatePlayerPartyCount();
    u8 i;
    for (i = 0; i < partyCount; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG, NULL) == gSpecialVar_0x8004)
            return TRUE;
    }
    return FALSE;
}

static const u8 sMartMaps[][3] = {
    {MAP(MAP_VIRIDIAN_CITY_MART),   1},
    {MAP(MAP_PEWTER_CITY_MART),     3},
    {MAP(MAP_CERULEAN_CITY_MART),   1},
    {MAP(MAP_LAVENDER_TOWN_MART),   1},
    {MAP(MAP_VERMILION_CITY_MART),  1},
    {MAP(MAP_FUSHCIA_CITY_MART),    1},
    {MAP(MAP_CINNABAR_ISLAND_MART), 1},
    {MAP(MAP_SAFFRON_CITY_MART),    1},
    {MAP(MAP_THREE_ISLAND_MART),    1},
    {MAP(MAP_FOUR_ISLAND_MART),     1},
    {MAP(MAP_SEVEN_ISLAND_MART),    1},
    {MAP(MAP_SIX_ISLAND_MART),      1}
};

u8 GetMartClerkObjectId(void)
{
    u8 i;
    for (i = 0; i < NELEMS(sMartMaps); i++)
    {
        if (gSaveBlock1Ptr->location.mapGroup == sMartMaps[i][0] && gSaveBlock1Ptr->location.mapNum == sMartMaps[i][1])
            return sMartMaps[i][2];
    }
    return 1;
}

void SetUsedPkmnCenterQuestLogEvent(void)
{
    SetQuestLogEvent(QL_EVENT_USED_PKMN_CENTER, NULL);
}

static const struct {
    u16 inside_grp;
    u16 inside_num;
    u16 outside_grp;
    u16 outside_num;
} sInsideOutsidePairs[] = {
    [QL_LOCATION_HOME]               = {MAP(MAP_PALLET_TOWN_PLAYERS_HOUSE_1F),          MAP(MAP_PALLET_TOWN)},
    [QL_LOCATION_OAKS_LAB]           = {MAP(MAP_PALLET_TOWN_PROFESSOR_OAKS_LAB),        MAP(MAP_PALLET_TOWN)},
    [QL_LOCATION_VIRIDIAN_GYM]       = {MAP(MAP_VIRIDIAN_CITY_GYM),                     MAP(MAP_VIRIDIAN_CITY)},
    [QL_LOCATION_LEAGUE_GATE_1]      = {MAP(MAP_ROUTE22_NORTH_ENTRANCE),                MAP(MAP_ROUTE22)},
    [QL_LOCATION_LEAGUE_GATE_2]      = {MAP(MAP_ROUTE22_NORTH_ENTRANCE),                MAP(MAP_ROUTE23)},
    [QL_LOCATION_VIRIDIAN_FOREST_1]  = {MAP(MAP_VIRIDIAN_FOREST),                       MAP(MAP_ROUTE2_VIRIDIAN_FOREST_SOUTH_ENTRANCE)},
    [QL_LOCATION_VIRIDIAN_FOREST_2]  = {MAP(MAP_VIRIDIAN_FOREST),                       MAP(MAP_ROUTE2_VIRIDIAN_FOREST_NORTH_ENTRANCE)},
    [QL_LOCATION_PEWTER_MUSEUM]      = {MAP(MAP_PEWTER_CITY_MUSEUM_1F),                 MAP(MAP_PEWTER_CITY)},
    [QL_LOCATION_PEWTER_GYM]         = {MAP(MAP_PEWTER_CITY_GYM),                       MAP(MAP_PEWTER_CITY)},
    [QL_LOCATION_MT_MOON_1]          = {MAP(MAP_MT_MOON_1F),                            MAP(MAP_ROUTE4)},
    [QL_LOCATION_MT_MOON_2]          = {MAP(MAP_MT_MOON_B1F),                           MAP(MAP_ROUTE4)},
    [QL_LOCATION_CERULEAN_GYM]       = {MAP(MAP_CERULEAN_CITY_GYM),                     MAP(MAP_CERULEAN_CITY)},
    [QL_LOCATION_BIKE_SHOP]          = {MAP(MAP_CERULEAN_CITY_BIKE_SHOP),               MAP(MAP_CERULEAN_CITY)},
    [QL_LOCATION_BILLS_HOUSE]        = {MAP(MAP_ROUTE25_SEA_COTTAGE),                   MAP(MAP_ROUTE25)},
    [QL_LOCATION_DAY_CARE]           = {MAP(MAP_ROUTE5_POKEMON_DAY_CARE),               MAP(MAP_ROUTE5)},
    [QL_LOCATION_UNDERGROUND_PATH_1] = {MAP(MAP_UNDERGROUND_PATH_NORTH_ENTRANCE),       MAP(MAP_ROUTE5)},
    [QL_LOCATION_UNDERGROUND_PATH_2] = {MAP(MAP_UNDERGROUND_PATH_SOUTH_ENTRANCE),       MAP(MAP_ROUTE6)},
    [QL_LOCATION_PKMN_FAN_CLUB]      = {MAP(MAP_VERMILION_CITY_POKEMON_FAN_CLUB),       MAP(MAP_VERMILION_CITY)},
    [QL_LOCATION_VERMILION_GYM]      = {MAP(MAP_VERMILION_CITY_GYM),                    MAP(MAP_VERMILION_CITY)},
    [QL_LOCATION_SS_ANNE]            = {MAP(MAP_SSANNE_1F_CORRIDOR),                    MAP(MAP_VERMILION_CITY)},
    [QL_LOCATION_DIGLETTS_CAVE_1]    = {MAP(MAP_DIGLETTS_CAVE_NORTH_ENTRANCE),          MAP(MAP_ROUTE2)},
    [QL_LOCATION_DIGLETTS_CAVE_2]    = {MAP(MAP_DIGLETTS_CAVE_SOUTH_ENTRANCE),          MAP(MAP_ROUTE11)},
    [QL_LOCATION_ROCK_TUNNEL_1]      = {MAP(MAP_ROCK_TUNNEL_1F),                        MAP(MAP_ROUTE10)},
    [QL_LOCATION_ROCK_TUNNEL_2]      = {MAP(MAP_ROCK_TUNNEL_1F),                        MAP(MAP_ROUTE10)},
    [QL_LOCATION_POWER_PLANT]        = {MAP(MAP_POWER_PLANT),                           MAP(MAP_ROUTE10)},
    [QL_LOCATION_PKMN_TOWER]         = {MAP(MAP_POKEMON_TOWER_1F),                      MAP(MAP_LAVENDER_TOWN)},
    [QL_LOCATION_VOLUNTEER_HOUSE]    = {MAP(MAP_LAVENDER_TOWN_VOLUNTEER_POKEMON_HOUSE), MAP(MAP_LAVENDER_TOWN)},
    [QL_LOCATION_NAME_RATERS_HOUSE]  = {MAP(MAP_LAVENDER_TOWN_HOUSE2),                  MAP(MAP_LAVENDER_TOWN)},
    [QL_LOCATION_UNDERGROUND_PATH_3] = {MAP(MAP_UNDERGROUND_PATH_EAST_ENTRANCE),        MAP(MAP_ROUTE8)},
    [QL_LOCATION_UNDERGROUND_PATH_4] = {MAP(MAP_UNDERGROUND_PATH_WEST_ENTRANCE),        MAP(MAP_ROUTE7)},
    [QL_LOCATION_CELADON_DEPT_STORE] = {MAP(MAP_CELADON_CITY_DEPARTMENT_STORE_1F),      MAP(MAP_CELADON_CITY)},
    [QL_LOCATION_CELADON_MANSION]    = {MAP(MAP_CELADON_CITY_CONDOMINIUMS_1F),          MAP(MAP_CELADON_CITY)},
    [QL_LOCATION_GAME_CORNER]        = {MAP(MAP_CELADON_CITY_GAME_CORNER),              MAP(MAP_CELADON_CITY)},
    [QL_LOCATION_CELADON_GYM]        = {MAP(MAP_CELADON_CITY_GYM),                      MAP(MAP_CELADON_CITY)},
    [QL_LOCATION_CELADON_RESTAURANT] = {MAP(MAP_CELADON_CITY_RESTAURANT),               MAP(MAP_CELADON_CITY)},
    [QL_LOCATION_ROCKET_HIDEOUT]     = {MAP(MAP_ROCKET_HIDEOUT_B1F),                    MAP(MAP_CELADON_CITY_GAME_CORNER)},
    [QL_LOCATION_SAFARI_ZONE]        = {MAP(MAP_SAFARI_ZONE_CENTER),                    MAP(MAP_FUSHCIA_CITY_SAFARI_ZONE_ENTRANCE)},
    [QL_LOCATION_FUSHCIA_GYM]        = {MAP(MAP_FUSHCIA_CITY_GYM),                      MAP(MAP_FUSHCIA_CITY)},
    [QL_LOCATION_WARDENS_HOME]       = {MAP(MAP_FUSHCIA_CITY_WARDENS_HOUSE),            MAP(MAP_FUSHCIA_CITY)},
    [QL_LOCATION_FIGHTING_DOJO]      = {MAP(MAP_SAFFRON_CITY_DOJO),                     MAP(MAP_SAFFRON_CITY)},
    [QL_LOCATION_SAFFRON_GYM]        = {MAP(MAP_SAFFRON_CITY_GYM),                      MAP(MAP_SAFFRON_CITY)},
    [QL_LOCATION_SILPH_CO]           = {MAP(MAP_SILPH_CO_1F),                           MAP(MAP_SAFFRON_CITY)},
    [QL_LOCATION_SEAFOAM_ISLANDS_1]  = {MAP(MAP_SEAFOAM_ISLANDS_1F),                    MAP(MAP_ROUTE20)},
    [QL_LOCATION_SEAFOAM_ISLANDS_2]  = {MAP(MAP_SEAFOAM_ISLANDS_1F),                    MAP(MAP_ROUTE20)},
    [QL_LOCATION_PKMN_MANSION]       = {MAP(MAP_POKEMON_MANSION_1F),                    MAP(MAP_CINNABAR_ISLAND)},
    [QL_LOCATION_CINNABAR_GYM]       = {MAP(MAP_CINNABAR_ISLAND_GYM),                   MAP(MAP_CINNABAR_ISLAND)},
    [QL_LOCATION_CINNABAR_LAB]       = {MAP(MAP_CINNABAR_ISLAND_POKEMON_LAB_ENTRANCE),  MAP(MAP_CINNABAR_ISLAND)},
    [QL_LOCATION_VICTORY_ROAD_1]     = {MAP(MAP_VICTORY_ROAD_1F),                       MAP(MAP_ROUTE23)},
    [QL_LOCATION_VICTORY_ROAD_2]     = {MAP(MAP_VICTORY_ROAD_2F),                       MAP(MAP_ROUTE23)},
    [QL_LOCATION_PKMN_LEAGUE]        = {MAP(MAP_INDIGO_PLATEAU_POKEMON_CENTER_1F),      MAP(MAP_INDIGO_PLATEAU_EXTERIOR)},
    [QL_LOCATION_CERULEAN_CAVE]      = {MAP(MAP_CERULEAN_CAVE_1F),                      MAP(MAP_CERULEAN_CITY)}
};

void QuestLog_CheckDepartingIndoorsMap(void)
{
    u8 i;
    for (i = 0; i < NELEMS(sInsideOutsidePairs); i++)
    {
        if (gSaveBlock1Ptr->location.mapGroup == sInsideOutsidePairs[i].inside_grp && gSaveBlock1Ptr->location.mapNum == sInsideOutsidePairs[i].inside_num)
        {
            if (VarGet(VAR_QL_ENTRANCE) != QL_LOCATION_ROCKET_HIDEOUT || i != QL_LOCATION_GAME_CORNER)
            {
                VarSet(VAR_QL_ENTRANCE, i);
                FlagSet(FLAG_SYS_QL_DEPARTED);
            }
            break;
        }
    }
}

void QuestLog_TryRecordDepartedLocation(void)
{
    s16 x, y;
    struct QuestLogEvent_Departed data;
    u16 locationId = VarGet(VAR_QL_ENTRANCE);
    data.mapSec = 0;
    data.locationId = 0;
    if (FlagGet(FLAG_SYS_QL_DEPARTED))
    {
        if (locationId == QL_LOCATION_VIRIDIAN_FOREST_1)
        {
            if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_ROUTE2_VIRIDIAN_FOREST_SOUTH_ENTRANCE)
              && (gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_ROUTE2_VIRIDIAN_FOREST_SOUTH_ENTRANCE)
               || gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_ROUTE2_VIRIDIAN_FOREST_NORTH_ENTRANCE)))
            {
                data.mapSec = MAPSEC_ROUTE_2;
                if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_ROUTE2_VIRIDIAN_FOREST_SOUTH_ENTRANCE))
                    data.locationId = locationId;
                else
                    data.locationId = locationId + 1;
                SetQuestLogEvent(QL_EVENT_DEPARTED, (const u16 *)&data);
                FlagClear(FLAG_SYS_QL_DEPARTED);
                return;
            }
        }
        else if (locationId == QL_LOCATION_LEAGUE_GATE_1)
        {
            if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_ROUTE22) &&
                (gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_ROUTE22)
              || gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_ROUTE23)))
            {
                data.mapSec = Overworld_GetMapHeaderByGroupAndId(sInsideOutsidePairs[locationId].inside_grp, sInsideOutsidePairs[locationId].inside_num)->regionMapSectionId;
                if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_ROUTE22))
                    data.locationId = locationId;
                else
                    data.locationId = locationId + 1;
                SetQuestLogEvent(QL_EVENT_DEPARTED, (const u16 *)&data);
                FlagClear(FLAG_SYS_QL_DEPARTED);
                return;
            }
        }
        if (gSaveBlock1Ptr->location.mapGroup == sInsideOutsidePairs[locationId].outside_grp
           && gSaveBlock1Ptr->location.mapNum == sInsideOutsidePairs[locationId].outside_num)
        {
            data.mapSec = Overworld_GetMapHeaderByGroupAndId(sInsideOutsidePairs[locationId].inside_grp, sInsideOutsidePairs[locationId].inside_num)->regionMapSectionId;
            data.locationId = locationId;
            if (locationId == QL_LOCATION_ROCK_TUNNEL_1)
            {
                PlayerGetDestCoords(&x, &y);
                if (x != 15 || y != 26)
                    data.locationId++;
            }
            else if (locationId == QL_LOCATION_SEAFOAM_ISLANDS_1)
            {
                PlayerGetDestCoords(&x, &y);
                if (x != 67 || y != 15)
                    data.locationId++;
            }
            SetQuestLogEvent(QL_EVENT_DEPARTED, (const u16 *)&data);
            FlagClear(FLAG_SYS_QL_DEPARTED);
            if (locationId == QL_LOCATION_ROCKET_HIDEOUT)
            {
                VarSet(VAR_QL_ENTRANCE, QL_LOCATION_GAME_CORNER);
                FlagSet(FLAG_SYS_QL_DEPARTED);
            }
        }
    }
}

u16 GetMysteryGiftCardStat(void)
{
    switch (gSpecialVar_Result)
    {
    case GET_NUM_STAMPS:
        return MysteryGift_GetCardStat(CARD_STAT_NUM_STAMPS);
    case GET_MAX_STAMPS:
        return MysteryGift_GetCardStat(CARD_STAT_MAX_STAMPS);
    case GET_CARD_BATTLES_WON:
        return MysteryGift_GetCardStat(CARD_STAT_BATTLES_WON);
    case GET_CARD_BATTLES_LOST:
        return MysteryGift_GetCardStat(CARD_STAT_BATTLES_LOST);
    case GET_CARD_NUM_TRADES:
        return MysteryGift_GetCardStat(CARD_STAT_NUM_TRADES);
    default:
        AGB_ASSERT_EX(0, ABSPATH("scr_tool.c"), 3873);
        return 0;
    }
}

void SetPCBoxToSendMon(u8 boxId)
{
    sPCBoxToSendMon = boxId;
}

u16 GetPCBoxToSendMon(void)
{
    return sPCBoxToSendMon;
}

bool8 ShouldShowBoxWasFullMessage(void)
{
    if (FlagGet(FLAG_SHOWN_BOX_WAS_FULL_MESSAGE))
        return FALSE;
    if (StorageGetCurrentBox() == VarGet(VAR_PC_BOX_TO_SEND_MON))
        return FALSE;
    FlagSet(FLAG_SHOWN_BOX_WAS_FULL_MESSAGE);
    return TRUE;
}

bool8 IsDestinationBoxFull(void)
{
    s32 i;
    s32 j;
    SetPCBoxToSendMon(VarGet(VAR_PC_BOX_TO_SEND_MON));
    i = StorageGetCurrentBox();
    do
    {
        for (j = 0; j < IN_BOX_COUNT; j++)
        {
            if (GetBoxMonData(GetBoxedMonPtr(i, j), MON_DATA_SPECIES, NULL) == SPECIES_NONE)
            {
                if (GetPCBoxToSendMon() != i)
                    FlagClear(FLAG_SHOWN_BOX_WAS_FULL_MESSAGE);
                VarSet(VAR_PC_BOX_TO_SEND_MON, i);
                return ShouldShowBoxWasFullMessage();
            }
        }
        i++;
        if (i == TOTAL_BOXES_COUNT)
            i = 0;
    } while (i != StorageGetCurrentBox());
    return FALSE;
}

const u16 sPokeCenter1FMaps[] = {
    MAP_VIRIDIAN_CITY_POKEMON_CENTER_1F,
    MAP_PEWTER_CITY_POKEMON_CENTER_1F,
    MAP_CERULEAN_CITY_POKEMON_CENTER_1F,
    MAP_LAVENDER_TOWN_POKEMON_CENTER_1F,
    MAP_VERMILION_CITY_POKEMON_CENTER_1F,
    MAP_CELADON_CITY_POKEMON_CENTER_1F,
    MAP_FUSHCIA_CITY_POKEMON_CENTER_1F,
    MAP_CINNABAR_ISLAND_POKEMON_CENTER_1F,
    MAP_INDIGO_PLATEAU_POKEMON_CENTER_1F,
    MAP_SAFFRON_CITY_POKEMON_CENTER_1F,
    MAP_ROUTE4_POKEMON_CENTER_1F,
    MAP_ROUTE10_POKEMON_CENTER_1F,
    MAP_ONE_ISLAND_POKEMON_CENTER_1F,
    MAP_THREE_ISLAND_POKEMON_CENTER_1F,
    MAP_FOUR_ISLAND_POKEMON_CENTER_1F,
    MAP_FIVE_ISLAND_POKEMON_CENTER_1F,
    MAP_SEVEN_ISLAND_POKEMON_CENTER_1F,
    MAP_SIX_ISLAND_POKEMON_CENTER_1F,
    MAP_UNION_ROOM,
    MAP_UNDEFINED
};

bool8 UsedPokemonCenterWarp(void)
{
    s32 i;
    u16 mapno = (gLastUsedWarp.mapGroup << 8) + gLastUsedWarp.mapNum;
    for (i = 0; sPokeCenter1FMaps[i] != MAP_UNDEFINED; i++)
    {
        if (sPokeCenter1FMaps[i] == mapno)
            return TRUE;
    }
    return FALSE;
}

bool8 BufferTMHMMoveName(void)
{
    // 8004 = item ID
    if (gSpecialVar_0x8004 >= ITEM_TM01 && gSpecialVar_0x8004 <= ITEM_HM08)
    {
        StringCopy(gStringVar1, gLongMoveNames[ItemIdToBattleMoveId(gSpecialVar_0x8004)]);
        return TRUE;
    }
    else
        return FALSE;
}

void RunMassageCooldownStepCounter(void)
{
    u16 count = VarGet(VAR_MASSAGE_COOLDOWN_STEP_COUNTER);
    if (count < 500)
        VarSet(VAR_MASSAGE_COOLDOWN_STEP_COUNTER, count + 1);
}

void DaisyMassageServices(void)
{
    AdjustFriendship(&gPlayerParty[gSpecialVar_0x8004], FRIENDSHIP_EVENT_MASSAGE);
    VarSet(VAR_MASSAGE_COOLDOWN_STEP_COUNTER, 0);
}

static const u16 sEliteFourLightingPalettes[][16] = {
    INCBIN_U16("graphics/field_specials/elite_four_lighting_0.gbapal"),
    INCBIN_U16("graphics/field_specials/elite_four_lighting_1.gbapal"),
    INCBIN_U16("graphics/field_specials/elite_four_lighting_2.gbapal"),
    INCBIN_U16("graphics/field_specials/elite_four_lighting_3.gbapal"),
    INCBIN_U16("graphics/field_specials/elite_four_lighting_4.gbapal"),
    INCBIN_U16("graphics/field_specials/elite_four_lighting_5.gbapal"),
    INCBIN_U16("graphics/field_specials/elite_four_lighting_6.gbapal"),
    INCBIN_U16("graphics/field_specials/elite_four_lighting_7.gbapal"),
    INCBIN_U16("graphics/field_specials/elite_four_lighting_8.gbapal"),
    INCBIN_U16("graphics/field_specials/elite_four_lighting_9.gbapal"),
    INCBIN_U16("graphics/field_specials/elite_four_lighting_10.gbapal"),
    INCBIN_U16("graphics/field_specials/elite_four_lighting_11.gbapal")
};

static const u16 sChampionRoomLightingPalettes[][16] = {
    INCBIN_U16("graphics/field_specials/champion_room_lighting_0.gbapal"),
    INCBIN_U16("graphics/field_specials/champion_room_lighting_1.gbapal"),
    INCBIN_U16("graphics/field_specials/champion_room_lighting_2.gbapal"),
    INCBIN_U16("graphics/field_specials/champion_room_lighting_3.gbapal"),
    INCBIN_U16("graphics/field_specials/champion_room_lighting_4.gbapal"),
    INCBIN_U16("graphics/field_specials/champion_room_lighting_5.gbapal"),
    INCBIN_U16("graphics/field_specials/champion_room_lighting_6.gbapal"),
    INCBIN_U16("graphics/field_specials/champion_room_lighting_7.gbapal"),
    INCBIN_U16("graphics/field_specials/champion_room_lighting_8.gbapal")
};

static const u8 sEliteFourLightingTimers[] = {
    40,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12
};

static const u8 sChampionRoomLightingTimers[] = {
    20,
     8,
     8,
     8,
     8,
     8,
     8,
     8
};

void DoPokemonLeagueLightingEffect(void)
{
    u8 taskId = CreateTask(Task_RunPokemonLeagueLightingEffect, 8);
    s16 *data = gTasks[taskId].data;
    if (FlagGet(FLAG_TEMP_3) == TRUE)
    {
        gTasks[taskId].func = Task_CancelPokemonLeagueLightingEffect;
    }
    else
    {
        if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_POKEMON_LEAGUE_CHAMPIONS_ROOM) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_POKEMON_LEAGUE_CHAMPIONS_ROOM))
        {
            data[0] = sChampionRoomLightingTimers[0];
            data[2] = 8;
            LoadPalette(sChampionRoomLightingPalettes[0], BG_PLTT_ID(7), PLTT_SIZE_4BPP);
        }
        else
        {
            data[0] = sEliteFourLightingTimers[0];
            data[2] = 11;
            LoadPalette(sEliteFourLightingPalettes[0], BG_PLTT_ID(7), PLTT_SIZE_4BPP);
        }
        data[1] = 0;
        ApplyGlobalTintToPaletteSlot(7, 1);
    }
}

static void Task_RunPokemonLeagueLightingEffect(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!gPaletteFade.active
     && FlagGet(FLAG_TEMP_2) != FALSE
     && FlagGet(FLAG_TEMP_5) != TRUE
     && gGlobalFieldTintMode != QL_TINT_BACKUP_GRAYSCALE
     && --data[0] == 0
    )
    {
        if (++data[1] == data[2])
            data[1] = 0;

        if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_POKEMON_LEAGUE_CHAMPIONS_ROOM) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_POKEMON_LEAGUE_CHAMPIONS_ROOM))
        {
            data[0] = sChampionRoomLightingTimers[data[1]];
            LoadPalette(sChampionRoomLightingPalettes[data[1]], BG_PLTT_ID(7), PLTT_SIZE_4BPP);
        }
        else
        {
            data[0] = sEliteFourLightingTimers[data[1]];
            LoadPalette(sEliteFourLightingPalettes[data[1]], BG_PLTT_ID(7), PLTT_SIZE_4BPP);
        }
        ApplyGlobalTintToPaletteSlot(7, 1);
    }
}

static void Task_CancelPokemonLeagueLightingEffect(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (FlagGet(FLAG_TEMP_4) != FALSE)
    {
        if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_POKEMON_LEAGUE_CHAMPIONS_ROOM) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_POKEMON_LEAGUE_CHAMPIONS_ROOM))
            LoadPalette(sChampionRoomLightingPalettes[8], BG_PLTT_ID(7), PLTT_SIZE_4BPP);
        else
            LoadPalette(sEliteFourLightingPalettes[11], BG_PLTT_ID(7), PLTT_SIZE_4BPP);
        ApplyGlobalTintToPaletteSlot(7, 1);
        if (gPaletteFade.active)
        {
            BlendPalettes(0x00000080, 16, RGB_BLACK);
        }
        DestroyTask(taskId);
    }
}

void StopPokemonLeagueLightingEffectTask(void)
{
    if (FuncIsActiveTask(Task_RunPokemonLeagueLightingEffect) == TRUE)
    {
        DestroyTask(FindTaskIdByFunc(Task_RunPokemonLeagueLightingEffect));
    }
}

static const u16 sCapeBrinkCompatibleSpecies[] = {
    SPECIES_BULBASAUR,
    SPECIES_IVYSAUR,
    SPECIES_VENUSAUR,
    SPECIES_SQUIRTLE,
    SPECIES_CHARMANDER,
    SPECIES_CHARMELEON,
    SPECIES_CHARIZARD,
};

bool8 CapeBrinkGetMoveToTeachLeadPokemon(void)
{
    // Returns:
    //   8005 = Move tutor index
    //   8006 = Num moves known by lead mon
    //   8007 = Index of lead mon
    //   to specialvar = whether a move can be taught in the first place
    u8 tutorMonId = 0;
    u8 numMovesKnown = 0;
    u8 leadMonSlot = GetLeadMonIndex();
    u8 i;
    gSpecialVar_0x8007 = leadMonSlot;
    for (i = 0; i < NELEMS(sCapeBrinkCompatibleSpecies); i++)
    {
        if (GetMonData(&gPlayerParty[leadMonSlot], MON_DATA_SPECIES_OR_EGG, NULL) == sCapeBrinkCompatibleSpecies[i])
        {
            tutorMonId = i;
            break;
        }
    }
    if (tutorMonId < 3)
    {
        StringCopy(gStringVar2, gLongMoveNames[MOVE_GRASS_PLEDGE]);
        gSpecialVar_0x8005 = MOVETUTOR_GRASS_PLEDGE;
        if (FlagGet(FLAG_TUTOR_GRASS_PLEDGE) == TRUE)
            return FALSE;
    }
    else if (tutorMonId > 3)
    {
        StringCopy(gStringVar2, gLongMoveNames[MOVE_FIRE_PLEDGE]);
        gSpecialVar_0x8005 = MOVETUTOR_FIRE_PLEDGE;
        if (FlagGet(FLAG_TUTOR_FIRE_PLEDGE) == TRUE)
            return FALSE;
    }
    else
    {
        StringCopy(gStringVar2, gLongMoveNames[MOVE_WATER_PLEDGE]);
        gSpecialVar_0x8005 = MOVETUTOR_WATER_PLEDGE;
        if (FlagGet(FLAG_TUTOR_WATER_PLEDGE) == TRUE)
            return FALSE;
    }
    if (GetMonData(&gPlayerParty[leadMonSlot], MON_DATA_MOVE1) != MOVE_NONE)
        numMovesKnown++;
    if (GetMonData(&gPlayerParty[leadMonSlot], MON_DATA_MOVE2) != MOVE_NONE)
        numMovesKnown++;
    if (GetMonData(&gPlayerParty[leadMonSlot], MON_DATA_MOVE3) != MOVE_NONE)
        numMovesKnown++;
    if (GetMonData(&gPlayerParty[leadMonSlot], MON_DATA_MOVE4) != MOVE_NONE)
        numMovesKnown++;
    gSpecialVar_0x8006 = numMovesKnown;
    return TRUE;
}

bool8 HasLearnedAllMovesFromCapeBrinkTutor(void)
{
    // 8005 is set by CapeBrinkGetMoveToTeachLeadPokemon
    u8 r4 = 0;
    if (gSpecialVar_0x8005 == MOVETUTOR_GRASS_PLEDGE)
        FlagClear(FLAG_TUTOR_GRASS_PLEDGE);
    else if (gSpecialVar_0x8005 == MOVETUTOR_FIRE_PLEDGE)
        FlagClear(FLAG_TUTOR_FIRE_PLEDGE);
    else
        FlagClear(FLAG_TUTOR_WATER_PLEDGE);
    if (FlagGet(FLAG_TUTOR_GRASS_PLEDGE) == TRUE)
        r4++;
    if (FlagGet(FLAG_TUTOR_FIRE_PLEDGE) == TRUE)
        r4++;
    if (FlagGet(FLAG_TUTOR_WATER_PLEDGE) == TRUE)
        r4++;
    if (r4 == 3)
        return TRUE;
    else
        return FALSE;
}

bool8 CutMoveRuinValleyCheck(void)
{
    if (FlagGet(FLAG_USED_CUT_ON_RUIN_VALLEY_BRAILLE) != TRUE
     && gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_SIX_ISLAND_RUIN_VALLEY)
     && gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_SIX_ISLAND_RUIN_VALLEY)
     && gSaveBlock1Ptr->pos.x == 24
     && gSaveBlock1Ptr->pos.y == 25
     && GetPlayerFacingDirection() == DIR_NORTH
    )
        return TRUE;
    else
        return FALSE;
}

void CutMoveOpenDottedHoleDoor(void)
{
    MapGridSetMetatileIdAt(31, 31, METATILE_SeviiIslands67_DottedHoleDoor_Open);
    DrawWholeMapView();
    PlaySE(SE_BANG);
    FlagSet(FLAG_USED_CUT_ON_RUIN_VALLEY_BRAILLE);
    UnlockPlayerFieldControls();
}

static const u16 sDeoxysObjectPals[][16] = {
    INCBIN_U16("graphics/field_specials/deoxys_rock_0.gbapal"),
    INCBIN_U16("graphics/field_specials/deoxys_rock_1.gbapal"),
    INCBIN_U16("graphics/field_specials/deoxys_rock_2.gbapal"),
    INCBIN_U16("graphics/field_specials/deoxys_rock_3.gbapal"),
    INCBIN_U16("graphics/field_specials/deoxys_rock_4.gbapal"),
    INCBIN_U16("graphics/field_specials/deoxys_rock_5.gbapal"),
    INCBIN_U16("graphics/field_specials/deoxys_rock_6.gbapal"),
    INCBIN_U16("graphics/field_specials/deoxys_rock_7.gbapal"),
    INCBIN_U16("graphics/field_specials/deoxys_rock_8.gbapal"),
    INCBIN_U16("graphics/field_specials/deoxys_rock_9.gbapal"),
    INCBIN_U16("graphics/field_specials/deoxys_rock_10.gbapal")
};

static const u8 sDeoxysCoords[][2] = {
    {15, 12},
    {11, 14},
    {15,  8},
    {19, 14},
    {12, 11},
    {18, 11},
    {15, 14},
    {11, 14},
    {19, 14},
    {15, 15},
    {15, 10}
};

static const u8 sDeoxysStepCaps[] = {
    4,
    8,
    8,
    8,
    4,
    4,
    4,
    6,
    3,
    3
};

void DoDeoxysTriangleInteraction(void)
{
    CreateTask(Task_DoDeoxysTriangleInteraction, 8);
}

static void Task_DoDeoxysTriangleInteraction(u8 taskId)
{
    u16 r5;
    u16 r6;
    if (FlagGet(FLAG_SYS_DEOXYS_AWAKENED) == TRUE)
    {
        gSpecialVar_Result = 3;
        ScriptContext_Enable();
        DestroyTask(taskId);
    }
    else
    {
        r5 = VarGet(VAR_DEOXYS_INTERACTION_NUM);
        r6 = VarGet(VAR_DEOXYS_INTERACTION_STEP_COUNTER);
        VarSet(VAR_DEOXYS_INTERACTION_STEP_COUNTER, 0);
        if (r5 != 0 && sDeoxysStepCaps[r5 - 1] < r6)
        {
            MoveDeoxysObject(0);
            VarSet(VAR_DEOXYS_INTERACTION_NUM, 0);
            gSpecialVar_Result = 0;
            DestroyTask(taskId);
        }
        else if (r5 == 10)
        {
            FlagSet(FLAG_SYS_DEOXYS_AWAKENED);
            gSpecialVar_Result = 2;
            ScriptContext_Enable();
            DestroyTask(taskId);
        }
        else
        {
            r5++;
            MoveDeoxysObject(r5);
            VarSet(VAR_DEOXYS_INTERACTION_NUM, r5);
            gSpecialVar_Result = 1;
            DestroyTask(taskId);
        }
    }
}

static void MoveDeoxysObject(u8 num)
{
    u8 mapObjId;
    LoadPalette(sDeoxysObjectPals[num], OBJ_PLTT_ID(10), PLTT_SIZEOF(4));
    ApplyGlobalFieldPaletteTint(10);
    TryGetObjectEventIdByLocalIdAndMap(LOCALID_BIRTH_ISLAND_EXTERIOR_ROCK, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &mapObjId);
    if (num == 0) {
        VarSet(VAR_TEMP_A, VarGet(VAR_TEMP_A) + 1);
        PlaySE(SE_M_CONFUSE_RAY);

    }
    else
        PlaySE(SE_DEOXYS_MOVE);
    CreateTask(Task_WaitDeoxysFieldEffect, 8);
    gFieldEffectArguments[0] = LOCALID_BIRTH_ISLAND_EXTERIOR_ROCK;
    gFieldEffectArguments[1] =  MAP_NUM(MAP_BIRTH_ISLAND_EXTERIOR);
    gFieldEffectArguments[2] = MAP_GROUP(MAP_BIRTH_ISLAND_EXTERIOR);
    gFieldEffectArguments[3] = sDeoxysCoords[num][0];
    gFieldEffectArguments[4] = sDeoxysCoords[num][1];
    if (num == 0)
        gFieldEffectArguments[5] = 60;
    else
        gFieldEffectArguments[5] = 5;
    FieldEffectStart(FLDEFF_MOVE_DEOXYS_ROCK);
    SetObjEventTemplateCoords(LOCALID_BIRTH_ISLAND_EXTERIOR_ROCK, sDeoxysCoords[num][0], sDeoxysCoords[num][1]);
}

static void Task_WaitDeoxysFieldEffect(u8 taskId)
{
    if (!FieldEffectActiveListContains(FLDEFF_MOVE_DEOXYS_ROCK))
    {
        ScriptContext_Enable();
        DestroyTask(taskId);
    }
}

void IncrementBirthIslandRockStepCount(void)
{
    u16 count = VarGet(VAR_DEOXYS_INTERACTION_STEP_COUNTER);
    if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_BIRTH_ISLAND_EXTERIOR) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_BIRTH_ISLAND_EXTERIOR))
    {
        count++;
        if (count > 99)
            VarSet(VAR_DEOXYS_INTERACTION_STEP_COUNTER, 0);
        else
            VarSet(VAR_DEOXYS_INTERACTION_STEP_COUNTER, count);
    }
}

void SetDeoxysTrianglePalette(void)
{
    u8 num = VarGet(VAR_DEOXYS_INTERACTION_NUM);
    LoadPalette(sDeoxysObjectPals[num], OBJ_PLTT_ID(10), PLTT_SIZEOF(4));
    ApplyGlobalFieldPaletteTint(10);
}

bool8 IsBadEggInParty(void)
{
    u8 partyCount = CalculatePlayerPartyCount();
    u8 i;
    for (i = 0; i < partyCount; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SANITY_IS_BAD_EGG) == TRUE)
            return TRUE;
    }
    return FALSE;
}

bool8 IsPlayerNotInTrainerTowerLobby(void)
{
    if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_TRAINER_TOWER_LOBBY) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_TRAINER_TOWER_LOBBY))
        return FALSE;
    else
        return TRUE;
}

void BrailleCursorToggle(void)
{
    // 8004 = x - 27
    // 8005 = y
    // 8006 = action (0 = create, 1 = delete)
    u16 x;
    if (gQuestLogState != QL_STATE_PLAYBACK)
    {
        x = gSpecialVar_0x8004 + 27;
        if (gSpecialVar_0x8006 == 0)
            sBrailleTextCursorSpriteID = CreateTextCursorSprite(0, x, gSpecialVar_0x8005, 0, 0);
        else
            DestroyTextCursorSprite(sBrailleTextCursorSpriteID);
    }
}

bool8 PlayerPartyContainsSpeciesWithPlayerID(void)
{
    // 8004 = species
    u8 playerCount = CalculatePlayerPartyCount();
    u8 i;
    for (i = 0; i < playerCount; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG, NULL) == gSpecialVar_0x8004 
            && GetPlayerTrainerId() == GetMonData(&gPlayerParty[i], MON_DATA_OT_ID, NULL))
            return TRUE;
    }
    return FALSE;
}

/*
 * Determines which of Lorelei's doll collection to show
 * based on how many times you've entered the Hall of Fame.
 */
void UpdateLoreleiDollCollection(void)
{
    u32 numHofClears = GetGameStat(GAME_STAT_ENTERED_HOF);
    if (numHofClears >= 25)
    {
    }
}

void LoopWingFlapSound(void)
{
    // 8004 = Num flaps
    // 8005 = Frame delay between flaps
    CreateTask(Task_WingFlapSound, 8);
    PlaySE(SE_M_WING_ATTACK);
}

static void Task_WingFlapSound(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    data[1]++;
    if (data[1] == gSpecialVar_0x8005)
    {
        data[0]++;
        data[1] = 0;
        PlaySE(SE_M_WING_ATTACK);
    }
    if (data[0] == gSpecialVar_0x8004 - 1)
        DestroyTask(taskId);
}

u16 ScriptGetPartyMonSpecies(void)
{
    return GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_SPECIES_OR_EGG, NULL);
}

bool32 ScriptIsPartyMonFainted(void)
{
    return GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_HP, NULL) == 0;
}

void ScriptPartyContainsSpecies(void)
{
    // sorry celia this code has an issue and it appears unused so I'm commenting it out for now
/*     s16 PartyContainsMon = 0;
    s16 i;

    for(i = 0; i < PARTY_SIZE; i++) {
        if(gSpecialVar_0x8004 == GetMonData(i, MON_DATA_SPECIES_OR_EGG, NULL)) {
            PartyContainsMon++;
        }
    }
    if(PartyContainsMon > 0) {
        gSpecialVar_Result = TRUE;
    }
    */ 
}

void GetUnownCount(void) {
    gSpecialVar_Result = GetGameStat(GAME_STAT_UNOWNS_CAUGHT);
}

void SwapLayout() {
    SetCurrentMapLayout(LAYOUT_ROUTE19_LAYOUT_PIT);
    InitMapLayoutData(&gMapHeader);
    DrawWholeMapView();
}


static const u32 sChapterTitleTiles[] = INCBIN_U32("graphics/chapter_title/tiles.4bpp.lz");
static const u32 sChapterTitleTilemap[] = INCBIN_U32("graphics/chapter_title/tiles.bin.lz");
static const u16 sChapterTitlePalette[] = INCBIN_U16("graphics/chapter_title/tiles.gbapal");

#define TITLE1_END_VPOS 40
#define TITLE2_START_VPOS 125
#define TITLE2_START_HPOS 29

#define WIPE1_END_HPOS 143
#define WIPE2_END_HPOS 207

#define WIPE1_DELAY 1
#define WIPE2_DELAY 162
#define END_DELAY 160

#define WIPE_SPEED 4 // in pixels per frame

#define tWipe1Delay data[0]
#define tWipe2Delay data[1]
#define tWipe1CurrHPos data[2]
#define tWipe2CurrHPos data[3]
#define tEndDelay data[4]

static void TeardownChapterTitleGfx(void)
{
    u32 i;
    u8 *buf = GetBgTilemapBuffer(0);
    memset(buf, 0, BG_SCREEN_SIZE);
    ScheduleBgCopyTilemapToVram(0);
    FlagClear(FLAG_CSR_DEBUG_NO_TRAINER_SEE);
    ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
    ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN1_ON);
}

static void Task_WipeChapterTitle(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (tWipe1Delay > 0)
    {
        FlagSet(FLAG_CSR_DEBUG_NO_TRAINER_SEE);
        tWipe1Delay--;        
        return;
    }
    
    if (tWipe1CurrHPos < WIPE1_END_HPOS)
    {
        tWipe1CurrHPos += WIPE_SPEED;
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(tWipe1CurrHPos, DISPLAY_WIDTH));
        return;
    }
    
    if (tWipe2Delay > 0)
    {
        tWipe2Delay--;        
        return;
    }

    if (tWipe2CurrHPos < WIPE2_END_HPOS)
    {
        tWipe2CurrHPos += WIPE_SPEED;
        SetGpuReg(REG_OFFSET_WIN1H, WIN_RANGE(tWipe2CurrHPos, DISPLAY_WIDTH));
        return;
    }
    
    if (tEndDelay > 0)
    {
        tEndDelay--;  
        return;
    }

    TeardownChapterTitleGfx();

    gChapterTitleRunning = FALSE;
    DestroyTask(taskId);
}

static void InitChapterTitleGfx(void)
{
    u8 *buf = GetBgTilemapBuffer(0);
    LoadBgTilemap(0, 0, 0, 0);
    DecompressAndCopyTileDataToVram(0, sChapterTitleTiles, 0, 0, 0);
    LZDecompressWram(sChapterTitleTilemap, buf);
    LoadPalette(sChapterTitlePalette, BG_PLTT_ID(14), PLTT_SIZE_4BPP * 2);
    ScheduleBgCopyTilemapToVram(0);
    
    SetGpuReg(REG_OFFSET_WININ, (WININ_WIN0_ALL & ~WININ_WIN0_BG0) | (WININ_WIN1_ALL & ~WININ_WIN1_BG0));
    SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_ALL);

    SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, DISPLAY_WIDTH));
    SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(0, TITLE1_END_VPOS));

    SetGpuReg(REG_OFFSET_WIN1H, WIN_RANGE(TITLE2_START_HPOS, DISPLAY_WIDTH));
    SetGpuReg(REG_OFFSET_WIN1V, WIN_RANGE(TITLE2_START_VPOS, DISPLAY_HEIGHT));

    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN1_ON);
}

void DrawChapterTitle(void) 
{
    u8 taskId;
    gChapterTitleRunning = TRUE;
    
    InitChapterTitleGfx();
    
    taskId = CreateTask(Task_WipeChapterTitle, 0);
    gTasks[taskId].tWipe1Delay = WIPE1_DELAY;
    gTasks[taskId].tWipe2Delay = WIPE2_DELAY;
    gTasks[taskId].tWipe2CurrHPos = TITLE2_START_HPOS;
    gTasks[taskId].tEndDelay = END_DELAY;
}




const u8 *const gKayleeNameTable[] = {
    COMPOUND_STRING("CAAGHLI"),
    COMPOUND_STRING("CAAGHLY"),
    COMPOUND_STRING("CAAHLAY"),
    COMPOUND_STRING("CAAHLEA"),
    COMPOUND_STRING("CAAHLEE"),
    COMPOUND_STRING("CAAHLEI"),
    COMPOUND_STRING("CAAHLEY"),
    COMPOUND_STRING("CAAHLHI"),
    COMPOUND_STRING("CAAHLHY"),
    COMPOUND_STRING("CAAHLI"),
    COMPOUND_STRING("CAAHLIE"),
    COMPOUND_STRING("CAAHLII"),
    COMPOUND_STRING("CAAHLIS"),
    COMPOUND_STRING("CAAHLIY"),
    COMPOUND_STRING("CAAHLLI"),
    COMPOUND_STRING("CAAHLLY"),
    COMPOUND_STRING("CAAHLY"),
    COMPOUND_STRING("CAALAEY"),
    COMPOUND_STRING("CAALAHY"),
    COMPOUND_STRING("CAALAY"),
    COMPOUND_STRING("CAALEA"),
    COMPOUND_STRING("CAALEE"),
    COMPOUND_STRING("CAALEEA"),
    COMPOUND_STRING("CAALEEE"),
    COMPOUND_STRING("CAALEEI"),
    COMPOUND_STRING("CAALEEY"),
    COMPOUND_STRING("CAALEI"),
    COMPOUND_STRING("CAALEIE"),
    COMPOUND_STRING("CAALEIH"),
    COMPOUND_STRING("CAALEIY"),
    COMPOUND_STRING("CAALEY"),
    COMPOUND_STRING("CAALHAY"),
    COMPOUND_STRING("CAALHEA"),
    COMPOUND_STRING("CAALHEE"),
    COMPOUND_STRING("CAALHEI"),
    COMPOUND_STRING("CAALHEY"),
    COMPOUND_STRING("CAALHI"),
    COMPOUND_STRING("CAALHIE"),
    COMPOUND_STRING("CAALHII"),
    COMPOUND_STRING("CAALHIS"),
    COMPOUND_STRING("CAALHIY"),
    COMPOUND_STRING("CAALHY"),
    COMPOUND_STRING("CAALI"),
    COMPOUND_STRING("CAALIE"),
    COMPOUND_STRING("CAALIEE"),
    COMPOUND_STRING("CAALIEI"),
    COMPOUND_STRING("CAALIEY"),
    COMPOUND_STRING("CAALII"),
    COMPOUND_STRING("CAALIIE"),
    COMPOUND_STRING("CAALIII"),
    COMPOUND_STRING("CAALIIS"),
    COMPOUND_STRING("CAALIS"),
    COMPOUND_STRING("CAALIY"),
    COMPOUND_STRING("CAALLAY"),
    COMPOUND_STRING("CAALLEA"),
    COMPOUND_STRING("CAALLEE"),
    COMPOUND_STRING("CAALLEI"),
    COMPOUND_STRING("CAALLEY"),
    COMPOUND_STRING("CAALLI"),
    COMPOUND_STRING("CAALLIE"),
    COMPOUND_STRING("CAALLII"),
    COMPOUND_STRING("CAALLIS"),
    COMPOUND_STRING("CAALLIY"),
    COMPOUND_STRING("CAALLY"),
    COMPOUND_STRING("CAALY"),
    COMPOUND_STRING("CAAYLAY"),
    COMPOUND_STRING("CAAYLEA"),
    COMPOUND_STRING("CAAYLEE"),
    COMPOUND_STRING("CAAYLEI"),
    COMPOUND_STRING("CAAYLEY"),
    COMPOUND_STRING("CAAYLHI"),
    COMPOUND_STRING("CAAYLHY"),
    COMPOUND_STRING("CAAYLI"),
    COMPOUND_STRING("CAAYLIE"),
    COMPOUND_STRING("CAAYLII"),
    COMPOUND_STRING("CAAYLIS"),
    COMPOUND_STRING("CAAYLIY"),
    COMPOUND_STRING("CAAYLLI"),
    COMPOUND_STRING("CAAYLLY"),
    COMPOUND_STRING("CAAYLY"),
    COMPOUND_STRING("CAEGHLI"),
    COMPOUND_STRING("CAEGHLY"),
    COMPOUND_STRING("CAEHLAY"),
    COMPOUND_STRING("CAEHLEA"),
    COMPOUND_STRING("CAEHLEE"),
    COMPOUND_STRING("CAEHLEI"),
    COMPOUND_STRING("CAEHLEY"),
    COMPOUND_STRING("CAEHLHI"),
    COMPOUND_STRING("CAEHLHY"),
    COMPOUND_STRING("CAEHLI"),
    COMPOUND_STRING("CAEHLIE"),
    COMPOUND_STRING("CAEHLII"),
    COMPOUND_STRING("CAEHLIS"),
    COMPOUND_STRING("CAEHLIY"),
    COMPOUND_STRING("CAEHLLI"),
    COMPOUND_STRING("CAEHLLY"),
    COMPOUND_STRING("CAEHLY"),
    COMPOUND_STRING("CAELAEY"),
    COMPOUND_STRING("CAELAHY"),
    COMPOUND_STRING("CAELAY"),
    COMPOUND_STRING("CAELEA"),
    COMPOUND_STRING("CAELEE"),
    COMPOUND_STRING("CAELEEA"),
    COMPOUND_STRING("CAELEEE"),
    COMPOUND_STRING("CAELEEI"),
    COMPOUND_STRING("CAELEEY"),
    COMPOUND_STRING("CAELEI"),
    COMPOUND_STRING("CAELEIE"),
    COMPOUND_STRING("CAELEIH"),
    COMPOUND_STRING("CAELEIY"),
    COMPOUND_STRING("CAELEY"),
    COMPOUND_STRING("CAELHAY"),
    COMPOUND_STRING("CAELHEA"),
    COMPOUND_STRING("CAELHEE"),
    COMPOUND_STRING("CAELHEI"),
    COMPOUND_STRING("CAELHEY"),
    COMPOUND_STRING("CAELHI"),
    COMPOUND_STRING("CAELHIE"),
    COMPOUND_STRING("CAELHII"),
    COMPOUND_STRING("CAELHIS"),
    COMPOUND_STRING("CAELHIY"),
    COMPOUND_STRING("CAELHY"),
    COMPOUND_STRING("CAELI"),
    COMPOUND_STRING("CAELIE"),
    COMPOUND_STRING("CAELIEE"),
    COMPOUND_STRING("CAELIEI"),
    COMPOUND_STRING("CAELIEY"),
    COMPOUND_STRING("CAELII"),
    COMPOUND_STRING("CAELIIE"),
    COMPOUND_STRING("CAELIII"),
    COMPOUND_STRING("CAELIIS"),
    COMPOUND_STRING("CAELIS"),
    COMPOUND_STRING("CAELIY"),
    COMPOUND_STRING("CAELLAY"),
    COMPOUND_STRING("CAELLEA"),
    COMPOUND_STRING("CAELLEE"),
    COMPOUND_STRING("CAELLEI"),
    COMPOUND_STRING("CAELLEY"),
    COMPOUND_STRING("CAELLI"),
    COMPOUND_STRING("CAELLIE"),
    COMPOUND_STRING("CAELLII"),
    COMPOUND_STRING("CAELLIS"),
    COMPOUND_STRING("CAELLIY"),
    COMPOUND_STRING("CAELLY"),
    COMPOUND_STRING("CAELY"),
    COMPOUND_STRING("CAGHLAY"),
    COMPOUND_STRING("CAGHLEA"),
    COMPOUND_STRING("CAGHLEE"),
    COMPOUND_STRING("CAGHLEI"),
    COMPOUND_STRING("CAGHLEY"),
    COMPOUND_STRING("CAGHLHI"),
    COMPOUND_STRING("CAGHLHY"),
    COMPOUND_STRING("CAGHLI"),
    COMPOUND_STRING("CAGHLIE"),
    COMPOUND_STRING("CAGHLII"),
    COMPOUND_STRING("CAGHLIS"),
    COMPOUND_STRING("CAGHLIY"),
    COMPOUND_STRING("CAGHLLI"),
    COMPOUND_STRING("CAGHLLY"),
    COMPOUND_STRING("CAGHLY"),
    COMPOUND_STRING("CAHLAEY"),
    COMPOUND_STRING("CAHLAHY"),
    COMPOUND_STRING("CAHLAY"),
    COMPOUND_STRING("CAHLEA"),
    COMPOUND_STRING("CAHLEE"),
    COMPOUND_STRING("CAHLEEA"),
    COMPOUND_STRING("CAHLEEE"),
    COMPOUND_STRING("CAHLEEI"),
    COMPOUND_STRING("CAHLEEY"),
    COMPOUND_STRING("CAHLEI"),
    COMPOUND_STRING("CAHLEIE"),
    COMPOUND_STRING("CAHLEIH"),
    COMPOUND_STRING("CAHLEIY"),
    COMPOUND_STRING("CAHLEY"),
    COMPOUND_STRING("CAHLHAY"),
    COMPOUND_STRING("CAHLHEA"),
    COMPOUND_STRING("CAHLHEE"),
    COMPOUND_STRING("CAHLHEI"),
    COMPOUND_STRING("CAHLHEY"),
    COMPOUND_STRING("CAHLHI"),
    COMPOUND_STRING("CAHLHIE"),
    COMPOUND_STRING("CAHLHII"),
    COMPOUND_STRING("CAHLHIS"),
    COMPOUND_STRING("CAHLHIY"),
    COMPOUND_STRING("CAHLHY"),
    COMPOUND_STRING("CAHLI"),
    COMPOUND_STRING("CAHLIE"),
    COMPOUND_STRING("CAHLIEE"),
    COMPOUND_STRING("CAHLIEI"),
    COMPOUND_STRING("CAHLIEY"),
    COMPOUND_STRING("CAHLII"),
    COMPOUND_STRING("CAHLIIE"),
    COMPOUND_STRING("CAHLIII"),
    COMPOUND_STRING("CAHLIIS"),
    COMPOUND_STRING("CAHLIS"),
    COMPOUND_STRING("CAHLIY"),
    COMPOUND_STRING("CAHLLAY"),
    COMPOUND_STRING("CAHLLEA"),
    COMPOUND_STRING("CAHLLEE"),
    COMPOUND_STRING("CAHLLEI"),
    COMPOUND_STRING("CAHLLEY"),
    COMPOUND_STRING("CAHLLI"),
    COMPOUND_STRING("CAHLLIE"),
    COMPOUND_STRING("CAHLLII"),
    COMPOUND_STRING("CAHLLIS"),
    COMPOUND_STRING("CAHLLIY"),
    COMPOUND_STRING("CAHLLY"),
    COMPOUND_STRING("CAHLY"),
    COMPOUND_STRING("CAHYLAY"),
    COMPOUND_STRING("CAHYLEA"),
    COMPOUND_STRING("CAHYLEE"),
    COMPOUND_STRING("CAHYLEI"),
    COMPOUND_STRING("CAHYLEY"),
    COMPOUND_STRING("CAHYLHI"),
    COMPOUND_STRING("CAHYLHY"),
    COMPOUND_STRING("CAHYLI"),
    COMPOUND_STRING("CAHYLIE"),
    COMPOUND_STRING("CAHYLII"),
    COMPOUND_STRING("CAHYLIS"),
    COMPOUND_STRING("CAHYLIY"),
    COMPOUND_STRING("CAHYLLI"),
    COMPOUND_STRING("CAHYLLY"),
    COMPOUND_STRING("CAHYLY"),
    COMPOUND_STRING("CAIGHLI"),
    COMPOUND_STRING("CAIGHLY"),
    COMPOUND_STRING("CAILAEY"),
    COMPOUND_STRING("CAILAHY"),
    COMPOUND_STRING("CAILAY"),
    COMPOUND_STRING("CAILEA"),
    COMPOUND_STRING("CAILEE"),
    COMPOUND_STRING("CAILEEA"),
    COMPOUND_STRING("CAILEEE"),
    COMPOUND_STRING("CAILEEI"),
    COMPOUND_STRING("CAILEEY"),
    COMPOUND_STRING("CAILEI"),
    COMPOUND_STRING("CAILEIE"),
    COMPOUND_STRING("CAILEIH"),
    COMPOUND_STRING("CAILEIY"),
    COMPOUND_STRING("CAILEY"),
    COMPOUND_STRING("CAILHAY"),
    COMPOUND_STRING("CAILHEA"),
    COMPOUND_STRING("CAILHEE"),
    COMPOUND_STRING("CAILHEI"),
    COMPOUND_STRING("CAILHEY"),
    COMPOUND_STRING("CAILHI"),
    COMPOUND_STRING("CAILHIE"),
    COMPOUND_STRING("CAILHII"),
    COMPOUND_STRING("CAILHIS"),
    COMPOUND_STRING("CAILHIY"),
    COMPOUND_STRING("CAILHY"),
    COMPOUND_STRING("CAILI"),
    COMPOUND_STRING("CAILIE"),
    COMPOUND_STRING("CAILIEE"),
    COMPOUND_STRING("CAILIEI"),
    COMPOUND_STRING("CAILIEY"),
    COMPOUND_STRING("CAILII"),
    COMPOUND_STRING("CAILIIE"),
    COMPOUND_STRING("CAILIII"),
    COMPOUND_STRING("CAILIIS"),
    COMPOUND_STRING("CAILIS"),
    COMPOUND_STRING("CAILIY"),
    COMPOUND_STRING("CAILLAY"),
    COMPOUND_STRING("CAILLEA"),
    COMPOUND_STRING("CAILLEE"),
    COMPOUND_STRING("CAILLEI"),
    COMPOUND_STRING("CAILLEY"),
    COMPOUND_STRING("CAILLI"),
    COMPOUND_STRING("CAILLIE"),
    COMPOUND_STRING("CAILLII"),
    COMPOUND_STRING("CAILLIS"),
    COMPOUND_STRING("CAILLIY"),
    COMPOUND_STRING("CAILLY"),
    COMPOUND_STRING("CAILY"),
    COMPOUND_STRING("CALAEHY"),
    COMPOUND_STRING("CALAEY"),
    COMPOUND_STRING("CALAHEY"),
    COMPOUND_STRING("CALAHY"),
    COMPOUND_STRING("CALAY"),
    COMPOUND_STRING("CALEA"),
    COMPOUND_STRING("CALEE"),
    COMPOUND_STRING("CALEEA"),
    COMPOUND_STRING("CALEEE"),
    COMPOUND_STRING("CALEEEA"),
    COMPOUND_STRING("CALEEEE"),
    COMPOUND_STRING("CALEEEI"),
    COMPOUND_STRING("CALEEEY"),
    COMPOUND_STRING("CALEEI"),
    COMPOUND_STRING("CALEEIE"),
    COMPOUND_STRING("CALEEIH"),
    COMPOUND_STRING("CALEEIY"),
    COMPOUND_STRING("CALEEY"),
    COMPOUND_STRING("CALEI"),
    COMPOUND_STRING("CALEIE"),
    COMPOUND_STRING("CALEIGH"),
    COMPOUND_STRING("CALEIH"),
    COMPOUND_STRING("CALEIIH"),
    COMPOUND_STRING("CALEIIY"),
    COMPOUND_STRING("CALEIY"),
    COMPOUND_STRING("CALEIYY"),
    COMPOUND_STRING("CALEY"),
    COMPOUND_STRING("CALHAEY"),
    COMPOUND_STRING("CALHAHY"),
    COMPOUND_STRING("CALHAY"),
    COMPOUND_STRING("CALHEA"),
    COMPOUND_STRING("CALHEE"),
    COMPOUND_STRING("CALHEEA"),
    COMPOUND_STRING("CALHEEE"),
    COMPOUND_STRING("CALHEEI"),
    COMPOUND_STRING("CALHEEY"),
    COMPOUND_STRING("CALHEI"),
    COMPOUND_STRING("CALHEIE"),
    COMPOUND_STRING("CALHEIH"),
    COMPOUND_STRING("CALHEIY"),
    COMPOUND_STRING("CALHEY"),
    COMPOUND_STRING("CALHI"),
    COMPOUND_STRING("CALHIE"),
    COMPOUND_STRING("CALHIEE"),
    COMPOUND_STRING("CALHIEI"),
    COMPOUND_STRING("CALHIEY"),
    COMPOUND_STRING("CALHII"),
    COMPOUND_STRING("CALHIIE"),
    COMPOUND_STRING("CALHIII"),
    COMPOUND_STRING("CALHIIS"),
    COMPOUND_STRING("CALHIS"),
    COMPOUND_STRING("CALHIY"),
    COMPOUND_STRING("CALHY"),
    COMPOUND_STRING("CALI"),
    COMPOUND_STRING("CALIE"),
    COMPOUND_STRING("CALIEE"),
    COMPOUND_STRING("CALIEEE"),
    COMPOUND_STRING("CALIEEY"),
    COMPOUND_STRING("CALIEI"),
    COMPOUND_STRING("CALIEY"),
    COMPOUND_STRING("CALIEYY"),
    COMPOUND_STRING("CALII"),
    COMPOUND_STRING("CALIIE"),
    COMPOUND_STRING("CALIIEY"),
    COMPOUND_STRING("CALIII"),
    COMPOUND_STRING("CALIIIE"),
    COMPOUND_STRING("CALIIII"),
    COMPOUND_STRING("CALIIIS"),
    COMPOUND_STRING("CALIIS"),
    COMPOUND_STRING("CALIS"),
    COMPOUND_STRING("CALIY"),
    COMPOUND_STRING("CALLAEY"),
    COMPOUND_STRING("CALLAHY"),
    COMPOUND_STRING("CALLAY"),
    COMPOUND_STRING("CALLEA"),
    COMPOUND_STRING("CALLEE"),
    COMPOUND_STRING("CALLEEA"),
    COMPOUND_STRING("CALLEEE"),
    COMPOUND_STRING("CALLEEI"),
    COMPOUND_STRING("CALLEEY"),
    COMPOUND_STRING("CALLEI"),
    COMPOUND_STRING("CALLEIE"),
    COMPOUND_STRING("CALLEIH"),
    COMPOUND_STRING("CALLEIY"),
    COMPOUND_STRING("CALLEY"),
    COMPOUND_STRING("CALLI"),
    COMPOUND_STRING("CALLIE"),
    COMPOUND_STRING("CALLIEE"),
    COMPOUND_STRING("CALLIEI"),
    COMPOUND_STRING("CALLIEY"),
    COMPOUND_STRING("CALLII"),
    COMPOUND_STRING("CALLIIE"),
    COMPOUND_STRING("CALLIII"),
    COMPOUND_STRING("CALLIIS"),
    COMPOUND_STRING("CALLIS"),
    COMPOUND_STRING("CALLIY"),
    COMPOUND_STRING("CALLY"),
    COMPOUND_STRING("CALY"),
    COMPOUND_STRING("CAYELAY"),
    COMPOUND_STRING("CAYELEA"),
    COMPOUND_STRING("CAYELEE"),
    COMPOUND_STRING("CAYELEI"),
    COMPOUND_STRING("CAYELEY"),
    COMPOUND_STRING("CAYELHI"),
    COMPOUND_STRING("CAYELHY"),
    COMPOUND_STRING("CAYELI"),
    COMPOUND_STRING("CAYELIE"),
    COMPOUND_STRING("CAYELII"),
    COMPOUND_STRING("CAYELIS"),
    COMPOUND_STRING("CAYELIY"),
    COMPOUND_STRING("CAYELLI"),
    COMPOUND_STRING("CAYELLY"),
    COMPOUND_STRING("CAYELY"),
    COMPOUND_STRING("CAYLAEY"),
    COMPOUND_STRING("CAYLAHY"),
    COMPOUND_STRING("CAYLAY"),
    COMPOUND_STRING("CAYLEA"),
    COMPOUND_STRING("CAYLEE"),
    COMPOUND_STRING("CAYLEEA"),
    COMPOUND_STRING("CAYLEEE"),
    COMPOUND_STRING("CAYLEEI"),
    COMPOUND_STRING("CAYLEEY"),
    COMPOUND_STRING("CAYLEI"),
    COMPOUND_STRING("CAYLEIE"),
    COMPOUND_STRING("CAYLEIH"),
    COMPOUND_STRING("CAYLEIY"),
    COMPOUND_STRING("CAYLEY"),
    COMPOUND_STRING("CAYLHAY"),
    COMPOUND_STRING("CAYLHEA"),
    COMPOUND_STRING("CAYLHEE"),
    COMPOUND_STRING("CAYLHEI"),
    COMPOUND_STRING("CAYLHEY"),
    COMPOUND_STRING("CAYLHI"),
    COMPOUND_STRING("CAYLHIE"),
    COMPOUND_STRING("CAYLHII"),
    COMPOUND_STRING("CAYLHIS"),
    COMPOUND_STRING("CAYLHIY"),
    COMPOUND_STRING("CAYLHY"),
    COMPOUND_STRING("CAYLI"),
    COMPOUND_STRING("CAYLIE"),
    COMPOUND_STRING("CAYLIEE"),
    COMPOUND_STRING("CAYLIEI"),
    COMPOUND_STRING("CAYLIEY"),
    COMPOUND_STRING("CAYLII"),
    COMPOUND_STRING("CAYLIIE"),
    COMPOUND_STRING("CAYLIII"),
    COMPOUND_STRING("CAYLIIS"),
    COMPOUND_STRING("CAYLIS"),
    COMPOUND_STRING("CAYLIY"),
    COMPOUND_STRING("CAYLLAY"),
    COMPOUND_STRING("CAYLLEA"),
    COMPOUND_STRING("CAYLLEE"),
    COMPOUND_STRING("CAYLLEI"),
    COMPOUND_STRING("CAYLLEY"),
    COMPOUND_STRING("CAYLLI"),
    COMPOUND_STRING("CAYLLIE"),
    COMPOUND_STRING("CAYLLII"),
    COMPOUND_STRING("CAYLLIS"),
    COMPOUND_STRING("CAYLLIY"),
    COMPOUND_STRING("CAYLLY"),
    COMPOUND_STRING("CAYLY"),
    COMPOUND_STRING("CCAAHLI"),
    COMPOUND_STRING("CCAAHLY"),
    COMPOUND_STRING("CCAALAY"),
    COMPOUND_STRING("CCAALEA"),
    COMPOUND_STRING("CCAALEE"),
    COMPOUND_STRING("CCAALEI"),
    COMPOUND_STRING("CCAALEY"),
    COMPOUND_STRING("CCAALHI"),
    COMPOUND_STRING("CCAALHY"),
    COMPOUND_STRING("CCAALI"),
    COMPOUND_STRING("CCAALIE"),
    COMPOUND_STRING("CCAALII"),
    COMPOUND_STRING("CCAALIS"),
    COMPOUND_STRING("CCAALIY"),
    COMPOUND_STRING("CCAALLI"),
    COMPOUND_STRING("CCAALLY"),
    COMPOUND_STRING("CCAALY"),
    COMPOUND_STRING("CCAAYLI"),
    COMPOUND_STRING("CCAAYLY"),
    COMPOUND_STRING("CCAEHLI"),
    COMPOUND_STRING("CCAEHLY"),
    COMPOUND_STRING("CCAELAY"),
    COMPOUND_STRING("CCAELEA"),
    COMPOUND_STRING("CCAELEE"),
    COMPOUND_STRING("CCAELEI"),
    COMPOUND_STRING("CCAELEY"),
    COMPOUND_STRING("CCAELHI"),
    COMPOUND_STRING("CCAELHY"),
    COMPOUND_STRING("CCAELI"),
    COMPOUND_STRING("CCAELIE"),
    COMPOUND_STRING("CCAELII"),
    COMPOUND_STRING("CCAELIS"),
    COMPOUND_STRING("CCAELIY"),
    COMPOUND_STRING("CCAELLI"),
    COMPOUND_STRING("CCAELLY"),
    COMPOUND_STRING("CCAELY"),
    COMPOUND_STRING("CCAGHLI"),
    COMPOUND_STRING("CCAGHLY"),
    COMPOUND_STRING("CCAHLAY"),
    COMPOUND_STRING("CCAHLEA"),
    COMPOUND_STRING("CCAHLEE"),
    COMPOUND_STRING("CCAHLEI"),
    COMPOUND_STRING("CCAHLEY"),
    COMPOUND_STRING("CCAHLHI"),
    COMPOUND_STRING("CCAHLHY"),
    COMPOUND_STRING("CCAHLI"),
    COMPOUND_STRING("CCAHLIE"),
    COMPOUND_STRING("CCAHLII"),
    COMPOUND_STRING("CCAHLIS"),
    COMPOUND_STRING("CCAHLIY"),
    COMPOUND_STRING("CCAHLLI"),
    COMPOUND_STRING("CCAHLLY"),
    COMPOUND_STRING("CCAHLY"),
    COMPOUND_STRING("CCAHYLI"),
    COMPOUND_STRING("CCAHYLY"),
    COMPOUND_STRING("CCAILAY"),
    COMPOUND_STRING("CCAILEA"),
    COMPOUND_STRING("CCAILEE"),
    COMPOUND_STRING("CCAILEI"),
    COMPOUND_STRING("CCAILEY"),
    COMPOUND_STRING("CCAILHI"),
    COMPOUND_STRING("CCAILHY"),
    COMPOUND_STRING("CCAILI"),
    COMPOUND_STRING("CCAILIE"),
    COMPOUND_STRING("CCAILII"),
    COMPOUND_STRING("CCAILIS"),
    COMPOUND_STRING("CCAILIY"),
    COMPOUND_STRING("CCAILLI"),
    COMPOUND_STRING("CCAILLY"),
    COMPOUND_STRING("CCAILY"),
    COMPOUND_STRING("CCALAEY"),
    COMPOUND_STRING("CCALAHY"),
    COMPOUND_STRING("CCALAY"),
    COMPOUND_STRING("CCALEA"),
    COMPOUND_STRING("CCALEE"),
    COMPOUND_STRING("CCALEEA"),
    COMPOUND_STRING("CCALEEE"),
    COMPOUND_STRING("CCALEEI"),
    COMPOUND_STRING("CCALEEY"),
    COMPOUND_STRING("CCALEI"),
    COMPOUND_STRING("CCALEIE"),
    COMPOUND_STRING("CCALEIH"),
    COMPOUND_STRING("CCALEIY"),
    COMPOUND_STRING("CCALEY"),
    COMPOUND_STRING("CCALHAY"),
    COMPOUND_STRING("CCALHEA"),
    COMPOUND_STRING("CCALHEE"),
    COMPOUND_STRING("CCALHEI"),
    COMPOUND_STRING("CCALHEY"),
    COMPOUND_STRING("CCALHI"),
    COMPOUND_STRING("CCALHIE"),
    COMPOUND_STRING("CCALHII"),
    COMPOUND_STRING("CCALHIS"),
    COMPOUND_STRING("CCALHIY"),
    COMPOUND_STRING("CCALHY"),
    COMPOUND_STRING("CCALI"),
    COMPOUND_STRING("CCALIE"),
    COMPOUND_STRING("CCALIEE"),
    COMPOUND_STRING("CCALIEI"),
    COMPOUND_STRING("CCALIEY"),
    COMPOUND_STRING("CCALII"),
    COMPOUND_STRING("CCALIIE"),
    COMPOUND_STRING("CCALIII"),
    COMPOUND_STRING("CCALIIS"),
    COMPOUND_STRING("CCALIS"),
    COMPOUND_STRING("CCALIY"),
    COMPOUND_STRING("CCALLAY"),
    COMPOUND_STRING("CCALLEA"),
    COMPOUND_STRING("CCALLEE"),
    COMPOUND_STRING("CCALLEI"),
    COMPOUND_STRING("CCALLEY"),
    COMPOUND_STRING("CCALLI"),
    COMPOUND_STRING("CCALLIE"),
    COMPOUND_STRING("CCALLII"),
    COMPOUND_STRING("CCALLIS"),
    COMPOUND_STRING("CCALLIY"),
    COMPOUND_STRING("CCALLY"),
    COMPOUND_STRING("CCALY"),
    COMPOUND_STRING("CCAYELI"),
    COMPOUND_STRING("CCAYELY"),
    COMPOUND_STRING("CCAYLAY"),
    COMPOUND_STRING("CCAYLEA"),
    COMPOUND_STRING("CCAYLEE"),
    COMPOUND_STRING("CCAYLEI"),
    COMPOUND_STRING("CCAYLEY"),
    COMPOUND_STRING("CCAYLHI"),
    COMPOUND_STRING("CCAYLHY"),
    COMPOUND_STRING("CCAYLI"),
    COMPOUND_STRING("CCAYLIE"),
    COMPOUND_STRING("CCAYLII"),
    COMPOUND_STRING("CCAYLIS"),
    COMPOUND_STRING("CCAYLIY"),
    COMPOUND_STRING("CCAYLLI"),
    COMPOUND_STRING("CCAYLLY"),
    COMPOUND_STRING("CCAYLY"),
    COMPOUND_STRING("CHAAHLI"),
    COMPOUND_STRING("CHAAHLY"),
    COMPOUND_STRING("CHAALAY"),
    COMPOUND_STRING("CHAALEA"),
    COMPOUND_STRING("CHAALEE"),
    COMPOUND_STRING("CHAALEI"),
    COMPOUND_STRING("CHAALEY"),
    COMPOUND_STRING("CHAALHI"),
    COMPOUND_STRING("CHAALHY"),
    COMPOUND_STRING("CHAALI"),
    COMPOUND_STRING("CHAALIE"),
    COMPOUND_STRING("CHAALII"),
    COMPOUND_STRING("CHAALIS"),
    COMPOUND_STRING("CHAALIY"),
    COMPOUND_STRING("CHAALLI"),
    COMPOUND_STRING("CHAALLY"),
    COMPOUND_STRING("CHAALY"),
    COMPOUND_STRING("CHAAYLI"),
    COMPOUND_STRING("CHAAYLY"),
    COMPOUND_STRING("CHAEHLI"),
    COMPOUND_STRING("CHAEHLY"),
    COMPOUND_STRING("CHAELAY"),
    COMPOUND_STRING("CHAELEA"),
    COMPOUND_STRING("CHAELEE"),
    COMPOUND_STRING("CHAELEI"),
    COMPOUND_STRING("CHAELEY"),
    COMPOUND_STRING("CHAELHI"),
    COMPOUND_STRING("CHAELHY"),
    COMPOUND_STRING("CHAELI"),
    COMPOUND_STRING("CHAELIE"),
    COMPOUND_STRING("CHAELII"),
    COMPOUND_STRING("CHAELIS"),
    COMPOUND_STRING("CHAELIY"),
    COMPOUND_STRING("CHAELLI"),
    COMPOUND_STRING("CHAELLY"),
    COMPOUND_STRING("CHAELY"),
    COMPOUND_STRING("CHAGHLI"),
    COMPOUND_STRING("CHAGHLY"),
    COMPOUND_STRING("CHAHLAY"),
    COMPOUND_STRING("CHAHLEA"),
    COMPOUND_STRING("CHAHLEE"),
    COMPOUND_STRING("CHAHLEI"),
    COMPOUND_STRING("CHAHLEY"),
    COMPOUND_STRING("CHAHLHI"),
    COMPOUND_STRING("CHAHLHY"),
    COMPOUND_STRING("CHAHLI"),
    COMPOUND_STRING("CHAHLIE"),
    COMPOUND_STRING("CHAHLII"),
    COMPOUND_STRING("CHAHLIS"),
    COMPOUND_STRING("CHAHLIY"),
    COMPOUND_STRING("CHAHLLI"),
    COMPOUND_STRING("CHAHLLY"),
    COMPOUND_STRING("CHAHLY"),
    COMPOUND_STRING("CHAHYLI"),
    COMPOUND_STRING("CHAHYLY"),
    COMPOUND_STRING("CHAILAY"),
    COMPOUND_STRING("CHAILEA"),
    COMPOUND_STRING("CHAILEE"),
    COMPOUND_STRING("CHAILEI"),
    COMPOUND_STRING("CHAILEY"),
    COMPOUND_STRING("CHAILHI"),
    COMPOUND_STRING("CHAILHY"),
    COMPOUND_STRING("CHAILI"),
    COMPOUND_STRING("CHAILIE"),
    COMPOUND_STRING("CHAILII"),
    COMPOUND_STRING("CHAILIS"),
    COMPOUND_STRING("CHAILIY"),
    COMPOUND_STRING("CHAILLI"),
    COMPOUND_STRING("CHAILLY"),
    COMPOUND_STRING("CHAILY"),
    COMPOUND_STRING("CHALAEY"),
    COMPOUND_STRING("CHALAHY"),
    COMPOUND_STRING("CHALAY"),
    COMPOUND_STRING("CHALEA"),
    COMPOUND_STRING("CHALEE"),
    COMPOUND_STRING("CHALEEA"),
    COMPOUND_STRING("CHALEEE"),
    COMPOUND_STRING("CHALEEI"),
    COMPOUND_STRING("CHALEEY"),
    COMPOUND_STRING("CHALEI"),
    COMPOUND_STRING("CHALEIE"),
    COMPOUND_STRING("CHALEIH"),
    COMPOUND_STRING("CHALEIY"),
    COMPOUND_STRING("CHALEY"),
    COMPOUND_STRING("CHALHAY"),
    COMPOUND_STRING("CHALHEA"),
    COMPOUND_STRING("CHALHEE"),
    COMPOUND_STRING("CHALHEI"),
    COMPOUND_STRING("CHALHEY"),
    COMPOUND_STRING("CHALHI"),
    COMPOUND_STRING("CHALHIE"),
    COMPOUND_STRING("CHALHII"),
    COMPOUND_STRING("CHALHIS"),
    COMPOUND_STRING("CHALHIY"),
    COMPOUND_STRING("CHALHY"),
    COMPOUND_STRING("CHALI"),
    COMPOUND_STRING("CHALIE"),
    COMPOUND_STRING("CHALIEE"),
    COMPOUND_STRING("CHALIEI"),
    COMPOUND_STRING("CHALIEY"),
    COMPOUND_STRING("CHALII"),
    COMPOUND_STRING("CHALIIE"),
    COMPOUND_STRING("CHALIII"),
    COMPOUND_STRING("CHALIIS"),
    COMPOUND_STRING("CHALIS"),
    COMPOUND_STRING("CHALIY"),
    COMPOUND_STRING("CHALLAY"),
    COMPOUND_STRING("CHALLEA"),
    COMPOUND_STRING("CHALLEE"),
    COMPOUND_STRING("CHALLEI"),
    COMPOUND_STRING("CHALLEY"),
    COMPOUND_STRING("CHALLI"),
    COMPOUND_STRING("CHALLIE"),
    COMPOUND_STRING("CHALLII"),
    COMPOUND_STRING("CHALLIS"),
    COMPOUND_STRING("CHALLIY"),
    COMPOUND_STRING("CHALLY"),
    COMPOUND_STRING("CHALY"),
    COMPOUND_STRING("CHAYELI"),
    COMPOUND_STRING("CHAYELY"),
    COMPOUND_STRING("CHAYLAY"),
    COMPOUND_STRING("CHAYLEA"),
    COMPOUND_STRING("CHAYLEE"),
    COMPOUND_STRING("CHAYLEI"),
    COMPOUND_STRING("CHAYLEY"),
    COMPOUND_STRING("CHAYLHI"),
    COMPOUND_STRING("CHAYLHY"),
    COMPOUND_STRING("CHAYLI"),
    COMPOUND_STRING("CHAYLIE"),
    COMPOUND_STRING("CHAYLII"),
    COMPOUND_STRING("CHAYLIS"),
    COMPOUND_STRING("CHAYLIY"),
    COMPOUND_STRING("CHAYLLI"),
    COMPOUND_STRING("CHAYLLY"),
    COMPOUND_STRING("CHAYLY"),
    COMPOUND_STRING("CHEALAY"),
    COMPOUND_STRING("CHEALEA"),
    COMPOUND_STRING("CHEALEE"),
    COMPOUND_STRING("CHEALEI"),
    COMPOUND_STRING("CHEALEY"),
    COMPOUND_STRING("CHEALHI"),
    COMPOUND_STRING("CHEALHY"),
    COMPOUND_STRING("CHEALI"),
    COMPOUND_STRING("CHEALIE"),
    COMPOUND_STRING("CHEALII"),
    COMPOUND_STRING("CHEALIS"),
    COMPOUND_STRING("CHEALIY"),
    COMPOUND_STRING("CHEALLI"),
    COMPOUND_STRING("CHEALLY"),
    COMPOUND_STRING("CHEALY"),
    COMPOUND_STRING("CHEIGLI"),
    COMPOUND_STRING("CHEIGLY"),
    COMPOUND_STRING("CHEIHLI"),
    COMPOUND_STRING("CHEIHLY"),
    COMPOUND_STRING("CHEILAY"),
    COMPOUND_STRING("CHEILEA"),
    COMPOUND_STRING("CHEILEE"),
    COMPOUND_STRING("CHEILEI"),
    COMPOUND_STRING("CHEILEY"),
    COMPOUND_STRING("CHEILHI"),
    COMPOUND_STRING("CHEILHY"),
    COMPOUND_STRING("CHEILI"),
    COMPOUND_STRING("CHEILIE"),
    COMPOUND_STRING("CHEILII"),
    COMPOUND_STRING("CHEILIS"),
    COMPOUND_STRING("CHEILIY"),
    COMPOUND_STRING("CHEILLI"),
    COMPOUND_STRING("CHEILLY"),
    COMPOUND_STRING("CHEILY"),
    COMPOUND_STRING("CHEYLAY"),
    COMPOUND_STRING("CHEYLEA"),
    COMPOUND_STRING("CHEYLEE"),
    COMPOUND_STRING("CHEYLEI"),
    COMPOUND_STRING("CHEYLEY"),
    COMPOUND_STRING("CHEYLHI"),
    COMPOUND_STRING("CHEYLHY"),
    COMPOUND_STRING("CHEYLI"),
    COMPOUND_STRING("CHEYLIE"),
    COMPOUND_STRING("CHEYLII"),
    COMPOUND_STRING("CHEYLIS"),
    COMPOUND_STRING("CHEYLIY"),
    COMPOUND_STRING("CHEYLLI"),
    COMPOUND_STRING("CHEYLLY"),
    COMPOUND_STRING("CHEYLY"),
    COMPOUND_STRING("CKAAHLI"),
    COMPOUND_STRING("CKAAHLY"),
    COMPOUND_STRING("CKAALAY"),
    COMPOUND_STRING("CKAALEA"),
    COMPOUND_STRING("CKAALEE"),
    COMPOUND_STRING("CKAALEI"),
    COMPOUND_STRING("CKAALEY"),
    COMPOUND_STRING("CKAALHI"),
    COMPOUND_STRING("CKAALHY"),
    COMPOUND_STRING("CKAALI"),
    COMPOUND_STRING("CKAALIE"),
    COMPOUND_STRING("CKAALII"),
    COMPOUND_STRING("CKAALIS"),
    COMPOUND_STRING("CKAALIY"),
    COMPOUND_STRING("CKAALLI"),
    COMPOUND_STRING("CKAALLY"),
    COMPOUND_STRING("CKAALY"),
    COMPOUND_STRING("CKAAYLI"),
    COMPOUND_STRING("CKAAYLY"),
    COMPOUND_STRING("CKAEHLI"),
    COMPOUND_STRING("CKAEHLY"),
    COMPOUND_STRING("CKAELAY"),
    COMPOUND_STRING("CKAELEA"),
    COMPOUND_STRING("CKAELEE"),
    COMPOUND_STRING("CKAELEI"),
    COMPOUND_STRING("CKAELEY"),
    COMPOUND_STRING("CKAELHI"),
    COMPOUND_STRING("CKAELHY"),
    COMPOUND_STRING("CKAELI"),
    COMPOUND_STRING("CKAELIE"),
    COMPOUND_STRING("CKAELII"),
    COMPOUND_STRING("CKAELIS"),
    COMPOUND_STRING("CKAELIY"),
    COMPOUND_STRING("CKAELLI"),
    COMPOUND_STRING("CKAELLY"),
    COMPOUND_STRING("CKAELY"),
    COMPOUND_STRING("CKAGHLI"),
    COMPOUND_STRING("CKAGHLY"),
    COMPOUND_STRING("CKAHLAY"),
    COMPOUND_STRING("CKAHLEA"),
    COMPOUND_STRING("CKAHLEE"),
    COMPOUND_STRING("CKAHLEI"),
    COMPOUND_STRING("CKAHLEY"),
    COMPOUND_STRING("CKAHLHI"),
    COMPOUND_STRING("CKAHLHY"),
    COMPOUND_STRING("CKAHLI"),
    COMPOUND_STRING("CKAHLIE"),
    COMPOUND_STRING("CKAHLII"),
    COMPOUND_STRING("CKAHLIS"),
    COMPOUND_STRING("CKAHLIY"),
    COMPOUND_STRING("CKAHLLI"),
    COMPOUND_STRING("CKAHLLY"),
    COMPOUND_STRING("CKAHLY"),
    COMPOUND_STRING("CKAHYLI"),
    COMPOUND_STRING("CKAHYLY"),
    COMPOUND_STRING("CKAILAY"),
    COMPOUND_STRING("CKAILEA"),
    COMPOUND_STRING("CKAILEE"),
    COMPOUND_STRING("CKAILEI"),
    COMPOUND_STRING("CKAILEY"),
    COMPOUND_STRING("CKAILHI"),
    COMPOUND_STRING("CKAILHY"),
    COMPOUND_STRING("CKAILI"),
    COMPOUND_STRING("CKAILIE"),
    COMPOUND_STRING("CKAILII"),
    COMPOUND_STRING("CKAILIS"),
    COMPOUND_STRING("CKAILIY"),
    COMPOUND_STRING("CKAILLI"),
    COMPOUND_STRING("CKAILLY"),
    COMPOUND_STRING("CKAILY"),
    COMPOUND_STRING("CKALAEY"),
    COMPOUND_STRING("CKALAHY"),
    COMPOUND_STRING("CKALAY"),
    COMPOUND_STRING("CKALEA"),
    COMPOUND_STRING("CKALEE"),
    COMPOUND_STRING("CKALEEA"),
    COMPOUND_STRING("CKALEEE"),
    COMPOUND_STRING("CKALEEI"),
    COMPOUND_STRING("CKALEEY"),
    COMPOUND_STRING("CKALEI"),
    COMPOUND_STRING("CKALEIE"),
    COMPOUND_STRING("CKALEIH"),
    COMPOUND_STRING("CKALEIY"),
    COMPOUND_STRING("CKALEY"),
    COMPOUND_STRING("CKALHAY"),
    COMPOUND_STRING("CKALHEA"),
    COMPOUND_STRING("CKALHEE"),
    COMPOUND_STRING("CKALHEI"),
    COMPOUND_STRING("CKALHEY"),
    COMPOUND_STRING("CKALHI"),
    COMPOUND_STRING("CKALHIE"),
    COMPOUND_STRING("CKALHII"),
    COMPOUND_STRING("CKALHIS"),
    COMPOUND_STRING("CKALHIY"),
    COMPOUND_STRING("CKALHY"),
    COMPOUND_STRING("CKALI"),
    COMPOUND_STRING("CKALIE"),
    COMPOUND_STRING("CKALIEE"),
    COMPOUND_STRING("CKALIEI"),
    COMPOUND_STRING("CKALIEY"),
    COMPOUND_STRING("CKALII"),
    COMPOUND_STRING("CKALIIE"),
    COMPOUND_STRING("CKALIII"),
    COMPOUND_STRING("CKALIIS"),
    COMPOUND_STRING("CKALIS"),
    COMPOUND_STRING("CKALIY"),
    COMPOUND_STRING("CKALLAY"),
    COMPOUND_STRING("CKALLEA"),
    COMPOUND_STRING("CKALLEE"),
    COMPOUND_STRING("CKALLEI"),
    COMPOUND_STRING("CKALLEY"),
    COMPOUND_STRING("CKALLI"),
    COMPOUND_STRING("CKALLIE"),
    COMPOUND_STRING("CKALLII"),
    COMPOUND_STRING("CKALLIS"),
    COMPOUND_STRING("CKALLIY"),
    COMPOUND_STRING("CKALLY"),
    COMPOUND_STRING("CKALY"),
    COMPOUND_STRING("CKAYELI"),
    COMPOUND_STRING("CKAYELY"),
    COMPOUND_STRING("CKAYLAY"),
    COMPOUND_STRING("CKAYLEA"),
    COMPOUND_STRING("CKAYLEE"),
    COMPOUND_STRING("CKAYLEI"),
    COMPOUND_STRING("CKAYLEY"),
    COMPOUND_STRING("CKAYLHI"),
    COMPOUND_STRING("CKAYLHY"),
    COMPOUND_STRING("CKAYLI"),
    COMPOUND_STRING("CKAYLIE"),
    COMPOUND_STRING("CKAYLII"),
    COMPOUND_STRING("CKAYLIS"),
    COMPOUND_STRING("CKAYLIY"),
    COMPOUND_STRING("CKAYLLI"),
    COMPOUND_STRING("CKAYLLY"),
    COMPOUND_STRING("CKAYLY"),
    COMPOUND_STRING("CKEALAY"),
    COMPOUND_STRING("CKEALEA"),
    COMPOUND_STRING("CKEALEE"),
    COMPOUND_STRING("CKEALEI"),
    COMPOUND_STRING("CKEALEY"),
    COMPOUND_STRING("CKEALHI"),
    COMPOUND_STRING("CKEALHY"),
    COMPOUND_STRING("CKEALI"),
    COMPOUND_STRING("CKEALIE"),
    COMPOUND_STRING("CKEALII"),
    COMPOUND_STRING("CKEALIS"),
    COMPOUND_STRING("CKEALIY"),
    COMPOUND_STRING("CKEALLI"),
    COMPOUND_STRING("CKEALLY"),
    COMPOUND_STRING("CKEALY"),
    COMPOUND_STRING("CKEIGLI"),
    COMPOUND_STRING("CKEIGLY"),
    COMPOUND_STRING("CKEIHLI"),
    COMPOUND_STRING("CKEIHLY"),
    COMPOUND_STRING("CKEILAY"),
    COMPOUND_STRING("CKEILEA"),
    COMPOUND_STRING("CKEILEE"),
    COMPOUND_STRING("CKEILEI"),
    COMPOUND_STRING("CKEILEY"),
    COMPOUND_STRING("CKEILHI"),
    COMPOUND_STRING("CKEILHY"),
    COMPOUND_STRING("CKEILI"),
    COMPOUND_STRING("CKEILIE"),
    COMPOUND_STRING("CKEILII"),
    COMPOUND_STRING("CKEILIS"),
    COMPOUND_STRING("CKEILIY"),
    COMPOUND_STRING("CKEILLI"),
    COMPOUND_STRING("CKEILLY"),
    COMPOUND_STRING("CKEILY"),
    COMPOUND_STRING("CKEYLAY"),
    COMPOUND_STRING("CKEYLEA"),
    COMPOUND_STRING("CKEYLEE"),
    COMPOUND_STRING("CKEYLEI"),
    COMPOUND_STRING("CKEYLEY"),
    COMPOUND_STRING("CKEYLHI"),
    COMPOUND_STRING("CKEYLHY"),
    COMPOUND_STRING("CKEYLI"),
    COMPOUND_STRING("CKEYLIE"),
    COMPOUND_STRING("CKEYLII"),
    COMPOUND_STRING("CKEYLIS"),
    COMPOUND_STRING("CKEYLIY"),
    COMPOUND_STRING("CKEYLLI"),
    COMPOUND_STRING("CKEYLLY"),
    COMPOUND_STRING("CKEYLY"),
    COMPOUND_STRING("CQAAHLI"),
    COMPOUND_STRING("CQAAHLY"),
    COMPOUND_STRING("CQAALAY"),
    COMPOUND_STRING("CQAALEA"),
    COMPOUND_STRING("CQAALEE"),
    COMPOUND_STRING("CQAALEI"),
    COMPOUND_STRING("CQAALEY"),
    COMPOUND_STRING("CQAALHI"),
    COMPOUND_STRING("CQAALHY"),
    COMPOUND_STRING("CQAALI"),
    COMPOUND_STRING("CQAALIE"),
    COMPOUND_STRING("CQAALII"),
    COMPOUND_STRING("CQAALIS"),
    COMPOUND_STRING("CQAALIY"),
    COMPOUND_STRING("CQAALLI"),
    COMPOUND_STRING("CQAALLY"),
    COMPOUND_STRING("CQAALY"),
    COMPOUND_STRING("CQAAYLI"),
    COMPOUND_STRING("CQAAYLY"),
    COMPOUND_STRING("CQAEHLI"),
    COMPOUND_STRING("CQAEHLY"),
    COMPOUND_STRING("CQAELAY"),
    COMPOUND_STRING("CQAELEA"),
    COMPOUND_STRING("CQAELEE"),
    COMPOUND_STRING("CQAELEI"),
    COMPOUND_STRING("CQAELEY"),
    COMPOUND_STRING("CQAELHI"),
    COMPOUND_STRING("CQAELHY"),
    COMPOUND_STRING("CQAELI"),
    COMPOUND_STRING("CQAELIE"),
    COMPOUND_STRING("CQAELII"),
    COMPOUND_STRING("CQAELIS"),
    COMPOUND_STRING("CQAELIY"),
    COMPOUND_STRING("CQAELLI"),
    COMPOUND_STRING("CQAELLY"),
    COMPOUND_STRING("CQAELY"),
    COMPOUND_STRING("CQAGHLI"),
    COMPOUND_STRING("CQAGHLY"),
    COMPOUND_STRING("CQAHLAY"),
    COMPOUND_STRING("CQAHLEA"),
    COMPOUND_STRING("CQAHLEE"),
    COMPOUND_STRING("CQAHLEI"),
    COMPOUND_STRING("CQAHLEY"),
    COMPOUND_STRING("CQAHLHI"),
    COMPOUND_STRING("CQAHLHY"),
    COMPOUND_STRING("CQAHLI"),
    COMPOUND_STRING("CQAHLIE"),
    COMPOUND_STRING("CQAHLII"),
    COMPOUND_STRING("CQAHLIS"),
    COMPOUND_STRING("CQAHLIY"),
    COMPOUND_STRING("CQAHLLI"),
    COMPOUND_STRING("CQAHLLY"),
    COMPOUND_STRING("CQAHLY"),
    COMPOUND_STRING("CQAHYLI"),
    COMPOUND_STRING("CQAHYLY"),
    COMPOUND_STRING("CQAILAY"),
    COMPOUND_STRING("CQAILEA"),
    COMPOUND_STRING("CQAILEE"),
    COMPOUND_STRING("CQAILEI"),
    COMPOUND_STRING("CQAILEY"),
    COMPOUND_STRING("CQAILHI"),
    COMPOUND_STRING("CQAILHY"),
    COMPOUND_STRING("CQAILI"),
    COMPOUND_STRING("CQAILIE"),
    COMPOUND_STRING("CQAILII"),
    COMPOUND_STRING("CQAILIS"),
    COMPOUND_STRING("CQAILIY"),
    COMPOUND_STRING("CQAILLI"),
    COMPOUND_STRING("CQAILLY"),
    COMPOUND_STRING("CQAILY"),
    COMPOUND_STRING("CQALAEY"),
    COMPOUND_STRING("CQALAHY"),
    COMPOUND_STRING("CQALAY"),
    COMPOUND_STRING("CQALEA"),
    COMPOUND_STRING("CQALEE"),
    COMPOUND_STRING("CQALEEA"),
    COMPOUND_STRING("CQALEEE"),
    COMPOUND_STRING("CQALEEI"),
    COMPOUND_STRING("CQALEEY"),
    COMPOUND_STRING("CQALEI"),
    COMPOUND_STRING("CQALEIE"),
    COMPOUND_STRING("CQALEIH"),
    COMPOUND_STRING("CQALEIY"),
    COMPOUND_STRING("CQALEY"),
    COMPOUND_STRING("CQALHAY"),
    COMPOUND_STRING("CQALHEA"),
    COMPOUND_STRING("CQALHEE"),
    COMPOUND_STRING("CQALHEI"),
    COMPOUND_STRING("CQALHEY"),
    COMPOUND_STRING("CQALHI"),
    COMPOUND_STRING("CQALHIE"),
    COMPOUND_STRING("CQALHII"),
    COMPOUND_STRING("CQALHIS"),
    COMPOUND_STRING("CQALHIY"),
    COMPOUND_STRING("CQALHY"),
    COMPOUND_STRING("CQALI"),
    COMPOUND_STRING("CQALIE"),
    COMPOUND_STRING("CQALIEE"),
    COMPOUND_STRING("CQALIEI"),
    COMPOUND_STRING("CQALIEY"),
    COMPOUND_STRING("CQALII"),
    COMPOUND_STRING("CQALIIE"),
    COMPOUND_STRING("CQALIII"),
    COMPOUND_STRING("CQALIIS"),
    COMPOUND_STRING("CQALIS"),
    COMPOUND_STRING("CQALIY"),
    COMPOUND_STRING("CQALLAY"),
    COMPOUND_STRING("CQALLEA"),
    COMPOUND_STRING("CQALLEE"),
    COMPOUND_STRING("CQALLEI"),
    COMPOUND_STRING("CQALLEY"),
    COMPOUND_STRING("CQALLI"),
    COMPOUND_STRING("CQALLIE"),
    COMPOUND_STRING("CQALLII"),
    COMPOUND_STRING("CQALLIS"),
    COMPOUND_STRING("CQALLIY"),
    COMPOUND_STRING("CQALLY"),
    COMPOUND_STRING("CQALY"),
    COMPOUND_STRING("CQAYELI"),
    COMPOUND_STRING("CQAYELY"),
    COMPOUND_STRING("CQAYLAY"),
    COMPOUND_STRING("CQAYLEA"),
    COMPOUND_STRING("CQAYLEE"),
    COMPOUND_STRING("CQAYLEI"),
    COMPOUND_STRING("CQAYLEY"),
    COMPOUND_STRING("CQAYLHI"),
    COMPOUND_STRING("CQAYLHY"),
    COMPOUND_STRING("CQAYLI"),
    COMPOUND_STRING("CQAYLIE"),
    COMPOUND_STRING("CQAYLII"),
    COMPOUND_STRING("CQAYLIS"),
    COMPOUND_STRING("CQAYLIY"),
    COMPOUND_STRING("CQAYLLI"),
    COMPOUND_STRING("CQAYLLY"),
    COMPOUND_STRING("CQAYLY"),
    COMPOUND_STRING("CQEALAY"),
    COMPOUND_STRING("CQEALEA"),
    COMPOUND_STRING("CQEALEE"),
    COMPOUND_STRING("CQEALEI"),
    COMPOUND_STRING("CQEALEY"),
    COMPOUND_STRING("CQEALHI"),
    COMPOUND_STRING("CQEALHY"),
    COMPOUND_STRING("CQEALI"),
    COMPOUND_STRING("CQEALIE"),
    COMPOUND_STRING("CQEALII"),
    COMPOUND_STRING("CQEALIS"),
    COMPOUND_STRING("CQEALIY"),
    COMPOUND_STRING("CQEALLI"),
    COMPOUND_STRING("CQEALLY"),
    COMPOUND_STRING("CQEALY"),
    COMPOUND_STRING("CQEIGLI"),
    COMPOUND_STRING("CQEIGLY"),
    COMPOUND_STRING("CQEIHLI"),
    COMPOUND_STRING("CQEIHLY"),
    COMPOUND_STRING("CQEILAY"),
    COMPOUND_STRING("CQEILEA"),
    COMPOUND_STRING("CQEILEE"),
    COMPOUND_STRING("CQEILEI"),
    COMPOUND_STRING("CQEILEY"),
    COMPOUND_STRING("CQEILHI"),
    COMPOUND_STRING("CQEILHY"),
    COMPOUND_STRING("CQEILI"),
    COMPOUND_STRING("CQEILIE"),
    COMPOUND_STRING("CQEILII"),
    COMPOUND_STRING("CQEILIS"),
    COMPOUND_STRING("CQEILIY"),
    COMPOUND_STRING("CQEILLI"),
    COMPOUND_STRING("CQEILLY"),
    COMPOUND_STRING("CQEILY"),
    COMPOUND_STRING("CQEYLAY"),
    COMPOUND_STRING("CQEYLEA"),
    COMPOUND_STRING("CQEYLEE"),
    COMPOUND_STRING("CQEYLEI"),
    COMPOUND_STRING("CQEYLEY"),
    COMPOUND_STRING("CQEYLHI"),
    COMPOUND_STRING("CQEYLHY"),
    COMPOUND_STRING("CQEYLI"),
    COMPOUND_STRING("CQEYLIE"),
    COMPOUND_STRING("CQEYLII"),
    COMPOUND_STRING("CQEYLIS"),
    COMPOUND_STRING("CQEYLIY"),
    COMPOUND_STRING("CQEYLLI"),
    COMPOUND_STRING("CQEYLLY"),
    COMPOUND_STRING("CQEYLY"),
    COMPOUND_STRING("KAAGHLI"),
    COMPOUND_STRING("KAAGHLY"),
    COMPOUND_STRING("KAAHLAY"),
    COMPOUND_STRING("KAAHLEA"),
    COMPOUND_STRING("KAAHLEE"),
    COMPOUND_STRING("KAAHLEI"),
    COMPOUND_STRING("KAAHLEY"),
    COMPOUND_STRING("KAAHLHI"),
    COMPOUND_STRING("KAAHLHY"),
    COMPOUND_STRING("KAAHLI"),
    COMPOUND_STRING("KAAHLIE"),
    COMPOUND_STRING("KAAHLII"),
    COMPOUND_STRING("KAAHLIS"),
    COMPOUND_STRING("KAAHLIY"),
    COMPOUND_STRING("KAAHLLI"),
    COMPOUND_STRING("KAAHLLY"),
    COMPOUND_STRING("KAAHLY"),
    COMPOUND_STRING("KAALAEY"),
    COMPOUND_STRING("KAALAHY"),
    COMPOUND_STRING("KAALAY"),
    COMPOUND_STRING("KAALEA"),
    COMPOUND_STRING("KAALEE"),
    COMPOUND_STRING("KAALEEA"),
    COMPOUND_STRING("KAALEEE"),
    COMPOUND_STRING("KAALEEI"),
    COMPOUND_STRING("KAALEEY"),
    COMPOUND_STRING("KAALEI"),
    COMPOUND_STRING("KAALEIE"),
    COMPOUND_STRING("KAALEIH"),
    COMPOUND_STRING("KAALEIY"),
    COMPOUND_STRING("KAALEY"),
    COMPOUND_STRING("KAALHAY"),
    COMPOUND_STRING("KAALHEA"),
    COMPOUND_STRING("KAALHEE"),
    COMPOUND_STRING("KAALHEI"),
    COMPOUND_STRING("KAALHEY"),
    COMPOUND_STRING("KAALHI"),
    COMPOUND_STRING("KAALHIE"),
    COMPOUND_STRING("KAALHII"),
    COMPOUND_STRING("KAALHIS"),
    COMPOUND_STRING("KAALHIY"),
    COMPOUND_STRING("KAALHY"),
    COMPOUND_STRING("KAALI"),
    COMPOUND_STRING("KAALIE"),
    COMPOUND_STRING("KAALIEE"),
    COMPOUND_STRING("KAALIEI"),
    COMPOUND_STRING("KAALIEY"),
    COMPOUND_STRING("KAALII"),
    COMPOUND_STRING("KAALIIE"),
    COMPOUND_STRING("KAALIII"),
    COMPOUND_STRING("KAALIIS"),
    COMPOUND_STRING("KAALIS"),
    COMPOUND_STRING("KAALIY"),
    COMPOUND_STRING("KAALLAY"),
    COMPOUND_STRING("KAALLEA"),
    COMPOUND_STRING("KAALLEE"),
    COMPOUND_STRING("KAALLEI"),
    COMPOUND_STRING("KAALLEY"),
    COMPOUND_STRING("KAALLI"),
    COMPOUND_STRING("KAALLIE"),
    COMPOUND_STRING("KAALLII"),
    COMPOUND_STRING("KAALLIS"),
    COMPOUND_STRING("KAALLIY"),
    COMPOUND_STRING("KAALLY"),
    COMPOUND_STRING("KAALY"),
    COMPOUND_STRING("KAAYLAY"),
    COMPOUND_STRING("KAAYLEA"),
    COMPOUND_STRING("KAAYLEE"),
    COMPOUND_STRING("KAAYLEI"),
    COMPOUND_STRING("KAAYLEY"),
    COMPOUND_STRING("KAAYLHI"),
    COMPOUND_STRING("KAAYLHY"),
    COMPOUND_STRING("KAAYLI"),
    COMPOUND_STRING("KAAYLIE"),
    COMPOUND_STRING("KAAYLII"),
    COMPOUND_STRING("KAAYLIS"),
    COMPOUND_STRING("KAAYLIY"),
    COMPOUND_STRING("KAAYLLI"),
    COMPOUND_STRING("KAAYLLY"),
    COMPOUND_STRING("KAAYLY"),
    COMPOUND_STRING("KAEGHLI"),
    COMPOUND_STRING("KAEGHLY"),
    COMPOUND_STRING("KAEHLAY"),
    COMPOUND_STRING("KAEHLEA"),
    COMPOUND_STRING("KAEHLEE"),
    COMPOUND_STRING("KAEHLEI"),
    COMPOUND_STRING("KAEHLEY"),
    COMPOUND_STRING("KAEHLHI"),
    COMPOUND_STRING("KAEHLHY"),
    COMPOUND_STRING("KAEHLI"),
    COMPOUND_STRING("KAEHLIE"),
    COMPOUND_STRING("KAEHLII"),
    COMPOUND_STRING("KAEHLIS"),
    COMPOUND_STRING("KAEHLIY"),
    COMPOUND_STRING("KAEHLLI"),
    COMPOUND_STRING("KAEHLLY"),
    COMPOUND_STRING("KAEHLY"),
    COMPOUND_STRING("KAELAEY"),
    COMPOUND_STRING("KAELAHY"),
    COMPOUND_STRING("KAELAY"),
    COMPOUND_STRING("KAELEA"),
    COMPOUND_STRING("KAELEE"),
    COMPOUND_STRING("KAELEEA"),
    COMPOUND_STRING("KAELEEE"),
    COMPOUND_STRING("KAELEEI"),
    COMPOUND_STRING("KAELEEY"),
    COMPOUND_STRING("KAELEI"),
    COMPOUND_STRING("KAELEIE"),
    COMPOUND_STRING("KAELEIH"),
    COMPOUND_STRING("KAELEIY"),
    COMPOUND_STRING("KAELEY"),
    COMPOUND_STRING("KAELHAY"),
    COMPOUND_STRING("KAELHEA"),
    COMPOUND_STRING("KAELHEE"),
    COMPOUND_STRING("KAELHEI"),
    COMPOUND_STRING("KAELHEY"),
    COMPOUND_STRING("KAELHI"),
    COMPOUND_STRING("KAELHIE"),
    COMPOUND_STRING("KAELHII"),
    COMPOUND_STRING("KAELHIS"),
    COMPOUND_STRING("KAELHIY"),
    COMPOUND_STRING("KAELHY"),
    COMPOUND_STRING("KAELI"),
    COMPOUND_STRING("KAELIE"),
    COMPOUND_STRING("KAELIEE"),
    COMPOUND_STRING("KAELIEI"),
    COMPOUND_STRING("KAELIEY"),
    COMPOUND_STRING("KAELII"),
    COMPOUND_STRING("KAELIIE"),
    COMPOUND_STRING("KAELIII"),
    COMPOUND_STRING("KAELIIS"),
    COMPOUND_STRING("KAELIS"),
    COMPOUND_STRING("KAELIY"),
    COMPOUND_STRING("KAELLAY"),
    COMPOUND_STRING("KAELLEA"),
    COMPOUND_STRING("KAELLEE"),
    COMPOUND_STRING("KAELLEI"),
    COMPOUND_STRING("KAELLEY"),
    COMPOUND_STRING("KAELLI"),
    COMPOUND_STRING("KAELLIE"),
    COMPOUND_STRING("KAELLII"),
    COMPOUND_STRING("KAELLIS"),
    COMPOUND_STRING("KAELLIY"),
    COMPOUND_STRING("KAELLY"),
    COMPOUND_STRING("KAELY"),
    COMPOUND_STRING("KAGHLAY"),
    COMPOUND_STRING("KAGHLEA"),
    COMPOUND_STRING("KAGHLEE"),
    COMPOUND_STRING("KAGHLEI"),
    COMPOUND_STRING("KAGHLEY"),
    COMPOUND_STRING("KAGHLHI"),
    COMPOUND_STRING("KAGHLHY"),
    COMPOUND_STRING("KAGHLI"),
    COMPOUND_STRING("KAGHLIE"),
    COMPOUND_STRING("KAGHLII"),
    COMPOUND_STRING("KAGHLIS"),
    COMPOUND_STRING("KAGHLIY"),
    COMPOUND_STRING("KAGHLLI"),
    COMPOUND_STRING("KAGHLLY"),
    COMPOUND_STRING("KAGHLY"),
    COMPOUND_STRING("KAHLAEY"),
    COMPOUND_STRING("KAHLAHY"),
    COMPOUND_STRING("KAHLAY"),
    COMPOUND_STRING("KAHLEA"),
    COMPOUND_STRING("KAHLEE"),
    COMPOUND_STRING("KAHLEEA"),
    COMPOUND_STRING("KAHLEEE"),
    COMPOUND_STRING("KAHLEEI"),
    COMPOUND_STRING("KAHLEEY"),
    COMPOUND_STRING("KAHLEI"),
    COMPOUND_STRING("KAHLEIE"),
    COMPOUND_STRING("KAHLEIH"),
    COMPOUND_STRING("KAHLEIY"),
    COMPOUND_STRING("KAHLEY"),
    COMPOUND_STRING("KAHLHAY"),
    COMPOUND_STRING("KAHLHEA"),
    COMPOUND_STRING("KAHLHEE"),
    COMPOUND_STRING("KAHLHEI"),
    COMPOUND_STRING("KAHLHEY"),
    COMPOUND_STRING("KAHLHI"),
    COMPOUND_STRING("KAHLHIE"),
    COMPOUND_STRING("KAHLHII"),
    COMPOUND_STRING("KAHLHIS"),
    COMPOUND_STRING("KAHLHIY"),
    COMPOUND_STRING("KAHLHY"),
    COMPOUND_STRING("KAHLI"),
    COMPOUND_STRING("KAHLIE"),
    COMPOUND_STRING("KAHLIEE"),
    COMPOUND_STRING("KAHLIEI"),
    COMPOUND_STRING("KAHLIEY"),
    COMPOUND_STRING("KAHLII"),
    COMPOUND_STRING("KAHLIIE"),
    COMPOUND_STRING("KAHLIII"),
    COMPOUND_STRING("KAHLIIS"),
    COMPOUND_STRING("KAHLIS"),
    COMPOUND_STRING("KAHLIY"),
    COMPOUND_STRING("KAHLLAY"),
    COMPOUND_STRING("KAHLLEA"),
    COMPOUND_STRING("KAHLLEE"),
    COMPOUND_STRING("KAHLLEI"),
    COMPOUND_STRING("KAHLLEY"),
    COMPOUND_STRING("KAHLLI"),
    COMPOUND_STRING("KAHLLIE"),
    COMPOUND_STRING("KAHLLII"),
    COMPOUND_STRING("KAHLLIS"),
    COMPOUND_STRING("KAHLLIY"),
    COMPOUND_STRING("KAHLLY"),
    COMPOUND_STRING("KAHLY"),
    COMPOUND_STRING("KAHYLAY"),
    COMPOUND_STRING("KAHYLEA"),
    COMPOUND_STRING("KAHYLEE"),
    COMPOUND_STRING("KAHYLEI"),
    COMPOUND_STRING("KAHYLEY"),
    COMPOUND_STRING("KAHYLHI"),
    COMPOUND_STRING("KAHYLHY"),
    COMPOUND_STRING("KAHYLI"),
    COMPOUND_STRING("KAHYLIE"),
    COMPOUND_STRING("KAHYLII"),
    COMPOUND_STRING("KAHYLIS"),
    COMPOUND_STRING("KAHYLIY"),
    COMPOUND_STRING("KAHYLLI"),
    COMPOUND_STRING("KAHYLLY"),
    COMPOUND_STRING("KAHYLY"),
    COMPOUND_STRING("KAIGHLI"),
    COMPOUND_STRING("KAIGHLY"),
    COMPOUND_STRING("KAILAEY"),
    COMPOUND_STRING("KAILAHY"),
    COMPOUND_STRING("KAILAY"),
    COMPOUND_STRING("KAILEA"),
    COMPOUND_STRING("KAILEE"),
    COMPOUND_STRING("KAILEEA"),
    COMPOUND_STRING("KAILEEE"),
    COMPOUND_STRING("KAILEEI"),
    COMPOUND_STRING("KAILEEY"),
    COMPOUND_STRING("KAILEI"),
    COMPOUND_STRING("KAILEIE"),
    COMPOUND_STRING("KAILEIH"),
    COMPOUND_STRING("KAILEIY"),
    COMPOUND_STRING("KAILEY"),
    COMPOUND_STRING("KAILHAY"),
    COMPOUND_STRING("KAILHEA"),
    COMPOUND_STRING("KAILHEE"),
    COMPOUND_STRING("KAILHEI"),
    COMPOUND_STRING("KAILHEY"),
    COMPOUND_STRING("KAILHI"),
    COMPOUND_STRING("KAILHIE"),
    COMPOUND_STRING("KAILHII"),
    COMPOUND_STRING("KAILHIS"),
    COMPOUND_STRING("KAILHIY"),
    COMPOUND_STRING("KAILHY"),
    COMPOUND_STRING("KAILI"),
    COMPOUND_STRING("KAILIE"),
    COMPOUND_STRING("KAILIEE"),
    COMPOUND_STRING("KAILIEI"),
    COMPOUND_STRING("KAILIEY"),
    COMPOUND_STRING("KAILII"),
    COMPOUND_STRING("KAILIIE"),
    COMPOUND_STRING("KAILIII"),
    COMPOUND_STRING("KAILIIS"),
    COMPOUND_STRING("KAILIS"),
    COMPOUND_STRING("KAILIY"),
    COMPOUND_STRING("KAILLAY"),
    COMPOUND_STRING("KAILLEA"),
    COMPOUND_STRING("KAILLEE"),
    COMPOUND_STRING("KAILLEI"),
    COMPOUND_STRING("KAILLEY"),
    COMPOUND_STRING("KAILLI"),
    COMPOUND_STRING("KAILLIE"),
    COMPOUND_STRING("KAILLII"),
    COMPOUND_STRING("KAILLIS"),
    COMPOUND_STRING("KAILLIY"),
    COMPOUND_STRING("KAILLY"),
    COMPOUND_STRING("KAILY"),
    COMPOUND_STRING("KALAEHY"),
    COMPOUND_STRING("KALAEY"),
    COMPOUND_STRING("KALAHEY"),
    COMPOUND_STRING("KALAHY"),
    COMPOUND_STRING("KALAY"),
    COMPOUND_STRING("KALEA"),
    COMPOUND_STRING("KALEE"),
    COMPOUND_STRING("KALEEA"),
    COMPOUND_STRING("KALEEE"),
    COMPOUND_STRING("KALEEEA"),
    COMPOUND_STRING("KALEEEE"),
    COMPOUND_STRING("KALEEEI"),
    COMPOUND_STRING("KALEEEY"),
    COMPOUND_STRING("KALEEI"),
    COMPOUND_STRING("KALEEIE"),
    COMPOUND_STRING("KALEEIH"),
    COMPOUND_STRING("KALEEIY"),
    COMPOUND_STRING("KALEEY"),
    COMPOUND_STRING("KALEI"),
    COMPOUND_STRING("KALEIE"),
    COMPOUND_STRING("KALEIGH"),
    COMPOUND_STRING("KALEIH"),
    COMPOUND_STRING("KALEIIH"),
    COMPOUND_STRING("KALEIIY"),
    COMPOUND_STRING("KALEIY"),
    COMPOUND_STRING("KALEIYY"),
    COMPOUND_STRING("KALEY"),
    COMPOUND_STRING("KALHAEY"),
    COMPOUND_STRING("KALHAHY"),
    COMPOUND_STRING("KALHAY"),
    COMPOUND_STRING("KALHEA"),
    COMPOUND_STRING("KALHEE"),
    COMPOUND_STRING("KALHEEA"),
    COMPOUND_STRING("KALHEEE"),
    COMPOUND_STRING("KALHEEI"),
    COMPOUND_STRING("KALHEEY"),
    COMPOUND_STRING("KALHEI"),
    COMPOUND_STRING("KALHEIE"),
    COMPOUND_STRING("KALHEIH"),
    COMPOUND_STRING("KALHEIY"),
    COMPOUND_STRING("KALHEY"),
    COMPOUND_STRING("KALHI"),
    COMPOUND_STRING("KALHIE"),
    COMPOUND_STRING("KALHIEE"),
    COMPOUND_STRING("KALHIEI"),
    COMPOUND_STRING("KALHIEY"),
    COMPOUND_STRING("KALHII"),
    COMPOUND_STRING("KALHIIE"),
    COMPOUND_STRING("KALHIII"),
    COMPOUND_STRING("KALHIIS"),
    COMPOUND_STRING("KALHIS"),
    COMPOUND_STRING("KALHIY"),
    COMPOUND_STRING("KALHY"),
    COMPOUND_STRING("KALI"),
    COMPOUND_STRING("KALIE"),
    COMPOUND_STRING("KALIEE"),
    COMPOUND_STRING("KALIEEE"),
    COMPOUND_STRING("KALIEEY"),
    COMPOUND_STRING("KALIEI"),
    COMPOUND_STRING("KALIEY"),
    COMPOUND_STRING("KALIEYY"),
    COMPOUND_STRING("KALII"),
    COMPOUND_STRING("KALIIE"),
    COMPOUND_STRING("KALIIEY"),
    COMPOUND_STRING("KALIII"),
    COMPOUND_STRING("KALIIIE"),
    COMPOUND_STRING("KALIIII"),
    COMPOUND_STRING("KALIIIS"),
    COMPOUND_STRING("KALIIS"),
    COMPOUND_STRING("KALIS"),
    COMPOUND_STRING("KALIY"),
    COMPOUND_STRING("KALLAEY"),
    COMPOUND_STRING("KALLAHY"),
    COMPOUND_STRING("KALLAY"),
    COMPOUND_STRING("KALLEA"),
    COMPOUND_STRING("KALLEE"),
    COMPOUND_STRING("KALLEEA"),
    COMPOUND_STRING("KALLEEE"),
    COMPOUND_STRING("KALLEEI"),
    COMPOUND_STRING("KALLEEY"),
    COMPOUND_STRING("KALLEI"),
    COMPOUND_STRING("KALLEIE"),
    COMPOUND_STRING("KALLEIH"),
    COMPOUND_STRING("KALLEIY"),
    COMPOUND_STRING("KALLEY"),
    COMPOUND_STRING("KALLI"),
    COMPOUND_STRING("KALLIE"),
    COMPOUND_STRING("KALLIEE"),
    COMPOUND_STRING("KALLIEI"),
    COMPOUND_STRING("KALLIEY"),
    COMPOUND_STRING("KALLII"),
    COMPOUND_STRING("KALLIIE"),
    COMPOUND_STRING("KALLIII"),
    COMPOUND_STRING("KALLIIS"),
    COMPOUND_STRING("KALLIS"),
    COMPOUND_STRING("KALLIY"),
    COMPOUND_STRING("KALLY"),
    COMPOUND_STRING("KALY"),
    COMPOUND_STRING("KAYELAY"),
    COMPOUND_STRING("KAYELEA"),
    COMPOUND_STRING("KAYELEE"),
    COMPOUND_STRING("KAYELEI"),
    COMPOUND_STRING("KAYELEY"),
    COMPOUND_STRING("KAYELHI"),
    COMPOUND_STRING("KAYELHY"),
    COMPOUND_STRING("KAYELI"),
    COMPOUND_STRING("KAYELIE"),
    COMPOUND_STRING("KAYELII"),
    COMPOUND_STRING("KAYELIS"),
    COMPOUND_STRING("KAYELIY"),
    COMPOUND_STRING("KAYELLI"),
    COMPOUND_STRING("KAYELLY"),
    COMPOUND_STRING("KAYELY"),
    COMPOUND_STRING("KAYLAEY"),
    COMPOUND_STRING("KAYLAHY"),
    COMPOUND_STRING("KAYLAY"),
    COMPOUND_STRING("KAYLEA"),
    COMPOUND_STRING("KAYLEE"),
    COMPOUND_STRING("KAYLEEA"),
    COMPOUND_STRING("KAYLEEE"),
    COMPOUND_STRING("KAYLEEI"),
    COMPOUND_STRING("KAYLEEY"),
    COMPOUND_STRING("KAYLEI"),
    COMPOUND_STRING("KAYLEIE"),
    COMPOUND_STRING("KAYLEIH"),
    COMPOUND_STRING("KAYLEIY"),
    COMPOUND_STRING("KAYLEY"),
    COMPOUND_STRING("KAYLHAY"),
    COMPOUND_STRING("KAYLHEA"),
    COMPOUND_STRING("KAYLHEE"),
    COMPOUND_STRING("KAYLHEI"),
    COMPOUND_STRING("KAYLHEY"),
    COMPOUND_STRING("KAYLHI"),
    COMPOUND_STRING("KAYLHIE"),
    COMPOUND_STRING("KAYLHII"),
    COMPOUND_STRING("KAYLHIS"),
    COMPOUND_STRING("KAYLHIY"),
    COMPOUND_STRING("KAYLHY"),
    COMPOUND_STRING("KAYLI"),
    COMPOUND_STRING("KAYLIE"),
    COMPOUND_STRING("KAYLIEE"),
    COMPOUND_STRING("KAYLIEI"),
    COMPOUND_STRING("KAYLIEY"),
    COMPOUND_STRING("KAYLII"),
    COMPOUND_STRING("KAYLIIE"),
    COMPOUND_STRING("KAYLIII"),
    COMPOUND_STRING("KAYLIIS"),
    COMPOUND_STRING("KAYLIS"),
    COMPOUND_STRING("KAYLIY"),
    COMPOUND_STRING("KAYLLAY"),
    COMPOUND_STRING("KAYLLEA"),
    COMPOUND_STRING("KAYLLEE"),
    COMPOUND_STRING("KAYLLEI"),
    COMPOUND_STRING("KAYLLEY"),
    COMPOUND_STRING("KAYLLI"),
    COMPOUND_STRING("KAYLLIE"),
    COMPOUND_STRING("KAYLLII"),
    COMPOUND_STRING("KAYLLIS"),
    COMPOUND_STRING("KAYLLIY"),
    COMPOUND_STRING("KAYLLY"),
    COMPOUND_STRING("KAYLY"),
    COMPOUND_STRING("KCAAHLI"),
    COMPOUND_STRING("KCAAHLY"),
    COMPOUND_STRING("KCAALAY"),
    COMPOUND_STRING("KCAALEA"),
    COMPOUND_STRING("KCAALEE"),
    COMPOUND_STRING("KCAALEI"),
    COMPOUND_STRING("KCAALEY"),
    COMPOUND_STRING("KCAALHI"),
    COMPOUND_STRING("KCAALHY"),
    COMPOUND_STRING("KCAALI"),
    COMPOUND_STRING("KCAALIE"),
    COMPOUND_STRING("KCAALII"),
    COMPOUND_STRING("KCAALIS"),
    COMPOUND_STRING("KCAALIY"),
    COMPOUND_STRING("KCAALLI"),
    COMPOUND_STRING("KCAALLY"),
    COMPOUND_STRING("KCAALY"),
    COMPOUND_STRING("KCAAYLI"),
    COMPOUND_STRING("KCAAYLY"),
    COMPOUND_STRING("KCAEHLI"),
    COMPOUND_STRING("KCAEHLY"),
    COMPOUND_STRING("KCAELAY"),
    COMPOUND_STRING("KCAELEA"),
    COMPOUND_STRING("KCAELEE"),
    COMPOUND_STRING("KCAELEI"),
    COMPOUND_STRING("KCAELEY"),
    COMPOUND_STRING("KCAELHI"),
    COMPOUND_STRING("KCAELHY"),
    COMPOUND_STRING("KCAELI"),
    COMPOUND_STRING("KCAELIE"),
    COMPOUND_STRING("KCAELII"),
    COMPOUND_STRING("KCAELIS"),
    COMPOUND_STRING("KCAELIY"),
    COMPOUND_STRING("KCAELLI"),
    COMPOUND_STRING("KCAELLY"),
    COMPOUND_STRING("KCAELY"),
    COMPOUND_STRING("KCAGHLI"),
    COMPOUND_STRING("KCAGHLY"),
    COMPOUND_STRING("KCAHLAY"),
    COMPOUND_STRING("KCAHLEA"),
    COMPOUND_STRING("KCAHLEE"),
    COMPOUND_STRING("KCAHLEI"),
    COMPOUND_STRING("KCAHLEY"),
    COMPOUND_STRING("KCAHLHI"),
    COMPOUND_STRING("KCAHLHY"),
    COMPOUND_STRING("KCAHLI"),
    COMPOUND_STRING("KCAHLIE"),
    COMPOUND_STRING("KCAHLII"),
    COMPOUND_STRING("KCAHLIS"),
    COMPOUND_STRING("KCAHLIY"),
    COMPOUND_STRING("KCAHLLI"),
    COMPOUND_STRING("KCAHLLY"),
    COMPOUND_STRING("KCAHLY"),
    COMPOUND_STRING("KCAHYLI"),
    COMPOUND_STRING("KCAHYLY"),
    COMPOUND_STRING("KCAILAY"),
    COMPOUND_STRING("KCAILEA"),
    COMPOUND_STRING("KCAILEE"),
    COMPOUND_STRING("KCAILEI"),
    COMPOUND_STRING("KCAILEY"),
    COMPOUND_STRING("KCAILHI"),
    COMPOUND_STRING("KCAILHY"),
    COMPOUND_STRING("KCAILI"),
    COMPOUND_STRING("KCAILIE"),
    COMPOUND_STRING("KCAILII"),
    COMPOUND_STRING("KCAILIS"),
    COMPOUND_STRING("KCAILIY"),
    COMPOUND_STRING("KCAILLI"),
    COMPOUND_STRING("KCAILLY"),
    COMPOUND_STRING("KCAILY"),
    COMPOUND_STRING("KCALAEY"),
    COMPOUND_STRING("KCALAHY"),
    COMPOUND_STRING("KCALAY"),
    COMPOUND_STRING("KCALEA"),
    COMPOUND_STRING("KCALEE"),
    COMPOUND_STRING("KCALEEA"),
    COMPOUND_STRING("KCALEEE"),
    COMPOUND_STRING("KCALEEI"),
    COMPOUND_STRING("KCALEEY"),
    COMPOUND_STRING("KCALEI"),
    COMPOUND_STRING("KCALEIE"),
    COMPOUND_STRING("KCALEIH"),
    COMPOUND_STRING("KCALEIY"),
    COMPOUND_STRING("KCALEY"),
    COMPOUND_STRING("KCALHAY"),
    COMPOUND_STRING("KCALHEA"),
    COMPOUND_STRING("KCALHEE"),
    COMPOUND_STRING("KCALHEI"),
    COMPOUND_STRING("KCALHEY"),
    COMPOUND_STRING("KCALHI"),
    COMPOUND_STRING("KCALHIE"),
    COMPOUND_STRING("KCALHII"),
    COMPOUND_STRING("KCALHIS"),
    COMPOUND_STRING("KCALHIY"),
    COMPOUND_STRING("KCALHY"),
    COMPOUND_STRING("KCALI"),
    COMPOUND_STRING("KCALIE"),
    COMPOUND_STRING("KCALIEE"),
    COMPOUND_STRING("KCALIEI"),
    COMPOUND_STRING("KCALIEY"),
    COMPOUND_STRING("KCALII"),
    COMPOUND_STRING("KCALIIE"),
    COMPOUND_STRING("KCALIII"),
    COMPOUND_STRING("KCALIIS"),
    COMPOUND_STRING("KCALIS"),
    COMPOUND_STRING("KCALIY"),
    COMPOUND_STRING("KCALLAY"),
    COMPOUND_STRING("KCALLEA"),
    COMPOUND_STRING("KCALLEE"),
    COMPOUND_STRING("KCALLEI"),
    COMPOUND_STRING("KCALLEY"),
    COMPOUND_STRING("KCALLI"),
    COMPOUND_STRING("KCALLIE"),
    COMPOUND_STRING("KCALLII"),
    COMPOUND_STRING("KCALLIS"),
    COMPOUND_STRING("KCALLIY"),
    COMPOUND_STRING("KCALLY"),
    COMPOUND_STRING("KCALY"),
    COMPOUND_STRING("KCAYELI"),
    COMPOUND_STRING("KCAYELY"),
    COMPOUND_STRING("KCAYLAY"),
    COMPOUND_STRING("KCAYLEA"),
    COMPOUND_STRING("KCAYLEE"),
    COMPOUND_STRING("KCAYLEI"),
    COMPOUND_STRING("KCAYLEY"),
    COMPOUND_STRING("KCAYLHI"),
    COMPOUND_STRING("KCAYLHY"),
    COMPOUND_STRING("KCAYLI"),
    COMPOUND_STRING("KCAYLIE"),
    COMPOUND_STRING("KCAYLII"),
    COMPOUND_STRING("KCAYLIS"),
    COMPOUND_STRING("KCAYLIY"),
    COMPOUND_STRING("KCAYLLI"),
    COMPOUND_STRING("KCAYLLY"),
    COMPOUND_STRING("KCAYLY"),
    COMPOUND_STRING("KEALAEY"),
    COMPOUND_STRING("KEALAHY"),
    COMPOUND_STRING("KEALAY"),
    COMPOUND_STRING("KEALEA"),
    COMPOUND_STRING("KEALEE"),
    COMPOUND_STRING("KEALEEA"),
    COMPOUND_STRING("KEALEEE"),
    COMPOUND_STRING("KEALEEI"),
    COMPOUND_STRING("KEALEEY"),
    COMPOUND_STRING("KEALEI"),
    COMPOUND_STRING("KEALEIE"),
    COMPOUND_STRING("KEALEIH"),
    COMPOUND_STRING("KEALEIY"),
    COMPOUND_STRING("KEALEY"),
    COMPOUND_STRING("KEALHAY"),
    COMPOUND_STRING("KEALHEA"),
    COMPOUND_STRING("KEALHEE"),
    COMPOUND_STRING("KEALHEI"),
    COMPOUND_STRING("KEALHEY"),
    COMPOUND_STRING("KEALHI"),
    COMPOUND_STRING("KEALHIE"),
    COMPOUND_STRING("KEALHII"),
    COMPOUND_STRING("KEALHIS"),
    COMPOUND_STRING("KEALHIY"),
    COMPOUND_STRING("KEALHY"),
    COMPOUND_STRING("KEALI"),
    COMPOUND_STRING("KEALIE"),
    COMPOUND_STRING("KEALIEE"),
    COMPOUND_STRING("KEALIEI"),
    COMPOUND_STRING("KEALIEY"),
    COMPOUND_STRING("KEALII"),
    COMPOUND_STRING("KEALIIE"),
    COMPOUND_STRING("KEALIII"),
    COMPOUND_STRING("KEALIIS"),
    COMPOUND_STRING("KEALIS"),
    COMPOUND_STRING("KEALIY"),
    COMPOUND_STRING("KEALLAY"),
    COMPOUND_STRING("KEALLEA"),
    COMPOUND_STRING("KEALLEE"),
    COMPOUND_STRING("KEALLEI"),
    COMPOUND_STRING("KEALLEY"),
    COMPOUND_STRING("KEALLI"),
    COMPOUND_STRING("KEALLIE"),
    COMPOUND_STRING("KEALLII"),
    COMPOUND_STRING("KEALLIS"),
    COMPOUND_STRING("KEALLIY"),
    COMPOUND_STRING("KEALLY"),
    COMPOUND_STRING("KEALY"),
    COMPOUND_STRING("KEIGHLI"),
    COMPOUND_STRING("KEIGHLY"),
    COMPOUND_STRING("KEIGLAY"),
    COMPOUND_STRING("KEIGLEA"),
    COMPOUND_STRING("KEIGLEE"),
    COMPOUND_STRING("KEIGLEI"),
    COMPOUND_STRING("KEIGLEY"),
    COMPOUND_STRING("KEIGLHI"),
    COMPOUND_STRING("KEIGLHY"),
    COMPOUND_STRING("KEIGLI"),
    COMPOUND_STRING("KEIGLIE"),
    COMPOUND_STRING("KEIGLII"),
    COMPOUND_STRING("KEIGLIS"),
    COMPOUND_STRING("KEIGLIY"),
    COMPOUND_STRING("KEIGLLI"),
    COMPOUND_STRING("KEIGLLY"),
    COMPOUND_STRING("KEIGLY"),
    COMPOUND_STRING("KEIHLAY"),
    COMPOUND_STRING("KEIHLEA"),
    COMPOUND_STRING("KEIHLEE"),
    COMPOUND_STRING("KEIHLEI"),
    COMPOUND_STRING("KEIHLEY"),
    COMPOUND_STRING("KEIHLHI"),
    COMPOUND_STRING("KEIHLHY"),
    COMPOUND_STRING("KEIHLI"),
    COMPOUND_STRING("KEIHLIE"),
    COMPOUND_STRING("KEIHLII"),
    COMPOUND_STRING("KEIHLIS"),
    COMPOUND_STRING("KEIHLIY"),
    COMPOUND_STRING("KEIHLLI"),
    COMPOUND_STRING("KEIHLLY"),
    COMPOUND_STRING("KEIHLY"),
    COMPOUND_STRING("KEILAEY"),
    COMPOUND_STRING("KEILAHY"),
    COMPOUND_STRING("KEILAY"),
    COMPOUND_STRING("KEILEA"),
    COMPOUND_STRING("KEILEE"),
    COMPOUND_STRING("KEILEEA"),
    COMPOUND_STRING("KEILEEE"),
    COMPOUND_STRING("KEILEEI"),
    COMPOUND_STRING("KEILEEY"),
    COMPOUND_STRING("KEILEI"),
    COMPOUND_STRING("KEILEIE"),
    COMPOUND_STRING("KEILEIH"),
    COMPOUND_STRING("KEILEIY"),
    COMPOUND_STRING("KEILEY"),
    COMPOUND_STRING("KEILHAY"),
    COMPOUND_STRING("KEILHEA"),
    COMPOUND_STRING("KEILHEE"),
    COMPOUND_STRING("KEILHEI"),
    COMPOUND_STRING("KEILHEY"),
    COMPOUND_STRING("KEILHI"),
    COMPOUND_STRING("KEILHIE"),
    COMPOUND_STRING("KEILHII"),
    COMPOUND_STRING("KEILHIS"),
    COMPOUND_STRING("KEILHIY"),
    COMPOUND_STRING("KEILHY"),
    COMPOUND_STRING("KEILI"),
    COMPOUND_STRING("KEILIE"),
    COMPOUND_STRING("KEILIEE"),
    COMPOUND_STRING("KEILIEI"),
    COMPOUND_STRING("KEILIEY"),
    COMPOUND_STRING("KEILII"),
    COMPOUND_STRING("KEILIIE"),
    COMPOUND_STRING("KEILIII"),
    COMPOUND_STRING("KEILIIS"),
    COMPOUND_STRING("KEILIS"),
    COMPOUND_STRING("KEILIY"),
    COMPOUND_STRING("KEILLAY"),
    COMPOUND_STRING("KEILLEA"),
    COMPOUND_STRING("KEILLEE"),
    COMPOUND_STRING("KEILLEI"),
    COMPOUND_STRING("KEILLEY"),
    COMPOUND_STRING("KEILLI"),
    COMPOUND_STRING("KEILLIE"),
    COMPOUND_STRING("KEILLII"),
    COMPOUND_STRING("KEILLIS"),
    COMPOUND_STRING("KEILLIY"),
    COMPOUND_STRING("KEILLY"),
    COMPOUND_STRING("KEILY"),
    COMPOUND_STRING("KEYLAEY"),
    COMPOUND_STRING("KEYLAHY"),
    COMPOUND_STRING("KEYLAY"),
    COMPOUND_STRING("KEYLEA"),
    COMPOUND_STRING("KEYLEE"),
    COMPOUND_STRING("KEYLEEA"),
    COMPOUND_STRING("KEYLEEE"),
    COMPOUND_STRING("KEYLEEI"),
    COMPOUND_STRING("KEYLEEY"),
    COMPOUND_STRING("KEYLEI"),
    COMPOUND_STRING("KEYLEIE"),
    COMPOUND_STRING("KEYLEIH"),
    COMPOUND_STRING("KEYLEIY"),
    COMPOUND_STRING("KEYLEY"),
    COMPOUND_STRING("KEYLHAY"),
    COMPOUND_STRING("KEYLHEA"),
    COMPOUND_STRING("KEYLHEE"),
    COMPOUND_STRING("KEYLHEI"),
    COMPOUND_STRING("KEYLHEY"),
    COMPOUND_STRING("KEYLHI"),
    COMPOUND_STRING("KEYLHIE"),
    COMPOUND_STRING("KEYLHII"),
    COMPOUND_STRING("KEYLHIS"),
    COMPOUND_STRING("KEYLHIY"),
    COMPOUND_STRING("KEYLHY"),
    COMPOUND_STRING("KEYLI"),
    COMPOUND_STRING("KEYLIE"),
    COMPOUND_STRING("KEYLIEE"),
    COMPOUND_STRING("KEYLIEI"),
    COMPOUND_STRING("KEYLIEY"),
    COMPOUND_STRING("KEYLII"),
    COMPOUND_STRING("KEYLIIE"),
    COMPOUND_STRING("KEYLIII"),
    COMPOUND_STRING("KEYLIIS"),
    COMPOUND_STRING("KEYLIS"),
    COMPOUND_STRING("KEYLIY"),
    COMPOUND_STRING("KEYLLAY"),
    COMPOUND_STRING("KEYLLEA"),
    COMPOUND_STRING("KEYLLEE"),
    COMPOUND_STRING("KEYLLEI"),
    COMPOUND_STRING("KEYLLEY"),
    COMPOUND_STRING("KEYLLI"),
    COMPOUND_STRING("KEYLLIE"),
    COMPOUND_STRING("KEYLLII"),
    COMPOUND_STRING("KEYLLIS"),
    COMPOUND_STRING("KEYLLIY"),
    COMPOUND_STRING("KEYLLY"),
    COMPOUND_STRING("KEYLY"),
    COMPOUND_STRING("KGHALAY"),
    COMPOUND_STRING("KGHALEA"),
    COMPOUND_STRING("KGHALEE"),
    COMPOUND_STRING("KGHALEI"),
    COMPOUND_STRING("KGHALEY"),
    COMPOUND_STRING("KGHALHI"),
    COMPOUND_STRING("KGHALHY"),
    COMPOUND_STRING("KGHALI"),
    COMPOUND_STRING("KGHALIE"),
    COMPOUND_STRING("KGHALII"),
    COMPOUND_STRING("KGHALIS"),
    COMPOUND_STRING("KGHALIY"),
    COMPOUND_STRING("KGHALLI"),
    COMPOUND_STRING("KGHALLY"),
    COMPOUND_STRING("KGHALY"),
    COMPOUND_STRING("KGHLAEY"),
    COMPOUND_STRING("KGHLAHY"),
    COMPOUND_STRING("KGHLAY"),
    COMPOUND_STRING("KGHLEA"),
    COMPOUND_STRING("KGHLEE"),
    COMPOUND_STRING("KGHLEEA"),
    COMPOUND_STRING("KGHLEEE"),
    COMPOUND_STRING("KGHLEEI"),
    COMPOUND_STRING("KGHLEEY"),
    COMPOUND_STRING("KGHLEI"),
    COMPOUND_STRING("KGHLEIE"),
    COMPOUND_STRING("KGHLEIH"),
    COMPOUND_STRING("KGHLEIY"),
    COMPOUND_STRING("KGHLEY"),
    COMPOUND_STRING("KGHLHAY"),
    COMPOUND_STRING("KGHLHEA"),
    COMPOUND_STRING("KGHLHEE"),
    COMPOUND_STRING("KGHLHEI"),
    COMPOUND_STRING("KGHLHEY"),
    COMPOUND_STRING("KGHLHI"),
    COMPOUND_STRING("KGHLHIE"),
    COMPOUND_STRING("KGHLHII"),
    COMPOUND_STRING("KGHLHIS"),
    COMPOUND_STRING("KGHLHIY"),
    COMPOUND_STRING("KGHLHY"),
    COMPOUND_STRING("KGHLI"),
    COMPOUND_STRING("KGHLIE"),
    COMPOUND_STRING("KGHLIEE"),
    COMPOUND_STRING("KGHLIEI"),
    COMPOUND_STRING("KGHLIEY"),
    COMPOUND_STRING("KGHLII"),
    COMPOUND_STRING("KGHLIIE"),
    COMPOUND_STRING("KGHLIII"),
    COMPOUND_STRING("KGHLIIS"),
    COMPOUND_STRING("KGHLIS"),
    COMPOUND_STRING("KGHLIY"),
    COMPOUND_STRING("KGHLLAY"),
    COMPOUND_STRING("KGHLLEA"),
    COMPOUND_STRING("KGHLLEE"),
    COMPOUND_STRING("KGHLLEI"),
    COMPOUND_STRING("KGHLLEY"),
    COMPOUND_STRING("KGHLLI"),
    COMPOUND_STRING("KGHLLIE"),
    COMPOUND_STRING("KGHLLII"),
    COMPOUND_STRING("KGHLLIS"),
    COMPOUND_STRING("KGHLLIY"),
    COMPOUND_STRING("KGHLLY"),
    COMPOUND_STRING("KGHLY"),
    COMPOUND_STRING("KGLAEHY"),
    COMPOUND_STRING("KGLAEY"),
    COMPOUND_STRING("KGLAHEY"),
    COMPOUND_STRING("KGLAHY"),
    COMPOUND_STRING("KGLAY"),
    COMPOUND_STRING("KGLEA"),
    COMPOUND_STRING("KGLEE"),
    COMPOUND_STRING("KGLEEA"),
    COMPOUND_STRING("KGLEEE"),
    COMPOUND_STRING("KGLEEEA"),
    COMPOUND_STRING("KGLEEEE"),
    COMPOUND_STRING("KGLEEEI"),
    COMPOUND_STRING("KGLEEEY"),
    COMPOUND_STRING("KGLEEI"),
    COMPOUND_STRING("KGLEEIE"),
    COMPOUND_STRING("KGLEEIH"),
    COMPOUND_STRING("KGLEEIY"),
    COMPOUND_STRING("KGLEEY"),
    COMPOUND_STRING("KGLEI"),
    COMPOUND_STRING("KGLEIE"),
    COMPOUND_STRING("KGLEIGH"),
    COMPOUND_STRING("KGLEIH"),
    COMPOUND_STRING("KGLEIIH"),
    COMPOUND_STRING("KGLEIIY"),
    COMPOUND_STRING("KGLEIY"),
    COMPOUND_STRING("KGLEIYY"),
    COMPOUND_STRING("KGLEY"),
    COMPOUND_STRING("KGLHAEY"),
    COMPOUND_STRING("KGLHAHY"),
    COMPOUND_STRING("KGLHAY"),
    COMPOUND_STRING("KGLHEA"),
    COMPOUND_STRING("KGLHEE"),
    COMPOUND_STRING("KGLHEEA"),
    COMPOUND_STRING("KGLHEEE"),
    COMPOUND_STRING("KGLHEEI"),
    COMPOUND_STRING("KGLHEEY"),
    COMPOUND_STRING("KGLHEI"),
    COMPOUND_STRING("KGLHEIE"),
    COMPOUND_STRING("KGLHEIH"),
    COMPOUND_STRING("KGLHEIY"),
    COMPOUND_STRING("KGLHEY"),
    COMPOUND_STRING("KGLHI"),
    COMPOUND_STRING("KGLHIE"),
    COMPOUND_STRING("KGLHIEE"),
    COMPOUND_STRING("KGLHIEI"),
    COMPOUND_STRING("KGLHIEY"),
    COMPOUND_STRING("KGLHII"),
    COMPOUND_STRING("KGLHIIE"),
    COMPOUND_STRING("KGLHIII"),
    COMPOUND_STRING("KGLHIIS"),
    COMPOUND_STRING("KGLHIS"),
    COMPOUND_STRING("KGLHIY"),
    COMPOUND_STRING("KGLHY"),
    COMPOUND_STRING("KGLI"),
    COMPOUND_STRING("KGLIE"),
    COMPOUND_STRING("KGLIEE"),
    COMPOUND_STRING("KGLIEEE"),
    COMPOUND_STRING("KGLIEEY"),
    COMPOUND_STRING("KGLIEI"),
    COMPOUND_STRING("KGLIEY"),
    COMPOUND_STRING("KGLIEYY"),
    COMPOUND_STRING("KGLII"),
    COMPOUND_STRING("KGLIIE"),
    COMPOUND_STRING("KGLIIEY"),
    COMPOUND_STRING("KGLIII"),
    COMPOUND_STRING("KGLIIIE"),
    COMPOUND_STRING("KGLIIII"),
    COMPOUND_STRING("KGLIIIS"),
    COMPOUND_STRING("KGLIIS"),
    COMPOUND_STRING("KGLIS"),
    COMPOUND_STRING("KGLIY"),
    COMPOUND_STRING("KGLLAEY"),
    COMPOUND_STRING("KGLLAHY"),
    COMPOUND_STRING("KGLLAY"),
    COMPOUND_STRING("KGLLEA"),
    COMPOUND_STRING("KGLLEE"),
    COMPOUND_STRING("KGLLEEA"),
    COMPOUND_STRING("KGLLEEE"),
    COMPOUND_STRING("KGLLEEI"),
    COMPOUND_STRING("KGLLEEY"),
    COMPOUND_STRING("KGLLEI"),
    COMPOUND_STRING("KGLLEIE"),
    COMPOUND_STRING("KGLLEIH"),
    COMPOUND_STRING("KGLLEIY"),
    COMPOUND_STRING("KGLLEY"),
    COMPOUND_STRING("KGLLI"),
    COMPOUND_STRING("KGLLIE"),
    COMPOUND_STRING("KGLLIEE"),
    COMPOUND_STRING("KGLLIEI"),
    COMPOUND_STRING("KGLLIEY"),
    COMPOUND_STRING("KGLLII"),
    COMPOUND_STRING("KGLLIIE"),
    COMPOUND_STRING("KGLLIII"),
    COMPOUND_STRING("KGLLIIS"),
    COMPOUND_STRING("KGLLIS"),
    COMPOUND_STRING("KGLLIY"),
    COMPOUND_STRING("KGLLY"),
    COMPOUND_STRING("KGLY"),
    COMPOUND_STRING("KGY"),
    COMPOUND_STRING("KHAAHLI"),
    COMPOUND_STRING("KHAAHLY"),
    COMPOUND_STRING("KHAALAY"),
    COMPOUND_STRING("KHAALEA"),
    COMPOUND_STRING("KHAALEE"),
    COMPOUND_STRING("KHAALEI"),
    COMPOUND_STRING("KHAALEY"),
    COMPOUND_STRING("KHAALHI"),
    COMPOUND_STRING("KHAALHY"),
    COMPOUND_STRING("KHAALI"),
    COMPOUND_STRING("KHAALIE"),
    COMPOUND_STRING("KHAALII"),
    COMPOUND_STRING("KHAALIS"),
    COMPOUND_STRING("KHAALIY"),
    COMPOUND_STRING("KHAALLI"),
    COMPOUND_STRING("KHAALLY"),
    COMPOUND_STRING("KHAALY"),
    COMPOUND_STRING("KHAAYLI"),
    COMPOUND_STRING("KHAAYLY"),
    COMPOUND_STRING("KHAEHLI"),
    COMPOUND_STRING("KHAEHLY"),
    COMPOUND_STRING("KHAELAY"),
    COMPOUND_STRING("KHAELEA"),
    COMPOUND_STRING("KHAELEE"),
    COMPOUND_STRING("KHAELEI"),
    COMPOUND_STRING("KHAELEY"),
    COMPOUND_STRING("KHAELHI"),
    COMPOUND_STRING("KHAELHY"),
    COMPOUND_STRING("KHAELI"),
    COMPOUND_STRING("KHAELIE"),
    COMPOUND_STRING("KHAELII"),
    COMPOUND_STRING("KHAELIS"),
    COMPOUND_STRING("KHAELIY"),
    COMPOUND_STRING("KHAELLI"),
    COMPOUND_STRING("KHAELLY"),
    COMPOUND_STRING("KHAELY"),
    COMPOUND_STRING("KHAGHLI"),
    COMPOUND_STRING("KHAGHLY"),
    COMPOUND_STRING("KHAHLAY"),
    COMPOUND_STRING("KHAHLEA"),
    COMPOUND_STRING("KHAHLEE"),
    COMPOUND_STRING("KHAHLEI"),
    COMPOUND_STRING("KHAHLEY"),
    COMPOUND_STRING("KHAHLHI"),
    COMPOUND_STRING("KHAHLHY"),
    COMPOUND_STRING("KHAHLI"),
    COMPOUND_STRING("KHAHLIE"),
    COMPOUND_STRING("KHAHLII"),
    COMPOUND_STRING("KHAHLIS"),
    COMPOUND_STRING("KHAHLIY"),
    COMPOUND_STRING("KHAHLLI"),
    COMPOUND_STRING("KHAHLLY"),
    COMPOUND_STRING("KHAHLY"),
    COMPOUND_STRING("KHAHYLI"),
    COMPOUND_STRING("KHAHYLY"),
    COMPOUND_STRING("KHAILAY"),
    COMPOUND_STRING("KHAILEA"),
    COMPOUND_STRING("KHAILEE"),
    COMPOUND_STRING("KHAILEI"),
    COMPOUND_STRING("KHAILEY"),
    COMPOUND_STRING("KHAILHI"),
    COMPOUND_STRING("KHAILHY"),
    COMPOUND_STRING("KHAILI"),
    COMPOUND_STRING("KHAILIE"),
    COMPOUND_STRING("KHAILII"),
    COMPOUND_STRING("KHAILIS"),
    COMPOUND_STRING("KHAILIY"),
    COMPOUND_STRING("KHAILLI"),
    COMPOUND_STRING("KHAILLY"),
    COMPOUND_STRING("KHAILY"),
    COMPOUND_STRING("KHALAEY"),
    COMPOUND_STRING("KHALAHY"),
    COMPOUND_STRING("KHALAY"),
    COMPOUND_STRING("KHALEA"),
    COMPOUND_STRING("KHALEE"),
    COMPOUND_STRING("KHALEEA"),
    COMPOUND_STRING("KHALEEE"),
    COMPOUND_STRING("KHALEEI"),
    COMPOUND_STRING("KHALEEY"),
    COMPOUND_STRING("KHALEI"),
    COMPOUND_STRING("KHALEIE"),
    COMPOUND_STRING("KHALEIH"),
    COMPOUND_STRING("KHALEIY"),
    COMPOUND_STRING("KHALEY"),
    COMPOUND_STRING("KHALHAY"),
    COMPOUND_STRING("KHALHEA"),
    COMPOUND_STRING("KHALHEE"),
    COMPOUND_STRING("KHALHEI"),
    COMPOUND_STRING("KHALHEY"),
    COMPOUND_STRING("KHALHI"),
    COMPOUND_STRING("KHALHIE"),
    COMPOUND_STRING("KHALHII"),
    COMPOUND_STRING("KHALHIS"),
    COMPOUND_STRING("KHALHIY"),
    COMPOUND_STRING("KHALHY"),
    COMPOUND_STRING("KHALI"),
    COMPOUND_STRING("KHALIE"),
    COMPOUND_STRING("KHALIEE"),
    COMPOUND_STRING("KHALIEI"),
    COMPOUND_STRING("KHALIEY"),
    COMPOUND_STRING("KHALII"),
    COMPOUND_STRING("KHALIIE"),
    COMPOUND_STRING("KHALIII"),
    COMPOUND_STRING("KHALIIS"),
    COMPOUND_STRING("KHALIS"),
    COMPOUND_STRING("KHALIY"),
    COMPOUND_STRING("KHALLAY"),
    COMPOUND_STRING("KHALLEA"),
    COMPOUND_STRING("KHALLEE"),
    COMPOUND_STRING("KHALLEI"),
    COMPOUND_STRING("KHALLEY"),
    COMPOUND_STRING("KHALLI"),
    COMPOUND_STRING("KHALLIE"),
    COMPOUND_STRING("KHALLII"),
    COMPOUND_STRING("KHALLIS"),
    COMPOUND_STRING("KHALLIY"),
    COMPOUND_STRING("KHALLY"),
    COMPOUND_STRING("KHALY"),
    COMPOUND_STRING("KHAYELI"),
    COMPOUND_STRING("KHAYELY"),
    COMPOUND_STRING("KHAYLAY"),
    COMPOUND_STRING("KHAYLEA"),
    COMPOUND_STRING("KHAYLEE"),
    COMPOUND_STRING("KHAYLEI"),
    COMPOUND_STRING("KHAYLEY"),
    COMPOUND_STRING("KHAYLHI"),
    COMPOUND_STRING("KHAYLHY"),
    COMPOUND_STRING("KHAYLI"),
    COMPOUND_STRING("KHAYLIE"),
    COMPOUND_STRING("KHAYLII"),
    COMPOUND_STRING("KHAYLIS"),
    COMPOUND_STRING("KHAYLIY"),
    COMPOUND_STRING("KHAYLLI"),
    COMPOUND_STRING("KHAYLLY"),
    COMPOUND_STRING("KHAYLY"),
    COMPOUND_STRING("KHEALAY"),
    COMPOUND_STRING("KHEALEA"),
    COMPOUND_STRING("KHEALEE"),
    COMPOUND_STRING("KHEALEI"),
    COMPOUND_STRING("KHEALEY"),
    COMPOUND_STRING("KHEALHI"),
    COMPOUND_STRING("KHEALHY"),
    COMPOUND_STRING("KHEALI"),
    COMPOUND_STRING("KHEALIE"),
    COMPOUND_STRING("KHEALII"),
    COMPOUND_STRING("KHEALIS"),
    COMPOUND_STRING("KHEALIY"),
    COMPOUND_STRING("KHEALLI"),
    COMPOUND_STRING("KHEALLY"),
    COMPOUND_STRING("KHEALY"),
    COMPOUND_STRING("KHEIGLI"),
    COMPOUND_STRING("KHEIGLY"),
    COMPOUND_STRING("KHEIHLI"),
    COMPOUND_STRING("KHEIHLY"),
    COMPOUND_STRING("KHEILAY"),
    COMPOUND_STRING("KHEILEA"),
    COMPOUND_STRING("KHEILEE"),
    COMPOUND_STRING("KHEILEI"),
    COMPOUND_STRING("KHEILEY"),
    COMPOUND_STRING("KHEILHI"),
    COMPOUND_STRING("KHEILHY"),
    COMPOUND_STRING("KHEILI"),
    COMPOUND_STRING("KHEILIE"),
    COMPOUND_STRING("KHEILII"),
    COMPOUND_STRING("KHEILIS"),
    COMPOUND_STRING("KHEILIY"),
    COMPOUND_STRING("KHEILLI"),
    COMPOUND_STRING("KHEILLY"),
    COMPOUND_STRING("KHEILY"),
    COMPOUND_STRING("KHEYLAY"),
    COMPOUND_STRING("KHEYLEA"),
    COMPOUND_STRING("KHEYLEE"),
    COMPOUND_STRING("KHEYLEI"),
    COMPOUND_STRING("KHEYLEY"),
    COMPOUND_STRING("KHEYLHI"),
    COMPOUND_STRING("KHEYLHY"),
    COMPOUND_STRING("KHEYLI"),
    COMPOUND_STRING("KHEYLIE"),
    COMPOUND_STRING("KHEYLII"),
    COMPOUND_STRING("KHEYLIS"),
    COMPOUND_STRING("KHEYLIY"),
    COMPOUND_STRING("KHEYLLI"),
    COMPOUND_STRING("KHEYLLY"),
    COMPOUND_STRING("KHEYLY"),
    COMPOUND_STRING("KKAAHLI"),
    COMPOUND_STRING("KKAAHLY"),
    COMPOUND_STRING("KKAALAY"),
    COMPOUND_STRING("KKAALEA"),
    COMPOUND_STRING("KKAALEE"),
    COMPOUND_STRING("KKAALEI"),
    COMPOUND_STRING("KKAALEY"),
    COMPOUND_STRING("KKAALHI"),
    COMPOUND_STRING("KKAALHY"),
    COMPOUND_STRING("KKAALI"),
    COMPOUND_STRING("KKAALIE"),
    COMPOUND_STRING("KKAALII"),
    COMPOUND_STRING("KKAALIS"),
    COMPOUND_STRING("KKAALIY"),
    COMPOUND_STRING("KKAALLI"),
    COMPOUND_STRING("KKAALLY"),
    COMPOUND_STRING("KKAALY"),
    COMPOUND_STRING("KKAAYLI"),
    COMPOUND_STRING("KKAAYLY"),
    COMPOUND_STRING("KKAEHLI"),
    COMPOUND_STRING("KKAEHLY"),
    COMPOUND_STRING("KKAELAY"),
    COMPOUND_STRING("KKAELEA"),
    COMPOUND_STRING("KKAELEE"),
    COMPOUND_STRING("KKAELEI"),
    COMPOUND_STRING("KKAELEY"),
    COMPOUND_STRING("KKAELHI"),
    COMPOUND_STRING("KKAELHY"),
    COMPOUND_STRING("KKAELI"),
    COMPOUND_STRING("KKAELIE"),
    COMPOUND_STRING("KKAELII"),
    COMPOUND_STRING("KKAELIS"),
    COMPOUND_STRING("KKAELIY"),
    COMPOUND_STRING("KKAELLI"),
    COMPOUND_STRING("KKAELLY"),
    COMPOUND_STRING("KKAELY"),
    COMPOUND_STRING("KKAGHLI"),
    COMPOUND_STRING("KKAGHLY"),
    COMPOUND_STRING("KKAHLAY"),
    COMPOUND_STRING("KKAHLEA"),
    COMPOUND_STRING("KKAHLEE"),
    COMPOUND_STRING("KKAHLEI"),
    COMPOUND_STRING("KKAHLEY"),
    COMPOUND_STRING("KKAHLHI"),
    COMPOUND_STRING("KKAHLHY"),
    COMPOUND_STRING("KKAHLI"),
    COMPOUND_STRING("KKAHLIE"),
    COMPOUND_STRING("KKAHLII"),
    COMPOUND_STRING("KKAHLIS"),
    COMPOUND_STRING("KKAHLIY"),
    COMPOUND_STRING("KKAHLLI"),
    COMPOUND_STRING("KKAHLLY"),
    COMPOUND_STRING("KKAHLY"),
    COMPOUND_STRING("KKAHYLI"),
    COMPOUND_STRING("KKAHYLY"),
    COMPOUND_STRING("KKAILAY"),
    COMPOUND_STRING("KKAILEA"),
    COMPOUND_STRING("KKAILEE"),
    COMPOUND_STRING("KKAILEI"),
    COMPOUND_STRING("KKAILEY"),
    COMPOUND_STRING("KKAILHI"),
    COMPOUND_STRING("KKAILHY"),
    COMPOUND_STRING("KKAILI"),
    COMPOUND_STRING("KKAILIE"),
    COMPOUND_STRING("KKAILII"),
    COMPOUND_STRING("KKAILIS"),
    COMPOUND_STRING("KKAILIY"),
    COMPOUND_STRING("KKAILLI"),
    COMPOUND_STRING("KKAILLY"),
    COMPOUND_STRING("KKAILY"),
    COMPOUND_STRING("KKALAEY"),
    COMPOUND_STRING("KKALAHY"),
    COMPOUND_STRING("KKALAY"),
    COMPOUND_STRING("KKALEA"),
    COMPOUND_STRING("KKALEE"),
    COMPOUND_STRING("KKALEEA"),
    COMPOUND_STRING("KKALEEE"),
    COMPOUND_STRING("KKALEEI"),
    COMPOUND_STRING("KKALEEY"),
    COMPOUND_STRING("KKALEI"),
    COMPOUND_STRING("KKALEIE"),
    COMPOUND_STRING("KKALEIH"),
    COMPOUND_STRING("KKALEIY"),
    COMPOUND_STRING("KKALEY"),
    COMPOUND_STRING("KKALHAY"),
    COMPOUND_STRING("KKALHEA"),
    COMPOUND_STRING("KKALHEE"),
    COMPOUND_STRING("KKALHEI"),
    COMPOUND_STRING("KKALHEY"),
    COMPOUND_STRING("KKALHI"),
    COMPOUND_STRING("KKALHIE"),
    COMPOUND_STRING("KKALHII"),
    COMPOUND_STRING("KKALHIS"),
    COMPOUND_STRING("KKALHIY"),
    COMPOUND_STRING("KKALHY"),
    COMPOUND_STRING("KKALI"),
    COMPOUND_STRING("KKALIE"),
    COMPOUND_STRING("KKALIEE"),
    COMPOUND_STRING("KKALIEI"),
    COMPOUND_STRING("KKALIEY"),
    COMPOUND_STRING("KKALII"),
    COMPOUND_STRING("KKALIIE"),
    COMPOUND_STRING("KKALIII"),
    COMPOUND_STRING("KKALIIS"),
    COMPOUND_STRING("KKALIS"),
    COMPOUND_STRING("KKALIY"),
    COMPOUND_STRING("KKALLAY"),
    COMPOUND_STRING("KKALLEA"),
    COMPOUND_STRING("KKALLEE"),
    COMPOUND_STRING("KKALLEI"),
    COMPOUND_STRING("KKALLEY"),
    COMPOUND_STRING("KKALLI"),
    COMPOUND_STRING("KKALLIE"),
    COMPOUND_STRING("KKALLII"),
    COMPOUND_STRING("KKALLIS"),
    COMPOUND_STRING("KKALLIY"),
    COMPOUND_STRING("KKALLY"),
    COMPOUND_STRING("KKALY"),
    COMPOUND_STRING("KKAYELI"),
    COMPOUND_STRING("KKAYELY"),
    COMPOUND_STRING("KKAYLAY"),
    COMPOUND_STRING("KKAYLEA"),
    COMPOUND_STRING("KKAYLEE"),
    COMPOUND_STRING("KKAYLEI"),
    COMPOUND_STRING("KKAYLEY"),
    COMPOUND_STRING("KKAYLHI"),
    COMPOUND_STRING("KKAYLHY"),
    COMPOUND_STRING("KKAYLI"),
    COMPOUND_STRING("KKAYLIE"),
    COMPOUND_STRING("KKAYLII"),
    COMPOUND_STRING("KKAYLIS"),
    COMPOUND_STRING("KKAYLIY"),
    COMPOUND_STRING("KKAYLLI"),
    COMPOUND_STRING("KKAYLLY"),
    COMPOUND_STRING("KKAYLY"),
    COMPOUND_STRING("KKEALAY"),
    COMPOUND_STRING("KKEALEA"),
    COMPOUND_STRING("KKEALEE"),
    COMPOUND_STRING("KKEALEI"),
    COMPOUND_STRING("KKEALEY"),
    COMPOUND_STRING("KKEALHI"),
    COMPOUND_STRING("KKEALHY"),
    COMPOUND_STRING("KKEALI"),
    COMPOUND_STRING("KKEALIE"),
    COMPOUND_STRING("KKEALII"),
    COMPOUND_STRING("KKEALIS"),
    COMPOUND_STRING("KKEALIY"),
    COMPOUND_STRING("KKEALLI"),
    COMPOUND_STRING("KKEALLY"),
    COMPOUND_STRING("KKEALY"),
    COMPOUND_STRING("KKEIGLI"),
    COMPOUND_STRING("KKEIGLY"),
    COMPOUND_STRING("KKEIHLI"),
    COMPOUND_STRING("KKEIHLY"),
    COMPOUND_STRING("KKEILAY"),
    COMPOUND_STRING("KKEILEA"),
    COMPOUND_STRING("KKEILEE"),
    COMPOUND_STRING("KKEILEI"),
    COMPOUND_STRING("KKEILEY"),
    COMPOUND_STRING("KKEILHI"),
    COMPOUND_STRING("KKEILHY"),
    COMPOUND_STRING("KKEILI"),
    COMPOUND_STRING("KKEILIE"),
    COMPOUND_STRING("KKEILII"),
    COMPOUND_STRING("KKEILIS"),
    COMPOUND_STRING("KKEILIY"),
    COMPOUND_STRING("KKEILLI"),
    COMPOUND_STRING("KKEILLY"),
    COMPOUND_STRING("KKEILY"),
    COMPOUND_STRING("KKEYLAY"),
    COMPOUND_STRING("KKEYLEA"),
    COMPOUND_STRING("KKEYLEE"),
    COMPOUND_STRING("KKEYLEI"),
    COMPOUND_STRING("KKEYLEY"),
    COMPOUND_STRING("KKEYLHI"),
    COMPOUND_STRING("KKEYLHY"),
    COMPOUND_STRING("KKEYLI"),
    COMPOUND_STRING("KKEYLIE"),
    COMPOUND_STRING("KKEYLII"),
    COMPOUND_STRING("KKEYLIS"),
    COMPOUND_STRING("KKEYLIY"),
    COMPOUND_STRING("KKEYLLI"),
    COMPOUND_STRING("KKEYLLY"),
    COMPOUND_STRING("KKEYLY"),
    COMPOUND_STRING("KLAEHY"),
    COMPOUND_STRING("KLAEY"),
    COMPOUND_STRING("KLAHEY"),
    COMPOUND_STRING("KLAHY"),
    COMPOUND_STRING("KLAY"),
    COMPOUND_STRING("KLEA"),
    COMPOUND_STRING("KLEE"),
    COMPOUND_STRING("KLEEA"),
    COMPOUND_STRING("KLEEE"),
    COMPOUND_STRING("KLEEEA"),
    COMPOUND_STRING("KLEEEE"),
    COMPOUND_STRING("KLEEEI"),
    COMPOUND_STRING("KLEEEY"),
    COMPOUND_STRING("KLEEI"),
    COMPOUND_STRING("KLEEIE"),
    COMPOUND_STRING("KLEEIH"),
    COMPOUND_STRING("KLEEIY"),
    COMPOUND_STRING("KLEEY"),
    COMPOUND_STRING("KLEI"),
    COMPOUND_STRING("KLEIE"),
    COMPOUND_STRING("KLEIGH"),
    COMPOUND_STRING("KLEIH"),
    COMPOUND_STRING("KLEIIH"),
    COMPOUND_STRING("KLEIIY"),
    COMPOUND_STRING("KLEIY"),
    COMPOUND_STRING("KLEIYY"),
    COMPOUND_STRING("KLEY"),
    COMPOUND_STRING("KLHAEY"),
    COMPOUND_STRING("KLHAHY"),
    COMPOUND_STRING("KLHAY"),
    COMPOUND_STRING("KLHEA"),
    COMPOUND_STRING("KLHEE"),
    COMPOUND_STRING("KLHEEA"),
    COMPOUND_STRING("KLHEEE"),
    COMPOUND_STRING("KLHEEI"),
    COMPOUND_STRING("KLHEEY"),
    COMPOUND_STRING("KLHEI"),
    COMPOUND_STRING("KLHEIE"),
    COMPOUND_STRING("KLHEIH"),
    COMPOUND_STRING("KLHEIY"),
    COMPOUND_STRING("KLHEY"),
    COMPOUND_STRING("KLHI"),
    COMPOUND_STRING("KLHIE"),
    COMPOUND_STRING("KLHIEE"),
    COMPOUND_STRING("KLHIEI"),
    COMPOUND_STRING("KLHIEY"),
    COMPOUND_STRING("KLHII"),
    COMPOUND_STRING("KLHIIE"),
    COMPOUND_STRING("KLHIII"),
    COMPOUND_STRING("KLHIIS"),
    COMPOUND_STRING("KLHIS"),
    COMPOUND_STRING("KLHIY"),
    COMPOUND_STRING("KLHY"),
    COMPOUND_STRING("KLI"),
    COMPOUND_STRING("KLIE"),
    COMPOUND_STRING("KLIEE"),
    COMPOUND_STRING("KLIEEE"),
    COMPOUND_STRING("KLIEEY"),
    COMPOUND_STRING("KLIEI"),
    COMPOUND_STRING("KLIEY"),
    COMPOUND_STRING("KLIEYY"),
    COMPOUND_STRING("KLII"),
    COMPOUND_STRING("KLIIE"),
    COMPOUND_STRING("KLIIEY"),
    COMPOUND_STRING("KLIII"),
    COMPOUND_STRING("KLIIIE"),
    COMPOUND_STRING("KLIIII"),
    COMPOUND_STRING("KLIIIS"),
    COMPOUND_STRING("KLIIS"),
    COMPOUND_STRING("KLIS"),
    COMPOUND_STRING("KLIY"),
    COMPOUND_STRING("KLLAEY"),
    COMPOUND_STRING("KLLAHY"),
    COMPOUND_STRING("KLLAY"),
    COMPOUND_STRING("KLLEA"),
    COMPOUND_STRING("KLLEE"),
    COMPOUND_STRING("KLLEEA"),
    COMPOUND_STRING("KLLEEE"),
    COMPOUND_STRING("KLLEEI"),
    COMPOUND_STRING("KLLEEY"),
    COMPOUND_STRING("KLLEI"),
    COMPOUND_STRING("KLLEIE"),
    COMPOUND_STRING("KLLEIH"),
    COMPOUND_STRING("KLLEIY"),
    COMPOUND_STRING("KLLEY"),
    COMPOUND_STRING("KLLI"),
    COMPOUND_STRING("KLLIE"),
    COMPOUND_STRING("KLLIEE"),
    COMPOUND_STRING("KLLIEI"),
    COMPOUND_STRING("KLLIEY"),
    COMPOUND_STRING("KLLII"),
    COMPOUND_STRING("KLLIIE"),
    COMPOUND_STRING("KLLIII"),
    COMPOUND_STRING("KLLIIS"),
    COMPOUND_STRING("KLLIS"),
    COMPOUND_STRING("KLLIY"),
    COMPOUND_STRING("KLLY"),
    COMPOUND_STRING("KLY"),
    COMPOUND_STRING("KQAAHLI"),
    COMPOUND_STRING("KQAAHLY"),
    COMPOUND_STRING("KQAALAY"),
    COMPOUND_STRING("KQAALEA"),
    COMPOUND_STRING("KQAALEE"),
    COMPOUND_STRING("KQAALEI"),
    COMPOUND_STRING("KQAALEY"),
    COMPOUND_STRING("KQAALHI"),
    COMPOUND_STRING("KQAALHY"),
    COMPOUND_STRING("KQAALI"),
    COMPOUND_STRING("KQAALIE"),
    COMPOUND_STRING("KQAALII"),
    COMPOUND_STRING("KQAALIS"),
    COMPOUND_STRING("KQAALIY"),
    COMPOUND_STRING("KQAALLI"),
    COMPOUND_STRING("KQAALLY"),
    COMPOUND_STRING("KQAALY"),
    COMPOUND_STRING("KQAAYLI"),
    COMPOUND_STRING("KQAAYLY"),
    COMPOUND_STRING("KQAEHLI"),
    COMPOUND_STRING("KQAEHLY"),
    COMPOUND_STRING("KQAELAY"),
    COMPOUND_STRING("KQAELEA"),
    COMPOUND_STRING("KQAELEE"),
    COMPOUND_STRING("KQAELEI"),
    COMPOUND_STRING("KQAELEY"),
    COMPOUND_STRING("KQAELHI"),
    COMPOUND_STRING("KQAELHY"),
    COMPOUND_STRING("KQAELI"),
    COMPOUND_STRING("KQAELIE"),
    COMPOUND_STRING("KQAELII"),
    COMPOUND_STRING("KQAELIS"),
    COMPOUND_STRING("KQAELIY"),
    COMPOUND_STRING("KQAELLI"),
    COMPOUND_STRING("KQAELLY"),
    COMPOUND_STRING("KQAELY"),
    COMPOUND_STRING("KQAGHLI"),
    COMPOUND_STRING("KQAGHLY"),
    COMPOUND_STRING("KQAHLAY"),
    COMPOUND_STRING("KQAHLEA"),
    COMPOUND_STRING("KQAHLEE"),
    COMPOUND_STRING("KQAHLEI"),
    COMPOUND_STRING("KQAHLEY"),
    COMPOUND_STRING("KQAHLHI"),
    COMPOUND_STRING("KQAHLHY"),
    COMPOUND_STRING("KQAHLI"),
    COMPOUND_STRING("KQAHLIE"),
    COMPOUND_STRING("KQAHLII"),
    COMPOUND_STRING("KQAHLIS"),
    COMPOUND_STRING("KQAHLIY"),
    COMPOUND_STRING("KQAHLLI"),
    COMPOUND_STRING("KQAHLLY"),
    COMPOUND_STRING("KQAHLY"),
    COMPOUND_STRING("KQAHYLI"),
    COMPOUND_STRING("KQAHYLY"),
    COMPOUND_STRING("KQAILAY"),
    COMPOUND_STRING("KQAILEA"),
    COMPOUND_STRING("KQAILEE"),
    COMPOUND_STRING("KQAILEI"),
    COMPOUND_STRING("KQAILEY"),
    COMPOUND_STRING("KQAILHI"),
    COMPOUND_STRING("KQAILHY"),
    COMPOUND_STRING("KQAILI"),
    COMPOUND_STRING("KQAILIE"),
    COMPOUND_STRING("KQAILII"),
    COMPOUND_STRING("KQAILIS"),
    COMPOUND_STRING("KQAILIY"),
    COMPOUND_STRING("KQAILLI"),
    COMPOUND_STRING("KQAILLY"),
    COMPOUND_STRING("KQAILY"),
    COMPOUND_STRING("KQALAEY"),
    COMPOUND_STRING("KQALAHY"),
    COMPOUND_STRING("KQALAY"),
    COMPOUND_STRING("KQALEA"),
    COMPOUND_STRING("KQALEE"),
    COMPOUND_STRING("KQALEEA"),
    COMPOUND_STRING("KQALEEE"),
    COMPOUND_STRING("KQALEEI"),
    COMPOUND_STRING("KQALEEY"),
    COMPOUND_STRING("KQALEI"),
    COMPOUND_STRING("KQALEIE"),
    COMPOUND_STRING("KQALEIH"),
    COMPOUND_STRING("KQALEIY"),
    COMPOUND_STRING("KQALEY"),
    COMPOUND_STRING("KQALHAY"),
    COMPOUND_STRING("KQALHEA"),
    COMPOUND_STRING("KQALHEE"),
    COMPOUND_STRING("KQALHEI"),
    COMPOUND_STRING("KQALHEY"),
    COMPOUND_STRING("KQALHI"),
    COMPOUND_STRING("KQALHIE"),
    COMPOUND_STRING("KQALHII"),
    COMPOUND_STRING("KQALHIS"),
    COMPOUND_STRING("KQALHIY"),
    COMPOUND_STRING("KQALHY"),
    COMPOUND_STRING("KQALI"),
    COMPOUND_STRING("KQALIE"),
    COMPOUND_STRING("KQALIEE"),
    COMPOUND_STRING("KQALIEI"),
    COMPOUND_STRING("KQALIEY"),
    COMPOUND_STRING("KQALII"),
    COMPOUND_STRING("KQALIIE"),
    COMPOUND_STRING("KQALIII"),
    COMPOUND_STRING("KQALIIS"),
    COMPOUND_STRING("KQALIS"),
    COMPOUND_STRING("KQALIY"),
    COMPOUND_STRING("KQALLAY"),
    COMPOUND_STRING("KQALLEA"),
    COMPOUND_STRING("KQALLEE"),
    COMPOUND_STRING("KQALLEI"),
    COMPOUND_STRING("KQALLEY"),
    COMPOUND_STRING("KQALLI"),
    COMPOUND_STRING("KQALLIE"),
    COMPOUND_STRING("KQALLII"),
    COMPOUND_STRING("KQALLIS"),
    COMPOUND_STRING("KQALLIY"),
    COMPOUND_STRING("KQALLY"),
    COMPOUND_STRING("KQALY"),
    COMPOUND_STRING("KQAYELI"),
    COMPOUND_STRING("KQAYELY"),
    COMPOUND_STRING("KQAYLAY"),
    COMPOUND_STRING("KQAYLEA"),
    COMPOUND_STRING("KQAYLEE"),
    COMPOUND_STRING("KQAYLEI"),
    COMPOUND_STRING("KQAYLEY"),
    COMPOUND_STRING("KQAYLHI"),
    COMPOUND_STRING("KQAYLHY"),
    COMPOUND_STRING("KQAYLI"),
    COMPOUND_STRING("KQAYLIE"),
    COMPOUND_STRING("KQAYLII"),
    COMPOUND_STRING("KQAYLIS"),
    COMPOUND_STRING("KQAYLIY"),
    COMPOUND_STRING("KQAYLLI"),
    COMPOUND_STRING("KQAYLLY"),
    COMPOUND_STRING("KQAYLY"),
    COMPOUND_STRING("KQEALAY"),
    COMPOUND_STRING("KQEALEA"),
    COMPOUND_STRING("KQEALEE"),
    COMPOUND_STRING("KQEALEI"),
    COMPOUND_STRING("KQEALEY"),
    COMPOUND_STRING("KQEALHI"),
    COMPOUND_STRING("KQEALHY"),
    COMPOUND_STRING("KQEALI"),
    COMPOUND_STRING("KQEALIE"),
    COMPOUND_STRING("KQEALII"),
    COMPOUND_STRING("KQEALIS"),
    COMPOUND_STRING("KQEALIY"),
    COMPOUND_STRING("KQEALLI"),
    COMPOUND_STRING("KQEALLY"),
    COMPOUND_STRING("KQEALY"),
    COMPOUND_STRING("KQEIGLI"),
    COMPOUND_STRING("KQEIGLY"),
    COMPOUND_STRING("KQEIHLI"),
    COMPOUND_STRING("KQEIHLY"),
    COMPOUND_STRING("KQEILAY"),
    COMPOUND_STRING("KQEILEA"),
    COMPOUND_STRING("KQEILEE"),
    COMPOUND_STRING("KQEILEI"),
    COMPOUND_STRING("KQEILEY"),
    COMPOUND_STRING("KQEILHI"),
    COMPOUND_STRING("KQEILHY"),
    COMPOUND_STRING("KQEILI"),
    COMPOUND_STRING("KQEILIE"),
    COMPOUND_STRING("KQEILII"),
    COMPOUND_STRING("KQEILIS"),
    COMPOUND_STRING("KQEILIY"),
    COMPOUND_STRING("KQEILLI"),
    COMPOUND_STRING("KQEILLY"),
    COMPOUND_STRING("KQEILY"),
    COMPOUND_STRING("KQEYLAY"),
    COMPOUND_STRING("KQEYLEA"),
    COMPOUND_STRING("KQEYLEE"),
    COMPOUND_STRING("KQEYLEI"),
    COMPOUND_STRING("KQEYLEY"),
    COMPOUND_STRING("KQEYLHI"),
    COMPOUND_STRING("KQEYLHY"),
    COMPOUND_STRING("KQEYLI"),
    COMPOUND_STRING("KQEYLIE"),
    COMPOUND_STRING("KQEYLII"),
    COMPOUND_STRING("KQEYLIS"),
    COMPOUND_STRING("KQEYLIY"),
    COMPOUND_STRING("KQEYLLI"),
    COMPOUND_STRING("KQEYLLY"),
    COMPOUND_STRING("KQEYLY"),
    COMPOUND_STRING("QAAGHLI"),
    COMPOUND_STRING("QAAGHLY"),
    COMPOUND_STRING("QAAHLAY"),
    COMPOUND_STRING("QAAHLEA"),
    COMPOUND_STRING("QAAHLEE"),
    COMPOUND_STRING("QAAHLEI"),
    COMPOUND_STRING("QAAHLEY"),
    COMPOUND_STRING("QAAHLHI"),
    COMPOUND_STRING("QAAHLHY"),
    COMPOUND_STRING("QAAHLI"),
    COMPOUND_STRING("QAAHLIE"),
    COMPOUND_STRING("QAAHLII"),
    COMPOUND_STRING("QAAHLIS"),
    COMPOUND_STRING("QAAHLIY"),
    COMPOUND_STRING("QAAHLLI"),
    COMPOUND_STRING("QAAHLLY"),
    COMPOUND_STRING("QAAHLY"),
    COMPOUND_STRING("QAALAEY"),
    COMPOUND_STRING("QAALAHY"),
    COMPOUND_STRING("QAALAY"),
    COMPOUND_STRING("QAALEA"),
    COMPOUND_STRING("QAALEE"),
    COMPOUND_STRING("QAALEEA"),
    COMPOUND_STRING("QAALEEE"),
    COMPOUND_STRING("QAALEEI"),
    COMPOUND_STRING("QAALEEY"),
    COMPOUND_STRING("QAALEI"),
    COMPOUND_STRING("QAALEIE"),
    COMPOUND_STRING("QAALEIH"),
    COMPOUND_STRING("QAALEIY"),
    COMPOUND_STRING("QAALEY"),
    COMPOUND_STRING("QAALHAY"),
    COMPOUND_STRING("QAALHEA"),
    COMPOUND_STRING("QAALHEE"),
    COMPOUND_STRING("QAALHEI"),
    COMPOUND_STRING("QAALHEY"),
    COMPOUND_STRING("QAALHI"),
    COMPOUND_STRING("QAALHIE"),
    COMPOUND_STRING("QAALHII"),
    COMPOUND_STRING("QAALHIS"),
    COMPOUND_STRING("QAALHIY"),
    COMPOUND_STRING("QAALHY"),
    COMPOUND_STRING("QAALI"),
    COMPOUND_STRING("QAALIE"),
    COMPOUND_STRING("QAALIEE"),
    COMPOUND_STRING("QAALIEI"),
    COMPOUND_STRING("QAALIEY"),
    COMPOUND_STRING("QAALII"),
    COMPOUND_STRING("QAALIIE"),
    COMPOUND_STRING("QAALIII"),
    COMPOUND_STRING("QAALIIS"),
    COMPOUND_STRING("QAALIS"),
    COMPOUND_STRING("QAALIY"),
    COMPOUND_STRING("QAALLAY"),
    COMPOUND_STRING("QAALLEA"),
    COMPOUND_STRING("QAALLEE"),
    COMPOUND_STRING("QAALLEI"),
    COMPOUND_STRING("QAALLEY"),
    COMPOUND_STRING("QAALLI"),
    COMPOUND_STRING("QAALLIE"),
    COMPOUND_STRING("QAALLII"),
    COMPOUND_STRING("QAALLIS"),
    COMPOUND_STRING("QAALLIY"),
    COMPOUND_STRING("QAALLY"),
    COMPOUND_STRING("QAALY"),
    COMPOUND_STRING("QAAYLAY"),
    COMPOUND_STRING("QAAYLEA"),
    COMPOUND_STRING("QAAYLEE"),
    COMPOUND_STRING("QAAYLEI"),
    COMPOUND_STRING("QAAYLEY"),
    COMPOUND_STRING("QAAYLHI"),
    COMPOUND_STRING("QAAYLHY"),
    COMPOUND_STRING("QAAYLI"),
    COMPOUND_STRING("QAAYLIE"),
    COMPOUND_STRING("QAAYLII"),
    COMPOUND_STRING("QAAYLIS"),
    COMPOUND_STRING("QAAYLIY"),
    COMPOUND_STRING("QAAYLLI"),
    COMPOUND_STRING("QAAYLLY"),
    COMPOUND_STRING("QAAYLY"),
    COMPOUND_STRING("QAEGHLI"),
    COMPOUND_STRING("QAEGHLY"),
    COMPOUND_STRING("QAEHLAY"),
    COMPOUND_STRING("QAEHLEA"),
    COMPOUND_STRING("QAEHLEE"),
    COMPOUND_STRING("QAEHLEI"),
    COMPOUND_STRING("QAEHLEY"),
    COMPOUND_STRING("QAEHLHI"),
    COMPOUND_STRING("QAEHLHY"),
    COMPOUND_STRING("QAEHLI"),
    COMPOUND_STRING("QAEHLIE"),
    COMPOUND_STRING("QAEHLII"),
    COMPOUND_STRING("QAEHLIS"),
    COMPOUND_STRING("QAEHLIY"),
    COMPOUND_STRING("QAEHLLI"),
    COMPOUND_STRING("QAEHLLY"),
    COMPOUND_STRING("QAEHLY"),
    COMPOUND_STRING("QAELAEY"),
    COMPOUND_STRING("QAELAHY"),
    COMPOUND_STRING("QAELAY"),
    COMPOUND_STRING("QAELEA"),
    COMPOUND_STRING("QAELEE"),
    COMPOUND_STRING("QAELEEA"),
    COMPOUND_STRING("QAELEEE"),
    COMPOUND_STRING("QAELEEI"),
    COMPOUND_STRING("QAELEEY"),
    COMPOUND_STRING("QAELEI"),
    COMPOUND_STRING("QAELEIE"),
    COMPOUND_STRING("QAELEIH"),
    COMPOUND_STRING("QAELEIY"),
    COMPOUND_STRING("QAELEY"),
    COMPOUND_STRING("QAELHAY"),
    COMPOUND_STRING("QAELHEA"),
    COMPOUND_STRING("QAELHEE"),
    COMPOUND_STRING("QAELHEI"),
    COMPOUND_STRING("QAELHEY"),
    COMPOUND_STRING("QAELHI"),
    COMPOUND_STRING("QAELHIE"),
    COMPOUND_STRING("QAELHII"),
    COMPOUND_STRING("QAELHIS"),
    COMPOUND_STRING("QAELHIY"),
    COMPOUND_STRING("QAELHY"),
    COMPOUND_STRING("QAELI"),
    COMPOUND_STRING("QAELIE"),
    COMPOUND_STRING("QAELIEE"),
    COMPOUND_STRING("QAELIEI"),
    COMPOUND_STRING("QAELIEY"),
    COMPOUND_STRING("QAELII"),
    COMPOUND_STRING("QAELIIE"),
    COMPOUND_STRING("QAELIII"),
    COMPOUND_STRING("QAELIIS"),
    COMPOUND_STRING("QAELIS"),
    COMPOUND_STRING("QAELIY"),
    COMPOUND_STRING("QAELLAY"),
    COMPOUND_STRING("QAELLEA"),
    COMPOUND_STRING("QAELLEE"),
    COMPOUND_STRING("QAELLEI"),
    COMPOUND_STRING("QAELLEY"),
    COMPOUND_STRING("QAELLI"),
    COMPOUND_STRING("QAELLIE"),
    COMPOUND_STRING("QAELLII"),
    COMPOUND_STRING("QAELLIS"),
    COMPOUND_STRING("QAELLIY"),
    COMPOUND_STRING("QAELLY"),
    COMPOUND_STRING("QAELY"),
    COMPOUND_STRING("QAGHLAY"),
    COMPOUND_STRING("QAGHLEA"),
    COMPOUND_STRING("QAGHLEE"),
    COMPOUND_STRING("QAGHLEI"),
    COMPOUND_STRING("QAGHLEY"),
    COMPOUND_STRING("QAGHLHI"),
    COMPOUND_STRING("QAGHLHY"),
    COMPOUND_STRING("QAGHLI"),
    COMPOUND_STRING("QAGHLIE"),
    COMPOUND_STRING("QAGHLII"),
    COMPOUND_STRING("QAGHLIS"),
    COMPOUND_STRING("QAGHLIY"),
    COMPOUND_STRING("QAGHLLI"),
    COMPOUND_STRING("QAGHLLY"),
    COMPOUND_STRING("QAGHLY"),
    COMPOUND_STRING("QAHLAEY"),
    COMPOUND_STRING("QAHLAHY"),
    COMPOUND_STRING("QAHLAY"),
    COMPOUND_STRING("QAHLEA"),
    COMPOUND_STRING("QAHLEE"),
    COMPOUND_STRING("QAHLEEA"),
    COMPOUND_STRING("QAHLEEE"),
    COMPOUND_STRING("QAHLEEI"),
    COMPOUND_STRING("QAHLEEY"),
    COMPOUND_STRING("QAHLEI"),
    COMPOUND_STRING("QAHLEIE"),
    COMPOUND_STRING("QAHLEIH"),
    COMPOUND_STRING("QAHLEIY"),
    COMPOUND_STRING("QAHLEY"),
    COMPOUND_STRING("QAHLHAY"),
    COMPOUND_STRING("QAHLHEA"),
    COMPOUND_STRING("QAHLHEE"),
    COMPOUND_STRING("QAHLHEI"),
    COMPOUND_STRING("QAHLHEY"),
    COMPOUND_STRING("QAHLHI"),
    COMPOUND_STRING("QAHLHIE"),
    COMPOUND_STRING("QAHLHII"),
    COMPOUND_STRING("QAHLHIS"),
    COMPOUND_STRING("QAHLHIY"),
    COMPOUND_STRING("QAHLHY"),
    COMPOUND_STRING("QAHLI"),
    COMPOUND_STRING("QAHLIE"),
    COMPOUND_STRING("QAHLIEE"),
    COMPOUND_STRING("QAHLIEI"),
    COMPOUND_STRING("QAHLIEY"),
    COMPOUND_STRING("QAHLII"),
    COMPOUND_STRING("QAHLIIE"),
    COMPOUND_STRING("QAHLIII"),
    COMPOUND_STRING("QAHLIIS"),
    COMPOUND_STRING("QAHLIS"),
    COMPOUND_STRING("QAHLIY"),
    COMPOUND_STRING("QAHLLAY"),
    COMPOUND_STRING("QAHLLEA"),
    COMPOUND_STRING("QAHLLEE"),
    COMPOUND_STRING("QAHLLEI"),
    COMPOUND_STRING("QAHLLEY"),
    COMPOUND_STRING("QAHLLI"),
    COMPOUND_STRING("QAHLLIE"),
    COMPOUND_STRING("QAHLLII"),
    COMPOUND_STRING("QAHLLIS"),
    COMPOUND_STRING("QAHLLIY"),
    COMPOUND_STRING("QAHLLY"),
    COMPOUND_STRING("QAHLY"),
    COMPOUND_STRING("QAHYLAY"),
    COMPOUND_STRING("QAHYLEA"),
    COMPOUND_STRING("QAHYLEE"),
    COMPOUND_STRING("QAHYLEI"),
    COMPOUND_STRING("QAHYLEY"),
    COMPOUND_STRING("QAHYLHI"),
    COMPOUND_STRING("QAHYLHY"),
    COMPOUND_STRING("QAHYLI"),
    COMPOUND_STRING("QAHYLIE"),
    COMPOUND_STRING("QAHYLII"),
    COMPOUND_STRING("QAHYLIS"),
    COMPOUND_STRING("QAHYLIY"),
    COMPOUND_STRING("QAHYLLI"),
    COMPOUND_STRING("QAHYLLY"),
    COMPOUND_STRING("QAHYLY"),
    COMPOUND_STRING("QAIGHLI"),
    COMPOUND_STRING("QAIGHLY"),
    COMPOUND_STRING("QAILAEY"),
    COMPOUND_STRING("QAILAHY"),
    COMPOUND_STRING("QAILAY"),
    COMPOUND_STRING("QAILEA"),
    COMPOUND_STRING("QAILEE"),
    COMPOUND_STRING("QAILEEA"),
    COMPOUND_STRING("QAILEEE"),
    COMPOUND_STRING("QAILEEI"),
    COMPOUND_STRING("QAILEEY"),
    COMPOUND_STRING("QAILEI"),
    COMPOUND_STRING("QAILEIE"),
    COMPOUND_STRING("QAILEIH"),
    COMPOUND_STRING("QAILEIY"),
    COMPOUND_STRING("QAILEY"),
    COMPOUND_STRING("QAILHAY"),
    COMPOUND_STRING("QAILHEA"),
    COMPOUND_STRING("QAILHEE"),
    COMPOUND_STRING("QAILHEI"),
    COMPOUND_STRING("QAILHEY"),
    COMPOUND_STRING("QAILHI"),
    COMPOUND_STRING("QAILHIE"),
    COMPOUND_STRING("QAILHII"),
    COMPOUND_STRING("QAILHIS"),
    COMPOUND_STRING("QAILHIY"),
    COMPOUND_STRING("QAILHY"),
    COMPOUND_STRING("QAILI"),
    COMPOUND_STRING("QAILIE"),
    COMPOUND_STRING("QAILIEE"),
    COMPOUND_STRING("QAILIEI"),
    COMPOUND_STRING("QAILIEY"),
    COMPOUND_STRING("QAILII"),
    COMPOUND_STRING("QAILIIE"),
    COMPOUND_STRING("QAILIII"),
    COMPOUND_STRING("QAILIIS"),
    COMPOUND_STRING("QAILIS"),
    COMPOUND_STRING("QAILIY"),
    COMPOUND_STRING("QAILLAY"),
    COMPOUND_STRING("QAILLEA"),
    COMPOUND_STRING("QAILLEE"),
    COMPOUND_STRING("QAILLEI"),
    COMPOUND_STRING("QAILLEY"),
    COMPOUND_STRING("QAILLI"),
    COMPOUND_STRING("QAILLIE"),
    COMPOUND_STRING("QAILLII"),
    COMPOUND_STRING("QAILLIS"),
    COMPOUND_STRING("QAILLIY"),
    COMPOUND_STRING("QAILLY"),
    COMPOUND_STRING("QAILY"),
    COMPOUND_STRING("QALAEHY"),
    COMPOUND_STRING("QALAEY"),
    COMPOUND_STRING("QALAHEY"),
    COMPOUND_STRING("QALAHY"),
    COMPOUND_STRING("QALAY"),
    COMPOUND_STRING("QALEA"),
    COMPOUND_STRING("QALEE"),
    COMPOUND_STRING("QALEEA"),
    COMPOUND_STRING("QALEEE"),
    COMPOUND_STRING("QALEEEA"),
    COMPOUND_STRING("QALEEEE"),
    COMPOUND_STRING("QALEEEI"),
    COMPOUND_STRING("QALEEEY"),
    COMPOUND_STRING("QALEEI"),
    COMPOUND_STRING("QALEEIE"),
    COMPOUND_STRING("QALEEIH"),
    COMPOUND_STRING("QALEEIY"),
    COMPOUND_STRING("QALEEY"),
    COMPOUND_STRING("QALEI"),
    COMPOUND_STRING("QALEIE"),
    COMPOUND_STRING("QALEIGH"),
    COMPOUND_STRING("QALEIH"),
    COMPOUND_STRING("QALEIIH"),
    COMPOUND_STRING("QALEIIY"),
    COMPOUND_STRING("QALEIY"),
    COMPOUND_STRING("QALEIYY"),
    COMPOUND_STRING("QALEY"),
    COMPOUND_STRING("QALHAEY"),
    COMPOUND_STRING("QALHAHY"),
    COMPOUND_STRING("QALHAY"),
    COMPOUND_STRING("QALHEA"),
    COMPOUND_STRING("QALHEE"),
    COMPOUND_STRING("QALHEEA"),
    COMPOUND_STRING("QALHEEE"),
    COMPOUND_STRING("QALHEEI"),
    COMPOUND_STRING("QALHEEY"),
    COMPOUND_STRING("QALHEI"),
    COMPOUND_STRING("QALHEIE"),
    COMPOUND_STRING("QALHEIH"),
    COMPOUND_STRING("QALHEIY"),
    COMPOUND_STRING("QALHEY"),
    COMPOUND_STRING("QALHI"),
    COMPOUND_STRING("QALHIE"),
    COMPOUND_STRING("QALHIEE"),
    COMPOUND_STRING("QALHIEI"),
    COMPOUND_STRING("QALHIEY"),
    COMPOUND_STRING("QALHII"),
    COMPOUND_STRING("QALHIIE"),
    COMPOUND_STRING("QALHIII"),
    COMPOUND_STRING("QALHIIS"),
    COMPOUND_STRING("QALHIS"),
    COMPOUND_STRING("QALHIY"),
    COMPOUND_STRING("QALHY"),
    COMPOUND_STRING("QALI"),
    COMPOUND_STRING("QALIE"),
    COMPOUND_STRING("QALIEE"),
    COMPOUND_STRING("QALIEEE"),
    COMPOUND_STRING("QALIEEY"),
    COMPOUND_STRING("QALIEI"),
    COMPOUND_STRING("QALIEY"),
    COMPOUND_STRING("QALIEYY"),
    COMPOUND_STRING("QALII"),
    COMPOUND_STRING("QALIIE"),
    COMPOUND_STRING("QALIIEY"),
    COMPOUND_STRING("QALIII"),
    COMPOUND_STRING("QALIIIE"),
    COMPOUND_STRING("QALIIII"),
    COMPOUND_STRING("QALIIIS"),
    COMPOUND_STRING("QALIIS"),
    COMPOUND_STRING("QALIS"),
    COMPOUND_STRING("QALIY"),
    COMPOUND_STRING("QALLAEY"),
    COMPOUND_STRING("QALLAHY"),
    COMPOUND_STRING("QALLAY"),
    COMPOUND_STRING("QALLEA"),
    COMPOUND_STRING("QALLEE"),
    COMPOUND_STRING("QALLEEA"),
    COMPOUND_STRING("QALLEEE"),
    COMPOUND_STRING("QALLEEI"),
    COMPOUND_STRING("QALLEEY"),
    COMPOUND_STRING("QALLEI"),
    COMPOUND_STRING("QALLEIE"),
    COMPOUND_STRING("QALLEIH"),
    COMPOUND_STRING("QALLEIY"),
    COMPOUND_STRING("QALLEY"),
    COMPOUND_STRING("QALLI"),
    COMPOUND_STRING("QALLIE"),
    COMPOUND_STRING("QALLIEE"),
    COMPOUND_STRING("QALLIEI"),
    COMPOUND_STRING("QALLIEY"),
    COMPOUND_STRING("QALLII"),
    COMPOUND_STRING("QALLIIE"),
    COMPOUND_STRING("QALLIII"),
    COMPOUND_STRING("QALLIIS"),
    COMPOUND_STRING("QALLIS"),
    COMPOUND_STRING("QALLIY"),
    COMPOUND_STRING("QALLY"),
    COMPOUND_STRING("QALY"),
    COMPOUND_STRING("QAYELAY"),
    COMPOUND_STRING("QAYELEA"),
    COMPOUND_STRING("QAYELEE"),
    COMPOUND_STRING("QAYELEI"),
    COMPOUND_STRING("QAYELEY"),
    COMPOUND_STRING("QAYELHI"),
    COMPOUND_STRING("QAYELHY"),
    COMPOUND_STRING("QAYELI"),
    COMPOUND_STRING("QAYELIE"),
    COMPOUND_STRING("QAYELII"),
    COMPOUND_STRING("QAYELIS"),
    COMPOUND_STRING("QAYELIY"),
    COMPOUND_STRING("QAYELLI"),
    COMPOUND_STRING("QAYELLY"),
    COMPOUND_STRING("QAYELY"),
    COMPOUND_STRING("QAYLAEY"),
    COMPOUND_STRING("QAYLAHY"),
    COMPOUND_STRING("QAYLAY"),
    COMPOUND_STRING("QAYLEA"),
    COMPOUND_STRING("QAYLEE"),
    COMPOUND_STRING("QAYLEEA"),
    COMPOUND_STRING("QAYLEEE"),
    COMPOUND_STRING("QAYLEEI"),
    COMPOUND_STRING("QAYLEEY"),
    COMPOUND_STRING("QAYLEI"),
    COMPOUND_STRING("QAYLEIE"),
    COMPOUND_STRING("QAYLEIH"),
    COMPOUND_STRING("QAYLEIY"),
    COMPOUND_STRING("QAYLEY"),
    COMPOUND_STRING("QAYLHAY"),
    COMPOUND_STRING("QAYLHEA"),
    COMPOUND_STRING("QAYLHEE"),
    COMPOUND_STRING("QAYLHEI"),
    COMPOUND_STRING("QAYLHEY"),
    COMPOUND_STRING("QAYLHI"),
    COMPOUND_STRING("QAYLHIE"),
    COMPOUND_STRING("QAYLHII"),
    COMPOUND_STRING("QAYLHIS"),
    COMPOUND_STRING("QAYLHIY"),
    COMPOUND_STRING("QAYLHY"),
    COMPOUND_STRING("QAYLI"),
    COMPOUND_STRING("QAYLIE"),
    COMPOUND_STRING("QAYLIEE"),
    COMPOUND_STRING("QAYLIEI"),
    COMPOUND_STRING("QAYLIEY"),
    COMPOUND_STRING("QAYLII"),
    COMPOUND_STRING("QAYLIIE"),
    COMPOUND_STRING("QAYLIII"),
    COMPOUND_STRING("QAYLIIS"),
    COMPOUND_STRING("QAYLIS"),
    COMPOUND_STRING("QAYLIY"),
    COMPOUND_STRING("QAYLLAY"),
    COMPOUND_STRING("QAYLLEA"),
    COMPOUND_STRING("QAYLLEE"),
    COMPOUND_STRING("QAYLLEI"),
    COMPOUND_STRING("QAYLLEY"),
    COMPOUND_STRING("QAYLLI"),
    COMPOUND_STRING("QAYLLIE"),
    COMPOUND_STRING("QAYLLII"),
    COMPOUND_STRING("QAYLLIS"),
    COMPOUND_STRING("QAYLLIY"),
    COMPOUND_STRING("QAYLLY"),
    COMPOUND_STRING("QAYLY"),
    COMPOUND_STRING("QCAAHLI"),
    COMPOUND_STRING("QCAAHLY"),
    COMPOUND_STRING("QCAALAY"),
    COMPOUND_STRING("QCAALEA"),
    COMPOUND_STRING("QCAALEE"),
    COMPOUND_STRING("QCAALEI"),
    COMPOUND_STRING("QCAALEY"),
    COMPOUND_STRING("QCAALHI"),
    COMPOUND_STRING("QCAALHY"),
    COMPOUND_STRING("QCAALI"),
    COMPOUND_STRING("QCAALIE"),
    COMPOUND_STRING("QCAALII"),
    COMPOUND_STRING("QCAALIS"),
    COMPOUND_STRING("QCAALIY"),
    COMPOUND_STRING("QCAALLI"),
    COMPOUND_STRING("QCAALLY"),
    COMPOUND_STRING("QCAALY"),
    COMPOUND_STRING("QCAAYLI"),
    COMPOUND_STRING("QCAAYLY"),
    COMPOUND_STRING("QCAEHLI"),
    COMPOUND_STRING("QCAEHLY"),
    COMPOUND_STRING("QCAELAY"),
    COMPOUND_STRING("QCAELEA"),
    COMPOUND_STRING("QCAELEE"),
    COMPOUND_STRING("QCAELEI"),
    COMPOUND_STRING("QCAELEY"),
    COMPOUND_STRING("QCAELHI"),
    COMPOUND_STRING("QCAELHY"),
    COMPOUND_STRING("QCAELI"),
    COMPOUND_STRING("QCAELIE"),
    COMPOUND_STRING("QCAELII"),
    COMPOUND_STRING("QCAELIS"),
    COMPOUND_STRING("QCAELIY"),
    COMPOUND_STRING("QCAELLI"),
    COMPOUND_STRING("QCAELLY"),
    COMPOUND_STRING("QCAELY"),
    COMPOUND_STRING("QCAGHLI"),
    COMPOUND_STRING("QCAGHLY"),
    COMPOUND_STRING("QCAHLAY"),
    COMPOUND_STRING("QCAHLEA"),
    COMPOUND_STRING("QCAHLEE"),
    COMPOUND_STRING("QCAHLEI"),
    COMPOUND_STRING("QCAHLEY"),
    COMPOUND_STRING("QCAHLHI"),
    COMPOUND_STRING("QCAHLHY"),
    COMPOUND_STRING("QCAHLI"),
    COMPOUND_STRING("QCAHLIE"),
    COMPOUND_STRING("QCAHLII"),
    COMPOUND_STRING("QCAHLIS"),
    COMPOUND_STRING("QCAHLIY"),
    COMPOUND_STRING("QCAHLLI"),
    COMPOUND_STRING("QCAHLLY"),
    COMPOUND_STRING("QCAHLY"),
    COMPOUND_STRING("QCAHYLI"),
    COMPOUND_STRING("QCAHYLY"),
    COMPOUND_STRING("QCAILAY"),
    COMPOUND_STRING("QCAILEA"),
    COMPOUND_STRING("QCAILEE"),
    COMPOUND_STRING("QCAILEI"),
    COMPOUND_STRING("QCAILEY"),
    COMPOUND_STRING("QCAILHI"),
    COMPOUND_STRING("QCAILHY"),
    COMPOUND_STRING("QCAILI"),
    COMPOUND_STRING("QCAILIE"),
    COMPOUND_STRING("QCAILII"),
    COMPOUND_STRING("QCAILIS"),
    COMPOUND_STRING("QCAILIY"),
    COMPOUND_STRING("QCAILLI"),
    COMPOUND_STRING("QCAILLY"),
    COMPOUND_STRING("QCAILY"),
    COMPOUND_STRING("QCALAEY"),
    COMPOUND_STRING("QCALAHY"),
    COMPOUND_STRING("QCALAY"),
    COMPOUND_STRING("QCALEA"),
    COMPOUND_STRING("QCALEE"),
    COMPOUND_STRING("QCALEEA"),
    COMPOUND_STRING("QCALEEE"),
    COMPOUND_STRING("QCALEEI"),
    COMPOUND_STRING("QCALEEY"),
    COMPOUND_STRING("QCALEI"),
    COMPOUND_STRING("QCALEIE"),
    COMPOUND_STRING("QCALEIH"),
    COMPOUND_STRING("QCALEIY"),
    COMPOUND_STRING("QCALEY"),
    COMPOUND_STRING("QCALHAY"),
    COMPOUND_STRING("QCALHEA"),
    COMPOUND_STRING("QCALHEE"),
    COMPOUND_STRING("QCALHEI"),
    COMPOUND_STRING("QCALHEY"),
    COMPOUND_STRING("QCALHI"),
    COMPOUND_STRING("QCALHIE"),
    COMPOUND_STRING("QCALHII"),
    COMPOUND_STRING("QCALHIS"),
    COMPOUND_STRING("QCALHIY"),
    COMPOUND_STRING("QCALHY"),
    COMPOUND_STRING("QCALI"),
    COMPOUND_STRING("QCALIE"),
    COMPOUND_STRING("QCALIEE"),
    COMPOUND_STRING("QCALIEI"),
    COMPOUND_STRING("QCALIEY"),
    COMPOUND_STRING("QCALII"),
    COMPOUND_STRING("QCALIIE"),
    COMPOUND_STRING("QCALIII"),
    COMPOUND_STRING("QCALIIS"),
    COMPOUND_STRING("QCALIS"),
    COMPOUND_STRING("QCALIY"),
    COMPOUND_STRING("QCALLAY"),
    COMPOUND_STRING("QCALLEA"),
    COMPOUND_STRING("QCALLEE"),
    COMPOUND_STRING("QCALLEI"),
    COMPOUND_STRING("QCALLEY"),
    COMPOUND_STRING("QCALLI"),
    COMPOUND_STRING("QCALLIE"),
    COMPOUND_STRING("QCALLII"),
    COMPOUND_STRING("QCALLIS"),
    COMPOUND_STRING("QCALLIY"),
    COMPOUND_STRING("QCALLY"),
    COMPOUND_STRING("QCALY"),
    COMPOUND_STRING("QCAYELI"),
    COMPOUND_STRING("QCAYELY"),
    COMPOUND_STRING("QCAYLAY"),
    COMPOUND_STRING("QCAYLEA"),
    COMPOUND_STRING("QCAYLEE"),
    COMPOUND_STRING("QCAYLEI"),
    COMPOUND_STRING("QCAYLEY"),
    COMPOUND_STRING("QCAYLHI"),
    COMPOUND_STRING("QCAYLHY"),
    COMPOUND_STRING("QCAYLI"),
    COMPOUND_STRING("QCAYLIE"),
    COMPOUND_STRING("QCAYLII"),
    COMPOUND_STRING("QCAYLIS"),
    COMPOUND_STRING("QCAYLIY"),
    COMPOUND_STRING("QCAYLLI"),
    COMPOUND_STRING("QCAYLLY"),
    COMPOUND_STRING("QCAYLY"),
    COMPOUND_STRING("QEALAEY"),
    COMPOUND_STRING("QEALAHY"),
    COMPOUND_STRING("QEALAY"),
    COMPOUND_STRING("QEALEA"),
    COMPOUND_STRING("QEALEE"),
    COMPOUND_STRING("QEALEEA"),
    COMPOUND_STRING("QEALEEE"),
    COMPOUND_STRING("QEALEEI"),
    COMPOUND_STRING("QEALEEY"),
    COMPOUND_STRING("QEALEI"),
    COMPOUND_STRING("QEALEIE"),
    COMPOUND_STRING("QEALEIH"),
    COMPOUND_STRING("QEALEIY"),
    COMPOUND_STRING("QEALEY"),
    COMPOUND_STRING("QEALHAY"),
    COMPOUND_STRING("QEALHEA"),
    COMPOUND_STRING("QEALHEE"),
    COMPOUND_STRING("QEALHEI"),
    COMPOUND_STRING("QEALHEY"),
    COMPOUND_STRING("QEALHI"),
    COMPOUND_STRING("QEALHIE"),
    COMPOUND_STRING("QEALHII"),
    COMPOUND_STRING("QEALHIS"),
    COMPOUND_STRING("QEALHIY"),
    COMPOUND_STRING("QEALHY"),
    COMPOUND_STRING("QEALI"),
    COMPOUND_STRING("QEALIE"),
    COMPOUND_STRING("QEALIEE"),
    COMPOUND_STRING("QEALIEI"),
    COMPOUND_STRING("QEALIEY"),
    COMPOUND_STRING("QEALII"),
    COMPOUND_STRING("QEALIIE"),
    COMPOUND_STRING("QEALIII"),
    COMPOUND_STRING("QEALIIS"),
    COMPOUND_STRING("QEALIS"),
    COMPOUND_STRING("QEALIY"),
    COMPOUND_STRING("QEALLAY"),
    COMPOUND_STRING("QEALLEA"),
    COMPOUND_STRING("QEALLEE"),
    COMPOUND_STRING("QEALLEI"),
    COMPOUND_STRING("QEALLEY"),
    COMPOUND_STRING("QEALLI"),
    COMPOUND_STRING("QEALLIE"),
    COMPOUND_STRING("QEALLII"),
    COMPOUND_STRING("QEALLIS"),
    COMPOUND_STRING("QEALLIY"),
    COMPOUND_STRING("QEALLY"),
    COMPOUND_STRING("QEALY"),
    COMPOUND_STRING("QEIGHLI"),
    COMPOUND_STRING("QEIGHLY"),
    COMPOUND_STRING("QEIGLAY"),
    COMPOUND_STRING("QEIGLEA"),
    COMPOUND_STRING("QEIGLEE"),
    COMPOUND_STRING("QEIGLEI"),
    COMPOUND_STRING("QEIGLEY"),
    COMPOUND_STRING("QEIGLHI"),
    COMPOUND_STRING("QEIGLHY"),
    COMPOUND_STRING("QEIGLI"),
    COMPOUND_STRING("QEIGLIE"),
    COMPOUND_STRING("QEIGLII"),
    COMPOUND_STRING("QEIGLIS"),
    COMPOUND_STRING("QEIGLIY"),
    COMPOUND_STRING("QEIGLLI"),
    COMPOUND_STRING("QEIGLLY"),
    COMPOUND_STRING("QEIGLY"),
    COMPOUND_STRING("QEIHLAY"),
    COMPOUND_STRING("QEIHLEA"),
    COMPOUND_STRING("QEIHLEE"),
    COMPOUND_STRING("QEIHLEI"),
    COMPOUND_STRING("QEIHLEY"),
    COMPOUND_STRING("QEIHLHI"),
    COMPOUND_STRING("QEIHLHY"),
    COMPOUND_STRING("QEIHLI"),
    COMPOUND_STRING("QEIHLIE"),
    COMPOUND_STRING("QEIHLII"),
    COMPOUND_STRING("QEIHLIS"),
    COMPOUND_STRING("QEIHLIY"),
    COMPOUND_STRING("QEIHLLI"),
    COMPOUND_STRING("QEIHLLY"),
    COMPOUND_STRING("QEIHLY"),
    COMPOUND_STRING("QEILAEY"),
    COMPOUND_STRING("QEILAHY"),
    COMPOUND_STRING("QEILAY"),
    COMPOUND_STRING("QEILEA"),
    COMPOUND_STRING("QEILEE"),
    COMPOUND_STRING("QEILEEA"),
    COMPOUND_STRING("QEILEEE"),
    COMPOUND_STRING("QEILEEI"),
    COMPOUND_STRING("QEILEEY"),
    COMPOUND_STRING("QEILEI"),
    COMPOUND_STRING("QEILEIE"),
    COMPOUND_STRING("QEILEIH"),
    COMPOUND_STRING("QEILEIY"),
    COMPOUND_STRING("QEILEY"),
    COMPOUND_STRING("QEILHAY"),
    COMPOUND_STRING("QEILHEA"),
    COMPOUND_STRING("QEILHEE"),
    COMPOUND_STRING("QEILHEI"),
    COMPOUND_STRING("QEILHEY"),
    COMPOUND_STRING("QEILHI"),
    COMPOUND_STRING("QEILHIE"),
    COMPOUND_STRING("QEILHII"),
    COMPOUND_STRING("QEILHIS"),
    COMPOUND_STRING("QEILHIY"),
    COMPOUND_STRING("QEILHY"),
    COMPOUND_STRING("QEILI"),
    COMPOUND_STRING("QEILIE"),
    COMPOUND_STRING("QEILIEE"),
    COMPOUND_STRING("QEILIEI"),
    COMPOUND_STRING("QEILIEY"),
    COMPOUND_STRING("QEILII"),
    COMPOUND_STRING("QEILIIE"),
    COMPOUND_STRING("QEILIII"),
    COMPOUND_STRING("QEILIIS"),
    COMPOUND_STRING("QEILIS"),
    COMPOUND_STRING("QEILIY"),
    COMPOUND_STRING("QEILLAY"),
    COMPOUND_STRING("QEILLEA"),
    COMPOUND_STRING("QEILLEE"),
    COMPOUND_STRING("QEILLEI"),
    COMPOUND_STRING("QEILLEY"),
    COMPOUND_STRING("QEILLI"),
    COMPOUND_STRING("QEILLIE"),
    COMPOUND_STRING("QEILLII"),
    COMPOUND_STRING("QEILLIS"),
    COMPOUND_STRING("QEILLIY"),
    COMPOUND_STRING("QEILLY"),
    COMPOUND_STRING("QEILY"),
    COMPOUND_STRING("QEYLAEY"),
    COMPOUND_STRING("QEYLAHY"),
    COMPOUND_STRING("QEYLAY"),
    COMPOUND_STRING("QEYLEA"),
    COMPOUND_STRING("QEYLEE"),
    COMPOUND_STRING("QEYLEEA"),
    COMPOUND_STRING("QEYLEEE"),
    COMPOUND_STRING("QEYLEEI"),
    COMPOUND_STRING("QEYLEEY"),
    COMPOUND_STRING("QEYLEI"),
    COMPOUND_STRING("QEYLEIE"),
    COMPOUND_STRING("QEYLEIH"),
    COMPOUND_STRING("QEYLEIY"),
    COMPOUND_STRING("QEYLEY"),
    COMPOUND_STRING("QEYLHAY"),
    COMPOUND_STRING("QEYLHEA"),
    COMPOUND_STRING("QEYLHEE"),
    COMPOUND_STRING("QEYLHEI"),
    COMPOUND_STRING("QEYLHEY"),
    COMPOUND_STRING("QEYLHI"),
    COMPOUND_STRING("QEYLHIE"),
    COMPOUND_STRING("QEYLHII"),
    COMPOUND_STRING("QEYLHIS"),
    COMPOUND_STRING("QEYLHIY"),
    COMPOUND_STRING("QEYLHY"),
    COMPOUND_STRING("QEYLI"),
    COMPOUND_STRING("QEYLIE"),
    COMPOUND_STRING("QEYLIEE"),
    COMPOUND_STRING("QEYLIEI"),
    COMPOUND_STRING("QEYLIEY"),
    COMPOUND_STRING("QEYLII"),
    COMPOUND_STRING("QEYLIIE"),
    COMPOUND_STRING("QEYLIII"),
    COMPOUND_STRING("QEYLIIS"),
    COMPOUND_STRING("QEYLIS"),
    COMPOUND_STRING("QEYLIY"),
    COMPOUND_STRING("QEYLLAY"),
    COMPOUND_STRING("QEYLLEA"),
    COMPOUND_STRING("QEYLLEE"),
    COMPOUND_STRING("QEYLLEI"),
    COMPOUND_STRING("QEYLLEY"),
    COMPOUND_STRING("QEYLLI"),
    COMPOUND_STRING("QEYLLIE"),
    COMPOUND_STRING("QEYLLII"),
    COMPOUND_STRING("QEYLLIS"),
    COMPOUND_STRING("QEYLLIY"),
    COMPOUND_STRING("QEYLLY"),
    COMPOUND_STRING("QEYLY"),
    COMPOUND_STRING("QHAAHLI"),
    COMPOUND_STRING("QHAAHLY"),
    COMPOUND_STRING("QHAALAY"),
    COMPOUND_STRING("QHAALEA"),
    COMPOUND_STRING("QHAALEE"),
    COMPOUND_STRING("QHAALEI"),
    COMPOUND_STRING("QHAALEY"),
    COMPOUND_STRING("QHAALHI"),
    COMPOUND_STRING("QHAALHY"),
    COMPOUND_STRING("QHAALI"),
    COMPOUND_STRING("QHAALIE"),
    COMPOUND_STRING("QHAALII"),
    COMPOUND_STRING("QHAALIS"),
    COMPOUND_STRING("QHAALIY"),
    COMPOUND_STRING("QHAALLI"),
    COMPOUND_STRING("QHAALLY"),
    COMPOUND_STRING("QHAALY"),
    COMPOUND_STRING("QHAAYLI"),
    COMPOUND_STRING("QHAAYLY"),
    COMPOUND_STRING("QHAEHLI"),
    COMPOUND_STRING("QHAEHLY"),
    COMPOUND_STRING("QHAELAY"),
    COMPOUND_STRING("QHAELEA"),
    COMPOUND_STRING("QHAELEE"),
    COMPOUND_STRING("QHAELEI"),
    COMPOUND_STRING("QHAELEY"),
    COMPOUND_STRING("QHAELHI"),
    COMPOUND_STRING("QHAELHY"),
    COMPOUND_STRING("QHAELI"),
    COMPOUND_STRING("QHAELIE"),
    COMPOUND_STRING("QHAELII"),
    COMPOUND_STRING("QHAELIS"),
    COMPOUND_STRING("QHAELIY"),
    COMPOUND_STRING("QHAELLI"),
    COMPOUND_STRING("QHAELLY"),
    COMPOUND_STRING("QHAELY"),
    COMPOUND_STRING("QHAGHLI"),
    COMPOUND_STRING("QHAGHLY"),
    COMPOUND_STRING("QHAHLAY"),
    COMPOUND_STRING("QHAHLEA"),
    COMPOUND_STRING("QHAHLEE"),
    COMPOUND_STRING("QHAHLEI"),
    COMPOUND_STRING("QHAHLEY"),
    COMPOUND_STRING("QHAHLHI"),
    COMPOUND_STRING("QHAHLHY"),
    COMPOUND_STRING("QHAHLI"),
    COMPOUND_STRING("QHAHLIE"),
    COMPOUND_STRING("QHAHLII"),
    COMPOUND_STRING("QHAHLIS"),
    COMPOUND_STRING("QHAHLIY"),
    COMPOUND_STRING("QHAHLLI"),
    COMPOUND_STRING("QHAHLLY"),
    COMPOUND_STRING("QHAHLY"),
    COMPOUND_STRING("QHAHYLI"),
    COMPOUND_STRING("QHAHYLY"),
    COMPOUND_STRING("QHAILAY"),
    COMPOUND_STRING("QHAILEA"),
    COMPOUND_STRING("QHAILEE"),
    COMPOUND_STRING("QHAILEI"),
    COMPOUND_STRING("QHAILEY"),
    COMPOUND_STRING("QHAILHI"),
    COMPOUND_STRING("QHAILHY"),
    COMPOUND_STRING("QHAILI"),
    COMPOUND_STRING("QHAILIE"),
    COMPOUND_STRING("QHAILII"),
    COMPOUND_STRING("QHAILIS"),
    COMPOUND_STRING("QHAILIY"),
    COMPOUND_STRING("QHAILLI"),
    COMPOUND_STRING("QHAILLY"),
    COMPOUND_STRING("QHAILY"),
    COMPOUND_STRING("QHALAEY"),
    COMPOUND_STRING("QHALAHY"),
    COMPOUND_STRING("QHALAY"),
    COMPOUND_STRING("QHALEA"),
    COMPOUND_STRING("QHALEE"),
    COMPOUND_STRING("QHALEEA"),
    COMPOUND_STRING("QHALEEE"),
    COMPOUND_STRING("QHALEEI"),
    COMPOUND_STRING("QHALEEY"),
    COMPOUND_STRING("QHALEI"),
    COMPOUND_STRING("QHALEIE"),
    COMPOUND_STRING("QHALEIH"),
    COMPOUND_STRING("QHALEIY"),
    COMPOUND_STRING("QHALEY"),
    COMPOUND_STRING("QHALHAY"),
    COMPOUND_STRING("QHALHEA"),
    COMPOUND_STRING("QHALHEE"),
    COMPOUND_STRING("QHALHEI"),
    COMPOUND_STRING("QHALHEY"),
    COMPOUND_STRING("QHALHI"),
    COMPOUND_STRING("QHALHIE"),
    COMPOUND_STRING("QHALHII"),
    COMPOUND_STRING("QHALHIS"),
    COMPOUND_STRING("QHALHIY"),
    COMPOUND_STRING("QHALHY"),
    COMPOUND_STRING("QHALI"),
    COMPOUND_STRING("QHALIE"),
    COMPOUND_STRING("QHALIEE"),
    COMPOUND_STRING("QHALIEI"),
    COMPOUND_STRING("QHALIEY"),
    COMPOUND_STRING("QHALII"),
    COMPOUND_STRING("QHALIIE"),
    COMPOUND_STRING("QHALIII"),
    COMPOUND_STRING("QHALIIS"),
    COMPOUND_STRING("QHALIS"),
    COMPOUND_STRING("QHALIY"),
    COMPOUND_STRING("QHALLAY"),
    COMPOUND_STRING("QHALLEA"),
    COMPOUND_STRING("QHALLEE"),
    COMPOUND_STRING("QHALLEI"),
    COMPOUND_STRING("QHALLEY"),
    COMPOUND_STRING("QHALLI"),
    COMPOUND_STRING("QHALLIE"),
    COMPOUND_STRING("QHALLII"),
    COMPOUND_STRING("QHALLIS"),
    COMPOUND_STRING("QHALLIY"),
    COMPOUND_STRING("QHALLY"),
    COMPOUND_STRING("QHALY"),
    COMPOUND_STRING("QHAYELI"),
    COMPOUND_STRING("QHAYELY"),
    COMPOUND_STRING("QHAYLAY"),
    COMPOUND_STRING("QHAYLEA"),
    COMPOUND_STRING("QHAYLEE"),
    COMPOUND_STRING("QHAYLEI"),
    COMPOUND_STRING("QHAYLEY"),
    COMPOUND_STRING("QHAYLHI"),
    COMPOUND_STRING("QHAYLHY"),
    COMPOUND_STRING("QHAYLI"),
    COMPOUND_STRING("QHAYLIE"),
    COMPOUND_STRING("QHAYLII"),
    COMPOUND_STRING("QHAYLIS"),
    COMPOUND_STRING("QHAYLIY"),
    COMPOUND_STRING("QHAYLLI"),
    COMPOUND_STRING("QHAYLLY"),
    COMPOUND_STRING("QHAYLY"),
    COMPOUND_STRING("QHEALAY"),
    COMPOUND_STRING("QHEALEA"),
    COMPOUND_STRING("QHEALEE"),
    COMPOUND_STRING("QHEALEI"),
    COMPOUND_STRING("QHEALEY"),
    COMPOUND_STRING("QHEALHI"),
    COMPOUND_STRING("QHEALHY"),
    COMPOUND_STRING("QHEALI"),
    COMPOUND_STRING("QHEALIE"),
    COMPOUND_STRING("QHEALII"),
    COMPOUND_STRING("QHEALIS"),
    COMPOUND_STRING("QHEALIY"),
    COMPOUND_STRING("QHEALLI"),
    COMPOUND_STRING("QHEALLY"),
    COMPOUND_STRING("QHEALY"),
    COMPOUND_STRING("QHEIGLI"),
    COMPOUND_STRING("QHEIGLY"),
    COMPOUND_STRING("QHEIHLI"),
    COMPOUND_STRING("QHEIHLY"),
    COMPOUND_STRING("QHEILAY"),
    COMPOUND_STRING("QHEILEA"),
    COMPOUND_STRING("QHEILEE"),
    COMPOUND_STRING("QHEILEI"),
    COMPOUND_STRING("QHEILEY"),
    COMPOUND_STRING("QHEILHI"),
    COMPOUND_STRING("QHEILHY"),
    COMPOUND_STRING("QHEILI"),
    COMPOUND_STRING("QHEILIE"),
    COMPOUND_STRING("QHEILII"),
    COMPOUND_STRING("QHEILIS"),
    COMPOUND_STRING("QHEILIY"),
    COMPOUND_STRING("QHEILLI"),
    COMPOUND_STRING("QHEILLY"),
    COMPOUND_STRING("QHEILY"),
    COMPOUND_STRING("QHEYLAY"),
    COMPOUND_STRING("QHEYLEA"),
    COMPOUND_STRING("QHEYLEE"),
    COMPOUND_STRING("QHEYLEI"),
    COMPOUND_STRING("QHEYLEY"),
    COMPOUND_STRING("QHEYLHI"),
    COMPOUND_STRING("QHEYLHY"),
    COMPOUND_STRING("QHEYLI"),
    COMPOUND_STRING("QHEYLIE"),
    COMPOUND_STRING("QHEYLII"),
    COMPOUND_STRING("QHEYLIS"),
    COMPOUND_STRING("QHEYLIY"),
    COMPOUND_STRING("QHEYLLI"),
    COMPOUND_STRING("QHEYLLY"),
    COMPOUND_STRING("QHEYLY"),
    COMPOUND_STRING("QKAAHLI"),
    COMPOUND_STRING("QKAAHLY"),
    COMPOUND_STRING("QKAALAY"),
    COMPOUND_STRING("QKAALEA"),
    COMPOUND_STRING("QKAALEE"),
    COMPOUND_STRING("QKAALEI"),
    COMPOUND_STRING("QKAALEY"),
    COMPOUND_STRING("QKAALHI"),
    COMPOUND_STRING("QKAALHY"),
    COMPOUND_STRING("QKAALI"),
    COMPOUND_STRING("QKAALIE"),
    COMPOUND_STRING("QKAALII"),
    COMPOUND_STRING("QKAALIS"),
    COMPOUND_STRING("QKAALIY"),
    COMPOUND_STRING("QKAALLI"),
    COMPOUND_STRING("QKAALLY"),
    COMPOUND_STRING("QKAALY"),
    COMPOUND_STRING("QKAAYLI"),
    COMPOUND_STRING("QKAAYLY"),
    COMPOUND_STRING("QKAEHLI"),
    COMPOUND_STRING("QKAEHLY"),
    COMPOUND_STRING("QKAELAY"),
    COMPOUND_STRING("QKAELEA"),
    COMPOUND_STRING("QKAELEE"),
    COMPOUND_STRING("QKAELEI"),
    COMPOUND_STRING("QKAELEY"),
    COMPOUND_STRING("QKAELHI"),
    COMPOUND_STRING("QKAELHY"),
    COMPOUND_STRING("QKAELI"),
    COMPOUND_STRING("QKAELIE"),
    COMPOUND_STRING("QKAELII"),
    COMPOUND_STRING("QKAELIS"),
    COMPOUND_STRING("QKAELIY"),
    COMPOUND_STRING("QKAELLI"),
    COMPOUND_STRING("QKAELLY"),
    COMPOUND_STRING("QKAELY"),
    COMPOUND_STRING("QKAGHLI"),
    COMPOUND_STRING("QKAGHLY"),
    COMPOUND_STRING("QKAHLAY"),
    COMPOUND_STRING("QKAHLEA"),
    COMPOUND_STRING("QKAHLEE"),
    COMPOUND_STRING("QKAHLEI"),
    COMPOUND_STRING("QKAHLEY"),
    COMPOUND_STRING("QKAHLHI"),
    COMPOUND_STRING("QKAHLHY"),
    COMPOUND_STRING("QKAHLI"),
    COMPOUND_STRING("QKAHLIE"),
    COMPOUND_STRING("QKAHLII"),
    COMPOUND_STRING("QKAHLIS"),
    COMPOUND_STRING("QKAHLIY"),
    COMPOUND_STRING("QKAHLLI"),
    COMPOUND_STRING("QKAHLLY"),
    COMPOUND_STRING("QKAHLY"),
    COMPOUND_STRING("QKAHYLI"),
    COMPOUND_STRING("QKAHYLY"),
    COMPOUND_STRING("QKAILAY"),
    COMPOUND_STRING("QKAILEA"),
    COMPOUND_STRING("QKAILEE"),
    COMPOUND_STRING("QKAILEI"),
    COMPOUND_STRING("QKAILEY"),
    COMPOUND_STRING("QKAILHI"),
    COMPOUND_STRING("QKAILHY"),
    COMPOUND_STRING("QKAILI"),
    COMPOUND_STRING("QKAILIE"),
    COMPOUND_STRING("QKAILII"),
    COMPOUND_STRING("QKAILIS"),
    COMPOUND_STRING("QKAILIY"),
    COMPOUND_STRING("QKAILLI"),
    COMPOUND_STRING("QKAILLY"),
    COMPOUND_STRING("QKAILY"),
    COMPOUND_STRING("QKALAEY"),
    COMPOUND_STRING("QKALAHY"),
    COMPOUND_STRING("QKALAY"),
    COMPOUND_STRING("QKALEA"),
    COMPOUND_STRING("QKALEE"),
    COMPOUND_STRING("QKALEEA"),
    COMPOUND_STRING("QKALEEE"),
    COMPOUND_STRING("QKALEEI"),
    COMPOUND_STRING("QKALEEY"),
    COMPOUND_STRING("QKALEI"),
    COMPOUND_STRING("QKALEIE"),
    COMPOUND_STRING("QKALEIH"),
    COMPOUND_STRING("QKALEIY"),
    COMPOUND_STRING("QKALEY"),
    COMPOUND_STRING("QKALHAY"),
    COMPOUND_STRING("QKALHEA"),
    COMPOUND_STRING("QKALHEE"),
    COMPOUND_STRING("QKALHEI"),
    COMPOUND_STRING("QKALHEY"),
    COMPOUND_STRING("QKALHI"),
    COMPOUND_STRING("QKALHIE"),
    COMPOUND_STRING("QKALHII"),
    COMPOUND_STRING("QKALHIS"),
    COMPOUND_STRING("QKALHIY"),
    COMPOUND_STRING("QKALHY"),
    COMPOUND_STRING("QKALI"),
    COMPOUND_STRING("QKALIE"),
    COMPOUND_STRING("QKALIEE"),
    COMPOUND_STRING("QKALIEI"),
    COMPOUND_STRING("QKALIEY"),
    COMPOUND_STRING("QKALII"),
    COMPOUND_STRING("QKALIIE"),
    COMPOUND_STRING("QKALIII"),
    COMPOUND_STRING("QKALIIS"),
    COMPOUND_STRING("QKALIS"),
    COMPOUND_STRING("QKALIY"),
    COMPOUND_STRING("QKALLAY"),
    COMPOUND_STRING("QKALLEA"),
    COMPOUND_STRING("QKALLEE"),
    COMPOUND_STRING("QKALLEI"),
    COMPOUND_STRING("QKALLEY"),
    COMPOUND_STRING("QKALLI"),
    COMPOUND_STRING("QKALLIE"),
    COMPOUND_STRING("QKALLII"),
    COMPOUND_STRING("QKALLIS"),
    COMPOUND_STRING("QKALLIY"),
    COMPOUND_STRING("QKALLY"),
    COMPOUND_STRING("QKALY"),
    COMPOUND_STRING("QKAYELI"),
    COMPOUND_STRING("QKAYELY"),
    COMPOUND_STRING("QKAYLAY"),
    COMPOUND_STRING("QKAYLEA"),
    COMPOUND_STRING("QKAYLEE"),
    COMPOUND_STRING("QKAYLEI"),
    COMPOUND_STRING("QKAYLEY"),
    COMPOUND_STRING("QKAYLHI"),
    COMPOUND_STRING("QKAYLHY"),
    COMPOUND_STRING("QKAYLI"),
    COMPOUND_STRING("QKAYLIE"),
    COMPOUND_STRING("QKAYLII"),
    COMPOUND_STRING("QKAYLIS"),
    COMPOUND_STRING("QKAYLIY"),
    COMPOUND_STRING("QKAYLLI"),
    COMPOUND_STRING("QKAYLLY"),
    COMPOUND_STRING("QKAYLY"),
    COMPOUND_STRING("QKEALAY"),
    COMPOUND_STRING("QKEALEA"),
    COMPOUND_STRING("QKEALEE"),
    COMPOUND_STRING("QKEALEI"),
    COMPOUND_STRING("QKEALEY"),
    COMPOUND_STRING("QKEALHI"),
    COMPOUND_STRING("QKEALHY"),
    COMPOUND_STRING("QKEALI"),
    COMPOUND_STRING("QKEALIE"),
    COMPOUND_STRING("QKEALII"),
    COMPOUND_STRING("QKEALIS"),
    COMPOUND_STRING("QKEALIY"),
    COMPOUND_STRING("QKEALLI"),
    COMPOUND_STRING("QKEALLY"),
    COMPOUND_STRING("QKEALY"),
    COMPOUND_STRING("QKEIGLI"),
    COMPOUND_STRING("QKEIGLY"),
    COMPOUND_STRING("QKEIHLI"),
    COMPOUND_STRING("QKEIHLY"),
    COMPOUND_STRING("QKEILAY"),
    COMPOUND_STRING("QKEILEA"),
    COMPOUND_STRING("QKEILEE"),
    COMPOUND_STRING("QKEILEI"),
    COMPOUND_STRING("QKEILEY"),
    COMPOUND_STRING("QKEILHI"),
    COMPOUND_STRING("QKEILHY"),
    COMPOUND_STRING("QKEILI"),
    COMPOUND_STRING("QKEILIE"),
    COMPOUND_STRING("QKEILII"),
    COMPOUND_STRING("QKEILIS"),
    COMPOUND_STRING("QKEILIY"),
    COMPOUND_STRING("QKEILLI"),
    COMPOUND_STRING("QKEILLY"),
    COMPOUND_STRING("QKEILY"),
    COMPOUND_STRING("QKEYLAY"),
    COMPOUND_STRING("QKEYLEA"),
    COMPOUND_STRING("QKEYLEE"),
    COMPOUND_STRING("QKEYLEI"),
    COMPOUND_STRING("QKEYLEY"),
    COMPOUND_STRING("QKEYLHI"),
    COMPOUND_STRING("QKEYLHY"),
    COMPOUND_STRING("QKEYLI"),
    COMPOUND_STRING("QKEYLIE"),
    COMPOUND_STRING("QKEYLII"),
    COMPOUND_STRING("QKEYLIS"),
    COMPOUND_STRING("QKEYLIY"),
    COMPOUND_STRING("QKEYLLI"),
    COMPOUND_STRING("QKEYLLY"),
    COMPOUND_STRING("QKEYLY"),
    COMPOUND_STRING("QQAAHLI"),
    COMPOUND_STRING("QQAAHLY"),
    COMPOUND_STRING("QQAALAY"),
    COMPOUND_STRING("QQAALEA"),
    COMPOUND_STRING("QQAALEE"),
    COMPOUND_STRING("QQAALEI"),
    COMPOUND_STRING("QQAALEY"),
    COMPOUND_STRING("QQAALHI"),
    COMPOUND_STRING("QQAALHY"),
    COMPOUND_STRING("QQAALI"),
    COMPOUND_STRING("QQAALIE"),
    COMPOUND_STRING("QQAALII"),
    COMPOUND_STRING("QQAALIS"),
    COMPOUND_STRING("QQAALIY"),
    COMPOUND_STRING("QQAALLI"),
    COMPOUND_STRING("QQAALLY"),
    COMPOUND_STRING("QQAALY"),
    COMPOUND_STRING("QQAAYLI"),
    COMPOUND_STRING("QQAAYLY"),
    COMPOUND_STRING("QQAEHLI"),
    COMPOUND_STRING("QQAEHLY"),
    COMPOUND_STRING("QQAELAY"),
    COMPOUND_STRING("QQAELEA"),
    COMPOUND_STRING("QQAELEE"),
    COMPOUND_STRING("QQAELEI"),
    COMPOUND_STRING("QQAELEY"),
    COMPOUND_STRING("QQAELHI"),
    COMPOUND_STRING("QQAELHY"),
    COMPOUND_STRING("QQAELI"),
    COMPOUND_STRING("QQAELIE"),
    COMPOUND_STRING("QQAELII"),
    COMPOUND_STRING("QQAELIS"),
    COMPOUND_STRING("QQAELIY"),
    COMPOUND_STRING("QQAELLI"),
    COMPOUND_STRING("QQAELLY"),
    COMPOUND_STRING("QQAELY"),
    COMPOUND_STRING("QQAGHLI"),
    COMPOUND_STRING("QQAGHLY"),
    COMPOUND_STRING("QQAHLAY"),
    COMPOUND_STRING("QQAHLEA"),
    COMPOUND_STRING("QQAHLEE"),
    COMPOUND_STRING("QQAHLEI"),
    COMPOUND_STRING("QQAHLEY"),
    COMPOUND_STRING("QQAHLHI"),
    COMPOUND_STRING("QQAHLHY"),
    COMPOUND_STRING("QQAHLI"),
    COMPOUND_STRING("QQAHLIE"),
    COMPOUND_STRING("QQAHLII"),
    COMPOUND_STRING("QQAHLIS"),
    COMPOUND_STRING("QQAHLIY"),
    COMPOUND_STRING("QQAHLLI"),
    COMPOUND_STRING("QQAHLLY"),
    COMPOUND_STRING("QQAHLY"),
    COMPOUND_STRING("QQAHYLI"),
    COMPOUND_STRING("QQAHYLY"),
    COMPOUND_STRING("QQAILAY"),
    COMPOUND_STRING("QQAILEA"),
    COMPOUND_STRING("QQAILEE"),
    COMPOUND_STRING("QQAILEI"),
    COMPOUND_STRING("QQAILEY"),
    COMPOUND_STRING("QQAILHI"),
    COMPOUND_STRING("QQAILHY"),
    COMPOUND_STRING("QQAILI"),
    COMPOUND_STRING("QQAILIE"),
    COMPOUND_STRING("QQAILII"),
    COMPOUND_STRING("QQAILIS"),
    COMPOUND_STRING("QQAILIY"),
    COMPOUND_STRING("QQAILLI"),
    COMPOUND_STRING("QQAILLY"),
    COMPOUND_STRING("QQAILY"),
    COMPOUND_STRING("QQALAEY"),
    COMPOUND_STRING("QQALAHY"),
    COMPOUND_STRING("QQALAY"),
    COMPOUND_STRING("QQALEA"),
    COMPOUND_STRING("QQALEE"),
    COMPOUND_STRING("QQALEEA"),
    COMPOUND_STRING("QQALEEE"),
    COMPOUND_STRING("QQALEEI"),
    COMPOUND_STRING("QQALEEY"),
    COMPOUND_STRING("QQALEI"),
    COMPOUND_STRING("QQALEIE"),
    COMPOUND_STRING("QQALEIH"),
    COMPOUND_STRING("QQALEIY"),
    COMPOUND_STRING("QQALEY"),
    COMPOUND_STRING("QQALHAY"),
    COMPOUND_STRING("QQALHEA"),
    COMPOUND_STRING("QQALHEE"),
    COMPOUND_STRING("QQALHEI"),
    COMPOUND_STRING("QQALHEY"),
    COMPOUND_STRING("QQALHI"),
    COMPOUND_STRING("QQALHIE"),
    COMPOUND_STRING("QQALHII"),
    COMPOUND_STRING("QQALHIS"),
    COMPOUND_STRING("QQALHIY"),
    COMPOUND_STRING("QQALHY"),
    COMPOUND_STRING("QQALI"),
    COMPOUND_STRING("QQALIE"),
    COMPOUND_STRING("QQALIEE"),
    COMPOUND_STRING("QQALIEI"),
    COMPOUND_STRING("QQALIEY"),
    COMPOUND_STRING("QQALII"),
    COMPOUND_STRING("QQALIIE"),
    COMPOUND_STRING("QQALIII"),
    COMPOUND_STRING("QQALIIS"),
    COMPOUND_STRING("QQALIS"),
    COMPOUND_STRING("QQALIY"),
    COMPOUND_STRING("QQALLAY"),
    COMPOUND_STRING("QQALLEA"),
    COMPOUND_STRING("QQALLEE"),
    COMPOUND_STRING("QQALLEI"),
    COMPOUND_STRING("QQALLEY"),
    COMPOUND_STRING("QQALLI"),
    COMPOUND_STRING("QQALLIE"),
    COMPOUND_STRING("QQALLII"),
    COMPOUND_STRING("QQALLIS"),
    COMPOUND_STRING("QQALLIY"),
    COMPOUND_STRING("QQALLY"),
    COMPOUND_STRING("QQALY"),
    COMPOUND_STRING("QQAYELI"),
    COMPOUND_STRING("QQAYELY"),
    COMPOUND_STRING("QQAYLAY"),
    COMPOUND_STRING("QQAYLEA"),
    COMPOUND_STRING("QQAYLEE"),
    COMPOUND_STRING("QQAYLEI"),
    COMPOUND_STRING("QQAYLEY"),
    COMPOUND_STRING("QQAYLHI"),
    COMPOUND_STRING("QQAYLHY"),
    COMPOUND_STRING("QQAYLI"),
    COMPOUND_STRING("QQAYLIE"),
    COMPOUND_STRING("QQAYLII"),
    COMPOUND_STRING("QQAYLIS"),
    COMPOUND_STRING("QQAYLIY"),
    COMPOUND_STRING("QQAYLLI"),
    COMPOUND_STRING("QQAYLLY"),
    COMPOUND_STRING("QQAYLY"),
    COMPOUND_STRING("QQEALAY"),
    COMPOUND_STRING("QQEALEA"),
    COMPOUND_STRING("QQEALEE"),
    COMPOUND_STRING("QQEALEI"),
    COMPOUND_STRING("QQEALEY"),
    COMPOUND_STRING("QQEALHI"),
    COMPOUND_STRING("QQEALHY"),
    COMPOUND_STRING("QQEALI"),
    COMPOUND_STRING("QQEALIE"),
    COMPOUND_STRING("QQEALII"),
    COMPOUND_STRING("QQEALIS"),
    COMPOUND_STRING("QQEALIY"),
    COMPOUND_STRING("QQEALLI"),
    COMPOUND_STRING("QQEALLY"),
    COMPOUND_STRING("QQEALY"),
    COMPOUND_STRING("QQEIGLI"),
    COMPOUND_STRING("QQEIGLY"),
    COMPOUND_STRING("QQEIHLI"),
    COMPOUND_STRING("QQEIHLY"),
    COMPOUND_STRING("QQEILAY"),
    COMPOUND_STRING("QQEILEA"),
    COMPOUND_STRING("QQEILEE"),
    COMPOUND_STRING("QQEILEI"),
    COMPOUND_STRING("QQEILEY"),
    COMPOUND_STRING("QQEILHI"),
    COMPOUND_STRING("QQEILHY"),
    COMPOUND_STRING("QQEILI"),
    COMPOUND_STRING("QQEILIE"),
    COMPOUND_STRING("QQEILII"),
    COMPOUND_STRING("QQEILIS"),
    COMPOUND_STRING("QQEILIY"),
    COMPOUND_STRING("QQEILLI"),
    COMPOUND_STRING("QQEILLY"),
    COMPOUND_STRING("QQEILY"),
    COMPOUND_STRING("QQEYLAY"),
    COMPOUND_STRING("QQEYLEA"),
    COMPOUND_STRING("QQEYLEE"),
    COMPOUND_STRING("QQEYLEI"),
    COMPOUND_STRING("QQEYLEY"),
    COMPOUND_STRING("QQEYLHI"),
    COMPOUND_STRING("QQEYLHY"),
    COMPOUND_STRING("QQEYLI"),
    COMPOUND_STRING("QQEYLIE"),
    COMPOUND_STRING("QQEYLII"),
    COMPOUND_STRING("QQEYLIS"),
    COMPOUND_STRING("QQEYLIY"),
    COMPOUND_STRING("QQEYLLI"),
    COMPOUND_STRING("QQEYLLY"),
    COMPOUND_STRING("QQEYLY"),

     
};

void IsPlayerNameKaylee(void)
{
    u32 i;
    for (i = 0; i < NELEMS(gKayleeNameTable); i++)
    {
        if (StringCompareIgnoreCase(gSaveBlock2Ptr->playerName, gKayleeNameTable[i]))
        {
            gSpecialVar_Result = TRUE;
            return;
        }
    }
    gSpecialVar_Result = FALSE;
}

void CSRBadgeDebug(void)
{
    u16 badgeState = VarGet(VAR_TEMP_F);
    DebugPrintf("setting badge state: %u", badgeState);

    switch (badgeState)
    {
    case 0:  // no badges
        FlagClear(FLAG_BADGE01_GET);
        FlagClear(FLAG_BADGE02_GET);
        FlagClear(FLAG_BADGE03_GET);
        FlagClear(FLAG_BADGE04_GET);
        FlagClear(FLAG_BADGE05_GET);
        FlagClear(FLAG_BADGE06_GET);
        FlagClear(FLAG_GOT_GYM_MEMBERSHIP_BADGE);
        FlagClear(FLAG_BADGE07_GET);
        FlagClear(FLAG_OBTAINED_ZEPHYRBADGE);
        FlagClear(FLAG_BADGE08_GET);
        break;
    case 1:  // everything pre double boulderbadge
        FlagSet(FLAG_BADGE01_GET);
        FlagSet(FLAG_BADGE02_GET);
        FlagSet(FLAG_BADGE03_GET);
        FlagSet(FLAG_BADGE04_GET);
        FlagSet(FLAG_BADGE05_GET);
        break;
    case 2: // double boulderbadge
        FlagSet(FLAG_BADGE06_GET);
        break;
    case 3: // gym membership badge
        FlagSet(FLAG_GOT_GYM_MEMBERSHIP_BADGE);
        break;
    case 4: // last badge before new tilemap
        FlagSet(FLAG_BADGE07_GET);
        break;
    case 5: // first badge of new tilemap
        FlagSet(FLAG_OBTAINED_ZEPHYRBADGE);
        break;
    case 6: // all badges obtained
        FlagSet(FLAG_BADGE08_GET);
        break;
    }

    badgeState++;
    if (badgeState > 6) badgeState = 0;
    VarSet(VAR_TEMP_F, badgeState);
}
