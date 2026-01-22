#ifndef GUARD_CONSTANTS_FLAGS_H
#define GUARD_CONSTANTS_FLAGS_H

#include "constants/trainers.h"

// Temporary Flags
// These temporary flags are are cleared every time a map is loaded. They are used
// for things like shortening an NPCs introduction text if the player already spoke
// to them once.
#define TEMP_FLAGS_START 0x0
#define FLAG_TEMP_1      (TEMP_FLAGS_START + 0x01)
#define FLAG_TEMP_2      (TEMP_FLAGS_START + 0x02)
#define FLAG_TEMP_3      (TEMP_FLAGS_START + 0x03)
#define FLAG_TEMP_4      (TEMP_FLAGS_START + 0x04)
#define FLAG_TEMP_5      (TEMP_FLAGS_START + 0x05)
#define FLAG_TEMP_6      (TEMP_FLAGS_START + 0x06)
#define FLAG_TEMP_7      (TEMP_FLAGS_START + 0x07)
#define FLAG_TEMP_8      (TEMP_FLAGS_START + 0x08)
#define FLAG_TEMP_9      (TEMP_FLAGS_START + 0x09)
#define FLAG_TEMP_A      (TEMP_FLAGS_START + 0x0A)
#define FLAG_TEMP_B      (TEMP_FLAGS_START + 0x0B)
#define FLAG_TEMP_C      (TEMP_FLAGS_START + 0x0C)
#define FLAG_TEMP_D      (TEMP_FLAGS_START + 0x0D)
#define FLAG_TEMP_E      (TEMP_FLAGS_START + 0x0E)
#define FLAG_TEMP_F      (TEMP_FLAGS_START + 0x0F)
#define FLAG_TEMP_10     (TEMP_FLAGS_START + 0x10)

// Used for obstacles (e.g. cut trees and rock smash rocks)
#define FLAG_TEMP_11     (TEMP_FLAGS_START + 0x11)
#define FLAG_TEMP_12     (TEMP_FLAGS_START + 0x12)
#define FLAG_TEMP_13     (TEMP_FLAGS_START + 0x13)
#define FLAG_TEMP_14     (TEMP_FLAGS_START + 0x14)
#define FLAG_TEMP_15     (TEMP_FLAGS_START + 0x15)
#define FLAG_TEMP_16     (TEMP_FLAGS_START + 0x16)
#define FLAG_TEMP_17     (TEMP_FLAGS_START + 0x17)
#define FLAG_TEMP_18     (TEMP_FLAGS_START + 0x18)
#define FLAG_TEMP_19     (TEMP_FLAGS_START + 0x19)
#define FLAG_TEMP_1A     (TEMP_FLAGS_START + 0x1A)
#define FLAG_TEMP_1B     (TEMP_FLAGS_START + 0x1B)
#define FLAG_TEMP_1C     (TEMP_FLAGS_START + 0x1C)
#define FLAG_TEMP_1D     (TEMP_FLAGS_START + 0x1D)
#define FLAG_TEMP_1E     (TEMP_FLAGS_START + 0x1E)
#define FLAG_TEMP_1F     (TEMP_FLAGS_START + 0x1F)
#define TEMP_FLAGS_END   FLAG_TEMP_1F

#define FLAG_LASS_MAZE               0x020
#define FLAG_READY_TO_TRIGGER_GLITCH_CITY               0x021
#define FLAG_0x022               0x022
#define FLAG_0x023               0x023
#define FLAG_0x024               0x024
#define FLAG_0x025               0x025
#define FLAG_0x026               0x026
#define FLAG_0x027               0x027

// Hide/show flags
#define FLAG_HIDE_BULBASAUR_BALL                           0x028
#define FLAG_HIDE_SQUIRTLE_BALL                            0x029
#define FLAG_HIDE_CHARMANDER_BALL                          0x02A
#define FLAG_HIDE_OAK_IN_HIS_LAB                           0x02B
#define FLAG_HIDE_OAK_IN_PALLET_TOWN                       0x02C
#define FLAG_HIDE_RIVAL_IN_LAB                             0x02D
#define FLAG_HIDE_PEWTER_CITY_GYM_GUIDE                    0x02E
#define FLAG_HIDE_DOME_FOSSIL                              0x02F
#define FLAG_HIDE_HELIX_FOSSIL                             0x030
#define FLAG_HIDE_NUGGET_BRIDGE_ROCKET                     0x031
#define FLAG_HIDE_BILL_CLEFAIRY                            0x032
#define FLAG_HIDE_BILL_HUMAN_SEA_COTTAGE                   0x033
#define FLAG_HIDE_TOWER_FUJI                               0x034
#define FLAG_HIDE_POKEHOUSE_FUJI                           0x035
#define FLAG_HIDE_LIFT_KEY                                 0x036
#define FLAG_HIDE_SILPH_SCOPE                              0x037
#define FLAG_HIDE_HIDEOUT_GIOVANNI                         0x038
#define FLAG_HIDE_TOWN_MAP                                 0x039
#define FLAG_HIDE_POKEDEX                                  0x03A
#define FLAG_HIDE_CERULEAN_ROCKET                          0x03B
#define FLAG_HIDE_CERULEAN_RIVAL                           0x03C
#define FLAG_HIDE_SS_ANNE_RIVAL                            0x03D
#define FLAG_HIDE_SAFFRON_ROCKETS                          0x03E
#define FLAG_HIDE_SAFFRON_CIVILIANS                        0x03F
#define FLAG_HIDE_SEAFOAM_1F_BOULDER_1                     0x040
#define FLAG_HIDE_SEAFOAM_1F_BOULDER_2                     0x041
#define FLAG_HIDE_SEAFOAM_B1F_BOULDER_1                    0x042
#define FLAG_HIDE_SEAFOAM_B1F_BOULDER_2                    0x043
#define FLAG_HIDE_SEAFOAM_B2F_BOULDER_1                    0x044
#define FLAG_HIDE_SEAFOAM_B2F_BOULDER_2                    0x045
#define FLAG_HIDE_SEAFOAM_B3F_BOULDER_1                    0x046
#define FLAG_HIDE_SEAFOAM_B3F_BOULDER_2                    0x047
#define FLAG_HIDE_SEAFOAM_B3F_BOULDER_3                    0x048
#define FLAG_HIDE_SEAFOAM_B3F_BOULDER_4                    0x049
#define FLAG_HIDE_SEAFOAM_B3F_BOULDER_5                    0x04A
#define FLAG_HIDE_SEAFOAM_B3F_BOULDER_6                    0x04B
#define FLAG_HIDE_SEAFOAM_B4F_BOULDER_1                    0x04C
#define FLAG_HIDE_SEAFOAM_B4F_BOULDER_2                    0x04D
#define FLAG_HIDE_SILPH_RIVAL                              0x04E
#define FLAG_HIDE_ROUTE_22_RIVAL                           0x04F
#define FLAG_HIDE_PEWTER_MUSEUM_GUIDE                      0x050
#define FLAG_HIDE_TOWER_RIVAL                              0x051
#define FLAG_HIDE_MOLTRES                                  0x052
#define FLAG_SILPH_DMCA_DEFEATED                            0x053
#define FLAG_HIDE_ROUTE_12_SNORLAX                         0x054
#define FLAG_HIDE_VIRIDIAN_GIOVANNI                        0x055
#define FLAG_HIDE_OLD_AMBER                                0x056
#define FLAG_HIDE_EEVEE_BALL                               0x057
#define FLAG_HIDE_VICTORY_ROAD_2F_BOULDER                  0x058
#define FLAG_HIDE_VICTORY_ROAD_3F_BOULDER                  0x059
#define FLAG_HIDE_OAK_IN_CHAMP_ROOM                        0x05A
#define FLAG_HIDE_GAME_CORNER_ROCKET                       0x05B
#define FLAG_HIDE_CERULEAN_CAVE_GUARD                      0x05C
#define FLAG_HIDE_ZAPDOS                                   0x05D
#define FLAG_HIDE_TOWER_ROCKET_1                           0x05E
#define FLAG_HIDE_CELADON_ROCKETS                          0x05F
#define FLAG_HIDE_DOJO_HITMONLEE_BALL                      0x060
#define FLAG_HIDE_DOJO_HITMONCHAN_BALL                     0x061
#define FLAG_HIDE_CINNABAR_BILL                            0x062
#define FLAG_HIDE_UNION_ROOM_PLAYER_1                      0x063
#define FLAG_HIDE_UNION_ROOM_PLAYER_2                      0x064
#define FLAG_HIDE_UNION_ROOM_PLAYER_3                      0x065
#define FLAG_HIDE_UNION_ROOM_PLAYER_4                      0x066
#define FLAG_HIDE_UNION_ROOM_PLAYER_5                      0x067
#define FLAG_HIDE_UNION_ROOM_PLAYER_6                      0x068
#define FLAG_HIDE_UNION_ROOM_PLAYER_7                      0x069
#define FLAG_HIDE_UNION_ROOM_PLAYER_8                      0x06A
#define FLAG_HIDE_CINNABAR_ALOLAN_GROWLITHE                       0x06B
#define FLAG_HIDE_SAFFRON_FAN_CLUB_BLACKBELT               0x06C
#define FLAG_HIDE_SAFFRON_FAN_CLUB_ROCKER                  0x06D
#define FLAG_HIDE_SAFFRON_FAN_CLUB_WOMAN                   0x06E
#define FLAG_HIDE_SAFFRON_FAN_CLUB_BEAUTY                  0x06F
#define FLAG_HIDE_MG_DELIVERYMEN                           0x070
#define FLAG_HIDE_ONE_ISLAND_BILL                          0x071
#define FLAG_HIDE_ONE_ISLAND_POKECENTER_BILL               0x072
#define FLAG_HIDE_ONE_ISLAND_POKECENTER_CELIO              0x073
#define FLAG_HIDE_TWO_ISLAND_GAME_CORNER_BIKER             0x074
#define FLAG_HIDE_TWO_ISLAND_GAME_CORNER_LOSTELLE          0x075
#define FLAG_CSR_CELIA_BONUS                     0x076
#define FLAG_HIDE_P_EMBLEM                                         0x077
#define FLAG_HIDE_W_EMBLEM                                         0x078
#define FLAG_HIDE_THREE_ISLAND_BIKERS                      0x079
#define FLAG_HIDE_LOSTELLE_IN_BERRY_FOREST                 0x07A
#define FLAG_HIDE_TWO_ISLAND_WOMAN                         0x07B
#define FLAG_HIDE_TWO_ISLAND_BEAUTY                        0x07C
#define FLAG_HIDE_TWO_ISLAND_SUPER_NERD                    0x07D
#define FLAG_HIDE_THREE_ISLAND_ANTIBIKERS                  0x07E
#define FLAG_HIDE_DMCA_IN_LAVENDER                                         0x07F
#define FLAG_HIDE_ROUTE_16_SNORLAX                         0x080
#define FLAG_HIDE_MEWTWO                                   0x081
#define FLAG_HIDE_ARTICUNO                                 0x082
#define FLAG_HIDE_TOWER_ROCKET_2                           0x083
#define FLAG_HIDE_TOWER_ROCKET_3                           0x084
#define FLAG_HIDE_POWER_PLANT_ELECTRODE_1                  0x085
#define FLAG_HIDE_POWER_PLANT_ELECTRODE_2                  0x086
#define FLAG_HIDE_SS_ANNE                                  0x087
#define FLAG_HIDE_FIVE_ISLAND_ROCKETS                      0x088
#define FLAG_HIDE_MT_EMBER_EXTERIOR_ROCKETS                0x089
#define FLAG_HIDE_RUBY                                     0x08A
#define FLAG_HIDE_ICEFALL_CAVE_LORELEI                     0x08B
#define FLAG_HIDE_LORELEI_IN_HER_HOUSE                     0x08C
#define FLAG_HIDE_ICEFALL_CAVE_ROCKETS                     0x08D
#define FLAG_HIDE_RUIN_VALLEY_SCIENTIST                    0x08E
#define FLAG_HIDE_SAPPHIRE                                 0x08F
#define FLAG_HIDE_DOTTED_HOLE_SCIENTIST                    0x090
#define FLAG_HIDE_THREE_ISLAND_LONE_BIKER                  0x091
#define FLAG_HIDE_PEWTER_CITY_RUNNING_SHOES_GUY            0x092
#define FLAG_HIDE_LOST_CAVE_SELPHY                         0x093
#define FLAG_HIDE_RESORT_GORGEOUS_SELPHY                   0x094
#define FLAG_HIDE_RESORT_GORGEOUS_INSIDE_SELPHY            0x095
#define FLAG_HIDE_SELPHYS_BUTLER                           0x096
#define FLAG_HIDE_FOUR_ISLAND_RIVAL                        0x097
#define FLAG_HIDE_SIX_ISLAND_POKECENTER_RIVAL              0x098
#define FLAG_HIDE_DEOXYS                                   0x099
#define FLAG_HIDE_BIRTH_ISLAND_METEORITE                   0x09A
#define FLAG_HIDE_LUGIA                                    0x09B
#define FLAG_HIDE_HO_OH                                    0x09C
#define FLAG_HIDE_POSTGAME_GOSSIPERS                       0x09D
#define FLAG_HIDE_FAME_CHECKER_ERIKA_JOURNALS              0x09E
#define FLAG_HIDE_FAME_CHECKER_KOGA_JOURNAL                0x09F
#define FLAG_HIDE_FAME_CHECKER_LT_SURGE_JOURNAL            0x0A0
#define FLAG_HIDE_VERMILION_CITY_OAKS_AIDE                 0x0A1
#define FLAG_HIDE_CINNABAR_POKECENTER_BILL                 0x0A2
#define FLAG_HIDE_CREDITS_RIVAL                            0x0A3
#define FLAG_HIDE_CREDITS_OAK                              0x0A4
#define FLAG_HIDE_LORELEI_HOUSE_MEOWTH_DOLL                0x0A5
#define FLAG_HIDE_LORELEI_HOUSE_CHANSEY_DOLL               0x0A6
#define FLAG_HIDE_LORELEIS_HOUSE_NIDORAN_F_DOLL            0x0A7
#define FLAG_HIDE_LORELEI_HOUSE_JIGGLYPUFF_DOLL            0x0A8
#define FLAG_HIDE_LORELEIS_HOUSE_NIDORAN_M_DOLL            0x0A9
#define FLAG_HIDE_LORELEIS_HOUSE_FEAROW_DOLL               0x0AA
#define FLAG_HIDE_LORELEIS_HOUSE_PIDGEOT_DOLL              0x0AB
#define FLAG_HIDE_LORELEIS_HOUSE_LAPRAS_DOLL               0x0AC
#define FLAG_HIDE_MISC_KANTO_ROCKETS                       0x0AD
#define FLAG_HIDE_SAFFRON_CITY_POKECENTER_SABRINA_JOURNALS 0x0AE

// CSR flags
#define FLAG_FOUND_Y                    0x0AF
//resets after every battle
#define FLAG_TEMP_MID_BATTLE_EVENT      0x0B0
// unused

//Pallet
#define FLAG_CSR_NOT_OAK_SILLY          0x0B1
#define FLAG_CSR_CUT_OAK                0x0B2
#define FLAG_CSR_TALKED_TO_SIGN_GIRL      0x0B3
#define FLAG_CSR_GS_BALL_GOT            0x0B4
#define FLAG_CSR_COLLECTED_STAR         0x0B5

//Route 1
#define FLAG_CSR_SHINY_RAT_1            0x0B6
#define FLAG_CSR_SHINY_RAT_2            0x0B7

//Viridian
#define FLAG_CSR_BROKE_INTO_HOUSE       0x0B8
#define FLAG_CSR_RETURNED_KEY           0x0B9
#define FLAG_CSR_WENT_TO_PIT            0x0BA
#define FLAG_CSR_HIDE_ROUTE_1_CANDY_BEFORE_RETREAT               0x0BB
#define FLAG_CSR_KENYA_OBTAINED         0x0BC

#define FLAG_ROUTE1_ENTERED_PIT                        0x0BD
#define FLAG_CHRIS_GIVES_LICKITUNG                      0x0BE

