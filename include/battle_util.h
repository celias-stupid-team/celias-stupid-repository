#ifndef GUARD_BATTLE_UTIL_H
#define GUARD_BATTLE_UTIL_H

#include "global.h"

#define MOVE_LIMITATION_ZEROMOVE                (1 << 0)
#define MOVE_LIMITATION_PP                      (1 << 1)
#define MOVE_LIMITATION_DISABLED                (1 << 2)
#define MOVE_LIMITATION_TORMENTED               (1 << 3)
#define MOVE_LIMITATION_TAUNT                   (1 << 4)
#define MOVE_LIMITATION_IMPRISON                (1 << 5)
#define MOVE_LIMITATION_GIGATON                 (1 << 6)
#define MOVE_LIMITATIONS_ALL                    0xFF

#define ABILITYEFFECT_ON_SWITCHIN                0
#define ABILITYEFFECT_ENDTURN                    1
#define ABILITYEFFECT_MOVES_BLOCK                2
#define ABILITYEFFECT_ABSORBING                  3
#define ABILITYEFFECT_ON_DAMAGE                  4
#define ABILITYEFFECT_IMMUNITY                   5
#define ABILITYEFFECT_FORECAST                   6
#define ABILITYEFFECT_SYNCHRONIZE                7
#define ABILITYEFFECT_ATK_SYNCHRONIZE            8
#define ABILITYEFFECT_INTIMIDATE1                9
#define ABILITYEFFECT_INTIMIDATE2                10
#define ABILITYEFFECT_TRACE                      11
#define ABILITYEFFECT_CHECK_OTHER_SIDE           12
#define ABILITYEFFECT_CHECK_BATTLER_SIDE         13
#define ABILITYEFFECT_FIELD_SPORT                14
#define ABILITYEFFECT_CHECK_FIELD_EXCEPT_BATTLER 15
#define ABILITYEFFECT_COUNT_OTHER_SIDE           16
#define ABILITYEFFECT_COUNT_BATTLER_SIDE         17
#define ABILITYEFFECT_COUNT_ON_FIELD             18
#define ABILITYEFFECT_CHECK_ON_FIELD             19
#define ABILITYEFFECT_NEUTRALIZINGGAS_SLOWSTART  20
#define ABILITYEFFECT_NEUTRALIZINGGAS            21
#define ABILITYEFFECT_MOVE_END_DANCER             22
#define ABILITYEFFECT_MUD_SPORT                  253
#define ABILITYEFFECT_WATER_SPORT                254
#define ABILITYEFFECT_SWITCH_IN_WEATHER          255

#define ABILITY_ON_OPPOSING_FIELD(battlerId, abilityId)(AbilityBattleEffects(ABILITYEFFECT_CHECK_OTHER_SIDE, battlerId, abilityId, 0, 0))
#define ABILITY_ON_FIELD(abilityId)(AbilityBattleEffects(ABILITYEFFECT_CHECK_ON_FIELD, 0, abilityId, 0, 0))
#define ABILITY_ON_FIELD2(abilityId)(AbilityBattleEffects(ABILITYEFFECT_FIELD_SPORT, 0, abilityId, 0, 0))

// For the first argument of ItemBattleEffects, to deteremine which block of item effects to try
#define ITEMEFFECT_ON_SWITCH_IN                 0
#define ITEMEFFECT_NORMAL                       1
#define ITEMEFFECT_DUMMY                        2 // Unused, empty
#define ITEMEFFECT_MOVE_END                     3
#define ITEMEFFECT_KINGSROCK_SHELLBELL          4
#define ITEMEFFECT_TARGET                       5
#define ITEMEFFECT_FORCE_BERRY_CONSUMPTION      6

#define WEATHER_HAS_EFFECT ((!AbilityBattleEffects(ABILITYEFFECT_CHECK_ON_FIELD, 0, ABILITY_CLOUD_NINE, 0, 0) && !AbilityBattleEffects(ABILITYEFFECT_CHECK_ON_FIELD, 0, ABILITY_AIR_LOCK, 0, 0)))
#define WEATHER_HAS_EFFECT2 ((!AbilityBattleEffects(ABILITYEFFECT_FIELD_SPORT, 0, ABILITY_CLOUD_NINE, 0, 0) && !AbilityBattleEffects(ABILITYEFFECT_FIELD_SPORT, 0, ABILITY_AIR_LOCK, 0, 0)))

#define BS_GET_TARGET                   0
#define BS_GET_ATTACKER                 1
#define BS_GET_EFFECT_BANK              2
#define BS_GET_SCRIPTING_BANK           10
#define BS_GET_PLAYER1                  11
#define BS_GET_OPPONENT1                12
#define BS_GET_PLAYER2                  13
#define BS_GET_OPPONENT2                14

static const uq4_12_t sTypeEffectivenessTable[NUMBER_OF_MON_TYPES][NUMBER_OF_MON_TYPES];

