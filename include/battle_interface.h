#ifndef GUARD_BATTLE_INTERFACE_H
#define GUARD_BATTLE_INTERFACE_H

#include "global.h"
#include "battle_controllers.h"

enum
{
    HP_CURRENT,
    HP_MAX
};

enum
{
    HEALTH_BAR,
    EXP_BAR
};

enum
{
    HP_BAR_EMPTY,
    HP_BAR_RED,
    HP_BAR_YELLOW,
    HP_BAR_GREEN,
    HP_BAR_FULL,
};

#define TAG_HEALTHBOX_PLAYER1_TILE              55039
#define TAG_HEALTHBOX_PLAYER2_TILE              55040
#define TAG_HEALTHBOX_OPPONENT1_TILE            55041
#define TAG_HEALTHBOX_OPPONENT2_TILE            55042

#define TAG_HEALTHBAR_PLAYER1_TILE              55044
#define TAG_HEALTHBAR_OPPONENT1_TILE            55045
#define TAG_HEALTHBAR_PLAYER2_TILE              55046
#define TAG_HEALTHBAR_OPPONENT2_TILE            55047

#define TAG_HEALTHBOX_PALS_1                    55049
#define TAG_HEALTHBOX_PALS_2                    55050
#define TAG_HEALTHBOX_SAFARI_TILE               55051
#define TAG_PARTY_SUMMARY_BAR_PLAYER_TILE       55052
#define TAG_PARTY_SUMMARY_BAR_OPPONENT_TILE     55053

#define TAG_PARTY_SUMMARY_BAR_PLAYER_PAL        55056
#define TAG_PARTY_SUMMARY_BAR_OPPONENT_PAL      55057
#define TAG_PARTY_SUMMARY_BALL_PLAYER_PAL       55058
#define TAG_PARTY_SUMMARY_BALL_OPPONENT_PAL     55059
#define TAG_PARTY_SUMMARY_BALL_PLAYER_TILE      55060
#define TAG_PARTY_SUMMARY_BALL_OPPONENT_TILE    55061

#define TAG_HEALTHBAR_OPPONENT_PAL              55062

#define TAG_HEALTHBOX_PAL                       TAG_HEALTHBOX_PLAYER1_TILE
#define TAG_HEALTHBAR_PAL                       TAG_HEALTHBAR_PLAYER1_TILE

#define RGB256(r, g, b)                         ((u16)((((r) & 0xF8) >> 3) | (((g) & 0xF8) << 2) | (((b) & 0xF8) << 7)))

#define B_HEALTHBAR_COLOR_LUGIA_MAIN            RGB256(215, 115, 255)
#define B_HEALTHBAR_COLOR_LUGIA_SHADOW          RGB256(169, 90, 214)
#define B_HEALTHBAR_COLOR_LUGIA_EMPTY_MAIN      RGB(14, 25, 31)
#define B_HEALTHBAR_COLOR_LUGIA_EMPTY_SHADOW    RGB(10, 18, 22)
#define B_HEALTHBAR_COLOR_ARTICUNO_MAIN         B_HEALTHBAR_COLOR_LUGIA_EMPTY_MAIN
#define B_HEALTHBAR_COLOR_ARTICUNO_SHADOW       B_HEALTHBAR_COLOR_LUGIA_EMPTY_SHADOW
#define B_HEALTHBAR_COLOR_ARTICUNO_EMPTY_MAIN   RGB256(115, 255, 173)
#define B_HEALTHBAR_COLOR_ARTICUNO_EMPTY_SHADOW RGB256(90, 214, 132)
#define B_HEALTHBAR_COLOR_HO_OH_MAIN            B_HEALTHBAR_COLOR_ARTICUNO_EMPTY_MAIN
#define B_HEALTHBAR_COLOR_HO_OH_SHADOW          B_HEALTHBAR_COLOR_ARTICUNO_EMPTY_SHADOW
#define B_HEALTHBAR_COLOR_HO_OH_EMPTY_MAIN      RGB256(245, 209, 66)
#define B_HEALTHBAR_COLOR_HO_OH_EMPTY_SHADOW    RGB256(200, 170, 55)
#define B_HEALTHBAR_COLOR_ZAPDOS_MAIN           B_HEALTHBAR_COLOR_HO_OH_EMPTY_MAIN
#define B_HEALTHBAR_COLOR_ZAPDOS_SHADOW         B_HEALTHBAR_COLOR_HO_OH_EMPTY_SHADOW
#define B_HEALTHBAR_COLOR_ZAPDOS_EMPTY_MAIN     RGB256(240, 34, 34)
#define B_HEALTHBAR_COLOR_ZAPDOS_EMPTY_SHADOW   RGB256(195, 28, 28)
#define B_HEALTHBAR_COLOR_MOLTRES_MAIN          B_HEALTHBAR_COLOR_ZAPDOS_EMPTY_MAIN
#define B_HEALTHBAR_COLOR_MOLTRES_SHADOW        B_HEALTHBAR_COLOR_ZAPDOS_EMPTY_SHADOW
#define B_HEALTHBAR_COLOR_MOLTRES_EMPTY_MAIN    RGB256(82, 106, 90) // resetting to base palette
#define B_HEALTHBAR_COLOR_MOLTRES_EMPTY_SHADOW  RGB256(74, 65, 90) // resetting to base palette