//Pewter City
#define FLAG_CSR_UNUSED_3               0x0BF
#define FLAG_CSR_MUSEUM_GUIDE_MISSED    0x0C0
#define FLAG_CSR_BROCK_RAINING          0x0C1
#define FLAG_CSR_TREE_FLAG_1            0x0C2
#define FLAG_CSR_TREE_FLAG_2            0x0C3
#define FLAG_CSR_TREE_FLAG_3            0x0C4
#define FLAG_CSR_WATERED_TREE           0x0C5

//Route 3
#define FLAG_CSR_LASS_ATTACK_1          0x0C6
#define FLAG_CSR_LASS_ATTACK_2          0x0C7
#define FLAG_CSR_GLASSES_NERD               0x0C8

//Route 4
#define FLAG_CSR_2_SITRUS_BERRIES       0x0C9
#define FLAG_CSR_NEGATIVE_BERRIES       0x0CA
#define FLAG_CSR_LOSSELLE_DAD               0x0CB

//Mt Moon
#define FLAG_CSR_FIRST_TENTACOOL        0x0CC
#define FLAG_CSR_SECOND_TENTACOOL       0x0CD
#define FLAG_CSR_EXITED_TRUCK               0x0CE
#define FLAG_CSR_VERMILLION_GYM_TALKED_TO_PSYDUCK               0x0CF
#define FLAG_CSR_RETREAT_CAMPER               0x0D0
#define FLAG_CSR_KIRI_PSYDUCK               0x0D1
#define FLAG_CSR_UNUSED_10              0x0D2
#define FLAG_CSR_UNUSED_11              0x0D3
#define FLAG_CSR_UNUSED_12              0x0D4

//Cerulean City
#define FLAG_CSR_BERRY_POWDER_MAN       0x0D5
#define FLAG_CSR_GOT_SCYTHER            0x0D6


#define FLAG_CSR_ABSCONDED_BROCK        0x0D7
#define FLAG_CSR_PYTHON_SUCCESS  0x0D8

//Wiz's game opening
#define FLAG_SHINY_CREATION                            0x0D9
#define FLAG_WALKTHROUGHWALLS                          0x0DA
#define FLAG_ROUTE1_OBJECTS_RETREAT                    0x0DB
#define FLAG_PT_NPC_LOOKLOOK_LEAVE                     0x0DC
#define FLAG_PT_NPC_SIGN_LADY                          0x0DD
#define FLAG_PT_NPC_LOOKLOOK                           0x0DE
#define FLAG_CSR_HIDE_GS_BALL               0x0DF
#define FLAG_CSR_VIRIDIAN_DOOR_ONCE               0x0E0
#define FLAG_CSR_ROUTE8_PUSHED_BENCH               0x0E1
#define FLAG_CSR_BERRY_FOREST_HBOX               0x0E2
#define FLAG_CSR_L_EMBLEM               0x0E3
#define FLAG_CSR_SUPER_SCOPE               0x0E4
#define FLAG_CSR_CLEFAIRY1               0x0E5
#define FLAG_CSR_CLEFAIRY2               0x0E6
#define FLAG_CSR_CLEFAIRY3               0x0E7
#define FLAG_CSR_CLEFAIRY4               0x0E8
#define FLAG_CSR_CLEFAIRY_TOPLEFT               0x0E9
#define FLAG_CSR_CLEFAIRY_TOPRIGHT               0x0EA
#define FLAG_CSR_CLEFAIRY_BOTTOMLEFT               0x0EB
#define FLAG_CSR_CLEFAIRY_BOTTOMRIGHT               0x0EC
#define FLAG_CSR_HIDE_ROUTE6_CELIA               0x0ED
#define FLAG_CSR_HIDE_POKEMONTOWER_CELIA               0x0EE
#define FLAG_TOOK_TOWER_CLEFAIRY_DOLL               0x0EF
//Celadon City
#define FLAG_CSR_ERIKA_CUTSCENE_SKIP               0x0F0
#define FLAG_FORCE_AI_SWITCH_IN_ORDER    0x0F1 //resets after each battle

// Pokemon Tower
#define FLAG_HIDE_CLEFAIRY_DOLL_GIRL               0x0F2
#define FLAG_ENTERED_MAROWAK_FIGHT_WITH_SCOPE               0x0F3
#define FLAG_USED_CLEFAIRY_DOLL               0x0F4
#define FLAG_SAW_GHOST_UNVEIL               0x0F5
#define FLAG_GOT_TAUROSES               0x0F6

#define FLAG_EATEN_SIGNPOST               0x0F7
#define FLAG_LIMIT_NOT_EXIST               0x0F8
#define FLAG_TALKED_TO_LICKITUNG_TRADE               0x0F9
#define FLAG_HIDE_TM42               0x0FA
#define FLAG_DID_AMPHAROS_TRADE               0x0FB
#define FLAG_IMPOSTER_OAK_ROOM_SWITCH               0x0FC

#define FLAG_ROUTE13_LASSATTACK               0x0FD
#define FLAG_ROUTE18_LASSATTACK               0x0FE
#define FLAG_DANCE_THEATER_WATCHED_SHOW                              0x0FF
#define FLAG_DANCE_THEATER_MOVED_GIRL_BEFORE_SHOW                              0x100
#define FLAG_DANCE_THEATER_KID_READY_TO_GIVE                              0x101
#define FLAG_GOT_SOOT_SACK                              0x102
#define FLAG_PUT_ASH_IN_SACK                              0x103
#define FLAG_CRAFTED_BLUE_FLUTE                              0x104
#define FLAG_HALL_OF_ORIGIN_ACTIVE               0x105
#define FLAG_CSR_TM_CASE               0x106
#define FLAG_CSR_TALKED_TO_PRIZEGIVER  0x107
#define FLAG_CSR_DRIFLOON_APPEARS               0x108
#define FLAG_CSR_FOUGHT_DRIFLOON               0x109
#define FLAG_CSR_TALKED_TO_MINDY               0x10A
#define FLAG_CSR_DID_MINDY_TRADE               0x10B
#define FLAG_CSR_TALKED_TO_MAGNEMITE_GUY               0x10C
#define FLAG_CSR_TALKED_TO_DAZZLE               0x10D
#define FLAG_CSR_TRADED_WITH_DAZZLE               0x10E
#define FLAG_CSR_POWER_IS_ON               0x10F
#define FLAG_CSR_DEFEATED_SNORLAX               0x110
#define FLAG_CSR_HIDE_OMANYTE               0x111
#define FLAG_CSR_ROUTE12_BROTHER_IS_CHASING               0x112
#define FLAG_CSR_SOUL_DEW_FOUND               0x113
#define FLAG_CSR_CAUGHT_AMPHAROS               0x114
#define FLAG_CUT_AMPHAROS_HAIR               0x115
#define FLAG_CUT_TANGELA_HAIR               0x116
#define FLAG_NO_TM_CASE               0x117
#define FLAG_POKEMONTOWER_POKEBALL               0x118
#define FLAG_POKEMONTOWER_BANETTE               0x119
#define FLAG_FUCHSIA_SIGN_LADY_EAST               0x11A
#define FLAG_FUCHSIA_SIGN_LADY_WEST               0x11B
#define FLAG_HIDE_DMCA_IN_SAFARI_ZONE               0x11C
#define FLAG_ROUTE13_HIDE_DAD               0x11D
#define FLAG_ROUTE13_LASS_2               0x11E
#define FLAG_INSERTED_INSTINCT_SEAL               0x11F
#define FLAG_GOT_MATH_CLUB               0x120
#define FLAG_BATTLED_IRON_CLEFTS               0x121
#define FLAG_TALKED_TO_FISHING_GURU               0x122
#define FLAG_PALLET_IMPOSTER_OAK               0x123
#define FLAG_WAS_THREATENED_BY_WARDEN               0x124
#define FLAG_ARCHER_CUTSCENE_SECOND               0x125
#define FLAG_SHORT_KID_RAN_OFF               0x126
#define FLAG_SANDWICH_GOT_BREAD               0x127 //check
#define FLAG_SANDWICH_GOT_MEAT               0x128 //check
#define FLAG_SANDWICH_GOT_CHEESE               0x129 //check
#define FLAG_SANDWICH_GOT_LETTUCE               0x12A //check
#define FLAG_SANDWICH_GOT_PICKLES               0x12B
#define FLAG_SANDWICH_GOT_SESAME_SEED               0x12C
#define FLAG_GOLURK_SANDWICH               0x12D
#define FLAG_BROKE_RIVALS_WALL               0x12E
#define FLAG_NERD_TOOK_KABUTOPS               0x12F
#define FLAG_HIDE_BUFF_OAK               0x130
#define FLAG_WALKED_THROUGH_GRASS               0x131
#define FLAG_ROUTE13_SIGN_BACK_HOME               0x132
#define FLAG_FUSCHIA_BROKE_WALL               0x133
#define FLAG_TALKED_TO_SARA               0x134
#define FLAG_MADE_A_SANDWICH               0x135
#define FLAG_TRIED_SLOPE               0x136
#define FLAG_TALKED_TO_LEFT_SCAMMER               0x137
#define FLAG_TALKED_TO_RIGHT_SCAMMER               0x138
#define FLAG_LEFT_SCAMMER_HAS_MON               0x139 // Left Scammer has been given a Pokemon, so he won't ask for another.
#define FLAG_RIGHT_SCAMMER_HAS_MON               0x13A // Right Scammer has been given a Pokemon, so he won't ask for another.
#define FLAG_LEFT_SCAMMER_RECIEVED_MON               0x13B // Right Scammer has sent a mon over and the Left Scammer has recieved it. Right Scammer will not prompt until you take it
#define FLAG_RIGHT_SCAMMER_RECIEVED_MON               0x13C // Left Scammer has sent a mon over and Right Scammer has recieved it. Left Scammer will not prompt until you grab it
#define FLAG_OTHER_SCAMMER_READY_TO_EVOLVE               0x13D
#define FLAG_TOOK_GIRL_DOLL               0x13E
#define FLAG_GOT_SECRET_FARFETCHD               0x13F
#define FLAG_DRILLED_RAIN_HOLE               0x140
#define FLAG_DRILLED_LION_HOLE               0x141
#define FLAG_CHASED_VULPIX               0x142
#define FLAG_GOT_WAKE_UP_SLAP               0x143
#define FLAG_GOT_SEAL_CASE               0x144
#define FLAG_REMOVED_CINNABAR_TREE               0x145
#define FLAG_REMOVED_CINNABAR_SCIENTIST               0x146
#define FLAG_GOT_YANMEGA               0x147
#define FLAG_REVIVED_YANMEGA               0x148
#define FLAG_HIDE_CINNABAR_YANMEGA               0x149
#define FLAG_REVIVED_TYRANASTAR               0x14A
#define FLAG_HIDE_NEBBY               0x14B
#define FLAG_PUT_NEBBY_IN_ALTAR               0x14C
#define FLAG_FOUGHT_FALKNER               0x14D
#define FLAG_SPAWN_VERMILION_ONIX               0x14E
#define FLAG_INSERTED_VALOR_SEAL               0x14F
#define FLAG_INSERTED_MYSTIC_SEAL               0x150
#define FLAG_ORTHWORM_POTION               0x151
#define FLAG_OBTAINED_ZEPHYRBADGE               0x152
#define FLAG_EVOLVED_MAGNEMITE               0x153

// Item ball hide/show

//Since the vast majority of vanilla items won't be relevant here, I'm going to clean this all up and repurpose them

