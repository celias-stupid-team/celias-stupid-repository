#ifndef GUARD_CONSTANTS_BATTLE_ANIM_H
#define GUARD_CONSTANTS_BATTLE_ANIM_H

// Sprites start at 10000 and thus must be subtracted of 10000 to account for the true index.
#define GET_TRUE_SPRITE_INDEX(i) ((i - ANIM_SPRITES_START))

// Particle ids.
#define ANIM_SPRITES_START 10000

#define ANIM_TAG_BONE                       (ANIM_SPRITES_START + 0)
#define ANIM_TAG_SPARK                      (ANIM_SPRITES_START + 1)
#define ANIM_TAG_PENCIL                     (ANIM_SPRITES_START + 2)
#define ANIM_TAG_AIR_WAVE                   (ANIM_SPRITES_START + 3)
#define ANIM_TAG_ORB                        (ANIM_SPRITES_START + 4)
#define ANIM_TAG_SWORD                      (ANIM_SPRITES_START + 5)
#define ANIM_TAG_SEED                       (ANIM_SPRITES_START + 6)
#define ANIM_TAG_EXPLOSION_6                (ANIM_SPRITES_START + 7)
#define ANIM_TAG_PINK_ORB                   (ANIM_SPRITES_START + 8) // unused
#define ANIM_TAG_GUST                       (ANIM_SPRITES_START + 9)
#define ANIM_TAG_ICE_CUBE                   (ANIM_SPRITES_START + 10)
#define ANIM_TAG_SPARK_2                    (ANIM_SPRITES_START + 11)
#define ANIM_TAG_ORANGE                     (ANIM_SPRITES_START + 12) // unused
#define ANIM_TAG_YELLOW_BALL                (ANIM_SPRITES_START + 13)
#define ANIM_TAG_LOCK_ON                    (ANIM_SPRITES_START + 14)
#define ANIM_TAG_TIED_BAG                   (ANIM_SPRITES_START + 15)
#define ANIM_TAG_BLACK_SMOKE                (ANIM_SPRITES_START + 16)
#define ANIM_TAG_BLACK_BALL                 (ANIM_SPRITES_START + 17)
#define ANIM_TAG_CONVERSION                 (ANIM_SPRITES_START + 18)
#define ANIM_TAG_GLASS                      (ANIM_SPRITES_START + 19) // unused
#define ANIM_TAG_HORN_HIT                   (ANIM_SPRITES_START + 20)
#define ANIM_TAG_HIT                        (ANIM_SPRITES_START + 21)
#define ANIM_TAG_HIT_2                      (ANIM_SPRITES_START + 22)
#define ANIM_TAG_BLUE_SHARDS                (ANIM_SPRITES_START + 23) // unused
#define ANIM_TAG_CLOSING_EYE                (ANIM_SPRITES_START + 24) // unused
#define ANIM_TAG_WAVING_HAND                (ANIM_SPRITES_START + 25) // unused
#define ANIM_TAG_HIT_DUPLICATE              (ANIM_SPRITES_START + 26) // unused
#define ANIM_TAG_LEER                       (ANIM_SPRITES_START + 27)
#define ANIM_TAG_BLUE_BURST                 (ANIM_SPRITES_START + 28) // unused
#define ANIM_TAG_SMALL_EMBER                (ANIM_SPRITES_START + 29)
#define ANIM_TAG_GRAY_SMOKE                 (ANIM_SPRITES_START + 30)
#define ANIM_TAG_BLUE_STAR                  (ANIM_SPRITES_START + 31)
#define ANIM_TAG_BUBBLE_BURST               (ANIM_SPRITES_START + 32)
#define ANIM_TAG_FIRE                       (ANIM_SPRITES_START + 33)
#define ANIM_TAG_SPINNING_FIRE              (ANIM_SPRITES_START + 34) // unused
#define ANIM_TAG_FIRE_PLUME                 (ANIM_SPRITES_START + 35)
#define ANIM_TAG_LIGHTNING_2                (ANIM_SPRITES_START + 36) // unused
#define ANIM_TAG_LIGHTNING                  (ANIM_SPRITES_START + 37)
#define ANIM_TAG_CLAW_SLASH_2               (ANIM_SPRITES_START + 38) // unused
#define ANIM_TAG_CLAW_SLASH                 (ANIM_SPRITES_START + 39)
#define ANIM_TAG_SCRATCH_3                  (ANIM_SPRITES_START + 40) // unused
#define ANIM_TAG_SCRATCH_2                  (ANIM_SPRITES_START + 41) // unused
#define ANIM_TAG_BUBBLE_BURST_2             (ANIM_SPRITES_START + 42) // unused
#define ANIM_TAG_ICE_CHUNK                  (ANIM_SPRITES_START + 43)
#define ANIM_TAG_GLASS_2                    (ANIM_SPRITES_START + 44) // unused
#define ANIM_TAG_PINK_HEART_2               (ANIM_SPRITES_START + 45) // unused
#define ANIM_TAG_SAP_DRIP                   (ANIM_SPRITES_START + 46) // unused
#define ANIM_TAG_SAP_DRIP_2                 (ANIM_SPRITES_START + 47) // unused
#define ANIM_TAG_SPARKLE_1                  (ANIM_SPRITES_START + 48)
#define ANIM_TAG_SPARKLE_2                  (ANIM_SPRITES_START + 49)
#define ANIM_TAG_HUMANOID_FOOT              (ANIM_SPRITES_START + 50)
#define ANIM_TAG_MONSTER_FOOT               (ANIM_SPRITES_START + 51)
#define ANIM_TAG_HUMANOID_HAND              (ANIM_SPRITES_START + 52) // unused
#define ANIM_TAG_NOISE_LINE                 (ANIM_SPRITES_START + 53)
#define ANIM_TAG_YELLOW_UNK                 (ANIM_SPRITES_START + 54) // unused
#define ANIM_TAG_RED_FIST                   (ANIM_SPRITES_START + 55) // unused
#define ANIM_TAG_SLAM_HIT                   (ANIM_SPRITES_START + 56)
#define ANIM_TAG_RING                       (ANIM_SPRITES_START + 57) // unused
#define ANIM_TAG_ROCKS                      (ANIM_SPRITES_START + 58)
#define ANIM_TAG_Z                          (ANIM_SPRITES_START + 59) // unused
#define ANIM_TAG_YELLOW_UNK_2               (ANIM_SPRITES_START + 60) // unused
#define ANIM_TAG_AIR_SLASH                  (ANIM_SPRITES_START + 61) // unused
#define ANIM_TAG_SPINNING_GREEN_ORBS        (ANIM_SPRITES_START + 62) // unused
#define ANIM_TAG_LEAF                       (ANIM_SPRITES_START + 63)
#define ANIM_TAG_FINGER                     (ANIM_SPRITES_START + 64)
#define ANIM_TAG_POISON_POWDER              (ANIM_SPRITES_START + 65)
#define ANIM_TAG_BROWN_TRIANGLE             (ANIM_SPRITES_START + 66) // unused
#define ANIM_TAG_SLEEP_POWDER               (ANIM_SPRITES_START + 67)
#define ANIM_TAG_STUN_SPORE                 (ANIM_SPRITES_START + 68)
#define ANIM_TAG_POWDER                     (ANIM_SPRITES_START + 69) // unused
#define ANIM_TAG_SPARKLE_3                  (ANIM_SPRITES_START + 70)
#define ANIM_TAG_SPARKLE_4                  (ANIM_SPRITES_START + 71)
#define ANIM_TAG_MUSIC_NOTES                (ANIM_SPRITES_START + 72)
#define ANIM_TAG_DUCK                       (ANIM_SPRITES_START + 73)
#define ANIM_TAG_MUD_SAND                   (ANIM_SPRITES_START + 74)
#define ANIM_TAG_ALERT                      (ANIM_SPRITES_START + 75)
#define ANIM_TAG_BLUE_FLAMES                (ANIM_SPRITES_START + 76) // unused
#define ANIM_TAG_BLUE_FLAMES_2              (ANIM_SPRITES_START + 77) // unused
#define ANIM_TAG_SHOCK_4                    (ANIM_SPRITES_START + 78) // unused
#define ANIM_TAG_SHOCK                      (ANIM_SPRITES_START + 79)
#define ANIM_TAG_BELL_2                     (ANIM_SPRITES_START + 80) // unused
#define ANIM_TAG_PINK_GLOVE                 (ANIM_SPRITES_START + 81) // unused
#define ANIM_TAG_BLUE_LINES                 (ANIM_SPRITES_START + 82) // unused
#define ANIM_TAG_IMPACT_3                   (ANIM_SPRITES_START + 83) // unused
#define ANIM_TAG_IMPACT_2                   (ANIM_SPRITES_START + 84) // unused
#define ANIM_TAG_RETICLE                    (ANIM_SPRITES_START + 85) // unused
#define ANIM_TAG_BREATH                     (ANIM_SPRITES_START + 86)
#define ANIM_TAG_ANGER                      (ANIM_SPRITES_START + 87)
#define ANIM_TAG_SNOWBALL                   (ANIM_SPRITES_START + 88) // unused
#define ANIM_TAG_VINE                       (ANIM_SPRITES_START + 89) // unused
#define ANIM_TAG_SWORD_2                    (ANIM_SPRITES_START + 90) // unused
#define ANIM_TAG_CLAPPING                   (ANIM_SPRITES_START + 91) // unused
#define ANIM_TAG_RED_TUBE                   (ANIM_SPRITES_START + 92) // unused
#define ANIM_TAG_AMNESIA                    (ANIM_SPRITES_START + 93)
#define ANIM_TAG_STRING_2                   (ANIM_SPRITES_START + 94) // unused
#define ANIM_TAG_PENCIL_2                   (ANIM_SPRITES_START + 95) // unused
#define ANIM_TAG_PETAL                      (ANIM_SPRITES_START + 96) // unused
#define ANIM_TAG_BENT_SPOON                 (ANIM_SPRITES_START + 97)
#define ANIM_TAG_WEB                        (ANIM_SPRITES_START + 98) // unused
#define ANIM_TAG_MILK_BOTTLE                (ANIM_SPRITES_START + 99)
#define ANIM_TAG_COIN                       (ANIM_SPRITES_START + 100)
#define ANIM_TAG_CRACKED_EGG                (ANIM_SPRITES_START + 101) // unused
#define ANIM_TAG_HATCHED_EGG                (ANIM_SPRITES_START + 102) // unused
#define ANIM_TAG_FRESH_EGG                  (ANIM_SPRITES_START + 103) // unused
#define ANIM_TAG_FANGS                      (ANIM_SPRITES_START + 104) // unused
#define ANIM_TAG_EXPLOSION_2                (ANIM_SPRITES_START + 105) // unused
#define ANIM_TAG_EXPLOSION_3                (ANIM_SPRITES_START + 106) // unused
#define ANIM_TAG_WATER_DROPLET              (ANIM_SPRITES_START + 107) // unused
#define ANIM_TAG_WATER_DROPLET_2            (ANIM_SPRITES_START + 108) // unused
#define ANIM_TAG_SEED_2                     (ANIM_SPRITES_START + 109) // unused
#define ANIM_TAG_SPROUT                     (ANIM_SPRITES_START + 110) // unused
#define ANIM_TAG_RED_WAND                   (ANIM_SPRITES_START + 111) // unused
#define ANIM_TAG_PURPLE_GREEN_UNK           (ANIM_SPRITES_START + 112) // unused
#define ANIM_TAG_WATER_COLUMN               (ANIM_SPRITES_START + 113) // unused
#define ANIM_TAG_MUD_UNK                    (ANIM_SPRITES_START + 114) // unused
#define ANIM_TAG_RAIN_DROPS                 (ANIM_SPRITES_START + 115)
#define ANIM_TAG_FURY_SWIPES                (ANIM_SPRITES_START + 116) // unused
#define ANIM_TAG_VINE_2                     (ANIM_SPRITES_START + 117) // unused
#define ANIM_TAG_TEETH                      (ANIM_SPRITES_START + 118) // unused
#define ANIM_TAG_BONE_2                     (ANIM_SPRITES_START + 119) // unused
#define ANIM_TAG_WHITE_BAG                  (ANIM_SPRITES_START + 120) // unused
#define ANIM_TAG_UNKNOWN                    (ANIM_SPRITES_START + 121) // unused
#define ANIM_TAG_PURPLE_CORAL               (ANIM_SPRITES_START + 122) // unused
#define ANIM_TAG_PURPLE_DROPLET             (ANIM_SPRITES_START + 123) // unused
#define ANIM_TAG_SHOCK_2                    (ANIM_SPRITES_START + 124) // unused
#define ANIM_TAG_CLOSING_EYE_2              (ANIM_SPRITES_START + 125) // unused
#define ANIM_TAG_METAL_BALL                 (ANIM_SPRITES_START + 126) // unused
#define ANIM_TAG_MONSTER_DOLL               (ANIM_SPRITES_START + 127) // unused
#define ANIM_TAG_WHIRLWIND                  (ANIM_SPRITES_START + 128) // unused
#define ANIM_TAG_WHIRLWIND_2                (ANIM_SPRITES_START + 129) // unused
#define ANIM_TAG_EXPLOSION_4                (ANIM_SPRITES_START + 130) // unused
#define ANIM_TAG_EXPLOSION_5                (ANIM_SPRITES_START + 131) // unused
#define ANIM_TAG_TONGUE                     (ANIM_SPRITES_START + 132) // unused
#define ANIM_TAG_SMOKE                      (ANIM_SPRITES_START + 133) // unused
#define ANIM_TAG_SMOKE_2                    (ANIM_SPRITES_START + 134) // unused
#define ANIM_TAG_IMPACT                     (ANIM_SPRITES_START + 135)
#define ANIM_TAG_CIRCLE_IMPACT              (ANIM_SPRITES_START + 136)
#define ANIM_TAG_SCRATCH                    (ANIM_SPRITES_START + 137)
#define ANIM_TAG_CUT                        (ANIM_SPRITES_START + 138)
#define ANIM_TAG_SHARP_TEETH                (ANIM_SPRITES_START + 139)
#define ANIM_TAG_RAINBOW_RINGS              (ANIM_SPRITES_START + 140)
#define ANIM_TAG_ICE_CRYSTALS               (ANIM_SPRITES_START + 141)
#define ANIM_TAG_ICE_SPIKES                 (ANIM_SPRITES_START + 142)
#define ANIM_TAG_HANDS_AND_FEET             (ANIM_SPRITES_START + 143)
#define ANIM_TAG_MIST_CLOUD                 (ANIM_SPRITES_START + 144)
#define ANIM_TAG_CLAMP                      (ANIM_SPRITES_START + 145)
#define ANIM_TAG_BUBBLE                     (ANIM_SPRITES_START + 146)
#define ANIM_TAG_ORBS                       (ANIM_SPRITES_START + 147)
#define ANIM_TAG_WATER_IMPACT               (ANIM_SPRITES_START + 148)
#define ANIM_TAG_WATER_ORB                  (ANIM_SPRITES_START + 149)
#define ANIM_TAG_POISON_BUBBLE              (ANIM_SPRITES_START + 150)
#define ANIM_TAG_TOXIC_BUBBLE               (ANIM_SPRITES_START + 151)
#define ANIM_TAG_SPIKES                     (ANIM_SPRITES_START + 152)
#define ANIM_TAG_HORN_HIT_2                 (ANIM_SPRITES_START + 153)
#define ANIM_TAG_AIR_WAVE_2                 (ANIM_SPRITES_START + 154)
#define ANIM_TAG_SMALL_BUBBLES              (ANIM_SPRITES_START + 155)
#define ANIM_TAG_ROUND_SHADOW               (ANIM_SPRITES_START + 156)
#define ANIM_TAG_SUNLIGHT                   (ANIM_SPRITES_START + 157)
#define ANIM_TAG_SPORE                      (ANIM_SPRITES_START + 158)
#define ANIM_TAG_FLOWER                     (ANIM_SPRITES_START + 159)
#define ANIM_TAG_RAZOR_LEAF                 (ANIM_SPRITES_START + 160)
#define ANIM_TAG_NEEDLE                     (ANIM_SPRITES_START + 161)
#define ANIM_TAG_WHIRLWIND_LINES            (ANIM_SPRITES_START + 162)
#define ANIM_TAG_GOLD_RING                  (ANIM_SPRITES_START + 163)
#define ANIM_TAG_PURPLE_RING                (ANIM_SPRITES_START + 164)
#define ANIM_TAG_BLUE_RING                  (ANIM_SPRITES_START + 165)
#define ANIM_TAG_GREEN_LIGHT_WALL           (ANIM_SPRITES_START + 166)
#define ANIM_TAG_BLUE_LIGHT_WALL            (ANIM_SPRITES_START + 167)
#define ANIM_TAG_RED_LIGHT_WALL             (ANIM_SPRITES_START + 168)
#define ANIM_TAG_GRAY_LIGHT_WALL            (ANIM_SPRITES_START + 169)
#define ANIM_TAG_ORANGE_LIGHT_WALL          (ANIM_SPRITES_START + 170)
#define ANIM_TAG_BLACK_BALL_2               (ANIM_SPRITES_START + 171)
#define ANIM_TAG_PURPLE_GAS_CLOUD           (ANIM_SPRITES_START + 172)
#define ANIM_TAG_SPARK_H                    (ANIM_SPRITES_START + 173)
#define ANIM_TAG_YELLOW_STAR                (ANIM_SPRITES_START + 174)
#define ANIM_TAG_LARGE_FRESH_EGG            (ANIM_SPRITES_START + 175)
#define ANIM_TAG_SHADOW_BALL                (ANIM_SPRITES_START + 176)
#define ANIM_TAG_LICK                       (ANIM_SPRITES_START + 177)
#define ANIM_TAG_VOID_LINES                 (ANIM_SPRITES_START + 178)
#define ANIM_TAG_STRING                     (ANIM_SPRITES_START + 179)
#define ANIM_TAG_WEB_THREAD                 (ANIM_SPRITES_START + 180)
#define ANIM_TAG_SPIDER_WEB                 (ANIM_SPRITES_START + 181)
#define ANIM_TAG_LIGHTBULB                  (ANIM_SPRITES_START + 182) // unused
#define ANIM_TAG_SLASH                      (ANIM_SPRITES_START + 183)
#define ANIM_TAG_FOCUS_ENERGY               (ANIM_SPRITES_START + 184)
#define ANIM_TAG_SPHERE_TO_CUBE             (ANIM_SPRITES_START + 185)
#define ANIM_TAG_TENDRILS                   (ANIM_SPRITES_START + 186)
#define ANIM_TAG_EYE                        (ANIM_SPRITES_START + 187)
#define ANIM_TAG_WHITE_SHADOW               (ANIM_SPRITES_START + 188)
#define ANIM_TAG_TEAL_ALERT                 (ANIM_SPRITES_START + 189)
#define ANIM_TAG_OPENING_EYE                (ANIM_SPRITES_START + 190)
#define ANIM_TAG_ROUND_WHITE_HALO           (ANIM_SPRITES_START + 191)
#define ANIM_TAG_FANG_ATTACK                (ANIM_SPRITES_START + 192)
#define ANIM_TAG_PURPLE_HAND_OUTLINE        (ANIM_SPRITES_START + 193)
#define ANIM_TAG_MOON                       (ANIM_SPRITES_START + 194)
#define ANIM_TAG_GREEN_SPARKLE              (ANIM_SPRITES_START + 195)
#define ANIM_TAG_SPIRAL                     (ANIM_SPRITES_START + 196)
#define ANIM_TAG_SNORE_Z                    (ANIM_SPRITES_START + 197)
#define ANIM_TAG_EXPLOSION                  (ANIM_SPRITES_START + 198)
#define ANIM_TAG_NAIL                       (ANIM_SPRITES_START + 199)
#define ANIM_TAG_GHOSTLY_SPIRIT             (ANIM_SPRITES_START + 200)
#define ANIM_TAG_WARM_ROCK                  (ANIM_SPRITES_START + 201)
#define ANIM_TAG_BREAKING_EGG               (ANIM_SPRITES_START + 202)
#define ANIM_TAG_THIN_RING                  (ANIM_SPRITES_START + 203)
#define ANIM_TAG_PUNCH_IMPACT               (ANIM_SPRITES_START + 204) // unused
#define ANIM_TAG_BELL                       (ANIM_SPRITES_START + 205)
#define ANIM_TAG_MUSIC_NOTES_2              (ANIM_SPRITES_START + 206)
#define ANIM_TAG_SPEED_DUST                 (ANIM_SPRITES_START + 207)
#define ANIM_TAG_TORN_METAL                 (ANIM_SPRITES_START + 208)
#define ANIM_TAG_THOUGHT_BUBBLE             (ANIM_SPRITES_START + 209)
#define ANIM_TAG_MAGENTA_HEART              (ANIM_SPRITES_START + 210)
#define ANIM_TAG_ELECTRIC_ORBS              (ANIM_SPRITES_START + 211)
#define ANIM_TAG_CIRCLE_OF_LIGHT            (ANIM_SPRITES_START + 212)
#define ANIM_TAG_ELECTRICITY                (ANIM_SPRITES_START + 213)
#define ANIM_TAG_FINGER_2                   (ANIM_SPRITES_START + 214)
#define ANIM_TAG_MOVEMENT_WAVES             (ANIM_SPRITES_START + 215)
#define ANIM_TAG_RED_HEART                  (ANIM_SPRITES_START + 216)
#define ANIM_TAG_RED_ORB                    (ANIM_SPRITES_START + 217)
#define ANIM_TAG_EYE_SPARKLE                (ANIM_SPRITES_START + 218)
#define ANIM_TAG_PINK_HEART                 (ANIM_SPRITES_START + 219)
#define ANIM_TAG_ANGEL                      (ANIM_SPRITES_START + 220)
#define ANIM_TAG_DEVIL                      (ANIM_SPRITES_START + 221)
#define ANIM_TAG_SWIPE                      (ANIM_SPRITES_START + 222)
#define ANIM_TAG_ROOTS                      (ANIM_SPRITES_START + 223)
#define ANIM_TAG_ITEM_BAG                   (ANIM_SPRITES_START + 224)
#define ANIM_TAG_JAGGED_MUSIC_NOTE          (ANIM_SPRITES_START + 225)
#define ANIM_TAG_POKEBALL                   (ANIM_SPRITES_START + 226)
#define ANIM_TAG_SPOTLIGHT                  (ANIM_SPRITES_START + 227)
#define ANIM_TAG_LETTER_Z                   (ANIM_SPRITES_START + 228)
#define ANIM_TAG_RAPID_SPIN                 (ANIM_SPRITES_START + 229)
#define ANIM_TAG_TRI_ATTACK_TRIANGLE        (ANIM_SPRITES_START + 230)
#define ANIM_TAG_WISP_ORB                   (ANIM_SPRITES_START + 231)
#define ANIM_TAG_WISP_FIRE                  (ANIM_SPRITES_START + 232)
#define ANIM_TAG_GOLD_STARS                 (ANIM_SPRITES_START + 233)
#define ANIM_TAG_ECLIPSING_ORB              (ANIM_SPRITES_START + 234)
#define ANIM_TAG_GRAY_ORB                   (ANIM_SPRITES_START + 235)
#define ANIM_TAG_BLUE_ORB                   (ANIM_SPRITES_START + 236)
#define ANIM_TAG_RED_ORB_2                  (ANIM_SPRITES_START + 237)
#define ANIM_TAG_PINK_PETAL                 (ANIM_SPRITES_START + 238)
#define ANIM_TAG_PAIN_SPLIT                 (ANIM_SPRITES_START + 239)
#define ANIM_TAG_CONFETTI                   (ANIM_SPRITES_START + 240)
#define ANIM_TAG_GREEN_STAR                 (ANIM_SPRITES_START + 241)
#define ANIM_TAG_PINK_CLOUD                 (ANIM_SPRITES_START + 242)
#define ANIM_TAG_SWEAT_DROP                 (ANIM_SPRITES_START + 243)
#define ANIM_TAG_GUARD_RING                 (ANIM_SPRITES_START + 244)
#define ANIM_TAG_PURPLE_SCRATCH             (ANIM_SPRITES_START + 245)
#define ANIM_TAG_PURPLE_SWIPE               (ANIM_SPRITES_START + 246)
#define ANIM_TAG_TAG_HAND                   (ANIM_SPRITES_START + 247)
#define ANIM_TAG_SMALL_RED_EYE              (ANIM_SPRITES_START + 248)
#define ANIM_TAG_HOLLOW_ORB                 (ANIM_SPRITES_START + 249)
#define ANIM_TAG_X_SIGN                     (ANIM_SPRITES_START + 250)
#define ANIM_TAG_BLUEGREEN_ORB              (ANIM_SPRITES_START + 251)
#define ANIM_TAG_PAW_PRINT                  (ANIM_SPRITES_START + 252)
#define ANIM_TAG_PURPLE_FLAME               (ANIM_SPRITES_START + 253)
#define ANIM_TAG_RED_BALL                   (ANIM_SPRITES_START + 254)
#define ANIM_TAG_SMELLINGSALT_EFFECT        (ANIM_SPRITES_START + 255)
#define ANIM_TAG_METEOR                     (ANIM_SPRITES_START + 256)
#define ANIM_TAG_FLAT_ROCK                  (ANIM_SPRITES_START + 257)
#define ANIM_TAG_MAGNIFYING_GLASS           (ANIM_SPRITES_START + 258)
#define ANIM_TAG_BROWN_ORB                  (ANIM_SPRITES_START + 259)
#define ANIM_TAG_METAL_SOUND_WAVES          (ANIM_SPRITES_START + 260)
#define ANIM_TAG_FLYING_DIRT                (ANIM_SPRITES_START + 261)
#define ANIM_TAG_ICICLE_SPEAR               (ANIM_SPRITES_START + 262)
#define ANIM_TAG_HAIL                       (ANIM_SPRITES_START + 263)
#define ANIM_TAG_GLOWY_RED_ORB              (ANIM_SPRITES_START + 264)
#define ANIM_TAG_GLOWY_GREEN_ORB            (ANIM_SPRITES_START + 265)
#define ANIM_TAG_GREEN_SPIKE                (ANIM_SPRITES_START + 266)
#define ANIM_TAG_WHITE_CIRCLE_OF_LIGHT      (ANIM_SPRITES_START + 267)
#define ANIM_TAG_GLOWY_BLUE_ORB             (ANIM_SPRITES_START + 268)
#define ANIM_TAG_SAFARI_BAIT                (ANIM_SPRITES_START + 269)
#define ANIM_TAG_WHITE_FEATHER              (ANIM_SPRITES_START + 270)
#define ANIM_TAG_SPARKLE_6                  (ANIM_SPRITES_START + 271)
#define ANIM_TAG_SPLASH                     (ANIM_SPRITES_START + 272)
#define ANIM_TAG_SWEAT_BEAD                 (ANIM_SPRITES_START + 273)
#define ANIM_TAG_GEM_1                      (ANIM_SPRITES_START + 274) // unused
#define ANIM_TAG_GEM_2                      (ANIM_SPRITES_START + 275) // unused
#define ANIM_TAG_GEM_3                      (ANIM_SPRITES_START + 276) // unused
#define ANIM_TAG_SLAM_HIT_2                 (ANIM_SPRITES_START + 277)
#define ANIM_TAG_RECYCLE                    (ANIM_SPRITES_START + 278)
#define ANIM_TAG_RED_PARTICLES              (ANIM_SPRITES_START + 279) // unused
#define ANIM_TAG_PROTECT                    (ANIM_SPRITES_START + 280)
#define ANIM_TAG_DIRT_MOUND                 (ANIM_SPRITES_START + 281)
#define ANIM_TAG_SHOCK_3                    (ANIM_SPRITES_START + 282)
#define ANIM_TAG_WEATHER_BALL               (ANIM_SPRITES_START + 283)
#define ANIM_TAG_BIRD                       (ANIM_SPRITES_START + 284)
#define ANIM_TAG_CROSS_IMPACT               (ANIM_SPRITES_START + 285)
#define ANIM_TAG_SLASH_2                    (ANIM_SPRITES_START + 286)
#define ANIM_TAG_WHIP_HIT                   (ANIM_SPRITES_START + 287)
#define ANIM_TAG_BLUE_RING_2                (ANIM_SPRITES_START + 288)
#define ANIM_TAG_CSR_CRAB                   (ANIM_SPRITES_START + 289)
#define ANIM_TAG_BEE                        (ANIM_SPRITES_START + 290)
#define ANIM_TAG_WATER_SHURIKEN             (ANIM_SPRITES_START + 291)
#define ANIM_TAG_STEALTH_ROCK               (ANIM_SPRITES_START + 292)
#define ANIM_TAG_WEED                       (ANIM_SPRITES_START + 293)
#define ANIM_TAG_TOMATO                     (ANIM_SPRITES_START + 294)
#define ANIM_TAG_TERA_CRYSTAL               (ANIM_SPRITES_START + 295)
#define ANIM_TAG_TERA_SHATTER               (ANIM_SPRITES_START + 296)
#define ANIM_TAG_QUICK_GUARD_HAND           (ANIM_SPRITES_START + 297)
#define ANIM_TAG_WONDER_SEED                (ANIM_SPRITES_START + 298)
#define ANIM_TAG_SMALL_CLOUD                (ANIM_SPRITES_START + 299)
#define ANIM_TAG_PUNISHMENT_BLADES          (ANIM_SPRITES_START + 300)
#define ANIM_TAG_ONE                        (ANIM_SPRITES_START + 301)
#define ANIM_TAG_MIDDLE_FINGER              (ANIM_SPRITES_START + 302)
#define ANIM_TAG_BROCKS                     (ANIM_SPRITES_START + 303)
#define ANIM_TAG_BROCK_X_SIGN               (ANIM_SPRITES_START + 304)
#define ANIM_TAG_ZEKROM_KICK                (ANIM_SPRITES_START + 305)
#define ANIM_TAG_RAINBOW                    (ANIM_SPRITES_START + 306)
#define ANIM_TAG_PICKLE_SPEAR               (ANIM_SPRITES_START + 307)
#define ANIM_TAG_WIN_FLAG                   (ANIM_SPRITES_START + 308)
#define ANIM_TAG_CHEESE                     (ANIM_SPRITES_START + 309)
#define ANIM_TAG_MEATBALL                   (ANIM_SPRITES_START + 310)
#define ANIM_TAG_NORMAL                     (ANIM_SPRITES_START + 311)
#define ANIM_TAG_WEATHER_BALLIN             (ANIM_SPRITES_START + 312)
#define ANIM_TAG_LETTUCE                    (ANIM_SPRITES_START + 313)
#define ANIM_TAG_SESAME                     (ANIM_SPRITES_START + 314)
#define ANIM_TAG_BREAD                      (ANIM_SPRITES_START + 315)
#define ANIM_TAG_ZYGARDE_Z                  (ANIM_SPRITES_START + 316)
#define ANIM_TAG_REVERSE                    (ANIM_SPRITES_START + 317)
#define ANIM_TAG_THUMBS_UP                  (ANIM_SPRITES_START + 318)
#define ANIM_TAG_THUMBS_DOWN                (ANIM_SPRITES_START + 319)
#define ANIM_TAG_BUTTER_BLADE               (ANIM_SPRITES_START + 320)
#define ANIM_TAG_WINDOW_WARNING             (ANIM_SPRITES_START + 321)
#define ANIM_TAG_WINDOW_ERROR               (ANIM_SPRITES_START + 322)
#define ANIM_TAG_FEMALE                     (ANIM_SPRITES_START + 323)
#define ANIM_TAG_YOSHI_EGG                  (ANIM_SPRITES_START + 324)
#define ANIM_TAG_FUZZY                      (ANIM_SPRITES_START + 325)
#define ANIM_TAG_TAXES                      (ANIM_SPRITES_START + 326)
#define ANIM_TAG_MONEY                      (ANIM_SPRITES_START + 327)
#define ANIM_TAG_KETCHUP                    (ANIM_SPRITES_START + 328)
#define ANIM_TAG_COIN_SMALL                 (ANIM_SPRITES_START + 329)
#define ANIM_TAG_WEED_SMALL                 (ANIM_SPRITES_START + 330)
#define ANIM_TAG_RAINBOW_ORB                (ANIM_SPRITES_START + 331)
#define ANIM_TAG_WEEDLE_SPIKE               (ANIM_SPRITES_START + 332)
#define ANIM_TAG_SHADOW_SHIELD              (ANIM_SPRITES_START + 333)
#define ANIM_TAG_ONE_PROTECT                (ANIM_SPRITES_START + 334)
#define ANIM_TAG_H                          (ANIM_SPRITES_START + 335)
#define ANIM_TAG_BULLET                     (ANIM_SPRITES_START + 336)
#define ANIM_TAG_STEAMROLLER                (ANIM_SPRITES_START + 337)
#define ANIM_TAG_BULLDOZER                  (ANIM_SPRITES_START + 338)
#define ANIM_TAG_ROTOM_DESCEND              (ANIM_SPRITES_START + 339)
#define ANIM_TAG_EXODIA                     (ANIM_SPRITES_START + 340)
#define ANIM_TAG_THROWN_KRABBY              (ANIM_SPRITES_START + 341)
#define ANIM_TAG_THROWN_FORRETRESS          (ANIM_SPRITES_START + 342)
#define ANIM_TAG_SHINE                      (ANIM_SPRITES_START + 343)
#define ANIM_TAG_SUMMONING_CIRCLE           (ANIM_SPRITES_START + 344)
#define ANIM_TAG_BUS_LEFT                   (ANIM_SPRITES_START + 345)
#define ANIM_TAG_BUS_RIGHT                  (ANIM_SPRITES_START + 346)
#define ANIM_TAG_CRASHED                    (ANIM_SPRITES_START + 347)
#define ANIM_TAG_ALLEGIANCE                 (ANIM_SPRITES_START + 348)
#define ANIM_TAG_EAGLE                      (ANIM_SPRITES_START + 349)
#define ANIM_TAG_BIBLE_STUFF                (ANIM_SPRITES_START + 350)
#define ANIM_TAG_GASTER_BLASTER             (ANIM_SPRITES_START + 351)
#define ANIM_TAG_GASTER_BEAM                (ANIM_SPRITES_START + 352)
#define ANIM_TAG_TEACUP                     (ANIM_SPRITES_START + 353)
#define ANIM_TAG_BALL_QUICK                 (ANIM_SPRITES_START + 354)
#define ANIM_TAG_BALL_DIVE                  (ANIM_SPRITES_START + 355)
#define ANIM_TAG_BALL_REPEAT                (ANIM_SPRITES_START + 356)
#define ANIM_TAG_BALL_LURE                  (ANIM_SPRITES_START + 357)
#define ANIM_TAG_BALL_HEAL                  (ANIM_SPRITES_START + 358)
#define ANIM_TAG_BALL_DREAM                 (ANIM_SPRITES_START + 359)
#define ANIM_TAG_BALL_TIMER                 (ANIM_SPRITES_START + 360)
#define ANIM_TAG_BALL_DUSK                  (ANIM_SPRITES_START + 361)
#define ANIM_TAG_BALL_LIGHT                 (ANIM_SPRITES_START + 362)
#define ANIM_TAG_BALL_ENERGY                (ANIM_SPRITES_START + 363)
#define ANIM_TAG_PLASTO                     (ANIM_SPRITES_START + 364)
#define ANIM_TAG_PISS_DROP                  (ANIM_SPRITES_START + 365)
#define ANIM_TAG_CLAM                       (ANIM_SPRITES_START + 366)
#define ANIM_TAG_MING_VASE                  (ANIM_SPRITES_START + 367)
#define ANIM_TAG_SHATTERED_VASE             (ANIM_SPRITES_START + 368)
#define ANIM_TAG_RED_DIAMOND                (ANIM_SPRITES_START + 369)
#define ANIM_TAG_BLACK_SPADE                (ANIM_SPRITES_START + 370)
#define ANIM_TAG_BLACK_CLUB                 (ANIM_SPRITES_START + 371)
#define ANIM_TAG_HAMMER                     (ANIM_SPRITES_START + 372)
#define ANIM_TAG_SHOEPRINT                  (ANIM_SPRITES_START + 373)
#define ANIM_TAG_SKYRIM                     (ANIM_SPRITES_START + 374)
#define ANIM_TAG_MISTY                      (ANIM_SPRITES_START + 375)
#define ANIM_TAG_PERISH_TONGUE              (ANIM_SPRITES_START + 376)
#define ANIM_TAG_CENSORED                   (ANIM_SPRITES_START + 377)
#define ANIM_TAG_GRAVEL_APPLE               (ANIM_SPRITES_START + 378)
#define ANIM_TAG_ONION                      (ANIM_SPRITES_START + 379)
#define ANIM_TAG_EXTREME_SLOTH              (ANIM_SPRITES_START + 380)
#define ANIM_TAG_CEREAL                     (ANIM_SPRITES_START + 381)
#define ANIM_TAG_CREAM                      (ANIM_SPRITES_START + 382)
#define ANIM_TAG_GOON                       (ANIM_SPRITES_START + 383)
#define ANIM_TAG_CAFE                       (ANIM_SPRITES_START + 384)
#define ANIM_TAG_DAYCARE                    (ANIM_SPRITES_START + 385)
#define ANIM_TAG_POKEMON_CENTER             (ANIM_SPRITES_START + 386)
#define ANIM_TAG_MART                       (ANIM_SPRITES_START + 387)
#define ANIM_TAG_RICK                       (ANIM_SPRITES_START + 388)
#define ANIM_TAG_RICK_LEFT                  (ANIM_SPRITES_START + 389)
#define ANIM_TAG_DODGEBALL                  (ANIM_SPRITES_START + 390)
#define ANIM_TAG_LOOK_LOOK                  (ANIM_SPRITES_START + 391)
#define ANIM_TAG_HAIR                       (ANIM_SPRITES_START + 392)
#define ANIM_TAG_CHERI_BOMB                 (ANIM_SPRITES_START + 393)
#define ANIM_TAG_ZIP_BOMB                   (ANIM_SPRITES_START + 394)
#define ANIM_TAG_MOVIE_FILE                 (ANIM_SPRITES_START + 395)
#define ANIM_TAG_TOOLBAR                    (ANIM_SPRITES_START + 396)
#define ANIM_TAG_NORTON                     (ANIM_SPRITES_START + 397)
#define ANIM_TAG_RUINS                      (ANIM_SPRITES_START + 398)
#define ANIM_TAG_NACL                       (ANIM_SPRITES_START + 399)
#define ANIM_TAG_ENVELOPE                   (ANIM_SPRITES_START + 400)
#define ANIM_TAG_FRIES                      (ANIM_SPRITES_START + 401)
#define ANIM_TAG_MINI_DIGLETT               (ANIM_SPRITES_START + 402)
#define ANIM_TAG_LETTER_R                   (ANIM_SPRITES_START + 403)
#define ANIM_TAG_LETTER_E                   (ANIM_SPRITES_START + 404)
#define ANIM_TAG_LETTER_GMB                 (ANIM_SPRITES_START + 405)
#define ANIM_TAG_MR_BONDING                 (ANIM_SPRITES_START + 406)
#define ANIM_TAG_LETTER_T                   (ANIM_SPRITES_START + 407)
#define ANIM_TAG_DAD_OF_LIGHT               (ANIM_SPRITES_START + 408)
#define ANIM_TAG_LASS                       (ANIM_SPRITES_START + 409)
#define ANIM_TAG_SPOON                      (ANIM_SPRITES_START + 410)
#define ANIM_TAG_SLURF                      (ANIM_SPRITES_START + 411)
#define ANIM_TAG_PEANUT                     (ANIM_SPRITES_START + 412)
#define ANIM_TAG_MEGA_STONE                 (ANIM_SPRITES_START + 413)
#define ANIM_TAG_MEGA_PARTICLES             (ANIM_SPRITES_START + 414)
#define ANIM_TAG_MEGA_SYMBOL                (ANIM_SPRITES_START + 415)
#define ANIM_TAG_BURGER                     (ANIM_SPRITES_START + 416)
#define ANIM_TAG_TOWER_TOP                  (ANIM_SPRITES_START + 417)
#define ANIM_TAG_TOWER_BOTTOM               (ANIM_SPRITES_START + 418)
#define ANIM_TAG_CASH_REGISTER              (ANIM_SPRITES_START + 419)
#define ANIM_TAG_RANCH                      (ANIM_SPRITES_START + 420)
#define ANIM_TAG_USELESS_CARD               (ANIM_SPRITES_START + 421)
#define ANIM_TAG_SOLDIER                    (ANIM_SPRITES_START + 422)
#define ANIM_TAG_BLUE_HAIR                  (ANIM_SPRITES_START + 423)
#define ANIM_TAG_CAPT                       (ANIM_SPRITES_START + 424)
#define ANIM_TAG_TCG_CHARGE                 (ANIM_SPRITES_START + 425)
#define ANIM_TAG_TCG_DASH                   (ANIM_SPRITES_START + 426)
#define ANIM_TAG_TCG_GOO                    (ANIM_SPRITES_START + 427)
#define ANIM_TAG_TCG_SLASH                  (ANIM_SPRITES_START + 428)
#define ANIM_TAG_TCG_IMPACT                 (ANIM_SPRITES_START + 429)
#define ANIM_TAG_TCG_PUNCH                  (ANIM_SPRITES_START + 430)
#define ANIM_TAG_TCG_POWDER                 (ANIM_SPRITES_START + 431)
#define ANIM_TAG_TCG_WATER                  (ANIM_SPRITES_START + 432)
#define ANIM_TAG_TCG_ROCKS                  (ANIM_SPRITES_START + 433)
#define ANIM_TAG_TCG_SWORD                  (ANIM_SPRITES_START + 434)
#define ANIM_TAG_LLOYD                      (ANIM_SPRITES_START + 435)
#define ANIM_TAG_DARK_LLOYD                 (ANIM_SPRITES_START + 436)
#define ANIM_TAG_PROTAGONISTS               (ANIM_SPRITES_START + 437)
#define ANIM_TAG_LATINAS                    (ANIM_SPRITES_START + 438)
#define ANIM_TAG_GAME_GENIE                 (ANIM_SPRITES_START + 439)
#define ANIM_TAG_FURBY                      (ANIM_SPRITES_START + 440)
#define ANIM_TAG_FIRERED                    (ANIM_SPRITES_START + 441)
#define ANIM_TAG_PRIDE_FLAG                 (ANIM_SPRITES_START + 442)
#define ANIM_TAG_CREAM_BUBBLES              (ANIM_SPRITES_START + 443)
#define ANIM_TAG_EARTH                      (ANIM_SPRITES_START + 444)
#define ANIM_TAG_HUMAN_LEG_ONE              (ANIM_SPRITES_START + 445)
#define ANIM_TAG_HUMAN_LEG_TWO              (ANIM_SPRITES_START + 446)
#define ANIM_TAG_MOLTRES_KICK               (ANIM_SPRITES_START + 447)
#define ANIM_TAG_MOLTRES_FLARE              (ANIM_SPRITES_START + 448)
#define ANIM_TAG_MOLTRES_APPEAR             (ANIM_SPRITES_START + 449)
#define ANIM_TAG_RARE_CANDY                 (ANIM_SPRITES_START + 450)
#define ANIM_TAG_MISSINGNO_RHYDON           (ANIM_SPRITES_START + 451)
#define ANIM_TAG_TCG_BLIZZARD               (ANIM_SPRITES_START + 452)
#define ANIM_TAG_TCG_COIN                   (ANIM_SPRITES_START + 453)
#define ANIM_TAG_EXODIA_BLAST               (ANIM_SPRITES_START + 454)
#define ANIM_TAG_CHOCOLATE                  (ANIM_SPRITES_START + 455)
#define ANIM_TAG_C_STINGER                  (ANIM_SPRITES_START + 456)
#define ANIM_TAG_HOTDOG                     (ANIM_SPRITES_START + 457)
#define ANIM_TAG_ACID_RAIN_DROPS            (ANIM_SPRITES_START + 458)
#define ANIM_TAG_PSI_ROCKIN_ONE             (ANIM_SPRITES_START + 459)
#define ANIM_TAG_PSI_ROCKIN_TWO             (ANIM_SPRITES_START + 460)
#define ANIM_TAG_HONG_KONG_RUN              (ANIM_SPRITES_START + 461)
#define ANIM_TAG_HONG_KONG_EXPLOSION        (ANIM_SPRITES_START + 462)
#define ANIM_TAG_HONG_KONG_BODY             (ANIM_SPRITES_START + 463)
#define ANIM_TAG_HONG_KONG_BULLET           (ANIM_SPRITES_START + 464)
#define ANIM_TAG_HONG_KONG_DRUG             (ANIM_SPRITES_START + 465)
#define ANIM_TAG_VACUUM                     (ANIM_SPRITES_START + 466)
#define ANIM_TAG_SCISSORS                   (ANIM_SPRITES_START + 467)
#define ANIM_TAG_COOLTRAINER                (ANIM_SPRITES_START + 468)
#define ANIM_TAG_KANGAS                     (ANIM_SPRITES_START + 469)
#define ANIM_TAG_POUND                      (ANIM_SPRITES_START + 470)
#define ANIM_TAG_GRASS                      (ANIM_SPRITES_START + 471)
#define ANIM_TAG_POINTING_FINGER            (ANIM_SPRITES_START + 472)
#define ANIM_TAG_MOUSE_CURSOR               (ANIM_SPRITES_START + 473)
#define ANIM_TAG_STEREO                     (ANIM_SPRITES_START + 474)
#define ANIM_TAG_STONESURGE                 (ANIM_SPRITES_START + 475)
#define ANIM_TAG_CODE_WINDOW                (ANIM_SPRITES_START + 476)
#define ANIM_TAG_VAULT_BOY                  (ANIM_SPRITES_START + 477)
#define ANIM_TAG_O_SIGN                     (ANIM_SPRITES_START + 478)
#define ANIM_TAG_THE_PIT                    (ANIM_SPRITES_START + 479)
#define ANIM_TAG_HANDGUN                    (ANIM_SPRITES_START + 480)
#define ANIM_TAG_LEER_BLAST_RIGHT           (ANIM_SPRITES_START + 481)
#define ANIM_TAG_LEER_BLAST_LEFT            (ANIM_SPRITES_START + 482)
#define ANIM_TAG_LEER_LASER                 (ANIM_SPRITES_START + 483)
#define ANIM_TAG_WURMPLE_HEAD               (ANIM_SPRITES_START + 484)
#define ANIM_TAG_POKEDAD                    (ANIM_SPRITES_START + 485)
#define ANIM_TAG_KRABBY_HEY                 (ANIM_SPRITES_START + 486)
#define ANIM_TAG_KNIT_SHORTS                (ANIM_SPRITES_START + 487)
#define ANIM_TAG_MUSHROOM                   (ANIM_SPRITES_START + 488)
#define ANIM_TAG_GYRO                       (ANIM_SPRITES_START + 489)
#define ANIM_TAG_PANTS_STRING               (ANIM_SPRITES_START + 490)
#define ANIM_TAG_SECRET_SWORD               (ANIM_SPRITES_START + 491)
#define ANIM_TAG_MINI_SHORTS                (ANIM_SPRITES_START + 492)
#define ANIM_TAG_CRUSHER                    (ANIM_SPRITES_START + 493)
#define ANIM_TAG_FINALE_ONE                 (ANIM_SPRITES_START + 494)
#define ANIM_TAG_FINALE_TWO                 (ANIM_SPRITES_START + 495)
#define ANIM_TAG_RAGE_SNOUT                 (ANIM_SPRITES_START + 496)
#define ANIM_TAG_TOAD                       (ANIM_SPRITES_START + 497)
#define ANIM_TAG_BULLET_BILL                (ANIM_SPRITES_START + 498)
#define ANIM_TAG_BAZOOKA                    (ANIM_SPRITES_START + 499)
#define ANIM_TAG_TRANS_EMBER                (ANIM_SPRITES_START + 500)
#define ANIM_TAG_FOUR                       (ANIM_SPRITES_START + 501)
#define ANIM_TAG_MISSILE                    (ANIM_SPRITES_START + 502)
#define ANIM_TAG_GNOME                      (ANIM_SPRITES_START + 503)
#define ANIM_TAG_BOOK                       (ANIM_SPRITES_START + 504)
#define ANIM_TAG_TAKEDOWN                   (ANIM_SPRITES_START + 505)
#define ANIM_TAG_HATCHET                    (ANIM_SPRITES_START + 506)
#define ANIM_TAG_LIONS                      (ANIM_SPRITES_START + 507)
#define ANIM_TAG_HUMAN_HAND                 (ANIM_SPRITES_START + 508)
#define ANIM_TAG_TCG_CONFUSION              (ANIM_SPRITES_START + 509)
#define ANIM_TAG_TCG_ICE                    (ANIM_SPRITES_START + 510)
#define ANIM_TAG_TCG_NEEDLE                 (ANIM_SPRITES_START + 511)
#define ANIM_TAG_TCG_POISON                 (ANIM_SPRITES_START + 512)
#define ANIM_TAG_IMAKUNI                    (ANIM_SPRITES_START + 513)
#define ANIM_TAG_TCG_PSYCHIC                (ANIM_SPRITES_START + 514)
#define ANIM_TAG_TCG_ELECTRIC               (ANIM_SPRITES_START + 515)
#define ANIM_TAG_TCG_SPARK                  (ANIM_SPRITES_START + 516)
#define ANIM_TAG_TCG_SLAP                   (ANIM_SPRITES_START + 517)
#define ANIM_TAG_TCG_SLAP_IMPACT            (ANIM_SPRITES_START + 518)
#define ANIM_TAG_KRABBY_CLAW                (ANIM_SPRITES_START + 519)
#define ANIM_TAG_GLISCOR_CLAW               (ANIM_SPRITES_START + 520)
#define ANIM_TAG_PRIME_NUMBERS              (ANIM_SPRITES_START + 521)
#define ANIM_TAG_QUAKE                      (ANIM_SPRITES_START + 522)
#define ANIM_TAG_FRYING_PAN                 (ANIM_SPRITES_START + 523)
#define ANIM_TAG_HYPER_BEAM                 (ANIM_SPRITES_START + 524)
#define ANIM_TAG_STARMIE                    (ANIM_SPRITES_START + 525)
#define ANIM_TAG_LIL_KENYA                  (ANIM_SPRITES_START + 526)
#define ANIM_TAG_CUBONE                     (ANIM_SPRITES_START + 527)
#define ANIM_TAG_ZYGARDE_CELL               (ANIM_SPRITES_START + 528)
#define ANIM_TAG_BALL_LOVE                  (ANIM_SPRITES_START + 529)
#define ANIM_TAG_REVENUE                    (ANIM_SPRITES_START + 530)
#define ANIM_TAG_LOCK                       (ANIM_SPRITES_START + 531)
#define ANIM_TAG_CLOCK                      (ANIM_SPRITES_START + 532)
#define ANIM_TAG_CLOTH                      (ANIM_SPRITES_START + 533)
#define ANIM_TAG_DIRE_HIT                   (ANIM_SPRITES_START + 534)
#define ANIM_TAG_NOBBLE                     (ANIM_SPRITES_START + 535)
#define ANIM_TAG_FERALIGATR                 (ANIM_SPRITES_START + 536)
#define ANIM_TAG_STORE                      (ANIM_SPRITES_START + 537)
#define ANIM_TAG_GYM                        (ANIM_SPRITES_START + 538)
#define ANIM_TAG_NOBSTRUCT                  (ANIM_SPRITES_START + 539)
#define ANIM_TAG_DAISY                      (ANIM_SPRITES_START + 540)
#define ANIM_TAG_NIGHTSY                    (ANIM_SPRITES_START + 541)
#define ANIM_TAG_CLAW                       (ANIM_SPRITES_START + 542)
#define ANIM_TAG_LATIAS                     (ANIM_SPRITES_START + 543)
#define ANIM_TAG_SOUL_DEW                   (ANIM_SPRITES_START + 544)
#define ANIM_TAG_EON_TICKET                 (ANIM_SPRITES_START + 545)
#define ANIM_TAG_THE_LEDGE                  (ANIM_SPRITES_START + 546)
#define ANIM_TAG_LOSS                       (ANIM_SPRITES_START + 547)
#define ANIM_TAG_LOSS_BUBBLES               (ANIM_SPRITES_START + 548)
#define ANIM_TAG_LOSS_HANDS                 (ANIM_SPRITES_START + 549)
#define ANIM_TAG_LOBSTER                    (ANIM_SPRITES_START + 550)
#define ANIM_TAG_SHED                       (ANIM_SPRITES_START + 551)
#define ANIM_TAG_DIME                       (ANIM_SPRITES_START + 552)
#define ANIM_TAG_SPIN_TILES                 (ANIM_SPRITES_START + 553)
#define ANIM_TAG_PLUS                       (ANIM_SPRITES_START + 554)
#define ANIM_TAG_TOGEDEMARU                 (ANIM_SPRITES_START + 555)
#define ANIM_TAG_DEDENNE                    (ANIM_SPRITES_START + 556)
#define ANIM_TAG_ANARCHY                    (ANIM_SPRITES_START + 557)
#define ANIM_TAG_GBA                        (ANIM_SPRITES_START + 558)
#define ANIM_TAG_BESEECH_SEED               (ANIM_SPRITES_START + 559)
#define ANIM_TAG_BOLT                       (ANIM_SPRITES_START + 560)
#define ANIM_TAG_COP                        (ANIM_SPRITES_START + 561)
#define ANIM_TAG_CONCRETE                   (ANIM_SPRITES_START + 562)
#define ANIM_TAG_LIGHT_GYM                  (ANIM_SPRITES_START + 563)
#define ANIM_TAG_STONE_FREE                 (ANIM_SPRITES_START + 564)
#define ANIM_TAG_FLIPPER                    (ANIM_SPRITES_START + 565)
#define ANIM_TAG_PRIME_RIBS                 (ANIM_SPRITES_START + 566)
#define ANIM_TAG_BREAM                      (ANIM_SPRITES_START + 567)
#define ANIM_TAG_WAGON_FRONT                (ANIM_SPRITES_START + 568)
#define ANIM_TAG_WAGON_BACK                 (ANIM_SPRITES_START + 569)
#define ANIM_TAG_WAGON_TOP_LEFT             (ANIM_SPRITES_START + 570)
#define ANIM_TAG_WAGON_TOP_RIGHT            (ANIM_SPRITES_START + 571)
#define ANIM_TAG_WAGON_CORNER               (ANIM_SPRITES_START + 572)
#define ANIM_TAG_MR_EXPLOSION               (ANIM_SPRITES_START + 573)
#define ANIM_TAG_PAPERBOY                   (ANIM_SPRITES_START + 574)
#define ANIM_TAG_NEWSPAPER                  (ANIM_SPRITES_START + 575)
#define ANIM_TAG_WET_DAD_IMPACT             (ANIM_SPRITES_START + 576)
#define ANIM_TAG_DIDDY                      (ANIM_SPRITES_START + 577)
#define ANIM_TAG_DRUG                       (ANIM_SPRITES_START + 578)
#define ANIM_TAG_TETO                       (ANIM_SPRITES_START + 579)
#define ANIM_TAG_SHADOW_SPIKES              (ANIM_SPRITES_START + 580)
#define ANIM_TAG_TENNA_ITS                  (ANIM_SPRITES_START + 581)
#define ANIM_TAG_TENNA_T                    (ANIM_SPRITES_START + 582)
#define ANIM_TAG_TENNA_EXCLAMATION_MARK     (ANIM_SPRITES_START + 583)
#define ANIM_TAG_TENNA_TIME                 (ANIM_SPRITES_START + 584)
#define ANIM_TAG_JUNJI_STAR                 (ANIM_SPRITES_START + 585)
#define ANIM_TAG_DEMON_CHILD                (ANIM_SPRITES_START + 586)
#define ANIM_TAG_YOSHI_RUN                  (ANIM_SPRITES_START + 587)
#define ANIM_TAG_CHATTER_LUL                (ANIM_SPRITES_START + 588)
#define ANIM_TAG_CHATTER_KAPPA              (ANIM_SPRITES_START + 589)
#define ANIM_TAG_CHATTER_SMILE              (ANIM_SPRITES_START + 590)
#define ANIM_TAG_LETTER_W                   (ANIM_SPRITES_START + 591)
#define ANIM_TAG_BLUK_BERRY                 (ANIM_SPRITES_START + 592)
#define ANIM_TAG_BLUK_JUICE                 (ANIM_SPRITES_START + 593)
#define ANIM_TAG_LCD_EXPLOSION              (ANIM_SPRITES_START + 594)
#define ANIM_TAG_TRASH                      (ANIM_SPRITES_START + 595)
#define ANIM_TAG_TM                         (ANIM_SPRITES_START + 596)
#define ANIM_TAG_BIKE                       (ANIM_SPRITES_START + 597)
#define ANIM_TAG_WAGON_ASCENT               (ANIM_SPRITES_START + 598)
#define ANIM_TAG_BALLOON                    (ANIM_SPRITES_START + 599)
#define ANIM_TAG_DODUO                      (ANIM_SPRITES_START + 600)
#define ANIM_TAG_KOOPA_SHELL                (ANIM_SPRITES_START + 601)