#define B_FINAL_BATTLE_LUGIA                    0
#define B_FINAL_BATTLE_ARTICUNO                 1
#define B_FINAL_BATTLE_HOOH                     2
#define B_FINAL_BATTLE_ZAPDOS                   3
#define B_FINAL_BATTLE_MOLTRES                  4
#define B_FINAL_BATTLE_WARTORTLE                5

enum
{
    HEALTHBOX_ALL,
    HEALTHBOX_CURRENT_HP,
    HEALTHBOX_MAX_HP,
    HEALTHBOX_LEVEL,
    HEALTHBOX_NICK,
    HEALTHBOX_HEALTH_BAR,
    HEALTHBOX_EXP_BAR,
    HEALTHBOX_UNUSED_7,
    HEALTHBOX_UNUSED_8,
    HEALTHBOX_STATUS_ICON,
    HEALTHBOX_SAFARI_ALL_TEXT,
    HEALTHBOX_SAFARI_BALLS_TEXT
};

void Task_HidePartyStatusSummary(u8 taskId);
u8 CreateBattlerHealthboxSprites(u8 battlerId);
u8 CreateSafariPlayerHealthboxSprites(void);
void SetBattleBarStruct(u8 battlerId, u8 healthboxSpriteId, s32 maxVal, s32 currVal, s32 receivedValue);
void SetHealthboxSpriteInvisible(u8 healthboxSpriteId);
void SetHealthboxSpriteVisible(u8 healthboxSpriteId);
void DestroyHealthboxSprite(u8 battler);
void DummyBattleInterfaceFunc(u8 healthboxSpriteId, bool8 isDoubleBattleBankOnly);
void UpdateOamPriorityInAllHealthboxes(u8 priority);
void InitBattlerHealthboxCoords(u8 battlerId);
void UpdateHpTextInHealthbox(u8 healthboxSpriteId, s16 value, u8 maxOrCurrent);
void SwapHpBarsWithHpText(void);
u8 CreatePartyStatusSummarySprites(u8 battlerId, struct HpAndStatus *partyInfo, u8 isSwitchingMons, bool8 isBattleStart);
void UpdateHealthboxAttribute(u8 healthboxSpriteId, struct Pokemon *mon, u8 elementId);
u8 GetScaledHPFraction(s16 hp, s16 maxhp, u8 scale);
u8 GetHPBarLevel(s16 hp, s16 maxhp);
void UpdateNickInHealthbox(u8 spriteId, struct Pokemon *mon);
void TryAddPokeballIconToHealthbox(u8 spriteId, u8);
s32 MoveBattleBar(u8 battler, u8 healthboxSpriteId, u8 whichBar, u8 arg3);
void UpdateStatusIconInHealthbox(u8 healthboxSpriteId);
void SetHPBarColorsForZapmolcunoOhgia(void);

#endif // GUARD_BATTLE_INTERFACE_H