#define FLAG_HIDE_ROUTE2_ETHER                                  0x154
#define FLAG_HIDE_ROUTE2_PARALYZE_HEAL                          0x155
#define FLAG_HIDE_VIRIDIAN_FOREST_POKE_BALL                     0x156
#define FLAG_HIDE_VIRIDIAN_FOREST_ANTIDOTE                      0x157
#define FLAG_HIDE_VIRIDIAN_FOREST_POTION                        0x158
#define FLAG_HIDE_MT_MOON_1F_PARALYZE_HEAL                      0x159
#define FLAG_HIDE_MT_MOON_1F_TM09                               0x15A
#define FLAG_HIDE_MT_MOON_1F_POTION                             0x15B
#define FLAG_HIDE_MT_MOON_1F_RARE_CANDY                         0x15C
#define FLAG_HIDE_MT_MOON_1F_ESCAPE_ROPE                        0x15D
#define FLAG_HIDE_MT_MOON_1F_MOON_STONE                         0x15E
#define FLAG_HIDE_MT_MOON_B2F_STAR_PIECE                        0x15F
#define FLAG_HIDE_MT_MOON_B2F_TM46                              0x160
#define FLAG_HIDE_ROUTE4_TM05                                   0x161
#define FLAG_HIDE_ROUTE24_TM45                                  0x162
#define FLAG_HIDE_ROUTE25_TM43                                  0x163
#define FLAG_FOUR_ISLAND_EAST_BERRY                          0x164
#define FLAG_FOUR_ISLAND_WEAST_BERRY                      0x165
#define FLAG_DMCA_SURGE_FIRST_GATE                      0x166
#define FLAG_DMCA_SURGE_SECOND_GATE                         0x167
#define FLAG_CUT_SAMSON_OAK                        0x168
#define FLAG_OPENED_ZERO_ISLAND                 0x169
#define FLAG_LUVDISC_HINT                     0x16A
#define FLAG_HIDE_ROUTE9_TM40                                   0x16B
#define FLAG_HIDE_ROCKET_HIDEOUT_B1F_ESCAPE_ROPE                0x16C
#define FLAG_HIDE_ROCKET_HIDEOUT_B1F_HYPER_POTION               0x16D
#define FLAG_HIDE_ROCKET_HIDEOUT_B2F_X_SPEED                    0x16E
#define FLAG_HIDE_ROCKET_HIDEOUT_B2F_MOON_STONE                 0x16F
#define FLAG_HIDE_ROCKET_HIDEOUT_B2F_TM12                       0x170
#define FLAG_COPYCAT_TM               0x171
#define FLAG_RELEASED_ZUBAT                 0x172
#define FLAG_DEFEATED_WAREHOUSE_ADMIN                       0x173
#define FLAG_HIDE_ROCKET_HIDEOUT_B4F_TM49                       0x174
#define FLAG_HIDE_ROCKET_HIDEOUT_B4F_MAX_ETHER                  0x175
#define FLAG_HIDE_ROCKET_HIDEOUT_B4F_CALCIUM                    0x176
#define FLAG_TALKED_TO_BLAINE                  0x177
#define FLAG_MIRAGE_ISLAND_APPEARS                       0x178
#define FLAG_SAW_CELIA_ROUTE15                    0x179
#define FLAG_GOT_CREAM_DROP                   0x17A
#define FLAG_TRIED_WHIRLPOOL_BATTLE                       0x17B
#define FLAG_ENTERED_COPYCAT_HOUSE                   0x17C
#define FLAG_HEART_SWAP_HINT                   0x17D
#define FLAG_DITTO_MEW_HINT                                  0x17E
#define FLAG_GOT_NEBBY_ONCE                                  0x17F
#define FLAG_KILLED_E4_OAK                                  0x180
#define FLAG_HIDE_SAFARI_ZONE_CENTER_TM32                     0x181
#define FLAG_HIDE_SAFARI_ZONE_EAST_MAX_POTION                   0x182
#define FLAG_HIDE_SAFARI_ZONE_EAST_FULL_RESTORE                 0x183
#define FLAG_HIDE_SAFARI_ZONE_EAST_TM11                         0x184
#define FLAG_HIDE_SAFARI_ZONE_EAST_LEAF_STONE                   0x185
#define FLAG_HIDE_SAFARI_ZONE_NORTH_PROTEIN                     0x186
#define FLAG_HIDE_SAFARI_ZONE_NORTH_TM47                        0x187
#define FLAG_HIDE_SAFARI_ZONE_WEST_TM32                         0x188
#define FLAG_GOT_GOLD_TEETH                   0x189
#define FLAG_HIDE_SAFARI_ZONE_WEST_MAX_POTION                   0x18A
#define FLAG_HIDE_SAFARI_ZONE_WEST_MAX_REVIVE                   0x18B
#define FLAG_GOT_SHINY_SYLVEON                      0x18C
#define FLAG_0x18D                        0x18D
#define FLAG_0x18E                       0x18E
#define FLAG_0x18F                         0x18F
#define FLAG_0x190                           0x190
#define FLAG_0x191                              0x191
#define FLAG_HIDE_SILPH_CO_5F_CARD_KEY                          0x192
#define FLAG_0x193                             0x193
#define FLAG_0x194                         0x194
#define FLAG_0x195                           0x195
#define FLAG_0x196                              0x196
#define FLAG_0x197                           0x197
#define FLAG_0x198                       0x198
#define FLAG_0x199                       0x199
#define FLAG_0x19A                        0x19A
#define FLAG_0x19B                              0x19B
#define FLAG_0x19C                              0x19C
#define FLAG_0x19D                     0x19D
#define FLAG_0x19E                            0x19E
#define FLAG_0x19F                     0x19F
#define FLAG_0x1A0                0x1A0
#define FLAG_0x1A1                    0x1A1
#define FLAG_0x1A2                 0x1A2
#define FLAG_0x1A3                       0x1A3
#define FLAG_0x1A4                      0x1A4
#define FLAG_0x1A5              0x1A5
#define FLAG_HIDE_LIGMA                                              0x1A6
#define FLAG_0x1A7                      0x1A7
#define FLAG_0x1A8                0x1A8
#define FLAG_0x1A9                    0x1A9
#define FLAG_0x1AA                          0x1AA
#define FLAG_0x1AB                    0x1AB
#define FLAG_0x1AC                          0x1AC
#define FLAG_0x1AD                     0x1AD
#define FLAG_0x1AE                          0x1AE
#define FLAG_0x1AF                    0x1AF
#define FLAG_GOT_TM50                          0x1B0
#define FLAG_0x1B1                   0x1B1
#define FLAG_0x1B2                       0x1B2
#define FLAG_0x1B3                 0x1B3
#define FLAG_0x1B4                 0x1B4
#define FLAG_0x1B5                        0x1B5
#define FLAG_0x1B6                   0x1B6
#define FLAG_0x1B7                  0x1B7
#define FLAG_0x1B8                  0x1B8
#define FLAG_HIDE_FUSHCIA_CITY_WARDENS_HOUSE_RARE_CANDY         0x1B9
#define FLAG_HIDE_TWO_ISLAND_REVIVE                             0x1BA
#define FLAG_FOUND_ZINC                             0x1BB
#define FLAG_HIDE_CELADON_TAUNT                                              0x1BC
#define FLAG_HIDE_WRAP_TM                                              0x1BD
#define FLAG_HIDE_VIRIDIAN_FOREST_POTION_2                      0x1BE
#define FLAG_HIDE_MT_MOON_B2F_REVIVE                            0x1BF
#define FLAG_HIDE_MT_MOON_B2F_ANTIDOTE                          0x1C0
#define FLAG_HIDE_ROUTE11_X_DEFEND                              0x1C1
#define FLAG_HIDE_ROUTE9_BURN_HEAL                              0x1C2
#define FLAG_HIDE_ROCK_TUNNEL_1F_REPEL                          0x1C3
#define FLAG_FOUND_W                          0x1C4
#define FLAG_0x1C5                    0x1C5
#define FLAG_0x1C6                        0x1C6
#define FLAG_0x1C7                     0x1C7
#define FLAG_0x1C8                              0x1C8
#define FLAG_0x1C9                             0x1C9
#define FLAG_0x1CA                    0x1CA
#define FLAG_0x1CB                       0x1CB
#define FLAG_0x1CC                      0x1CC
#define FLAG_HIDE_VIRIDIAN_CITY_POTION                          0x1CD
#define FLAG_HIDE_ROUTE11_GREAT_BALL                            0x1CE
#define FLAG_0x1CF                             0x1CF
#define FLAG_0x1D0                  0x1D0
#define FLAG_HIDE_CELADON_CITY_ETHER                            0x1D1
#define FLAG_0x1D2              0x1D2
#define FLAG_0x1D3                  0x1D3
#define FLAG_0x1D4                   0x1D4
#define FLAG_0x1D5               0x1D5
#define FLAG_0x1D6                    0x1D6
#define FLAG_0x1D7                 0x1D7
#define FLAG_0x1D8                0x1D8
#define FLAG_0x1D9                        0x1D9
#define FLAG_0x1DA                    0x1DA
#define FLAG_0x1DB                  0x1DB
#define FLAG_0x1DC        0x1DC
#define FLAG_0x1DD           0x1DD
#define FLAG_0x1DE           0x1DE
#define FLAG_0x1DF                0x1DF
#define FLAG_0x1E0  0x1E0
#define FLAG_0x1E1         0x1E1
#define FLAG_0x1E2            0x1E2
#define FLAG_0x1E3      0x1E3
#define FLAG_0x1E4     0x1E4
#define FLAG_0x1E5            0x1E5
#define FLAG_0x1E6        0x1E6
#define FLAG_0x1E7  0x1E7
#define FLAG_0x1E8  0x1E8
#define FLAG_0x1E9      0x1E9
#define FLAG_0x1EA     0x1EA
#define FLAG_0x1EB      0x1EB
#define FLAG_0x1EC    0x1EC
#define FLAG_0x1ED            0x1ED
#define FLAG_0x1EE            0x1EE
#define FLAG_0x1EF              0x1EF
#define FLAG_0x1F0        0x1F0
#define FLAG_0x1F1        0x1F1
#define FLAG_0x1F2 0x1F2
#define FLAG_0x1F3 0x1F3
#define FLAG_GROUDON_NOTHING        0x1F4
#define FLAG_LASS_MAZE_WATER_NOTHING             0x1F5
#define FLAG_SAFFRON_NOTHING            0x1F6
#define FLAG_CINNABAR_QUESTION_SECRET_1         0x1F7
#define FLAG_CINNABAR_QUESTION_SECRET_2       0x1F8
#define FLAG_CINNABAR_QUESTION_SECRET_3      0x1F9
#define FLAG_CINNABAR_QUESTION_SECRET_4      0x1FA
#define FLAG_CINNABAR_QUESTION_SECRET_5       0x1FB
#define FLAG_CINNABAR_QUESTION_SECRET_6       0x1FC
#define FLAG_CINNABAR_QUESTION_SECRET_7 0x1FD
#define FLAG_CINNABAR_QUESTION_SECRET_8                              0x1FE

// Unused?
// Let's use these for item pickups
#define FLAG_CSR_ROUTE_2_POKEBALL                          0x1FF
#define FLAG_CSR_PEWTER_POKEBALL                           0x200
#define FLAG_CSR_ROUTE_3_POKEBALL                          0x201
#define FLAG_CSR_ROUTE_4_POKEBALL                          0x202
#define FLAG_CSR_MT_MOON_SUPER_REPEL                       0x203
#define FLAG_CSR_MT_MOON_MIN_REPEL                         0x204
#define FLAG_CSR_MT_MOON_MAX_REPEL                         0x205
#define FLAG_CSR_MT_MOON_BASEMENT_REPEL_1                  0x206
#define FLAG_CSR_MT_MOON_BASEMENT_REPEL_2                  0x207
#define FLAG_CSR_MT_MOON_BASEMENT_REPEL_3                  0x208
#define FLAG_CSR_MT_MOON_BASEMENT_ESCAPE_KEY               0x209
#define FLAG_CSR_MT_MOON_BASEMENT_SIGN               0x20A
#define FLAG_CSR_ROUTE_4_BERRIES              0x20B
#define FLAG_CSR_HBOX_TEMP_DISAPPEARANCE               0x20C
#define FLAG_CSR_GOT_BULLDOZE               0x20D
#define FLAG_CSR_GOT_STEAMROLLER               0x20E
#define FLAG_CSR_POKEMON_TOWER_MUSIC               0x20F
#define FLAG_WATER_GUN_TM               0x210
#define FLAG_SAFARI_ZONE_WATER_STONE               0x211
#define FLAG_ROUTE_17_POKEBALL               0x212
#define FLAG_GOT_SHINY_BELLSPROUT               0x213
#define FLAG_HIDE_GTS_NPCS               0x214
#define FLAG_LOOK_GIRL_LASS               0x215
#define FLAG_MELTED_LIGHTHOUSE_GUARD               0x216
#define FLAG_GOT_HISTORY_BOOK               0x217
#define FLAG_FUSHCIA_GYM_LOOK_GIRL_TO_ICE               0x218
#define FLAG_FUSHCIA_GYM_LOOK_GIRL_TO_LIONS               0x219
#define FLAG_HOOPA_HINT               0x21A
#define FLAG_FOUR_ISLAND_ROCK_CLIMB               0x21B
#define FLAG_GOT_GYM_MEMBERSHIP_BADGE               0x21C
#define FLAG_GOT_BURN_DRIVE               0x21D
#define FLAG_SHINY_MEWTWO               0x21E
#define FLAG_CAPTAIN_DIRECTS_SPHEALS               0x21F
#define FLAG_HALF_ISLAND_SHORT               0x220
#define FLAG_TALKED_TO_BRENDAN               0x221
#define FLAG_CHAPTER_7_CHAPTER_2               0x222
#define FLAG_CHAPTER_7_CHAPTER_2_INTERMISSION_1               0x223
#define FLAG_TALKED_TO_NATIONAL_PARK_HINT               0x224
#define FLAG_SAFFRON_IS_TRAINS               0x225
#define FLAG_SEAFOAM_B2F_CAPTAIN               0x226
#define FLAG_SEAFOAM_B3F_CAPTAIN               0x227
#define FLAG_SEAFOAM_B1F_CAPTAIN               0x228
#define FLAG_0x229               0x229
#define FLAG_0x22A               0x22A
#define FLAG_0x22B               0x22B
#define FLAG_TWO_ISLAND_BOMB_PRESENT               0x22C
#define FLAG_CAUGHT_MR_FUJI               0x22D
#define FLAG_CAUGHT_VERMILION_SEAL               0x22E
#define FLAG_CSR_CELIA_DEV_CREW               0x22F

// Story flags
#define STORY_FLAGS_START 0x230
#define FLAG_GOT_POTION_ON_ROUTE_1                       0x230
#define FLAG_GOT_TM34_FROM_SURGE                         0x231
#define FLAG_GOT_FOSSIL_FROM_MT_MOON                     0x232
#define FLAG_HELPED_BILL_IN_SEA_COTTAGE                  0x233
#define FLAG_CSR_GOT_BILL                               0x234
#define FLAG_CSR_GOT_BILL_DUP                           0x235
#define FLAG_GOT_TM42_AT_MEMORIAL_PILLAR                 0x236
#define FLAG_GOT_HM01                                    0x237
#define FLAG_GOT_HM02                                    0x238
#define FLAG_CSR_GOT_PAY_DAY                                    0x239
#define FLAG_WARDENS_TEETH                                    0x23A
#define FLAG_GOT_HM05                                    0x23B
#define FLAG_RESCUED_CUBONES_MOM                             0x23C
#define FLAG_GOT_POKE_FLUTE                              0x23D
#define FLAG_APPROACHING_ROUTE_14_FROM_ABOVE                                       0x23E
#define FLAG_GOT_TM28_FROM_ROCKET                        0x23F
#define FLAG_GOT_OLD_ROD                                 0x240
#define FLAG_GOT_BIKE_VOUCHER                            0x241
#define FLAG_SECRET_BIKE_SHOP                                       0x242
#define FLAG_GOT_COIN_CASE                               0x243
#define FLAG_GOT_GOOD_ROD                                0x244
#define FLAG_GOT_TM29_FROM_MR_PSYCHIC                    0x245
#define FLAG_GOT_LAPRAS_FROM_SILPH                       0x246
#define FLAG_GOT_POKEBALLS_FROM_OAK_AFTER_22_RIVAL       0x247
#define FLAG_DID_MIMIEN_TRADE                            0x248
#define FLAG_BOUGHT_GYARADOS                             0x249
#define FLAG_DID_JYNX_TRADE                              0x24A
#define FLAG_DID_RAICHU_TRADE                           0x24B
#define FLAG_GOT_MOVE_BOOK                                       0x24C
#define FLAG_DID_FARFETCHD_TRADE                           0x24D
#define FLAG_GOT_TM38_FROM_BLAINE                        0x24E
#define FLAG_OAK_SKIP_22_RIVAL_CHECK                     0x24F
#define FLAG_GOT_MASTER_BALL_FROM_SILPH                  0x250
#define FLAG_DID_NINA_TRADE                              0x251
#define FLAG_GOT_ITEMFINDER                              0x252
#define FLAG_WOKE_UP_ROUTE_12_SNORLAX                    0x253
#define FLAG_GOT_TM39_FROM_BROCK                         0x254
#define FLAG_CSR_VIDEO_GAME_NUMBER                               0x255
#define FLAG_GOT_EXP_SHARE_FROM_OAKS_AIDE                0x256
#define FLAG_DID_MARC_TRADE                              0x257
#define FLAG_BEAT_RIVAL_IN_OAKS_LAB                      0x258
#define FLAG_GOT_TM06_FROM_KOGA                          0x259
#define FLAG_AIDES_RAN_AWAY                                       0x25A
#define FLAG_GOT_TM27                                    0x25B
#define FLAG_GOT_HOUSE_KEY                                       0x25C
#define FLAG_SAW_KANGA_CUTSCENE                                       0x25D
#define FLAG_GOT_OLD_AMBER                               0x25E
#define FLAG_GOT_PSYCHIC_KEY                                       0x25F
#define FLAG_DRILLED_PALLET_HOLE                                       0x260
#define FLAG_PICKED_UP_FUSHCIA_DOOR                                       0x261
#define FLAG_SET_FUSHCIA_DOOR                                       0x262
#define FLAG_GOT_EEVEE                                   0x263
#define FLAG_VERMILLION_GYM_DOOR_OPENED           0x264
#define FLAG_CINNABAR_GYM_QUIZ_1                         0x265
#define FLAG_PENDING_DAYCARE_EGG                         0x266
#define FLAG_CINNABAR_GYM_QUIZ_2                         0x267
#define FLAG_CINNABAR_GYM_QUIZ_3                         0x268
#define FLAG_CINNABAR_GYM_QUIZ_4                         0x269
#define FLAG_CINNABAR_GYM_QUIZ_5                         0x26A
#define FLAG_CINNABAR_GYM_QUIZ_6                         0x26B
#define FLAG_POKEMON_MANSION_SWITCH_STATE                0x26C
#define FLAG_OPENED_ROCKET_HIDEOUT                       0x26D
#define FLAG_GOT_10_COINS_FROM_GAMBLER                   0x26E
#define FLAG_GOT_20_COINS_FROM_GAMBLER                   0x26F
#define FLAG_GOT_20_COINS_FROM_GAMBLER_2                 0x270
#define FLAG_GOT_BICYCLE                                 0x271
#define FLAG_GOT_DOME_FOSSIL                             0x272
#define FLAG_GOT_HELIX_FOSSIL                            0x273
#define FLAG_DID_ESPHERE_TRADE                           0x274
#define FLAG_DID_TANGENY_TRADE                           0x275
#define FLAG_DID_SEELOR_TRADE                            0x276
#define FLAG_FUSCHIA_CUT_TREE                                       0x277
#define FLAG_GOT_HITMON_FROM_DOJO                        0x278
#define FLAG_GOT_SHINY_MANKEY_FROM_CELIA                                       0x279
#define FLAG_SILPH_2F_DOOR_1                             0x27A
#define FLAG_SILPH_2F_DOOR_2                             0x27B
#define FLAG_SILPH_3F_DOOR_1                             0x27C
#define FLAG_SILPH_3F_DOOR_2                             0x27D
#define FLAG_SILPH_4F_DOOR_1                             0x27E
#define FLAG_SILPH_4F_DOOR_2                             0x27F
#define FLAG_SILPH_5F_DOOR_1                             0x280
#define FLAG_SILPH_5F_DOOR_2                             0x281
#define FLAG_SILPH_5F_DOOR_3                             0x282
#define FLAG_SILPH_6F_DOOR                               0x283
#define FLAG_SILPH_7F_DOOR_1                             0x284
#define FLAG_SILPH_7F_DOOR_2                             0x285
#define FLAG_SILPH_7F_DOOR_3                             0x286
#define FLAG_SILPH_8F_DOOR                               0x287
#define FLAG_SILPH_9F_DOOR_1                             0x288
#define FLAG_SILPH_9F_DOOR_2                             0x289
#define FLAG_SILPH_9F_DOOR_3                             0x28A
#define FLAG_SILPH_9F_DOOR_4                             0x28B
#define FLAG_SILPH_10F_DOOR                              0x28C
#define FLAG_SILPH_11F_DOOR                              0x28D
#define FLAG_GOT_MACHOKE                                       0x28E
#define FLAG_GOT_SHINY_CUBONE                                       0x28F
#define FLAG_MET_STICKER_MAN                             0x290
#define FLAG_PALLET_LADY_NOT_BLOCKING_SIGN               0x291
#define FLAG_GOT_VS_SEEKER                               0x292
#define FLAG_GOT_TM19_FROM_ERIKA                         0x293
#define FLAG_GOT_TM33_FROM_THIRSTY_GIRL                  0x294
#define FLAG_GOT_TM20_FROM_THIRSTY_GIRL                  0x295
#define FLAG_GOT_TM16_FROM_THIRSTY_GIRL                  0x296
#define FLAG_GOT_TM03_FROM_MISTY                         0x297
#define FLAG_GOT_TM26_FROM_GIOVANNI                      0x298
#define FLAG_HIDE_MISTY_IN_CERULEAN                                       0x299
#define FLAG_GOT_TM04_FROM_SABRINA                       0x29A
#define FLAG_GOT_FAME_CHECKER                            0x29B
#define FLAG_GOT_RECORD_SETTING_MAGIKARP                 0x29C
#define FLAG_TWO_ISLAND_SHOP_INTRODUCED                  0x29D
#define FLAG_TWO_ISLAND_SHOP_EXPANDED_1                  0x29E
#define FLAG_TWO_ISLAND_SHOP_EXPANDED_2                  0x29F
#define FLAG_TWO_ISLAND_SHOP_EXPANDED_3                  0x2A0
#define FLAG_SEVII_DETOUR_FINISHED                       0x2A1
#define FLAG_VISITED_TWO_ISLAND                          0x2A2
#define FLAG_RESCUED_LOSTELLE                            0x2A3
#define FLAG_BROKE_BABY_KANGA_WALL                                       0x2A4
#define FLAG_CAN_USE_ROCKET_HIDEOUT_LIFT                 0x2A5
#define FLAG_GOT_TEA                                     0x2A6
#define FLAG_RECEIVED_AURORA_TICKET                      0x2A7
#define FLAG_RECEIVED_MYSTIC_TICKET                      0x2A8
#define FLAG_RECEIVED_OLD_SEA_MAP                        0x2A9
#define FLAG_WONDER_CARD_UNUSED_1                        0x2AA
#define FLAG_WONDER_CARD_UNUSED_2                        0x2AB
#define FLAG_WONDER_CARD_UNUSED_3                        0x2AC
#define FLAG_WONDER_CARD_UNUSED_4                        0x2AD
#define FLAG_WONDER_CARD_UNUSED_5                        0x2AE
#define FLAG_WONDER_CARD_UNUSED_6                        0x2AF
#define FLAG_WONDER_CARD_UNUSED_7                        0x2B0
#define FLAG_WONDER_CARD_UNUSED_8                        0x2B1
#define FLAG_WONDER_CARD_UNUSED_9                        0x2B2
#define FLAG_WONDER_CARD_UNUSED_10                       0x2B3
#define FLAG_WONDER_CARD_UNUSED_11                       0x2B4
#define FLAG_WONDER_CARD_UNUSED_12                       0x2B5
#define FLAG_WONDER_CARD_UNUSED_13                       0x2B6
#define FLAG_WONDER_CARD_UNUSED_14                       0x2B7
#define FLAG_WONDER_CARD_UNUSED_15                       0x2B8
#define FLAG_WONDER_CARD_UNUSED_16                       0x2B9
#define FLAG_WONDER_CARD_UNUSED_17                       0x2BA
#define NUM_WONDER_CARD_FLAGS                            (1 + FLAG_WONDER_CARD_UNUSED_17 - FLAG_RECEIVED_AURORA_TICKET)