// battlers
#define ANIM_ATTACKER       0
#define ANIM_TARGET         1
#define ANIM_ATK_PARTNER    2
#define ANIM_DEF_PARTNER    3
#define ANIM_PLAYER_LEFT    4
#define ANIM_PLAYER_RIGHT   5
#define ANIM_OPPONENT_LEFT  6
#define ANIM_OPPONENT_RIGHT 7

// stereo panning constants [0-255]
//
//          0
//         .  .
//      .        .
// 192 .          . 63
//     .          .
//      .        .
//         .  .
//          127
//
#define SOUND_PAN_ATTACKER -64
#define SOUND_PAN_TARGET    63

// move background ids
#define BG_NONE 0 // the same as BG_DARK
#define BG_DARK 1
#define BG_GHOST 2
#define BG_PSYCHIC 3
#define BG_IMPACT_OPPONENT 4
#define BG_IMPACT_PLAYER 5
#define BG_IMPACT_CONTESTS 6
#define BG_DRILL 7
#define BG_DRILL_CONTESTS 8
#define BG_HIGHSPEED_OPPONENT 9
#define BG_HIGHSPEED_PLAYER 10
#define BG_THUNDER 11
#define BG_GUILLOTINE_OPPONENT 12
#define BG_GUILLOTINE_PLAYER 13
#define BG_GUILLOTINE_CONTESTS 14
#define BG_ICE 15
#define BG_COSMIC 16
#define BG_IN_AIR 17
#define BG_SKY 18
#define BG_SKY_CONTESTS 19
#define BG_AURORA 20
#define BG_FISSURE 21
#define BG_BUG_OPPONENT 22
#define BG_BUG_PLAYER 23
#define BG_SOLAR_BEAM_OPPONENT 24
#define BG_SOLAR_BEAM_PLAYER 25
#define BG_SOLAR_BEAM_CONTESTS 26
#define BG_DARK_VOID 27
#define BG_TRICK_ROOM 28
#define BG_FIRE 29
#define BG_AMERICAN_FLAG 30
#define BG_IRAN_FLAG 31
#define BG_BSOD 32
#define BG_SKYRIM 33
#define BG_IRAQ_FLAG 34
#define BG_ACE_FLAG 35
#define BG_SOLACEON_TOWN 36
#define BG_PEWTER 37
#define BG_COKE 38
#define BG_GHOST_TRICK 39
#define BG_LOSS 40
#define BG_OREGON 41
#define BG_LCD 42
#define BG_MANGA 43

