#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "battle_anim.h"
#include "overworld.h"
#include "quest_log.h"
#include "constants/trainers.h"

void TrySetQuestLogBattleEvent(void)
{
    if (!(gBattleTypeFlags & (BATTLE_TYPE_OLD_MAN_TUTORIAL | BATTLE_TYPE_POKEDUDE)) && (gBattleOutcome == B_OUTCOME_WON || gBattleOutcome == B_OUTCOME_CAUGHT))
    {
        // Why allocate both of these? Only one will ever be used at a time
        struct QuestLogEvent_TrainerBattle * trainerData = Alloc(sizeof(*trainerData));
        struct QuestLogEvent_WildBattle * wildData = Alloc(sizeof(*wildData));
        u16 eventId;
        u16 playerEndingHP;
        u16 playerMaxHP;

        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
        {
            switch (gTrainers[gTrainerBattleOpponent_A].trainerClass)
            {
            case TRAINER_CLASS_LEADER:
                eventId = QL_EVENT_DEFEATED_GYM_LEADER;
                break;
            case TRAINER_CLASS_CHAMPION:
                eventId = QL_EVENT_DEFEATED_CHAMPION;
                break;
            case TRAINER_CLASS_ELITE_FOUR:
                eventId = QL_EVENT_DEFEATED_E4_MEMBER;
                break;
            default:
                eventId = QL_EVENT_DEFEATED_TRAINER;
                break;
            }
            trainerData->trainerId = gTrainerBattleOpponent_A;
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            {
                trainerData->speciesOpponent = gBattleResults.lastOpponentSpecies;
                
                // Decide which of the pokemon on the player's side to mention as the victor
                if (GetBattlerSide(gBattleStruct->lastAttackerToFaintOpponent) == B_SIDE_PLAYER)
                    trainerData->speciesPlayer = gBattleMons[gBattleStruct->lastAttackerToFaintOpponent].species;
                else if (gBattleMons[GetBattlerAtPosition(0)].hp != 0)
                    trainerData->speciesPlayer = gBattleMons[GetBattlerAtPosition(0)].species;
                else
                    trainerData->speciesPlayer = gBattleMons[GetBattlerAtPosition(2)].species;

                playerEndingHP = gBattleMons[GetBattlerAtPosition(0)].hp + gBattleMons[GetBattlerAtPosition(2)].hp;
                playerMaxHP = gBattleMons[GetBattlerAtPosition(0)].maxHP + gBattleMons[GetBattlerAtPosition(2)].maxHP;
            }
            else
            {
                trainerData->speciesOpponent = gBattleResults.lastOpponentSpecies;
                trainerData->speciesPlayer = gBattleMons[GetBattlerAtPosition(0)].species;
                playerEndingHP = gBattleMons[GetBattlerAtPosition(0)].hp;
                playerMaxHP = gBattleMons[GetBattlerAtPosition(0)].maxHP;
            }
            trainerData->mapSec = GetCurrentRegionMapSectionId();

            // Calculate fractional HP loss (determines flavor text, e.g. "handily" vs "somehow" defeated trainer)
            trainerData->hpFractionId = 0;
            if (playerEndingHP < playerMaxHP / 3 * 2)
                trainerData->hpFractionId++;
            if (playerEndingHP < playerMaxHP / 3)
                trainerData->hpFractionId++;

            SetQuestLogEvent(eventId, (const u16 *)trainerData);
        }
        else
        {
            if (gBattleOutcome == B_OUTCOME_WON)
            {
                wildData->defeatedSpecies = GetMonData(gEnemyParty, MON_DATA_SPECIES);
                wildData->caughtSpecies = SPECIES_NONE;
            }
            else // gBattleOutcome == B_OUTCOME_CAUGHT
            {
                wildData->defeatedSpecies = SPECIES_NONE;
                wildData->caughtSpecies = GetMonData(gEnemyParty, MON_DATA_SPECIES);
            }
            wildData->mapSec = GetCurrentRegionMapSectionId();
            SetQuestLogEvent(QL_EVENT_DEFEATED_WILD_MON, (const u16 *)wildData);
        }
        Free(trainerData);
        Free(wildData);
    }
}