#define FLAG_GOT_POWDER_JAR                              0x2BB
#define FLAG_FOUGHT_MEWTWO                               0x2BC
#define FLAG_FOUGHT_MOLTRES                              0x2BD
#define FLAG_FOUGHT_ARTICUNO                             0x2BE
#define FLAG_FOUGHT_ZAPDOS                               0x2BF
#define FLAG_TUTOR_DOUBLE_EDGE                           0x2C0
#define FLAG_TUTOR_THUNDER_WAVE                          0x2C1
#define FLAG_TUTOR_ROCK_SLIDE                            0x2C2
#define FLAG_TUTOR_EXPLOSION                             0x2C3
#define FLAG_TUTOR_MEGA_PUNCH                            0x2C4
#define FLAG_TUTOR_MEGA_KICK                             0x2C5
#define FLAG_TUTOR_DREAM_EATER                           0x2C6
#define FLAG_TUTOR_SOFT_BOILED                           0x2C7
#define FLAG_TUTOR_SUBSTITUTE                            0x2C8
#define FLAG_TUTOR_SWORDS_DANCE                          0x2C9
#define FLAG_TUTOR_SEISMIC_TOSS                          0x2CA
#define FLAG_TUTOR_COUNTER                               0x2CB
#define FLAG_TUTOR_METRONOME                             0x2CC
#define FLAG_TUTOR_MIMIC                                 0x2CD
#define FLAG_TUTOR_BODY_SLAM                             0x2CE
#define FLAG_VISITED_OAKS_LAB                            0x2CF
#define FLAG_FOUGHT_ROUTE25_HBOX              0x2D0
#define FLAG_FOUGHT_POWER_PLANT_ELECTRODE_2              0x2D1
#define FLAG_STOPPED_SEAFOAM_B3F_CURRENT                 0x2D2
#define FLAG_STOPPED_SEAFOAM_B4F_CURRENT                 0x2D3
#define FLAG_TALKED_TO_LORELEI_AFTER_WAREHOUSE           0x2D4
#define FLAG_DEFEATED_ROCKETS_IN_WAREHOUSE               0x2D5
#define FLAG_UNLOCKED_ROCKET_WAREHOUSE                   0x2D6
#define FLAG_NO_ROOM_FOR_TM42_AT_MEMORIAL_PILLAR         0x2D7
#define FLAG_LEARNED_YES_NAH_CHANSEY                     0x2D8
#define FLAG_GOT_NEST_BALL_FROM_WATER_PATH_HOUSE_1       0x2D9
#define FLAG_GOT_TOGEPI_EGG                              0x2DA
#define FLAG_NO_ROOM_FOR_TOGEPI_EGG                      0x2DB
#define FLAG_RECOVERED_SAPPHIRE                          0x2DC
#define FLAG_GOT_RUBY                                    0x2DD
#define FLAG_TUTOR_GRASS_PLEDGE                          0x2DE
#define FLAG_TUTOR_FIRE_PLEDGE                            0x2DF
#define FLAG_TUTOR_WATER_PLEDGE                          0x2E0
#define FLAG_LEARNED_ALL_MOVES_AT_CAPE_BRINK             0x2E1
#define FLAG_GOT_NUGGET_FROM_DUNSPARCE_TUNNEL            0x2E2
#define FLAG_USED_CUT_ON_RUIN_VALLEY_BRAILLE             0x2E3
#define FLAG_CELIA_SECRET_PALLET                               0x2E4 // 8
#define FLAG_CELIA_SECRET_VIRIDIAN                                       0x2E5 //0
#define FLAG_CELIA_SECRET_PEWTER                                       0x2E6 //1
#define FLAG_CELIA_SECRET_CERULEAN                                       0x2E7 //2
#define FLAG_CELIA_SECRET_VERMILION                                       0x2E8 //3
#define FLAG_CELIA_SECRET_LAVENDER                                       0x2E9 //4
#define FLAG_CELIA_SECRET_CELADON                                       0x2EA //5
#define FLAG_CELIA_SECRET_FUCHSIA                                       0x2EB //6
#define FLAG_CELIA_SECRET_CINNABAR                                0x2EC // 7
#define FLAG_CELIA_SECRETS_FINISHED                               0x2ED
#define FLAG_HIDE_CELIA_IN_CERULEAN_BACK                               0x2EE
#define FLAG_CELIA_SECRETS_NEXT_UPDATE                                    0x2EF

#define CELIA_SECRET_VIRIDIAN 0
#define CELIA_SECRET_PEWTER 1
#define CELIA_SECRET_CERULEAN 2
#define CELIA_SECRET_VERMILION 3
#define CELIA_SECRET_LAVENDER 4
#define CELIA_SECRET_CELADON 5
#define CELIA_SECRET_FUCHSIA 6
#define CELIA_SECRET_CINNABAR 7
#define CELIA_SECRET_PALLET 8



#define FLAG_SHOWN_MYSTIC_TICKET                         0x2F0
#define FLAG_SHOWN_AURORA_TICKET                         0x2F1
#define FLAG_FOUGHT_LUGIA                                0x2F2
#define FLAG_FOUGHT_HO_OH                                0x2F3
#define FLAG_OAK_SAW_DEX_COMPLETION                      0x2F4
#define FLAG_LUGIA_FLEW_AWAY                             0x2F5
#define FLAG_TURNED_IN_POKEMON_SIGNS                             0x2F6
#define FLAG_DEOXYS_FLEW_AWAY                            0x2F7
#define FLAG_TALKED_TO_TEA_LADY_AFTER_HOF                0x2F8
#define FLAG_TALKED_TO_OAKS_AIDE_IN_VERMILION            0x2F9
#define FLAG_GOT_EVERSTONE_FROM_OAKS_AIDE                0x2FA
#define FLAG_GOT_MOON_STONE_FROM_JOYFUL_GAME_CORNER      0x2FB
#define FLAG_GOT_FULL_RESTORE_FROM_THREE_ISLAND_DEFENDER 0x2FC
#define FLAG_GOT_AMULET_COIN_FROM_OAKS_AIDE              0x2FD
#define FLAG_NO_ROOM_FOR_JOYFUL_GAME_CORNER_MOON_STONE   0x2FE
#define FLAG_OAKS_RATING_IS_VIA_PC                       0x2FF

// Unused?
#define FLAG_CSR_DEBUG_NO_ENCOUNTER               0x300
#define FLAG_CSR_DEBUG_NO_TRAINER_SEE             0x301
#define FLAG_CSR_DEBUG_NO_COLLISION               0x302
#define FLAG_CSR_DEBUG_NO_QUEST_LOG               0x303
#define FLAG_CSR_CERULEAN_GOING_NORTH               0x304
#define FLAG_CSR_HIDDEN_CELIA_BILL               0x305
#define FLAG_CSR_PHIONE_EGG               0x306
#define FLAG_CSR_JIRACHI_SET               0x307
#define FLAG_CSR_JIRACHI_GOT               0x308
#define FLAG_CSR_MELTED_GUARDS               0x309
#define FLAG_CSR_OLD_CELIA_BONUS     0x30A
#define FLAG_CSR_PHISHING_GURU_MENUS               0x30B
#define FLAG_CSR_TALKED_TO_YOUNGER_BROTHER               0x30C
#define FLAG_CSR_TALKED_TO_OLDER_BROTHER               0x30D
#define FLAG_CSR_GOT_DUCK_PAIL               0x30E
#define FLAG_CSR_DUCK_PAIL_EMPTIED               0x30F
#define FLAG_CSR_IMPOSTEROAK1               0x310
#define FLAG_REVIVED_DOME               0x311
#define FLAG_REVIVED_HELIX               0x312
#define FLAG_REVIVED_AMBER               0x313
#define FLAG_GOT_HM06               0x314
#define FLAG_CSR_CONFUSED_GRUNT               0x315
#define FLAG_CSR_TUBER_EATEN               0x316
#define FLAG_CSR_TALKED_TO_TUBER               0x317
#define FLAG_CSR_ON_PATH_TO_LAVENDER_SECRET               0x318
#define FLAG_CSR_HIDE_MUSIC_GIRL               0x319
#define FLAG_CSR_FUSHCIA_HBOX               0x31A
#define FLAG_CSR_GOT_SLOWPOKE               0x31B
#define FLAG_CSR_GOT_GUN               0x31C
#define FLAG_LIGHTHOUSE_OLD_MAN               0x31D
#define FLAG_JUMPED_FROM_LIGHTHOUSE               0x31E
#define FLAG_LIGHTHOUSE_FALLING_FROM_ABOVE               0x31F
#define FLAG_GOT_FLOAT_STONE               0x320

//Fushcia Gym
#define FLAG_GOT_DEVON_SCOPE               0x321
#define FLAG_IN_FUSHCIA_GYM               0x322
#define FLAG_FUSHCIA_GYM_INVISIBLE_LASS               0x323
#define FLAG_DEFEATED_TRAINER_1               0x324
#define FLAG_REVEALED_DAD               0x325
#define FLAG_DEFEATED_TRAINER_2               0x326
#define FLAG_DRILLED_LEFT_HOLE               0x327
#define FLAG_DRILLED_RIGHT_HOLE               0x328
#define FLAG_DEFEATED_ARON_MAN               0x329
#define FLAG_UNUSED_0x32A               0x32A
#define FLAG_GOT_DRILL_DOZER               0x32B
#define FLAG_GOT_BURNED_ONCE               0x32C
#define FLAG_GOT_PARALYZED_ONCE               0x32D
#define FLAG_GOT_POISONED_ONCE               0x32E
#define FLAG_BEAT_RAIN_GIRL               0x32F
#define FLAG_IRON_CURTAIN_SET               0x330
#define FLAG_IRON_CURTAIN_ON_RED               0x331
#define FLAG_GREEN_DOOR_OPENED               0x332
#define FLAG_IRON_CURTAIN_OPENED               0x333
#define FLAG_MEMORIZED_SCROLL               0x334
#define FLAG_OBTAINED_IRON_CURTAIN               0x335
#define FLAG_LASS_BROKE_WALL               0x336
#define FLAG_FUSHCIA_IMPOSTER_OAK               0x337
#define FLAG_DEFEATED_NINJAS               0x338
#define FLAG_LION_BATTLE               0x339 // yes I know this is cringe but idk how to do it 
#define FLAG_FUSHCIA_GYM_LEFT_FIRST               0x33A
#define FLAG_FUSHCIA_GYM_RIGHT_FIRST               0x33B
#define FLAG_GOT_POINCARE_VOUCHER               0x33C
#define FLAG_TALKED_TO_KOGA_AT_START               0x33D
#define FLAG_RELEASED_CHOMP               0x33E
#define FLAG_GOT_STAR               0x33F
#define FLAG_GOT_PARAS_FROM_LUIGI               0x340
#define FLAG_REPELLED_MAX               0x341
#define FLAG_GOT_HORSEA_FROM_DAD               0x342