// table ids for general animations (gBattleAnims_General)
#define B_ANIM_CASTFORM_CHANGE          0
#define B_ANIM_STATS_CHANGE             1
#define B_ANIM_SUBSTITUTE_FADE          2
#define B_ANIM_SUBSTITUTE_APPEAR        3
#define B_ANIM_BAIT_THROW               4
#define B_ANIM_ITEM_KNOCKOFF            5
#define B_ANIM_TURN_TRAP                6
#define B_ANIM_HELD_ITEM_EFFECT         7
#define B_ANIM_SMOKEBALL_ESCAPE         8
#define B_ANIM_FOCUS_BAND               9
#define B_ANIM_RAIN_CONTINUES           10
#define B_ANIM_SUN_CONTINUES            11
#define B_ANIM_SANDSTORM_CONTINUES      12
#define B_ANIM_HAIL_CONTINUES           13
#define B_ANIM_LEECH_SEED_DRAIN         14
#define B_ANIM_MON_HIT                  15
#define B_ANIM_ITEM_STEAL               16
#define B_ANIM_SNATCH_MOVE              17
#define B_ANIM_FUTURE_SIGHT_HIT         18
#define B_ANIM_DOOM_DESIRE_HIT          19
#define B_ANIM_FOCUS_PUNCH_SETUP        20
#define B_ANIM_INGRAIN_HEAL             21
#define B_ANIM_WISH_HEAL                22
#define B_ANIM_MON_SCARED               23
#define B_ANIM_GHOST_GET_OUT            24
#define B_ANIM_SILPH_SCOPED             25
#define B_ANIM_ROCK_THROW               26
#define B_ANIM_SAFARI_REACTION          27
#define B_ANIM_ALOMOMOLA_EVOLVE         28
#define B_ANIM_HANGED_ON                29
#define B_ANIM_TERA_CHARGE              30
#define B_ANIM_TERA_ACTIVATE            31
#define B_ANIM_TRICK_ROOM_CONTINUES     32
#define B_ANIM_SEEL_HOOPA_TRANSFORM     33
#define B_ANIM_SHADOW_SKY_CONTINUES     34
#define B_ANIM_SHADOW_SPIKES            35
#define B_ANIM_ZAPMOLCUNO_TRANSFORM     36
#define B_ANIM_ROTOM_APPEARS            37
#define B_ANIM_ROTOM_COMES_DOWN         38
#define B_ANIM_DOUBLE_DIP_HIT           39
#define B_ANIM_CHARGE_TURN              40
#define B_ANIM_GHOST_DODGE              41
#define B_ANIM_SLOWPOKE_TRANSFORM       42
#define B_ANIM_GRAVITY_CONTINUES        43
#define B_ANIM_COLOR_CHANGE_WIZ1989     44
#define B_ANIM_FLIP_TURN_TRANSFORM      45
#define B_ANIM_MEGA_EVOLUTION           46
#define B_ANIM_DYNAMAX_GROWTH           47
#define B_ANIM_RAINBOW                  48
#define B_ANIM_ALOMOMOLA_EVOLVE_REVERSE 49
#define B_ANIM_RHYDON_TRANSFORM         50
#define B_ANIM_TRUMP_CARD_USELESS       51
#define B_ANIM_UNBOUND_SPRITE_UPDATE    52
#define B_ANIM_CONFUSION_BONK           53
#define B_ANIM_EXODIA_OBLITERATE        54