u8 GetBattlerForBattleScript(u8 caseId);
void PressurePPLose(u8 target, u8 attacker, u16 move);
void PressurePPLoseOnUsingImprison(u8 attacker);
void PressurePPLoseOnUsingPerishSong(u8 attacker);
void MarkBattlerForControllerExec(u8 battlerId);
void MarkBattlerReceivedLinkData(u8 battlerId);
void CancelMultiTurnMoves(u8 battler);
bool8 WasUnableToUseMove(u8 battler);
void PrepareStringBattle(u16 stringId, u8 battler);
void ResetSentPokesToOpponentValue(void);
void OpponentSwitchInResetSentPokesToOpponentValue(u8 battler);
void UpdateSentPokesToOpponentValue(u8 battler);
void BattleScriptPush(const u8 *bsPtr);
void BattleScriptPushCursor(void);
void BattleScriptPop(void);
u8 TrySetCantSelectMoveBattleScript(void);
u8 CheckMoveLimitations(u8 battlerId, u8 unusableMoves, u8 check);
bool8 AreAllMovesUnusable(void);
u8 GetImprisonedMovesCount(u8 battlerId, u16 move);
u8 DoFieldEndTurnEffects(void);
u8 DoBattlerEndTurnEffects(void);
bool8 HandleWishPerishSongOnTurnEnd(void);
bool8 HandleFaintedMonActions(void);
void TryClearRageStatuses(void);
u8 AtkCanceller_UnableToUseMove(void);
bool8 HasNoMonsToSwitch(u8 battler, u8 partyIdBattlerOn1, u8 partyIdBattlerOn2);
u8 CastformDataTypeChange(u8 battler);
u8 AbilityBattleEffects(u8 caseID, u8 battler, u8 ability, u8 special, u16 moveArg);
void BattleScriptExecute(const u8 *BS_ptr);
void BattleScriptPushCursorAndCallback(const u8 *BS_ptr);
u8 ItemBattleEffects(u8 caseID, u8 battlerId, bool8 moveTurn);
void ClearFuryCutterDestinyBondGrudge(u8 battlerId);
void HandleAction_RunBattleScript(void);
u8 GetMoveTarget(u16 move, u8 setTarget);
u8 IsMonDisobedient(void);
s32 GetStealthHazardDamage(u8 hazardType, u32 battler);
s32 GetStealthHazardDamageByTypesAndHP(u8 hazardType, u8 type1, u8 type2, u32 maxHp);
uq4_12_t GetTypeModifier(u32 atkType, u32 defType);
bool32 IsNeutralizingGasOnField(void);
void TryRestoreHeldItems(void);
bool32 IsSingleWildRattata(void);
bool32 IsZapmolcunoOhgiaSpecies(u16 species);
bool32 CanBePoisoned(u8 battlerTarget, u8 abilityTarget);
bool32 CanBattlerGetOrLoseItem(u32 battler, u16 itemId);
u8 GetColorChangeDefType(u8 moveType);
u16 GetTwistedRealityMove(u8 index);
u8 GetTwistedRealityMoveCount(void);

#define COLOR_CHANGE_DEF_TYPE_GHOST          0
#define COLOR_CHANGE_DEF_TYPE_SUBMARINE      1
#define COLOR_CHANGE_DEF_TYPE_STEEL          2
#define COLOR_CHANGE_DEF_TYPE_POLICE         3
#define COLOR_CHANGE_DEF_TYPE_CARPENTER      4
#define COLOR_CHANGE_DEF_TYPE_MICROSOFT      5
#define COLOR_CHANGE_DEF_TYPE_NORMAL         6
#define COLOR_CHANGE_DEF_TYPE_YUGIOH         7
#define COLOR_CHANGE_DEF_TYPE_FLYING         8
#define COLOR_CHANGE_DEF_TYPE_BOSS           9
#define COLOR_CHANGE_DEF_TYPE_OIL            10
#define COLOR_CHANGE_DEF_TYPE_MOWER          11
#define COLOR_CHANGE_DEF_TYPE_GROUND         12
#define COLOR_CHANGE_DEF_TYPE_DARK           13
#define COLOR_CHANGE_DEF_TYPE_GLOBAL_WARMING 14
#define COLOR_CHANGE_DEF_TYPE_FAIRY          15
#define COLOR_CHANGE_DEF_TYPE_BLACKHOLE      16
#define COLOR_CHANGE_DEF_TYPE_TOOTH          17
#define COLOR_CHANGE_DEF_TYPE_GIRLS          18
#define COLOR_CHANGE_DEF_TYPE_BORED          19
#define COLOR_CHANGE_DEF_TYPE_MOM            20
#define COLOR_CHANGE_DEF_TYPE_SUN            21
#define COLOR_CHANGE_DEF_TYPE_MYSTERY        22
#define COLOR_CHANGE_DEF_TYPE_COUNT          23

extern const u8 gColorChangeDefTypeNames[COLOR_CHANGE_DEF_TYPE_COUNT][20];
extern const u16 gColorChangeDefTypeHue[COLOR_CHANGE_DEF_TYPE_COUNT];

#endif // GUARD_BATTLE_UTIL_H