#define FLAG_FREED_KANGA               0x343
#define FLAG_WATERED_BRENDANMAY_OAK               0x344
#define FLAG_GOT_BRENDANMAY_JIRACHI               0x345
#define FLAG_DUG_IN_DIGLETTS_CAVE               0x346
#define FLAG_DRAW_STATUE_IN_LION_ROOM               0x347
#define FLAG_GOT_SHINY_VULPIX               0x348
#define FLAG_CAN_DRILL_TRICK_WALL               0x349
#define FLAG_DRILLED_TRICK_WALL               0x34A
#define FLAG_GOT_SHINY_SLOWPOKE               0x34B
#define FLAG_GOT_HOUSE_VOUCHER               0x34C
#define FLAG_TEAM_SKY_FALLS_DOWN               0x34D
#define FLAG_GOT_BRENDAN_HAT               0x34E
#define FLAG_CUT_MUSEUM_ASSOCIATE               0x34F
#define FLAG_PUSHED_CARDBOARD_CUTOUT               0x350
#define FLAG_FROSLASS_ENCOUNTER               0x351
#define FLAG_TWO_ISLAND_PENCIL               0x352
#define FLAG_TWO_ISLAND_DRAGONITE_PRESENT               0x353
#define FLAG_TWO_ISLAND_FUCK_PRESENT               0x354
#define FLAG_TWO_ISLAND_OTHER_PRESENT               0x355
#define FLAG_SILPH_WARP_CALLCENTER               0x356
#define FLAG_SILPH_WARP_RD               0x357
#define FLAG_SILPH_WARP_HOSTAGES               0x358
#define FLAG_SILPH_WARP_PRESIDENT               0x359
#define FLAG_SILPH_WARP_BALLS               0x35A
#define FLAG_SILPH_WARP_LARRY               0x35B
#define FLAG_SILPH_WARP_THREE_ISLAND               0x35C
#define FLAG_GOT_PENCIL_ERASER               0x35D
#define FLAG_GOT_ODDISH               0x35E
#define FLAG_HELPED_MILTANK               0x35F
#define FLAG_TRUCK_PUT_IN_HOLE               0x360
#define FLAG_GIRL_PUT_IN_HOLE               0x361
#define FLAG_BOULDER_PUT_IN_HOLE               0x362
#define FLAG_TRIANGLE_PUT_IN_HOLE               0x363
#define FLAG_OPENED_SKY_TOWER               0x364
#define FLAG_GOT_CATERPIE               0x365
#define FLAG_CREDITS_FAKEOUT               0x366
#define FLAG_GOT_BALM_MUSHROOM               0x367
#define FLAG_FUCKING_FURRET               0x368
#define FLAG_LOOKER_SCENE               0x369
#define FLAG_FUSHCIA_GO_TO_SHORE_SCENE               0x36A
#define FLAG_MESPRIT_RAN_AWAY               0x36B
#define FLAG_DMCA_SKULL_FIGHT_1               0x36C
#define FLAG_DMCA_SKUNTANK_FIGHT_COMPLETED               0x36D
#define FLAG_DRILLED_MT_MOON_HOLE               0x36E
#define FLAG_SHINY_SCYTHER_FROM_BUGSY               0x36F
#define FLAG_MURDERED_LANCE               0x370
#define FLAG_CSR_HINT_GOLD_TEETH               0x371
#define FLAG_CSR_SPEEDRUN_CAVE               0x372
#define FLAG_CSR_HINT_CLEFABLE_SHADOW               0x373
#define FLAG_CSR_HINT_EVO_LEVEL               0x374
#define FLAG_CSR_HINT_RUNNING_SHOES               0x375
#define FLAG_CSR_HINT_MISSINGNO               0x376
#define FLAG_CSR_HINT_ABRA_TRADE               0x377
#define FLAG_CSR_HINT_KENYA               0x378
#define FLAG_CSR_HINT_PHISHING               0x379
#define FLAG_CSR_HINT_LICKITUNG               0x37A
#define FLAG_CSR_HINT_MOVE_REMINDER               0x37B
#define FLAG_BACK_OF_ARROW_MAZE               0x37C
#define FLAG_CSR_HINT_DRAGONITE               0x37D
#define FLAG_CSR_HINT_SPEAROW               0x37E
#define FLAG_CSR_HINT_PEWTER_GRASS               0x37F
#define FLAG_SHE_SELLS_SEASHELLS               0x380
#define FLAG_CSR_HINT_REVEAL_GLASS               0x381
#define FLAG_CSR_HINT_GYM_STATUES               0x382
#define FLAG_CSR_HINT_ARMS_TRADE               0x383
#define FLAG_POKEMON_GUN_HINT               0x384
#define FLAG_CSR_HINT_FOREST_CANDIES               0x385
#define FLAG_CSR_HINT_SPAM               0x386
#define FLAG_CSR_TALKED_TO_RAICHU_GIRL               0x387
#define FLAG_CSR_TALKED_TO_JYNX_GUY               0x388
#define FLAG_CSR_GOT_GOLDEN_ROD               0x389
#define FLAG_BAKED_DONUT_HINT               0x38A
#define FLAG_FED_SANDWICH               0x38B
#define FLAG_GOT_SANDWICH_CASE               0x38C
#define FLAG_HIDE_HARRY_RAT               0x38D
#define FLAG_SENT_BIKER_FLYING               0x38E
#define FLAG_READ_SAFE_CODE               0x38F
#define FLAG_GOT_SHINY_MACHOKE               0x390
#define FLAG_TALKED_TO_IVY               0x391
#define FLAG_TALKED_TO_TODD               0x392
#define FLAG_UNLOCKED_CINNABAR_GYM               0x393
#define FLAG_FOUGHT_CASTFORM               0x394
#define FLAG_BOUGHT_A_HOUSE               0x395
#define FLAG_TWO_ISLAND_TERRITORIAL_OAK               0x396
#define FLAG_GOT_HAMBURGER               0x397

#define FLAG_KINGLER_SIGN               0x398
#define FLAG_DUGTRIO_SIGN               0x399
#define FLAG_GROWLITHE_SIGN               0x39A
#define FLAG_ELECTIVIRE_SIGN               0x39B
#define FLAG_AMBIGUOUS_STATUE_SIGN               0x39C
#define FLAG_ONIX_TAIL_SIGN               0x39D
#define FLAG_IVY_SIGN               0x39E




//Odd Candy Quest
#define FLAG_PALLET_CANDY                0x39F //placed
#define FLAG_VIRIDIAN_CANDY              0x3A0 //placed
#define FLAG_PEWTER_CANDY                0x3A1 //placed 
#define FLAG_CERULEAN_CANDY              0x3A2 //placed
#define FLAG_VERMILLION_CANDY            0x3A3 //placed
#define FLAG_LAVENDER_CANDY              0x3A4 //placed
#define FLAG_CELADON_CANDY               0x3A5 //placed
#define FLAG_FUSHCIA_CANDY               0x3A6 //placed
#define FLAG_CINNABAR_ISLAND_CANDY       0x3A8 // Revealed after island crashed through
#define FLAG_SOOTOPOLIS_CITY_CANDY       0x3A9 // Maybe put this elsewhere?
#define FLAG_MT_MOON_CANDY               0x3AA //placed
#define FLAG_UNDERGROUND_PATH_CANDY      0x3AB //placed
#define FLAG_POKEMON_TOWER_CANDY         0x3AC //placed
#define FLAG_SAFARI_ZONE_CANDY           0x3AD //placed
#define FLAG_SILPH_CO_CANDY              0x3AF //Behind the ball shop counter
#define FLAG_SEAFOAM_ISLANDS_CANDY       0x3B2
#define FLAG_SKY_PILLAR_CANDY            0x3B4 //Dumb bike puzzle maybe
#define FLAG_KANTO_LIGHTHOUSE_CANDY      0x3B6 //placed
#define FLAG_CERULEAN_CAVE_CANDY           0x3B7  //placed
#define FLAG_ONE_ISLAND_CANDY            0x3B8 
#define FLAG_TWO_ISLAND_CANDY            0x3B9 // placed
#define FLAG_THREE_ISLAND_CANDY          0x3BA // Inside the mansion somewhere
#define FLAG_FOUR_ISLAND_CANDY           0x3BB //In Mart
#define FLAG_THIRTY_EIGHT_ISLAND_CANDY   0x3BC //Placed
#define FLAG_POKEMON_ISLAND_CANDY        0x3BD //Placed
#define FLAG_MINNESOTA_CANDY             0x3BF  //placed
#define FLAG_ROUTE_1_CANDY               0x3C0 //placed
#define FLAG_ROUTE_2_CANDY               0x3C1 //placed
#define FLAG_ROUTE_3_CANDY               0x3C2 //placed
#define FLAG_ROUTE_4_CANDY               0x3C3 //placed
#define FLAG_ROUTE_5_CANDY               0x3C4 //placed
#define FLAG_ROUTE_6_CANDY               0x3C5 //placed
#define FLAG_ROUTE_8_CANDY               0x3C7 //placed
#define FLAG_ROUTE_9_CANDY               0x3C8 //placed
#define FLAG_ROUTE_10_CANDY              0x3C9 //placed
#define FLAG_ROUTE_11_CANDY              0x3CA //placed
#define FLAG_ROUTE_12_CANDY              0x3CB //placed
#define FLAG_ROUTE_13_CANDY              0x3CC //placed
#define FLAG_ROUTE_14_CANDY              0x3CD //placed
#define FLAG_ROUTE_16_CANDY              0x3CF //placed
#define FLAG_ROUTE_21_CANDY              0x3D0 // idk
#define FLAG_ROUTE_18_CANDY              0x3D1 //placed
#define FLAG_ROUTE_22_CANDY              0x3D3 //placed
#define FLAG_ROUTE_24_CANDY              0x3D4 //placed
#define FLAG_ROUTE_25_CANDY              0x3D5 //placed
#define FLAG_VIRIDIAN_FOREST_CANDY               0x3D6 //placed



#define FLAG_UNUSED_CANDY_1          0x3A7 // REPURPOSE
#define FLAG_UNUSED_CANDY_2         0x3AE // REPURPOSE
#define FLAG_UNUSED_CANDY_3         0x3B0 // REPURPOSE
#define FLAG_UNUSED_CANDY_4           0x3B1 // REPURPOSE
#define FLAG_UNUSED_CANDY_5      0x3B3 // REPURPOSE
#define FLAG_UNUSED_CANDY_6               0x3C6 //REPURPOSE
#define FLAG_UNUSED_CANDY_7              0x3CE //REPURPOSE


#define FLAG_PIRATE_BAY_CANDY              0x3D2 
#define FLAG_YES_CANDY                   0x3BE
#define FLAG_AETHER_PARADISE_CANDY       0x3B5
#define FLAG_NATIONAL_PARK_CANDY               0x3D7

//Mystery Gift Stuff
#define FLAG_MYSTERY_GIFT_DONE   0x3D8
#define FLAG_MYSTERY_GIFT_1      0x3D9
#define FLAG_MYSTERY_GIFT_2      0x3DA
#define FLAG_MYSTERY_GIFT_3      0x3DB
#define FLAG_MYSTERY_GIFT_4      0x3DC
#define FLAG_MYSTERY_GIFT_5      0x3DD
#define FLAG_MYSTERY_GIFT_6      0x3DE
#define FLAG_MYSTERY_GIFT_7      0x3DF
#define FLAG_MYSTERY_GIFT_8      0x3E0
#define FLAG_MYSTERY_GIFT_9      0x3E1
#define FLAG_MYSTERY_GIFT_10     0x3E2
#define FLAG_MYSTERY_GIFT_11     0x3E3
#define FLAG_MYSTERY_GIFT_12     0x3E4
#define FLAG_MYSTERY_GIFT_13     0x3E5
#define FLAG_MYSTERY_GIFT_14     0x3E6
#define FLAG_MYSTERY_GIFT_15     0x3E7

#define FLAG_HIDDEN_ITEMS_START 1000 // 0x3E8