// special animations table (gBattleAnims_Special)
#define B_ANIM_LVL_UP                   0
#define B_ANIM_SWITCH_OUT_PLAYER_MON    1
#define B_ANIM_SWITCH_OUT_OPPONENT_MON  2
#define B_ANIM_BALL_THROW               3
#define B_ANIM_BALL_THROW_WITH_TRAINER  4
#define B_ANIM_SUBSTITUTE_TO_MON        5
#define B_ANIM_MON_TO_SUBSTITUTE        6

// status animation table (gBattleAnims_StatusConditions)
#define B_ANIM_STATUS_PSN               0
#define B_ANIM_STATUS_CONFUSION         1
#define B_ANIM_STATUS_BRN               2
#define B_ANIM_STATUS_INFATUATION       3
#define B_ANIM_STATUS_SLP               4
#define B_ANIM_STATUS_PRZ               5
#define B_ANIM_STATUS_FRZ               6
#define B_ANIM_STATUS_CURSED            7
#define B_ANIM_STATUS_NIGHTMARE         8
#define B_ANIM_STATUS_WRAPPED           9 // does not actually exist

// Most tasks return a value to gBattleAnimArgs[7].
#define ARG_RET_ID 7

// For createsprite macro to use internally
#define ANIMSPRITE_IS_TARGET (1 << 7)

