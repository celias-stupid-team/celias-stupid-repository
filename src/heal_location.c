#include "global.h"
#include "heal_location.h"
#include "event_data.h"
#include "constants/maps.h"
#include "constants/map_event_ids.h"
#include "constants/heal_locations.h"

static void SetWhiteoutRespawnHealerNpcAsLastTalked(u32 healLocationIdx);

// Arrays described here because mapjson will overrwrite the below data file

// sHealLocations
// This array defines the fly points for unlocked spawns.

// sWhiteoutRespawnHealCenterMapIdxs
// This array defines the map where you actually respawn when you white out,
// based on where you last checkpointed.
// This is either the player's house or a Pokémon Center.
// The data are u16 instead of u8 for reasons unknown.

// sWhiteoutRespawnHealerNpcIds
// When you respawn, your character scurries back to either their house
// or a Pokémon Center, and hands their fainted Pokémon to their mother
// or the Nurse for healing.
// This array defines the index of the NPC on the map defined above
// with whom your character interacts in this cutscene.

#include "data/heal_locations.h"

static u32 GetHealLocationIndexFromMapGroupAndNum(u16 mapGroup, u16 mapNum)
{
    u32 i;

    for (i = 0; i < ARRAY_COUNT(sHealLocations); i++) {
        if (sHealLocations[i].mapGroup == mapGroup && sHealLocations[i].mapNum == mapNum)
        {
            return i + 1;
        }
    }

    return HEAL_LOCATION_NONE;
}

static const struct HealLocation * GetHealLocationPointerFromMapGroupAndNum(u16 mapGroup, u16 mapNum)
{
    u32 i = GetHealLocationIndexFromMapGroupAndNum(mapGroup, mapNum);
    if (i == HEAL_LOCATION_NONE)
        return NULL;

    return &sHealLocations[i - 1];
}

const struct HealLocation * GetHealLocation(u32 idx)
{
    if (idx == HEAL_LOCATION_NONE)
        return NULL;
    if (idx > ARRAY_COUNT(sHealLocations))
        return NULL;
    return &sHealLocations[idx - 1];
}

void SetWhiteoutRespawnWarpAndHealerNpc(struct WarpData * warp)
{
    u32 healLocationIdx;

    if (VarGet(VAR_CSR_DUMMY_22) == 1)
    {
        if (!gSaveBlock1Ptr->trainerTower[gSaveBlock1Ptr->towerChallengeId].spokeToOwner)
            VarSet(VAR_CSR_DUMMY_22, 0);
        gSpecialVar_LastTalked = 1;
        warp->x = 4;
        warp->y = 11;
        warp->mapGroup = MAP_GROUP(MAP_TRAINER_TOWER_LOBBY);
        warp->mapNum = MAP_NUM(MAP_TRAINER_TOWER_LOBBY);
        warp->warpId = 0xFF;
    }
    else
    {
        healLocationIdx = GetHealLocationIndexFromMapGroupAndNum(gSaveBlock1Ptr->lastHealLocation.mapGroup, gSaveBlock1Ptr->lastHealLocation.mapNum);
#ifdef BUGFIX
        // Avoid out of bounds read
        if (healLocationIdx == HEAL_LOCATION_NONE)
            return;
#endif
        warp->mapGroup = sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0];
        warp->mapNum = sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1];
        warp->warpId = WARP_ID_NONE;
        if(DoesHealLocationSkipCutscene()) {
            warp->x = gSaveBlock1Ptr->lastHealLocation.x;
            warp->y = gSaveBlock1Ptr->lastHealLocation.y;
        }
        else if (sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(MAP_PALLET_TOWN_PLAYERS_HOUSE_1F) && sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(MAP_PALLET_TOWN_PLAYERS_HOUSE_1F))
        {
            warp->x = 8;
            warp->y = 6;
        }
        else if (sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(MAP_INDIGO_PLATEAU_POKEMON_CENTER_1F) && sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(MAP_INDIGO_PLATEAU_POKEMON_CENTER_1F))
        {
            warp->x = 13;
            warp->y = 12;
        }
        else if (sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(MAP_ONE_ISLAND_POKEMON_CENTER_1F) && sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(MAP_ONE_ISLAND_POKEMON_CENTER_1F))
        {
            warp->x = 5;
            warp->y = 4;
        }
        else if (sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][0] == MAP_GROUP(MAP_TRAINER_TOWER_LOBBY) && sWhiteoutRespawnHealCenterMapIdxs[healLocationIdx - 1][1] == MAP_NUM(MAP_TRAINER_TOWER_LOBBY))
        {
            warp->x = 4;
            warp->y = 11;
            VarSet(VAR_CSR_DUMMY_22, 0);
        }
        else
        {
            warp->x = 7;
            warp->y = 4;
        }
        SetWhiteoutRespawnHealerNpcAsLastTalked(healLocationIdx);
    }
}

static void SetWhiteoutRespawnHealerNpcAsLastTalked(u32 healLocationIdx)
{
    gSpecialVar_LastTalked = sWhiteoutRespawnHealerNpcIds[healLocationIdx - 1];
}


bool8 DoesHealLocationSkipCutscene(void) {
    const struct HealLocation *loc;

    static const u32 HealLocationsWithoutCutscene[] = 
    {
        HEAL_LOCATION_FUSHCIA_GYM_ENTRANCE,
        HEAL_LOCATION_FUSHCIA_GYM_TRAINER_ROOM_1,
        HEAL_LOCATION_FUSHCIA_GYM_GYM_LEADER_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_TRAINER_ROOM_2,
        HEAL_LOCATION_FUSHCIA_GYM_ARON_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_MOUSEHOLE_HEAL,
        HEAL_LOCATION_FUSHCIA_GYM_SHEDINJA_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_LASS_MAZE,
        HEAL_LOCATION_FUSHCIA_GYM_BURN_DUSCLOPS_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_DARKRAI_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_IMPOSTER_OAK_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_HEAL_ROOM_2,
        HEAL_LOCATION_FUSHCIA_GYM_PARALYSIS_DUSCLOPS_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_DRILL_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_RAIN_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_TRIO_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_SCROLL_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_THE_PIT_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_ELECTRIFY_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_LIONS_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_LOOK_GIRL_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_ICE_PUZZLE_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_TOXIC_DUSCLOPS_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_DEVON_SCOPE_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_DOUBLE_BATTLE_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_TRICK_ROOM_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_MAP_ROOM,
        HEAL_LOCATION_FUSHCIA_GYM_IRON_CURTAIN_ROOM,
        HEAL_LOCATION_POKEMON_TOWER,
        HEAL_LOCATION_FUSHCIA_OUTSIDE,
    };
    u32 i;
    for (i = 0; i < ARRAY_COUNT(HealLocationsWithoutCutscene); i++)
    {
        loc = GetHealLocation(HealLocationsWithoutCutscene[i]);
        if (gSaveBlock1Ptr->lastHealLocation.mapGroup == loc->mapGroup
        && gSaveBlock1Ptr->lastHealLocation.mapNum == loc->mapNum
        && gSaveBlock1Ptr->lastHealLocation.x == loc->x
        && gSaveBlock1Ptr->lastHealLocation.y == loc->y) {
            DebugPrintf("Should not have cutscene, case %d", i);
            return TRUE;
        } else {
            
            DebugPrintf("Compared %d to %d not equal", gSaveBlock1Ptr->lastHealLocation.mapGroup, loc->mapGroup);
        }
    }
    DebugPrintf("Should have cutscene");
    return FALSE;
}