#define FLAG_CSR_HIDDEN_ITEM_VIRIDIAN_FOREST_ETHER                            (FLAG_HIDDEN_ITEMS_START +   0)
#define FLAG_CSR_HIDDEN_ITEM_VIRIDIAN_FOREST_RARE_CANDY                          (FLAG_HIDDEN_ITEMS_START +   1)
#define FLAG_CSR_HIDDEN_ITEM_MT_MOON_B2F_SUN_STONE                            (FLAG_HIDDEN_ITEMS_START +   2)
#define FLAG_HIDDEN_ITEM_MT_MOON_B2F_ETHER                                 (FLAG_HIDDEN_ITEMS_START +   3)
#define FLAG_HIDDEN_ITEM_ROUTE25_ELIXIR                                    (FLAG_HIDDEN_ITEMS_START +   4)
#define FLAG_HIDDEN_ITEM_ROUTE25_CHOICE_BAND                                     (FLAG_HIDDEN_ITEMS_START +   5)
#define FLAG_HIDDEN_ITEM_ROUTE9_ETHER                                      (FLAG_HIDDEN_ITEMS_START +   6)
#define FLAG_HIDDEN_ITEM_UNUSED_0x07                                       (FLAG_HIDDEN_ITEMS_START +   7)
#define FLAG_HIDDEN_ITEM_LEAF_STONE_HOUSE                 (FLAG_HIDDEN_ITEMS_START +   8)
#define FLAG_HIDDEN_ITEM_POKE_DOLL                              (FLAG_HIDDEN_ITEMS_START +   9) //naming this 2 was a mistake.
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_3                                 (FLAG_HIDDEN_ITEMS_START +  10)
#define FLAG_HIDDEN_ITEM_POKE_DOLL_2                          (FLAG_HIDDEN_ITEMS_START +  11)
#define FLAG_HIDDEN_ITEM_POKE_DOLL_4                         (FLAG_HIDDEN_ITEMS_START +  12)
#define FLAG_HIDDEN_ITEM_POKE_DOLL_5                      (FLAG_HIDDEN_ITEMS_START +  13)
#define FLAG_HIDDEN_ITEM_POKE_DOLL_6                     (FLAG_HIDDEN_ITEMS_START +  14)
#define FLAG_HIDDEN_ITEM_POKE_DOLL_7                                     (FLAG_HIDDEN_ITEMS_START +  15)
#define FLAG_HIDDEN_ITEM_POKE_DOLL_8                                       (FLAG_HIDDEN_ITEMS_START +  16)
#define FLAG_HIDDEN_ITEM_POKE_DOLL_3                                (FLAG_HIDDEN_ITEMS_START +  17)
#define FLAG_HIDDEN_ITEM_POKE_DOLL_9                              (FLAG_HIDDEN_ITEMS_START +  18)
#define FLAG_ROUTE19_DOLL_1                                     (FLAG_HIDDEN_ITEMS_START +  19)
#define FLAG_ROUTE19_DOLL_2                                (FLAG_HIDDEN_ITEMS_START +  20)
#define FLAG_HIDDEN_ITEM_POKE_DOLL_10                                (FLAG_HIDDEN_ITEMS_START +  21)
#define FLAG_HIDDEN_ITEM_ROUTE22_NOTHING                     (FLAG_HIDDEN_ITEMS_START +  22)
#define FLAG_HIDDEN_ITEM_SPONGEBOB                           (FLAG_HIDDEN_ITEMS_START +  23)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_17                                (FLAG_HIDDEN_ITEMS_START +  24)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_18                            (FLAG_HIDDEN_ITEMS_START +  25)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_19             (FLAG_HIDDEN_ITEMS_START +  26)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_33                            (FLAG_HIDDEN_ITEMS_START +  27) //smh Rave I can't believe you missed this
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_20                         (FLAG_HIDDEN_ITEMS_START +  28)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_21                        (FLAG_HIDDEN_ITEMS_START +  29)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_22                   (FLAG_HIDDEN_ITEMS_START +  30)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_23                     (FLAG_HIDDEN_ITEMS_START +  31)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_24                     (FLAG_HIDDEN_ITEMS_START +  32)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_25                        (FLAG_HIDDEN_ITEMS_START +  33)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_26                              (FLAG_HIDDEN_ITEMS_START +  34)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_27                                (FLAG_HIDDEN_ITEMS_START +  35)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_28                                 (FLAG_HIDDEN_ITEMS_START +  36)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_29                        (FLAG_HIDDEN_ITEMS_START +  37)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_30                      (FLAG_HIDDEN_ITEMS_START +  38)
#define FLAG_HIDDEN_ITEM_SHRINE_ISLAND_NOTHING                       (FLAG_HIDDEN_ITEMS_START +  39)
#define FLAG_HIDDEN_ITEM_POMEG_BERRY                                       (FLAG_HIDDEN_ITEMS_START +  40)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_32                               (FLAG_HIDDEN_ITEMS_START +  41)
#define FLAG_HIDDEN_ITEM_CSR_DUMMY_34                              (FLAG_HIDDEN_ITEMS_START +  42)
#define FLAG_HIDDEN_ITEM_UNUSED_0x2B                                       (FLAG_HIDDEN_ITEMS_START +  43)
#define FLAG_HIDDEN_ITEM_MAY_BIDE                                       (FLAG_HIDDEN_ITEMS_START +  44)
#define FLAG_HIDDEN_ITEM_UNUSED_0x2D                                       (FLAG_HIDDEN_ITEMS_START +  45)
#define FLAG_HIDDEN_ITEM_UNUSED_0x2E                                       (FLAG_HIDDEN_ITEMS_START +  46)
#define FLAG_HIDDEN_ITEM_CELADON_CITY_PP_UP                                (FLAG_HIDDEN_ITEMS_START +  47)
#define FLAG_HIDDEN_ITEM_VERMILION_CITY_MAX_ETHER                          (FLAG_HIDDEN_ITEMS_START +  48)
#define FLAG_HIDDEN_ITEM_CERULEAN_CITY_RARE_CANDY                          (FLAG_HIDDEN_ITEMS_START +  49)
#define FLAG_HIDDEN_ITEM_ROUTE4_GREAT_BALL                                 (FLAG_HIDDEN_ITEMS_START +  50)
#define FLAG_HIDDEN_ITEM_CELADON_CITY_GAME_CORNER_COINS                    (FLAG_HIDDEN_ITEMS_START +  51)
#define FLAG_HIDDEN_ITEM_CELADON_CITY_GAME_CORNER_COINS_2                  (FLAG_HIDDEN_ITEMS_START +  52)
#define FLAG_HIDDEN_ITEM_CELADON_CITY_GAME_CORNER_COINS_3                  (FLAG_HIDDEN_ITEMS_START +  53)
#define FLAG_HIDDEN_ITEM_CELADON_CITY_GAME_CORNER_COINS_4                  (FLAG_HIDDEN_ITEMS_START +  54)
#define FLAG_HIDDEN_ITEM_CELADON_CITY_GAME_CORNER_COINS_5                  (FLAG_HIDDEN_ITEMS_START +  55)
#define FLAG_HIDDEN_ITEM_CELADON_CITY_GAME_CORNER_COINS_6                  (FLAG_HIDDEN_ITEMS_START +  56)
#define FLAG_HIDDEN_ITEM_CELADON_CITY_GAME_CORNER_COINS_7                  (FLAG_HIDDEN_ITEMS_START +  57)
#define FLAG_HIDDEN_ITEM_CELADON_CITY_GAME_CORNER_COINS_8                  (FLAG_HIDDEN_ITEMS_START +  58)
#define FLAG_HIDDEN_ITEM_CELADON_CITY_GAME_CORNER_COINS_9                  (FLAG_HIDDEN_ITEMS_START +  59)
#define FLAG_HIDDEN_ITEM_CELADON_CITY_GAME_CORNER_COINS_10                 (FLAG_HIDDEN_ITEMS_START +  60)
#define FLAG_HIDDEN_ITEM_CELADON_CITY_GAME_CORNER_COINS_11                 (FLAG_HIDDEN_ITEMS_START +  61)
#define FLAG_HIDDEN_ITEM_CELADON_CITY_GAME_CORNER_COINS_12                 (FLAG_HIDDEN_ITEMS_START +  62)
#define FLAG_HIDDEN_ITEM_NOTHING           (FLAG_HIDDEN_ITEMS_START +  63)
#define FLAG_HIDDEN_ITEM_SEVEN_ISLAND_TANOBY_RUINS_HEART_SCALE_4           (FLAG_HIDDEN_ITEMS_START +  64)
#define FLAG_HIDDEN_ITEM_SEVEN_ISLAND_TANOBY_RUINS_HEART_SCALE             (FLAG_HIDDEN_ITEMS_START +  65)
#define FLAG_HIDDEN_ITEM_SEVEN_ISLAND_TANOBY_RUINS_HEART_SCALE_2           (FLAG_HIDDEN_ITEMS_START +  66)
#define FLAG_HIDDEN_ITEM_SEVEN_ISLAND_TANOBY_RUINS_HEART_SCALE_3           (FLAG_HIDDEN_ITEMS_START +  67)
#define FLAG_HIDDEN_ITEM_FIVE_ISLAND_ROCKET_WAREHOUSE_NEST_BALL            (FLAG_HIDDEN_ITEMS_START +  68)
#define FLAG_HIDDEN_ITEM_FIVE_ISLAND_ROCKET_WAREHOUSE_NET_BALL             (FLAG_HIDDEN_ITEMS_START +  69)
#define FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_POTION        (FLAG_HIDDEN_ITEMS_START +  70)
#define FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_ANTIDOTE      (FLAG_HIDDEN_ITEMS_START +  71)
#define FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_PARALYZE_HEAL (FLAG_HIDDEN_ITEMS_START +  72)
#define FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_AWAKENING     (FLAG_HIDDEN_ITEMS_START +  73)
#define FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_BURN_HEAL     (FLAG_HIDDEN_ITEMS_START +  74)
#define FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_ICE_HEAL      (FLAG_HIDDEN_ITEMS_START +  75)
#define FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL_ETHER         (FLAG_HIDDEN_ITEMS_START +  76)
#define FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_POTION          (FLAG_HIDDEN_ITEMS_START +  77)
#define FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_ANTIDOTE        (FLAG_HIDDEN_ITEMS_START +  78)
#define FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_PARALYZE_HEAL   (FLAG_HIDDEN_ITEMS_START +  79)
#define FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_AWAKENING       (FLAG_HIDDEN_ITEMS_START +  80)
#define FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_BURN_HEAL       (FLAG_HIDDEN_ITEMS_START +  81)
#define FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_ICE_HEAL        (FLAG_HIDDEN_ITEMS_START +  82)
#define FLAG_HIDDEN_ITEM_UNDERGROUND_PATH_EAST_WEST_TUNNEL_ETHER           (FLAG_HIDDEN_ITEMS_START +  83)
#define FLAG_HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM                         (FLAG_HIDDEN_ITEMS_START +  84)
#define FLAG_HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM_2                       (FLAG_HIDDEN_ITEMS_START +  85)
#define FLAG_HIDDEN_ITEM_MT_MOON_B1F_TINY_MUSHROOM_3                       (FLAG_HIDDEN_ITEMS_START +  86)
#define FLAG_HIDDEN_ITEM_MT_MOON_B1F_BIG_MUSHROOM                          (FLAG_HIDDEN_ITEMS_START +  87)
#define FLAG_HIDDEN_ITEM_MT_MOON_B1F_BIG_MUSHROOM_2                        (FLAG_HIDDEN_ITEMS_START +  88)
#define FLAG_HIDDEN_ITEM_MT_MOON_B1F_BIG_MUSHROOM_3                        (FLAG_HIDDEN_ITEMS_START +  89)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_RAZZ_BERRY              (FLAG_HIDDEN_ITEMS_START +  90)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_BLUK_BERRY              (FLAG_HIDDEN_ITEMS_START +  91)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_NANAB_BERRY             (FLAG_HIDDEN_ITEMS_START +  92)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_WEPEAR_BERRY            (FLAG_HIDDEN_ITEMS_START +  93)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_ORAN_BERRY              (FLAG_HIDDEN_ITEMS_START +  94)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_CHERI_BERRY             (FLAG_HIDDEN_ITEMS_START +  95)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_CHESTO_BERRY            (FLAG_HIDDEN_ITEMS_START +  96)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_PECHA_BERRY             (FLAG_HIDDEN_ITEMS_START +  97)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_RAWST_BERRY             (FLAG_HIDDEN_ITEMS_START +  98)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_ASPEAR_BERRY            (FLAG_HIDDEN_ITEMS_START +  99)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_PERSIM_BERRY            (FLAG_HIDDEN_ITEMS_START + 100)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_PINAP_BERRY             (FLAG_HIDDEN_ITEMS_START + 101)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BERRY_FOREST_LUM_BERRY               (FLAG_HIDDEN_ITEMS_START + 102)
#define FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_STARDUST                (FLAG_HIDDEN_ITEMS_START + 103)
#define FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_STARDUST_2              (FLAG_HIDDEN_ITEMS_START + 104)
#define FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_PEARL                   (FLAG_HIDDEN_ITEMS_START + 105)
#define FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_PEARL_2                 (FLAG_HIDDEN_ITEMS_START + 106)
#define FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_ULTRA_BALL              (FLAG_HIDDEN_ITEMS_START + 107)
#define FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_ULTRA_BALL_2            (FLAG_HIDDEN_ITEMS_START + 108)
#define FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_STAR_PIECE              (FLAG_HIDDEN_ITEMS_START + 109)
#define FLAG_HIDDEN_ITEM_ONE_ISLAND_TREASURE_BEACH_BIG_PEARL               (FLAG_HIDDEN_ITEMS_START + 110)
#define FLAG_HIDDEN_ITEM_TWO_ISLAND_CAPE_BRINK_RARE_CANDY                  (FLAG_HIDDEN_ITEMS_START + 111)
#define FLAG_HIDDEN_ITEM_PEWTER_CITY_POKE_BALL                             (FLAG_HIDDEN_ITEMS_START + 112)
#define FLAG_HIDDEN_ITEM_ROUTE3_SITRUS_BERRIES                                 (FLAG_HIDDEN_ITEMS_START + 113)
#define FLAG_HIDDEN_ITEM_ROUTE4_PERSIM_BERRY                               (FLAG_HIDDEN_ITEMS_START + 114)
#define FLAG_HIDDEN_ITEM_ROUTE24_PECHA_BERRY                               (FLAG_HIDDEN_ITEMS_START + 115)
#define FLAG_HIDDEN_ITEM_ROUTE25_LEPPA_BERRY                                (FLAG_HIDDEN_ITEMS_START + 116)
#define FLAG_HIDDEN_ITEM_ROUTE25_BLUK_BERRY                                (FLAG_HIDDEN_ITEMS_START + 117)
#define FLAG_HIDDEN_ITEM_ROUTE6_SITRUS_BERRY                               (FLAG_HIDDEN_ITEMS_START + 118)
#define FLAG_HIDDEN_ITEM_ROUTE6_RARE_CANDY                                 (FLAG_HIDDEN_ITEMS_START + 119)
#define FLAG_HIDDEN_ITEM_SSANNE_KITCHEN_PECHA_BERRY                        (FLAG_HIDDEN_ITEMS_START + 120)
#define FLAG_HIDDEN_ITEM_SSANNE_KITCHEN_CHERI_BERRY                        (FLAG_HIDDEN_ITEMS_START + 121)
#define FLAG_HIDDEN_ITEM_SSANNE_KITCHEN_CHESTO_BERRY                       (FLAG_HIDDEN_ITEMS_START + 122)
#define FLAG_HIDDEN_ITEM_SSANNE_KITCHEN_BERRY_4                                 (FLAG_HIDDEN_ITEMS_START + 123)
#define FLAG_HIDDEN_ITEM_SSANNE_KITCHEN_BERRY_5                                      (FLAG_HIDDEN_ITEMS_START + 124)
#define FLAG_HIDDEN_ITEM_ROUTE10_PERSIM_BERRY                              (FLAG_HIDDEN_ITEMS_START + 125)
#define FLAG_HIDDEN_ITEM_ROUTE10_CHERI_BERRY                               (FLAG_HIDDEN_ITEMS_START + 126)
#define FLAG_HIDDEN_ITEM_ROUTE8_RAWST_BERRY                                (FLAG_HIDDEN_ITEMS_START + 127)
#define FLAG_HIDDEN_ITEM_ROUTE8_LUM_BERRY                                  (FLAG_HIDDEN_ITEMS_START + 128)
#define FLAG_HIDDEN_ITEM_ROUTE8_LEPPA_BERRY                                (FLAG_HIDDEN_ITEMS_START + 129)
#define FLAG_HIDDEN_ITEM_ROUTE12_RARE_CANDY                                (FLAG_HIDDEN_ITEMS_START + 130)
#define FLAG_HIDDEN_ITEM_ROUTE12_LEFTOVERS                                 (FLAG_HIDDEN_ITEMS_START + 131)
#define FLAG_HIDDEN_ITEM_ROUTE16_LEFTOVERS                                 (FLAG_HIDDEN_ITEMS_START + 132)
#define FLAG_HIDDEN_ITEM_FUSHCIA_CITY_MAX_REVIVE                           (FLAG_HIDDEN_ITEMS_START + 133)
#define FLAG_HIDDEN_ITEM_ROCKET_HIDEOUT_B4F_NET_BALL                       (FLAG_HIDDEN_ITEMS_START + 134)
#define FLAG_HIDDEN_ITEM_SILPH_CO_2F_ULTRA_BALL                            (FLAG_HIDDEN_ITEMS_START + 135)
#define FLAG_HIDDEN_ITEM_SILPH_CO_3F_PROTEIN                               (FLAG_HIDDEN_ITEMS_START + 136)
#define FLAG_HIDDEN_ITEM_SILPH_CO_4F_IRON                                  (FLAG_HIDDEN_ITEMS_START + 137)
#define FLAG_HIDDEN_ITEM_SSANNE_KITCHEN_BERRY_6                                 (FLAG_HIDDEN_ITEMS_START + 138)
#define FLAG_HIDDEN_ITEM_SSANNE_KITCHEN_BERRY_7                                (FLAG_HIDDEN_ITEMS_START + 139)
#define FLAG_HIDDEN_ITEM_SILPH_CO_7F_ZINC                                  (FLAG_HIDDEN_ITEMS_START + 140)
#define FLAG_HIDDEN_ITEM_SILPH_CO_8F_NUGGET                                (FLAG_HIDDEN_ITEMS_START + 141)
#define FLAG_HIDDEN_ITEM_SILPH_CO_9F_CALCIUM                               (FLAG_HIDDEN_ITEMS_START + 142)
#define FLAG_HIDDEN_ITEM_SILPH_CO_10F_HP_UP                                (FLAG_HIDDEN_ITEMS_START + 143)
#define FLAG_HIDDEN_ITEM_SILPH_CO_11F_REVIVE                               (FLAG_HIDDEN_ITEMS_START + 144)
#define FLAG_HIDDEN_ITEM_ROUTE23_LUM_BERRY                                 (FLAG_HIDDEN_ITEMS_START + 145)
#define FLAG_HIDDEN_ITEM_ROUTE23_SITRUS_BERRY                              (FLAG_HIDDEN_ITEMS_START + 146)
#define FLAG_HIDDEN_ITEM_ROUTE23_ASPEAR_BERRY                              (FLAG_HIDDEN_ITEMS_START + 147)
#define FLAG_HIDDEN_ITEM_ROUTE23_LEPPA_BERRY                               (FLAG_HIDDEN_ITEMS_START + 148)
#define FLAG_HIDDEN_ITEM_ROUTE14_ZINC                                      (FLAG_HIDDEN_ITEMS_START + 149)
#define FLAG_HIDDEN_ITEM_ROUTE9_CHESTO_BERRY                               (FLAG_HIDDEN_ITEMS_START + 150)
#define FLAG_HIDDEN_ITEM_ROUTE10_NANAB_BERRY                               (FLAG_HIDDEN_ITEMS_START + 151)
#define FLAG_HIDDEN_ITEM_ROUTE7_WEPEAR_BERRY                               (FLAG_HIDDEN_ITEMS_START + 152)
#define FLAG_HIDDEN_ITEM_ROUTE20_STARDUST                                  (FLAG_HIDDEN_ITEMS_START + 153)
#define FLAG_HIDDEN_ITEM_ROUTE21_NORTH_PEARL                               (FLAG_HIDDEN_ITEMS_START + 154)
#define FLAG_HIDDEN_ITEM_ROUTE23_MAX_ELIXIR                                (FLAG_HIDDEN_ITEMS_START + 155)
#define FLAG_HIDDEN_ITEM_ROUTE4_RAZZ_BERRY                                 (FLAG_HIDDEN_ITEMS_START + 156)
#define FLAG_HIDDEN_ITEM_ROUTE14_PINAP_BERRY                               (FLAG_HIDDEN_ITEMS_START + 157)
#define FLAG_HIDDEN_ITEM_MT_EMBER_EXTERIOR_FIRE_STONE                      (FLAG_HIDDEN_ITEMS_START + 158)
#define FLAG_HIDDEN_ITEM_POKEMON_TOWER_7F_SOOTHE_BELL                      (FLAG_HIDDEN_ITEMS_START + 159)
#define FLAG_HIDDEN_ITEM_NAVEL_ROCK_SUMMIT_SACRED_ASH                      (FLAG_HIDDEN_ITEMS_START + 160)
#define FLAG_HIDDEN_ITEM_TWO_ISLAND_CAPE_BRINK_PP_MAX                      (FLAG_HIDDEN_ITEMS_START + 161)
#define FLAG_HIDDEN_ITEM_MT_EMBER_EXTERIOR_ULTRA_BALL                      (FLAG_HIDDEN_ITEMS_START + 162)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_DUNSPARCE_TUNNEL_NUGGET              (FLAG_HIDDEN_ITEMS_START + 163)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_PP_UP                                (FLAG_HIDDEN_ITEMS_START + 164)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BOND_BRIDGE_MAX_REPEL                (FLAG_HIDDEN_ITEMS_START + 165)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BOND_BRIDGE_PEARL                    (FLAG_HIDDEN_ITEMS_START + 166)
#define FLAG_HIDDEN_ITEM_THREE_ISLAND_BOND_BRIDGE_STARDUST                 (FLAG_HIDDEN_ITEMS_START + 167)
#define FLAG_HIDDEN_ITEM_FOUR_ISLAND_PEARL                                 (FLAG_HIDDEN_ITEMS_START + 168)
#define FLAG_HIDDEN_ITEM_FOUR_ISLAND_ULTRA_BALL                            (FLAG_HIDDEN_ITEMS_START + 169)
#define FLAG_HIDDEN_ITEM_FIVE_ISLAND_MEMORIAL_PILLAR_BIG_PEARL             (FLAG_HIDDEN_ITEMS_START + 170)
#define FLAG_HIDDEN_ITEM_FIVE_ISLAND_MEMORIAL_PILLAR_RAZZ_BERRY            (FLAG_HIDDEN_ITEMS_START + 171)
#define FLAG_HIDDEN_ITEM_FIVE_ISLAND_MEMORIAL_PILLAR_SITRUS_BERRY          (FLAG_HIDDEN_ITEMS_START + 172)
#define FLAG_HIDDEN_ITEM_FIVE_ISLAND_MEMORIAL_PILLAR_BLUK_BERRY            (FLAG_HIDDEN_ITEMS_START + 173)
#define FLAG_HIDDEN_ITEM_FIVE_ISLAND_RESORT_GORGEOUS_NEST_BALL             (FLAG_HIDDEN_ITEMS_START + 174)
#define FLAG_HIDDEN_ITEM_FIVE_ISLAND_RESORT_GORGEOUS_STARDUST              (FLAG_HIDDEN_ITEMS_START + 175)
#define FLAG_HIDDEN_ITEM_FIVE_ISLAND_RESORT_GORGEOUS_STAR_PIECE            (FLAG_HIDDEN_ITEMS_START + 176)
#define FLAG_HIDDEN_ITEM_FIVE_ISLAND_RESORT_GORGEOUS_STARDUST_2            (FLAG_HIDDEN_ITEMS_START + 177)
#define FLAG_HIDDEN_ITEM_SIX_ISLAND_OUTCAST_ISLAND_STAR_PIECE              (FLAG_HIDDEN_ITEMS_START + 178)
#define FLAG_HIDDEN_ITEM_SIX_ISLAND_OUTCAST_ISLAND_NET_BALL                (FLAG_HIDDEN_ITEMS_START + 179)
#define FLAG_HIDDEN_ITEM_SIX_ISLAND_GREEN_PATH_ULTRA_BALL                  (FLAG_HIDDEN_ITEMS_START + 180)
#define FLAG_HIDDEN_ITEM_SIX_ISLAND_WATER_PATH_ASPEAR_BERRY                (FLAG_HIDDEN_ITEMS_START + 181)
#define FLAG_HIDDEN_ITEM_SIX_ISLAND_WATER_PATH_ORAN_BERRY                  (FLAG_HIDDEN_ITEMS_START + 182)
#define FLAG_HIDDEN_ITEM_SIX_ISLAND_WATER_PATH_PINAP_BERRY                 (FLAG_HIDDEN_ITEMS_START + 183)
#define FLAG_HIDDEN_ITEM_VICTINI_CAVE_NOTHING                            (FLAG_HIDDEN_ITEMS_START + 184)
#define FLAG_HIDDEN_ITEM_SEVEN_ISLAND_TRAINER_TOWER_BIG_PEARL              (FLAG_HIDDEN_ITEMS_START + 185)
#define FLAG_HIDDEN_ITEM_SEVEN_ISLAND_TRAINER_TOWER_PEARL                  (FLAG_HIDDEN_ITEMS_START + 186)
#define FLAG_HIDDEN_ITEM_SEVEN_ISLAND_TRAINER_TOWER_NANAB_BERRY            (FLAG_HIDDEN_ITEMS_START + 187)
#define FLAG_HIDDEN_ITEM_SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE_RAWST_BERRY  (FLAG_HIDDEN_ITEMS_START + 188)
#define FLAG_HIDDEN_ITEM_VIRIDIAN_CITY_GYM_MACHO_BRACE                     (FLAG_HIDDEN_ITEMS_START + 189)
#define FLAG_HIDDEN_ITEM_SSANNE_EXTERIOR_LAVA_COOKIE                       (FLAG_HIDDEN_ITEMS_START + 190)