// Trapping Wrap-like moves end turn animation.
#define TRAP_ANIM_BIND 0
#define TRAP_ANIM_WRAP 0
#define TRAP_ANIM_FIRE_SPIN 1
#define TRAP_ANIM_WHIRLPOOL 2
#define TRAP_ANIM_CLAMP 3
#define TRAP_ANIM_SAND_TOMB 4

// Weather defines for battle animation scripts.
#define ANIM_WEATHER_NONE 0
#define ANIM_WEATHER_SUN 1
#define ANIM_WEATHER_RAIN 2
#define ANIM_WEATHER_SANDSTORM 3
#define ANIM_WEATHER_HAIL 4

// Flags given to various functions to indicate which palettes to consider.
// Handled by UnpackSelectedBattlePalettes
#define F_PAL_BG          (1 << 0)
#define F_PAL_ATTACKER    (1 << 1)
#define F_PAL_TARGET      (1 << 2)
#define F_PAL_ATK_PARTNER (1 << 3)
#define F_PAL_DEF_PARTNER (1 << 4)
#define F_PAL_ANIM_1      (1 << 5) // Palette set for GetBattleAnimBg1Data/GetBattleAnimBgDataByPriorityRank. Only used (ineffectually?) by Aromatherapy.
#define F_PAL_ANIM_2      (1 << 6) // Palette set for GetBattleAnimBgData/GetBattleAnimBgDataByPriorityRank. Unused.
#define F_PAL_ATK_SIDE    (F_PAL_ATTACKER | F_PAL_ATK_PARTNER)
#define F_PAL_DEF_SIDE    (F_PAL_TARGET | F_PAL_DEF_PARTNER)
#define F_PAL_BATTLERS    (F_PAL_ATK_SIDE | F_PAL_DEF_SIDE)
// The below are only used by AnimTask_BlendBattleAnimPal to get battler sprite palettes by position rather than by role.
// It's redundant with F_PAL_BATTLERS, because they're only ever used together to refer to all the battlers at once.
#define F_PAL_BATTLERS_2  (1 << 7 | 1 << 8 | 1 << 9 | 1 << 10)

// Battle mon back animations.
#define BACK_ANIM_NONE                         0x00
#define BACK_ANIM_H_SLIDE_QUICK                0x01
#define BACK_ANIM_H_SLIDE                      0x02
#define BACK_ANIM_H_SLIDE_WITH_V_COMPRESS_1    0x03
#define BACK_ANIM_H_SLIDE_WITH_V_COMPRESS_2    0x04
#define BACK_ANIM_SHRINK_GROW_1                0x05
#define BACK_ANIM_GROW_1                       0x06
#define BACK_ANIM_CIRCLE_MOVE_COUNTERCLOCKWISE 0x07
#define BACK_ANIM_HORIZONTAL_SHAKE             0x08
#define BACK_ANIM_VERTICAL_SHAKE               0x09
#define BACK_ANIM_V_SHAKE_WITH_H_SLIDE         0x0a
#define BACK_ANIM_VERTICAL_STRETCH             0x0b
#define BACK_ANIM_HORIZONTAL_STRETCH           0x0c
#define BACK_ANIM_GROW_2                       0x0d
#define BACK_ANIM_V_SHAKE_WITH_PAUSE           0x0e
#define BACK_ANIM_CIRCLE_MOVE_CLOCKWISE        0x0f
#define BACK_ANIM_CONCAVE_DOWN_ARC_SWAY_SMALL  0x10
#define BACK_ANIM_CONCAVE_DOWN_ARC_SWAY_LARGE  0x11
#define BACK_ANIM_CONCAVE_UP_ARC_SWAY_LARGE    0x12
#define BACK_ANIM_DIP_RIGHT_SIDE               0x13
#define BACK_ANIM_SHRINK_GROW_2                0x14
#define BACK_ANIM_JOLT_RIGHT                   0x15
#define BACK_ANIM_FLASH_YELLOW_WITH_SHAKE      0x16
#define BACK_ANIM_FADE_RED_WITH_SHAKE          0x17
#define BACK_ANIM_FADE_GREEN_WITH_SHAKE        0x18
#define BACK_ANIM_FADE_BLUE_WITH_SHAKE         0x19

// fade anim types
#define FADE_FROM_BLACK  0
#define FADE_TO_BLACK    1
#define FADE_FROM_WHITE  2
#define FADE_TO_WHITE    3

// letter constants for addletter macro (from the charmap)
#define LETTER_A  0xBB
#define LETTER_B  0xBC
#define LETTER_C  0xBD
#define LETTER_D  0xBE
#define LETTER_E  0xBF
#define LETTER_F  0xC0
#define LETTER_G  0xC1
#define LETTER_H  0xC2
#define LETTER_I  0xC3
#define LETTER_J  0xC4
#define LETTER_K  0xC5
#define LETTER_L  0xC6
#define LETTER_M  0xC7
#define LETTER_N  0xC8
#define LETTER_O  0xC9
#define LETTER_P  0xCA
#define LETTER_Q  0xCB
#define LETTER_R  0xCC
#define LETTER_S  0xCD
#define LETTER_T  0xCE
#define LETTER_U  0xCF
#define LETTER_V  0xD0
#define LETTER_W  0xD1
#define LETTER_X  0xD2
#define LETTER_Y  0xD3
#define LETTER_Z  0xD4


#endif // GUARD_CONSTANTS_BATTLE_ANIM_H