// Unused hidden item flags
#define FLAG_CSR_ROUTE_4_SIRTUS               0x4A7 // Unused Flag
#define FLAG_CSR_VIRIDIAN_HIDDEN_ETHER               0x4A8 // Unused Flag
#define FLAG_HIDDEN_ITEM_ROUTE3_BERRIES               0x4A9 // Unused Flag
#define FLAG_CSR_UNUSED_13               0x4AA
#define FLAG_CSR_UNUSED_14               0x4AB
#define FLAG_CSR_CRYSTAL_BERRY               0x4AC
#define FLAG_UNUSED_0x4AD               0x4AD // Unused Flag
#define FLAG_UNUSED_0x4AE               0x4AE // Unused Flag
#define FLAG_UNUSED_0x4AF               0x4AF // Unused Flag

// Boss clear flags, 1200
#define FLAG_DEFEATED_BROCK           0x4B0
#define FLAG_DEFEATED_MISTY           0x4B1
#define FLAG_DEFEATED_LT_SURGE        0x4B2
#define FLAG_DEFEATED_ERIKA           0x4B3
#define FLAG_DEFEATED_KOGA            0x4B4
#define FLAG_DEFEATED_SABRINA         0x4B5
#define FLAG_DEFEATED_BLAINE          0x4B6
#define FLAG_DEFEATED_LEADER_GIOVANNI 0x4B7
#define FLAG_DEFEATED_LORELEI         0x4B8
#define FLAG_DEFEATED_BRUNO           0x4B9
#define FLAG_DEFEATED_AGATHA          0x4BA
#define FLAG_DEFEATED_LANCE           0x4BB
#define FLAG_DEFEATED_CHAMP           0x4BC

// Unused?
//Dad Heals
#define FLAG_DAD_PALLET               0x4BD
#define FLAG_DAD_VIRIDIAN_ENTRANCE               0x4BE
#define FLAG_DAD_VIRIDIAN_EXIT               0x4BF
#define FLAG_DAD_ROUTE3               0x4C0
#define FLAG_DAD_MTMOON_1F               0x4C1
#define FLAG_DAD_MTMOON_B1F               0x4C2
#define FLAG_DAD_MTMOON_B2F               0x4C3
#define FLAG_DAD_ROUTE24               0x4C4
#define FLAG_DAD_ROUTE25               0x4C5
#define FLAG_DAD_UNDERGROUNDPATH               0x4C6
#define FLAG_DAD_HAIRCUT               0x4C7
#define FLAG_DAD_PEWTER_GYM               0x4C8
#define FLAG_DAD_CERULEAN_CLUB               0x4C9
#define FLAG_DAD_CELADON_GAMESTORE               0x4CA
#define FLAG_SAFFRON_HIDDEN               0x4CB
#define FLAG_DAD_VERMILLION_GYM               0x4CC
#define FLAG_DAD_ROCKTUNNEL               0x4CD
#define FLAG_DAD_ROUTE8               0x4CE
#define FLAG_DAD_CELADON_GATE               0x4CF
#define FLAG_DAD_SOOTOPOLIS               0x4D0
#define FLAG_DAD_SISTERS               0x4D1
#define FLAG_0x4D2               0x4D2
#define FLAG_0x4D3               0x4D3
#define FLAG_0x4D4               0x4D4
#define FLAG_0x4D5               0x4D5
#define FLAG_0x4D6               0x4D6
#define FLAG_0x4D7               0x4D7
#define FLAG_0x4D8               0x4D8
#define FLAG_0x4D9               0x4D9
#define FLAG_0x4DA               0x4DA
#define FLAG_0x4DB               0x4DB
#define FLAG_0x4DC               0x4DC
#define FLAG_0x4DD               0x4DD
#define FLAG_0x4DE               0x4DE
#define FLAG_0x4DF               0x4DF
#define FLAG_0x4E0               0x4E0
#define FLAG_0x4E1               0x4E1
#define FLAG_0x4E2               0x4E2
#define FLAG_0x4E3               0x4E3
#define FLAG_0x4E4               0x4E4
#define FLAG_0x4E5               0x4E5
#define FLAG_0x4E6               0x4E6
#define FLAG_0x4E7               0x4E7
#define FLAG_0x4E8               0x4E8
#define FLAG_0x4E9               0x4E9
#define FLAG_0x4EA               0x4EA
#define FLAG_0x4EB               0x4EB
#define FLAG_0x4EC               0x4EC
#define FLAG_0x4ED               0x4ED
#define FLAG_0x4EE               0x4EE
#define FLAG_0x4EF               0x4EF
#define FLAG_0x4F0               0x4F0
#define FLAG_0x4F1               0x4F1
#define FLAG_0x4F2               0x4F2
#define FLAG_0x4F3               0x4F3
#define FLAG_0x4F4               0x4F4
#define FLAG_0x4F5               0x4F5
#define FLAG_0x4F6               0x4F6
#define FLAG_0x4F7               0x4F7
#define FLAG_0x4F8               0x4F8
#define FLAG_0x4F9               0x4F9
#define FLAG_0x4FA               0x4FA
#define FLAG_0x4FB               0x4FB
#define FLAG_0x4FC               0x4FC
#define FLAG_0x4FD               0x4FD
#define FLAG_0x4FE               0x4FE
#define FLAG_0x4FF               0x4FF

#define TRAINER_FLAGS_START      (FLAG_0x4FF + 1) //wiz1989 Trainer Flags
#define TRAINER_FLAGS_END        (TRAINER_FLAGS_START + MAX_TRAINERS_COUNT - 1) // 0x7FF

// SYSTEM FLAGS

#define SYS_FLAGS (TRAINER_FLAGS_END + 1) // 0x800

// Temporary system flags
#define FLAG_SYS_SAFARI_MODE                                        (SYS_FLAGS + 0x0)
#define FLAG_SYS_VS_SEEKER_CHARGING                                 (SYS_FLAGS + 0x1)
#define FLAG_SYS_CRUISE_MODE                                        (SYS_FLAGS + 0x2)
#define FLAG_SYS_WHITE_FLUTE_ACTIVE                                 (SYS_FLAGS + 0x3)
#define FLAG_SYS_BLACK_FLUTE_ACTIVE                                 (SYS_FLAGS + 0x4)
#define FLAG_SYS_USE_STRENGTH                                       (SYS_FLAGS + 0x5)
#define FLAG_SYS_FLASH_ACTIVE                                       (SYS_FLAGS + 0x6)
#define FLAG_SYS_SPECIAL_WILD_BATTLE                                (SYS_FLAGS + 0x7)

#define FLAG_SYS_QL_DEPARTED                                        (SYS_FLAGS + 0x8)
#define FLAG_SYS_CSR_VICTORY                                        (SYS_FLAGS + 0x9)
#define FLAG_SYS_EXEGGUTOR                                          (SYS_FLAGS + 0xA)
#define FLAG_SYS_SNORLAX_FIGHT                                      (SYS_FLAGS + 0xB)
#define FLAG_SYS_KANGA_FIGHT                                        (SYS_FLAGS + 0xC)
#define FLAG_SYS_MAX_REPEL                                          (SYS_FLAGS + 0xD)
#define FLAG_SYS_DISABLE_SAVE                                       (SYS_FLAGS + 0xE)
#define FLAG_SYS_CARRYING_BOX                                       (SYS_FLAGS + 0xF)
#define FLAG_SYS_BILL_GARDEN                                        (SYS_FLAGS + 0x10)
#define FLAG_SYS_SKUNTANK_FIGHT                                     (SYS_FLAGS + 0x11)
#define FLAG_SYS_ROTOM_MENU                                         (SYS_FLAGS + 0x12)
#define FLAG_DEFEATED_FINAL_BOSS                                    (SYS_FLAGS + 0x13)
#define FLAG_SYS_ROTOM_BATTLE_UI                                    (SYS_FLAGS + 0x14)
#define FLAG_0x815                                                  (SYS_FLAGS + 0x15)
#define FLAG_0x816                                                  (SYS_FLAGS + 0x16)
#define FLAG_0x817                                                  (SYS_FLAGS + 0x17)
#define FLAG_0x818                                                  (SYS_FLAGS + 0x18)
#define FLAG_0x819                                                  (SYS_FLAGS + 0x19)
#define FLAG_0x81A                                                  (SYS_FLAGS + 0x1A)
#define FLAG_0x81B                                                  (SYS_FLAGS + 0x1B)
#define FLAG_0x81C                                                  (SYS_FLAGS + 0x1C)
#define FLAG_0x81D                                                  (SYS_FLAGS + 0x1D)
#define FLAG_0x81E                                                  (SYS_FLAGS + 0x1E)
#define FLAG_0x81F                                                  (SYS_FLAGS + 0x1F)

// Permanent system flags
#define PERMA_SYS_FLAGS_START                                       (FLAG_0x81F + 1)

#define FLAG_BADGE01_GET                                            (SYS_FLAGS + 0x20)
#define FLAG_BADGE02_GET                                            (SYS_FLAGS + 0x21)
#define FLAG_BADGE03_GET                                            (SYS_FLAGS + 0x22)
#define FLAG_BADGE04_GET                                            (SYS_FLAGS + 0x23)
#define FLAG_BADGE05_GET                                            (SYS_FLAGS + 0x24)
#define FLAG_BADGE06_GET                                            (SYS_FLAGS + 0x25)
#define FLAG_BADGE07_GET                                            (SYS_FLAGS + 0x26)
#define FLAG_BADGE08_GET                                            (SYS_FLAGS + 0x27)
#define NUM_BADGES                                                  10 //The badges are seperated in the flags, so I'm just setting it to a raw number

#define FLAG_SYS_POKEMON_GET                                        (SYS_FLAGS + 0x28)
#define FLAG_SYS_POKEDEX_GET                                        (SYS_FLAGS + 0x29)
#define FLAG_SYS_IS_FULL_RELEASE                                    (SYS_FLAGS + 0x2A) //For locking surf out of demo 3
#define FLAG_SYS_IS_CREDITS                                         (SYS_FLAGS + 0x2B)
#define FLAG_SYS_GAME_CLEAR                                         (SYS_FLAGS + 0x2C)
#define FLAG_SYS_SET_TRAINER_CARD_PROFILE                           (SYS_FLAGS + 0x2D)
#define FLAG_SYS_FUSHCIA_DISABLE_FLY                                (SYS_FLAGS + 0x2E)
#define FLAG_SYS_B_DASH                                             (SYS_FLAGS + 0x2F)
#define FLAG_SYS_ON_CYCLING_ROAD                                    (SYS_FLAGS + 0x30)
#define FLAG_0x831                                                  (SYS_FLAGS + 0x31)
#define FLAG_0x832                                                  (SYS_FLAGS + 0x32)
#define FLAG_0x833                                                  (SYS_FLAGS + 0x33)
#define FLAG_SYS_NOT_SOMEONES_PC                                    (SYS_FLAGS + 0x34)
#define FLAG_0x835                                                  (SYS_FLAGS + 0x35)
#define FLAG_0x836                                                  (SYS_FLAGS + 0x36)
#define FLAG_SYS_RESET_RTC_ENABLE                                   (SYS_FLAGS + 0x37)
#define FLAG_0x838                                                  (SYS_FLAGS + 0x38) // Set, never read
#define FLAG_SYS_MYSTERY_GIFT_ENABLED                               (SYS_FLAGS + 0x39)
#define FLAG_0x83A                                                  (SYS_FLAGS + 0x3A)
#define FLAG_SYS_RIBBON_GET                                         (SYS_FLAGS + 0x3B)
#define FLAG_SYS_SAW_HELP_SYSTEM_INTRO                              (SYS_FLAGS + 0x3C)
#define FLAG_0x83D                                                  (SYS_FLAGS + 0x3D)
#define FLAG_OPENED_START_MENU                                      (SYS_FLAGS + 0x3E)
#define FLAG_0x83F                                                  (SYS_FLAGS + 0x3F)
#define FLAG_SYS_NATIONAL_DEX                                       (SYS_FLAGS + 0x40)
#define FLAG_SYS_PC_STORAGE_DISABLED                                (SYS_FLAGS + 0x41)
#define FLAG_SYS_INFORMED_OF_LOCAL_WIRELESS_PLAYER                  (SYS_FLAGS + 0x42)
#define FLAG_SHOWN_BOX_WAS_FULL_MESSAGE                             (SYS_FLAGS + 0x43)
#define FLAG_SYS_CAN_LINK_WITH_RS                                   (SYS_FLAGS + 0x44)
#define FLAG_SYS_SEVII_MAP_123                                      (SYS_FLAGS + 0x45)
#define FLAG_SYS_SEVII_MAP_4567                                     (SYS_FLAGS + 0x46)
#define FLAG_SYS_GOT_BERRY_POUCH                                    (SYS_FLAGS + 0x47)
#define FLAG_SYS_DEOXYS_AWAKENED                                    (SYS_FLAGS + 0x48)
#define FLAG_SYS_UNLOCKED_TANOBY_RUINS                              (SYS_FLAGS + 0x49)
#define FLAG_ENABLE_SHIP_NAVEL_ROCK                                 (SYS_FLAGS + 0x4A)
#define FLAG_ENABLE_SHIP_BIRTH_ISLAND                               (SYS_FLAGS + 0x4B)

// World Map Flags
#define FLAG_WORLD_MAP_PALLET_TOWN                                  (SYS_FLAGS + 0x90)
#define FLAG_WORLD_MAP_VIRIDIAN_CITY                                (SYS_FLAGS + 0x91)
#define FLAG_WORLD_MAP_PEWTER_CITY                                  (SYS_FLAGS + 0x92)
#define FLAG_WORLD_MAP_CERULEAN_CITY                                (SYS_FLAGS + 0x93)
#define FLAG_WORLD_MAP_LAVENDER_TOWN                                (SYS_FLAGS + 0x94)
#define FLAG_WORLD_MAP_VERMILION_CITY                               (SYS_FLAGS + 0x95)
#define FLAG_WORLD_MAP_CELADON_CITY                                 (SYS_FLAGS + 0x96)
#define FLAG_WORLD_MAP_FUSHCIA_CITY                                 (SYS_FLAGS + 0x97)
#define FLAG_WORLD_MAP_CINNABAR_ISLAND                              (SYS_FLAGS + 0x98)
#define FLAG_WORLD_MAP_INDIGO_PLATEAU_EXTERIOR                      (SYS_FLAGS + 0x99)
#define FLAG_WORLD_MAP_SAFFRON_CITY                                 (SYS_FLAGS + 0x9A)
#define FLAG_WORLD_MAP_ONE_ISLAND                                   (SYS_FLAGS + 0x9B)
#define FLAG_WORLD_MAP_TWO_ISLAND                                   (SYS_FLAGS + 0x9C)
#define FLAG_WORLD_MAP_THREE_ISLAND                                 (SYS_FLAGS + 0x9D)
#define FLAG_WORLD_MAP_FOUR_ISLAND                                  (SYS_FLAGS + 0x9E)
#define FLAG_WORLD_MAP_FIVE_ISLAND                                  (SYS_FLAGS + 0x9F)
#define FLAG_WORLD_MAP_SEVEN_ISLAND                                 (SYS_FLAGS + 0xA0)
#define FLAG_WORLD_MAP_SIX_ISLAND                                   (SYS_FLAGS + 0xA1)
#define FLAG_WORLD_MAP_ROUTE4_POKEMON_CENTER_1F                     (SYS_FLAGS + 0xA2)
#define FLAG_WORLD_MAP_ROUTE10_POKEMON_CENTER_1F                    (SYS_FLAGS + 0xA3)
#define FLAG_WORLD_MAP_VIRIDIAN_FOREST                              (SYS_FLAGS + 0xA4)
#define FLAG_WORLD_MAP_MT_MOON_1F                                   (SYS_FLAGS + 0xA5)
#define FLAG_WORLD_MAP_SSANNE_EXTERIOR                              (SYS_FLAGS + 0xA6)
#define FLAG_WORLD_MAP_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL          (SYS_FLAGS + 0xA7)
#define FLAG_WORLD_MAP_UNDERGROUND_PATH_EAST_WEST_TUNNEL            (SYS_FLAGS + 0xA8)
#define FLAG_WORLD_MAP_DIGLETTS_CAVE_B1F                            (SYS_FLAGS + 0xA9)
#define FLAG_WORLD_MAP_VICTORY_ROAD_1F                              (SYS_FLAGS + 0xAA)
#define FLAG_WORLD_MAP_ROCKET_HIDEOUT_B1F                           (SYS_FLAGS + 0xAB)
#define FLAG_WORLD_MAP_SILPH_CO_1F                                  (SYS_FLAGS + 0xAC)
#define FLAG_WORLD_MAP_POKEMON_MANSION_1F                           (SYS_FLAGS + 0xAD)
#define FLAG_WORLD_MAP_SAFARI_ZONE_CENTER                           (SYS_FLAGS + 0xAE)
#define FLAG_WORLD_MAP_POKEMON_LEAGUE_LORELEIS_ROOM                 (SYS_FLAGS + 0xAF)
#define FLAG_WORLD_MAP_ROCK_TUNNEL_1F                               (SYS_FLAGS + 0xB0)
#define FLAG_WORLD_MAP_SEAFOAM_ISLANDS_1F                           (SYS_FLAGS + 0xB1)
#define FLAG_WORLD_MAP_POKEMON_TOWER_1F                             (SYS_FLAGS + 0xB2)
#define FLAG_WORLD_MAP_CERULEAN_CAVE_1F                             (SYS_FLAGS + 0xB3)
#define FLAG_WORLD_MAP_POWER_PLANT                                  (SYS_FLAGS + 0xB4)
#define FLAG_WORLD_MAP_NAVEL_ROCK_EXTERIOR                          (SYS_FLAGS + 0xB5)
#define FLAG_WORLD_MAP_MT_EMBER_EXTERIOR                            (SYS_FLAGS + 0xB6)
#define FLAG_WORLD_MAP_THREE_ISLAND_BERRY_FOREST                    (SYS_FLAGS + 0xB7)
#define FLAG_WORLD_MAP_FOUR_ISLAND_ICEFALL_CAVE_ENTRANCE            (SYS_FLAGS + 0xB8)
#define FLAG_WORLD_MAP_FIVE_ISLAND_ROCKET_WAREHOUSE                 (SYS_FLAGS + 0xB9)
#define FLAG_WORLD_MAP_TRAINER_TOWER_LOBBY                          (SYS_FLAGS + 0xBA)
#define FLAG_WORLD_MAP_SIX_ISLAND_DOTTED_HOLE_1F                    (SYS_FLAGS + 0xBB)
#define FLAG_WORLD_MAP_CELADON_POKEMON_CENTER               (SYS_FLAGS + 0xBC)
#define FLAG_WORLD_MAP_SIX_ISLAND_PATTERN_BUSH                      (SYS_FLAGS + 0xBD)
#define FLAG_WORLD_MAP_SIX_ISLAND_ALTERING_CAVE                     (SYS_FLAGS + 0xBE)
#define FLAG_WORLD_MAP_SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER     (SYS_FLAGS + 0xBF)
#define FLAG_WORLD_MAP_THREE_ISLAND_DUNSPARCE_TUNNEL                (SYS_FLAGS + 0xC0)
#define FLAG_WORLD_MAP_SEVEN_ISLAND_SEVAULT_CANYON_TANOBY_KEY       (SYS_FLAGS + 0xC1)
#define FLAG_WORLD_MAP_BIRTH_ISLAND_EXTERIOR                        (SYS_FLAGS + 0xC2)

#define FLAG_CSR_MAP_ROUTE_22     /*Set*/                           (SYS_FLAGS + 0xC3) //Only set after Dex
#define FLAG_CSR_MAP_ROUTE_3_FAR       /*Set*/                      (SYS_FLAGS + 0xC4)
#define FLAG_CSR_MAP_ROUTE_4_FAR                                    (SYS_FLAGS + 0xC5)
#define FLAG_CSR_MAP_ROUTE_24_FAR                                   (SYS_FLAGS + 0xC6)
#define FLAG_CSR_MAP_CERULEAN_GYM                                   (SYS_FLAGS + 0xC7)
#define FLAG_CSR_MAP_ROUTE_5                                        (SYS_FLAGS + 0xC8)
#define FLAG_CSR_MAP_ROUTE_11                                       (SYS_FLAGS + 0xC9)
#define FLAG_CSR_MAP_ROUTE_9_FAR                                    (SYS_FLAGS + 0xCA)
#define FLAG_CSR_MAP_ROUTE_10                                       (SYS_FLAGS + 0xCB)
#define FLAG_CSR_MAP_ROUTE_7                                        (SYS_FLAGS + 0xCC)
#define FLAG_CSR_MAP_ROUTE_8_FAR                                    (SYS_FLAGS + 0xCD)
#define FLAG_CSR_MAP_SOOTOPOLIS                                     (SYS_FLAGS + 0xCE)
#define FLAG_CSR_MAP_ROUTE_4_CENTER                                 (SYS_FLAGS + 0xCF)
#define FLAG_CSR_MAP_MT_MOON_BASEMENT                               (SYS_FLAGS + 0xD0)
#define FLAG_CSR_SUN_STONE_FOUND                                    (SYS_FLAGS + 0xD1)
#define FLAG_CSR_MAP_STONE_EMPORIUM                                 (SYS_FLAGS + 0xD2)
#define FLAG_CSR_MAP_BROCK_GYM                                      (SYS_FLAGS + 0xD3)
#define FLAG_CSR_MAP_SECRET_GARDEN                                  (SYS_FLAGS + 0xD4)
#define FLAG_CSR_MAP_SKY_TOWER                                      (SYS_FLAGS + 0xD5)
#define FLAG_CSR_MAP_BRENDANMAY                                     (SYS_FLAGS + 0xD6)
#define FLAG_CSR_MAP_NATIONAL_PARK                                  (SYS_FLAGS + 0xD7)
#define FLAG_CSR_MAP_BALL_SHOP                                      (SYS_FLAGS + 0xD8)
#define FLAG_CSR_VIRIDIAN_GYM_BACK_ROOM                             (SYS_FLAGS + 0xD9)
#define FLAG_WORLD_MAP_PIRATE_BAY                                   (SYS_FLAGS + 0xDA)
#define FLAG_CSR_MAP_DUMMY_6                                        (SYS_FLAGS + 0xDB)
#define FLAG_CSR_MAP_PRIZE_EXCHANGE                                 (SYS_FLAGS + 0xDC)
#define FLAG_CSR_MAP_DUMMY_7                                        (SYS_FLAGS + 0xDD)
#define FLAG_CSR_MAP_CAVE_OF_ORIGIN                                 (SYS_FLAGS + 0xDE)
#define FLAG_CSR_MAP_DUMMY_8                                        (SYS_FLAGS + 0xDF)
#define FLAG_CSR_MAP_GAME_SHOP                                      (SYS_FLAGS + 0xE0)
#define FLAG_CSR_MAP_EEVEE_ROOM                                     (SYS_FLAGS + 0xE1)
#define FLAG_CSR_MAP_THIRTY_EIGHT_ISLAND                            (SYS_FLAGS + 0xE2)
#define FLAG_CSR_MAP_DUMMY_10                                       (SYS_FLAGS + 0xE3)
#define FLAG_CSR_MAP_DUMMY_11                                       (SYS_FLAGS + 0xE4)
#define FLAG_CSR_MAP_DUMMY_12                                       (SYS_FLAGS + 0xE5)
#define FLAG_CSR_MAP_DUMMY_13                                       (SYS_FLAGS + 0xE6)
#define FLAG_CSR_MAP_DUMMY_14                                       (SYS_FLAGS + 0xE7)
#define FLAG_CSR_MAP_MINNESOTA                                      (SYS_FLAGS + 0xE8)
#define FLAG_CSR_MAP_ROUTE_16_FAR                                   (SYS_FLAGS + 0xE9)
#define FLAG_CSR_MAP_DUMMY_15                                       (SYS_FLAGS + 0xEA)
#define FLAG_CSR_MAP_DUMMY_16                                       (SYS_FLAGS + 0xEB)
#define FLAG_CSR_MAP_DUMMY_17                                       (SYS_FLAGS + 0xEC)
#define FLAG_CSR_MAP_DUMMY_18                                       (SYS_FLAGS + 0xED)
#define FLAG_CSR_MAP_DUMMY_19  /*Set*/                              (SYS_FLAGS + 0xEE)
#define FLAG_WORLD_MAP_POKEMON_LEAGUE_GAUNTLET                      (SYS_FLAGS + 0xEF)
#define FLAG_CSR_MAP_MT_MOON_SQUARE                                 (SYS_FLAGS + 0xF0)
#define FLAG_CSR_MAP_YES                                            (SYS_FLAGS + 0xF1)
#define FLAG_CSR_MAP_AMITY_SQUARE                                   (SYS_FLAGS + 0xF2)
#define FLAG_CSR_MAP_POKEMON_ISLAND                                 (SYS_FLAGS + 0xF3)
#define FLAG_CSR_MAP_AETHER_PARADISE                                (SYS_FLAGS + 0xF4)
#define FLAG_CSR_MAP_KANTO_LIGHTHOUSE                               (SYS_FLAGS + 0xF5)
#define FLAG_CSR_MAP_ALTAR_OF_MOONE                                 (SYS_FLAGS + 0xF6)
#define FLAG_CSR_MAP_SECRET_TUNNEL                                  (SYS_FLAGS + 0xF7)
#define FLAG_CSR_MAP_ZERO_ISLAND                                    (SYS_FLAGS + 0xF8)
#define FLAG_CSR_MAP_DUMMY_21                                       (SYS_FLAGS + 0xF9)
#define FLAG_CSR_MAP_DUMMY_22                                       (SYS_FLAGS + 0xFA)
#define FLAG_CSR_MAP_ROUTE_9                                        (SYS_FLAGS + 0xFB)
#define FLAG_0x8FC                                                  (SYS_FLAGS + 0xFC)
#define FLAG_0x8FD                                                  (SYS_FLAGS + 0xFD)
#define FLAG_0x8FE                                                  (SYS_FLAGS + 0xFE)
#define FLAG_CSR_DEX_DUMMY                                          (SYS_FLAGS + 0xFF)

#define FLAGS_COUNT (FLAG_CSR_DEX_DUMMY + 1)

// Special Flags (Stored in EWRAM (sSpecialFlags, not in the SaveBlock)
#define SPECIAL_FLAGS_START           0x4000
#define FLAG_DONT_SHOW_MAP_NAME_POPUP (SPECIAL_FLAGS_START + 0x0)
#define FLAG_DONT_TRANSITION_MUSIC    (SPECIAL_FLAGS_START + 0x1)
// FLAG_SPECIAL_FLAG_0x4002 - 0x407F also exist and are unused
#define SPECIAL_FLAGS_END             (SPECIAL_FLAGS_START + 0x7F)

#endif // GUARD_CONSTANTS_FLAGS_H
