#include "constants/battle.h"
#include "constants/battle_anim.h"
#include "constants/battle_string_ids.h"
#include "constants/rgb.h"
#include "constants/songs.h"
#include "constants/sound.h"
#include "constants/moves.h"
#include "constants/flags.h"
#include "constants/vars.h"
	.include "asm/macros.inc"
	.include "asm/macros/battle_anim_script.inc"
	.include "constants/constants.inc"

	.section script_data, "aw", %progbits

	.align 2
gMovesWithQuietBGM::
	.2byte MOVE_SING
	.2byte MOVE_PERISH_SONG
	.2byte MOVE_GRASS_WHISTLE
	.2byte MOVE_SANDSTORM
	.2byte 0xFFFF

	.align 2
gBattleAnims_Moves::
	.4byte Move_NONE
	.4byte Move_POUND
	.4byte Move_KARATE_CHOP
	.4byte Move_DOUBLE_SLAP
	.4byte Move_COMET_PUNCH
	.4byte Move_MEGA_PUNCH
	.4byte Move_PAY_DAY
	.4byte Move_FIRE_PUNCH
	.4byte Move_ICE_PUNCH
	.4byte Move_THUNDER_PUNCH
	.4byte Move_SCRATCH
	.4byte Move_VICE_GRIP
	.4byte Move_GUILLOTINE
	.4byte Move_RAZOR_WIND
	.4byte Move_SWORDS_DANCE
	.4byte Move_CUT
	.4byte Move_GUST
	.4byte Move_WING_ATTACK
	.4byte Move_WHIRLWIND
	.4byte Move_FLY
	.4byte Move_BIND
	.4byte Move_SLAM
	.4byte Move_VINE_WHIP
	.4byte Move_STOMP
	.4byte Move_DOUBLE_KICK
	.4byte Move_MEGA_KICK
	.4byte Move_JUMP_KICK
	.4byte Move_ROLLING_KICK
	.4byte Move_SAND_ATTACK
	.4byte Move_HEADBUTT
	.4byte Move_HORN_ATTACK
	.4byte Move_FURY_ATTACK
	.4byte Move_HORN_DRILL
	.4byte Move_TACKLE
	.4byte Move_BODY_SLAM
	.4byte Move_WRAP
	.4byte Move_TAKE_DOWN
	.4byte Move_THRASH
	.4byte Move_DOUBLE_EDGE
	.4byte Move_TAIL_WHIP
	.4byte Move_POISON_STING
	.4byte Move_TWINEEDLE
	.4byte Move_PIN_MISSILE
	.4byte Move_LEER
	.4byte Move_BITE
	.4byte Move_GROWL
	.4byte Move_ROAR
	.4byte Move_SING
	.4byte Move_SUPERSONIC
	.4byte Move_SONIC_BOOM
	.4byte Move_DISABLE
	.4byte Move_ACID
	.4byte Move_EMBER
	.4byte Move_FLAMETHROWER
	.4byte Move_MIST
	.4byte Move_WATER_GUN
	.4byte Move_HYDRO_PUMP
	.4byte Move_SURF
	.4byte Move_ICEBEAM
	.4byte Move_ICE
	.4byte Move_PSY_WIND
	.4byte Move_BUBBLE_BEAM
	.4byte Move_AURORA_BEAM
	.4byte Move_HYPER_BEAM
	.4byte Move_PECK
	.4byte Move_DRILL_PECK
	.4byte Move_SUBMISSION
	.4byte Move_LOW_KICK
	.4byte Move_COUNTER
	.4byte Move_SEISMIC_TOSS
	.4byte Move_STRENGTH
	.4byte Move_ABSORB
	.4byte Move_MEGA_DRAIN
	.4byte Move_LEECH_SEED
	.4byte Move_GROWTH
	.4byte Move_RAZOR_LEAF
	.4byte Move_SOLAR_BEAM
	.4byte Move_POISON_POWDER
	.4byte Move_STUN_SPORE
	.4byte Move_SLEEP_POWDER
	.4byte Move_PETAL_DANCE
	.4byte Move_STRING_SHOT
	.4byte Move_DRAGON_RAGE
	.4byte Move_FIRE_SPIN
	.4byte Move_THUNDER_SHOCK
	.4byte Move_THUNDERBOLT
	.4byte Move_THUNDER_WAVE
	.4byte Move_THUNDER
	.4byte Move_ROCK_THROW
	.4byte Move_EARTHQUAKE
	.4byte Move_FISSURE
	.4byte Move_DIG
	.4byte Move_TOXIC
	.4byte Move_CONFUSION
	.4byte Move_PSY_BEAM
	.4byte Move_HYPNOSIS
	.4byte Move_MEDITATE
	.4byte Move_AGILITY
	.4byte Move_QUICK_ATTACK
	.4byte Move_RAGE
	.4byte Move_FLASH
	.4byte Move_NIGHT_SHADE
	.4byte Move_MIMIC
	.4byte Move_SCREECH
	.4byte Move_DOUBLE_TEAM
	.4byte Move_RECOVER
	.4byte Move_BULK_UP
	.4byte Move_MINIMIZE
	.4byte Move_SMOKESCREEN
	.4byte Move_CONFUSE_RAY
	.4byte Move_WITHDRAW
	.4byte Move_DEFENSE_CURL
	.4byte Move_BARRIER
	.4byte Move_LIGHT_SCREEN
	.4byte Move_HAZE
	.4byte Move_REFLECT
	.4byte Move_FOCUS_ENERGY
	.4byte Move_BIDE
	.4byte Move_METRONOME
	.4byte Move_MIRROR_MOVE
	.4byte Move_SELF_DESTRUCT
	.4byte Move_EGG_BOMB
	.4byte Move_LICK
	.4byte Move_SMOG
	.4byte Move_SLUDGE
	.4byte Move_BONE_CLUB
	.4byte Move_FIRE_BLAST
	.4byte Move_WATERFALL
	.4byte Move_CLAMP
	.4byte Move_SWIFT
	.4byte Move_SKULL_BASH
	.4byte Move_SPIKE_CANNON
	.4byte Move_CONSTRICT
	.4byte Move_AMNESIA
	.4byte Move_KINESIS
	.4byte Move_SOFT_BOILED
	.4byte Move_HI_JUMP_KICK
	.4byte Move_GLARE
	.4byte Move_DREAM_EATER
	.4byte Move_POISON_GAS
	.4byte Move_BARRAGE
	.4byte Move_LEECH_LIFE
	.4byte Move_LOVELY_KISS
	.4byte Move_SKY_ATTACK
	.4byte Move_TRANSFORM
	.4byte Move_HEART_SWAP
	.4byte Move_DIZZY_PUNCH
	.4byte Move_SPORE
	.4byte Move_FLASH
	.4byte Move_PSYWAVE
	.4byte Move_SPLASH
	.4byte Move_ACID_ARMOR
	.4byte Move_CRABHAMMER
	.4byte Move_EXPLOSION
	.4byte Move_FURY_SWIPES
	.4byte Move_BONEMERANG
	.4byte Move_REST
	.4byte Move_ROCK_SLIDE
	.4byte Move_HYPER_FANG
	.4byte Move_SHARPEN
	.4byte Move_CONVERSION
	.4byte Move_TRI_ATTACK
	.4byte Move_SUPER_FANG
	.4byte Move_SLASH
	.4byte Move_SUBSTITUTE
	.4byte Move_STRUGGLE
	.4byte Move_SKETCH
	.4byte Move_TRIPLE_KICK
	.4byte Move_THIEF
	.4byte Move_SPIDER_WEB
	.4byte Move_MIND_READER
	.4byte Move_NIGHTMARE
	.4byte Move_FLAME_WHEEL
	.4byte Move_SNORE
	.4byte Move_CURSE
	.4byte Move_FLAIL
	.4byte Move_CONVERSION_2
	.4byte Move_AEROBLAST
	.4byte Move_COTTON_SPORE
	.4byte Move_REVERSAL
	.4byte Move_SPITE
	.4byte Move_FREEZE
	.4byte Move_PROTECT
	.4byte Move_MACH_PUNCH
	.4byte Move_SCARY_FACE
	.4byte Move_FAINT_ATTACK
	.4byte Move_SWEET_KISS
	.4byte Move_BELLY_DRUM
	.4byte Move_SLUDGE_BOMB
	.4byte Move_MUD_SLAP
	.4byte Move_OCTAZOOKA
	.4byte Move_SPIKES
	.4byte Move_ZAP_CANNON
	.4byte Move_FORESIGHT
	.4byte Move_DESTINY_BOND
	.4byte Move_PERISH_SONG
	.4byte Move_ICY_WIND
	.4byte Move_DETECT
	.4byte Move_BONE_RUSH
	.4byte Move_LOCK_ON
	.4byte Move_OUTRAGE
	.4byte Move_SANDSTORM
	.4byte Move_GIGA_DRAIN
	.4byte Move_ENDURE
	.4byte Move_CHARM
	.4byte Move_ROLLOUT
	.4byte Move_FALSE_SWIPE
	.4byte Move_SWAGGER
	.4byte Move_MILK_DRINK
	.4byte Move_SPARK
	.4byte Move_FURY_CUTTER
	.4byte Move_STEEL_WING
	.4byte Move_MEAN_LOOK
	.4byte Move_HARDEN
	.4byte Move_SLEEP_TALK
	.4byte Move_HEAL_BELL
	.4byte Move_RETURN
	.4byte Move_PRESENT
	.4byte Move_FRUSTRATION
	.4byte Move_SAFEGUARD
	.4byte Move_PAIN_SPLIT
	.4byte Move_SACRED_FIRE
	.4byte Move_MAGNITUDE
	.4byte Move_DYNAMIC_PUNCH
	.4byte Move_MEGAHORN
	.4byte Move_DRAGON_BREATH
	.4byte Move_BATON_PASS
	.4byte Move_ENCORE
	.4byte Move_PURSUIT
	.4byte Move_RAPID_SPIN
	.4byte Move_SWEET_SCENT
	.4byte Move_IRON_TAIL
	.4byte Move_METAL_CLAW
	.4byte Move_VITAL_THROW
	.4byte Move_MORNING_SUN
	.4byte Move_SYNTHESIS
	.4byte Move_MOONLIGHT
	.4byte Move_HIDDEN_POWER
	.4byte Move_CROSS_CHOP
	.4byte Move_TWISTER
	.4byte Move_RAIN_DANCE
	.4byte Move_SUNNY_DAY
	.4byte Move_CRUNCH
	.4byte Move_MIRROR_COAT
	.4byte Move_PSYCH_UP
	.4byte Move_EXTREME_SPEED
	.4byte Move_ANCIENT_POWER
	.4byte Move_SHADOW_BALL
	.4byte Move_FUTURE_SIGHT
	.4byte Move_ROCK_SMASH
	.4byte Move_WHIRLPOOL
	.4byte Move_BEAT_UP
	.4byte Move_FAKE_OUT
	.4byte Move_UPROAR
	.4byte Move_STOCKPILE
	.4byte Move_SPIT_UP
	.4byte Move_SWALLOW
	.4byte Move_HEAT_WAVE
	.4byte Move_HAIL
	.4byte Move_TORMENT
	.4byte Move_FLATTER
	.4byte Move_WILL_O_WISP
	.4byte Move_MEMENTO
	.4byte Move_FACADE
	.4byte Move_FOCUS_PUNCH
	.4byte Move_WAKE_UP_SLAP
	.4byte Move_FOLLOW_ME
	.4byte Move_NATURE_POWER
	.4byte Move_CHARGE
	.4byte Move_TAUNT
	.4byte Move_HELPING_HAND
	.4byte Move_TRICK
	.4byte Move_ROLE_PLAY
	.4byte Move_WISH
	.4byte Move_ASSIST
	.4byte Move_INGRAIN
	.4byte Move_SUPERPOWER
	.4byte Move_MAGIC_COAT
	.4byte Move_RECYCLE
	.4byte Move_REVENGE
	.4byte Move_BRICK_BREAK
	.4byte Move_YAWN
	.4byte Move_KNOCK_OFF
	.4byte Move_ENDEAVOR
	.4byte Move_ERUPTION
	.4byte Move_SKILL_SWAP
	.4byte Move_IMPRISON
	.4byte Move_REFRESH
	.4byte Move_GRUDGE
	.4byte Move_SNATCH
	.4byte Move_SECRET_POWER
	.4byte Move_DIVE
	.4byte Move_ARM_THRUST
	.4byte Move_CAMOUFLAGE
	.4byte Move_TAIL_GLOW
	.4byte Move_LUSTER_PURGE
	.4byte Move_MIST_BALL
	.4byte Move_FEATHER_DANCE
	.4byte Move_TEETER_DANCE
	.4byte Move_BLAZE_KICK
	.4byte Move_MUD_SPORT
	.4byte Move_ICE_BALL
	.4byte Move_NEEDLE_ARM
	.4byte Move_SLACK_OFF
	.4byte Move_HYPER_VOICE
	.4byte Move_POISON_FANG
	.4byte Move_CRUSH_CLAW
	.4byte Move_FIRE_PLEDGE
	.4byte Move_WATER_PLEDGE
	.4byte Move_METEOR_MASH
	.4byte Move_ASTONISH
	.4byte Move_WEATHER_BALL
	.4byte Move_AROMATHERAPY
	.4byte Move_FAKE_TEARS
	.4byte Move_AIR_CUTTER
	.4byte Move_OVERHEAT
	.4byte Move_ODOR_SLEUTH
	.4byte Move_ROCK_TOMB
	.4byte Move_SILVER_WIND
	.4byte Move_METAL_SOUND
	.4byte Move_GRASS_WHISTLE
	.4byte Move_TICKLE
	.4byte Move_COSMIC_POWER
	.4byte Move_WATER_SPOUT
	.4byte Move_SIGNAL_BEAM
	.4byte Move_SHADOW_PUNCH
	.4byte Move_EXTRASENSORY
	.4byte Move_SKY_UPPERCUT
	.4byte Move_SAND_TOMB
	.4byte Move_SHEER_COLD
	.4byte Move_MUDDY_WATER
	.4byte Move_BULLET_SEED
	.4byte Move_AERIAL_ACE
	.4byte Move_ICICLE_SPEAR
	.4byte Move_IRON_DEFENSE
	.4byte Move_BLOCK
	.4byte Move_HOWL
	.4byte Move_DRAGON_CLAW
	.4byte Move_GRASS_PLEDGE
	.4byte Move_BULK_UP
	.4byte Move_BOUNCE
	.4byte Move_MUD_SHOT
	.4byte Move_POISON_TAIL
	.4byte Move_COVET
	.4byte Move_VOLT_TACKLE
	.4byte Move_MAGICAL_LEAF
	.4byte Move_WATER_SPORT
	.4byte Move_CALM_MIND
	.4byte Move_LEAF_BLADE
	.4byte Move_DRAGON_DANCE
	.4byte Move_BOFFA
	.4byte Move_SHOCK_WAVE
	.4byte Move_WATER_PULSE
	.4byte Move_DOOM_DESIRE
	.4byte Move_SLUSH_RUSH
	@@@@@@@@@@@@ additional moves for CSR @@@@@@@@@@@@
	.4byte Move_BUBBLE
	.4byte Move_RETREAT
	.4byte Move_SUBSTITUTE_TEACHER
	.4byte Move_EXPLOSION_USELESS
	.4byte Move_GROWL_CHARMANDER
	.4byte Move_WATER_SHURIKEN
	.4byte Move_REVIVAL_BLESSING //done
	.4byte Move_TOMBSTONER //done
	.4byte Move_FOLLOW_HIM
	.4byte Move_SPIKY_SHIELD
	.4byte Move_SEARING_SHOT
	.4byte Move_GLACIATE
	.4byte Move_VICTORY_DANCE
	.4byte Move_FUSION_BOLT
	.4byte Move_V_CREATE
	.4byte Move_L_CREATE
	.4byte Move_O_CREATE
	.4byte Move_WALUIGI
	.4byte Move_ONE_CLUB
	.4byte Move_ONE_CLAWS
	.4byte Move_ONE_EDGE
	.4byte Move_ONEMERANG
	.4byte Move_BANEFUL_1NKER
	.4byte Move_FINAL_GAMBIT
	.4byte Move_DRAGON_ASCENT
	.4byte Move_FLYING_CLAW
	.4byte Move_FLYING_DANCE
	.4byte Move_FLY_O_METEOR
	.4byte Move_TRIPLE_FINISH
	.4byte Move_CELEBRATE
	.4byte Move_HURRICANE
	.4byte Move_AIR_SLASH
	.4byte Move_THE_BEE_MOVE
	.4byte Move_WUMBOIZE
	.4byte Move_TAILWIND
	.4byte Move_ROOST
	.4byte Move_CSR_DUMMY
	.4byte Move_PRIMAL_RAGE
	.4byte Move_CLOSE_COMBAT
	.4byte Move_RAGE_SNOUT
	.4byte Move_BULLDOZE
	.4byte Move_ELECTRO_BALL
	.4byte Move_FLAME_CHARGE
	.4byte Move_BOUNCY_BUBBLE
	.4byte Move_COLLISION_COURSE
	.4byte Move_COIL
	.4byte Move_ROCKET_PUNCH
	.4byte Move_DODGE_IT
	.4byte Move_NUZZLE
	.4byte Move_FAIRY_TAIL
	.4byte Move_DOUBLE_JUMP
	.4byte Move_WATERBOLT
	.4byte Move_VAULT_TACKLE
	.4byte Move_BLU_FLARE
	.4byte Move_ROUND
	.4byte Move_CIRCLE_THROW
	.4byte Move_CHILL_HEADBUTT
	.4byte Move_AURA_SPHERE
	.4byte Move_HEAD_SMASH
	.4byte Move_HEAD_CHARGE
	.4byte Move_BACK_AIR
	.4byte Move_REST_HBOX
	.4byte Move_POP_OFF
	.4byte Move_UP_THROW
	.4byte Move_UP_DOG
	.4byte Move_CRAB_THROW
	.4byte Move_WALL_OF_PAIN
	.4byte Move_SECRET_SWORD
	.4byte Move_EARTH_POWER
	.4byte Move_SACRED_SWORD
	.4byte Move_FAIRY_FANG
	.4byte Move_ATTACK_ORDER
	.4byte Move_STOMPING_TANTRUM
	.4byte Move_THUNDURUS_KICK
	.4byte Move_TORNADUS_KICK
	.4byte Move_TAKE_HEART
	.4byte Move_POPULATION_BOMB
	.4byte Move_DADDLING_GLEAM
	.4byte Move_PAY_DAD
	.4byte Move_SUNNY_DAD
	.4byte Move_LIQUIDADTION
	.4byte Move_CHATTER
	.4byte Move_FURY_SWIPE_1
	.4byte Move_FURY_SWIPE_2
	.4byte Move_FURY_SWIPE_3
	.4byte Move_FURY_SWIPE_4
	.4byte Move_FURY_SWIPE_5
	.4byte Move_STRUGGLE_BUG
	.4byte Move_X_SCISSOR
	.4byte Move_IRON_HEAD
	.4byte Move_PRECIPICE_BLADES
	.4byte Move_AQUA_STEP
	.4byte Move_SOMESENSORY
	.4byte Move_NOSENSORY
	.4byte Move_HEALING_WISH
	.4byte Move_REAL_TEARS
	.4byte Move_SHADOW_SNEAK
	.4byte Move_PUKE_BLOOD
	.4byte Move_ACID_SPRAY
	.4byte Move_DRILL_RUN
	.4byte Move_ROCK_PUNCH
	.4byte Move_ROCK_CLIMB
	.4byte Move_CONFIDE
	.4byte Move_DUAL_WINGBEAT
	.4byte Move_JAB
	.4byte Move_SPECIALPUNCH
	.4byte Move_PSYCHIC_PUNCH
	.4byte Move_MOONGEIST_BEAM
	.4byte Move_SHELL_SMASH
	.4byte Move_PSYCICLE_SPEAR
	.4byte Move_CONVERSION_Z
	.4byte Move_BOLTBEAM
	.4byte Move_ROUNDEN
	.4byte Move_THROAT_CHOP
	.4byte Move_DRAGON_HAMMER
	.4byte Move_PICKLE_SPEAR
	.4byte Move_DRUM_BEATING
	.4byte Move_BESTOW
	.4byte Move_SKY_DROP
	.4byte Move_DELIVERY
	.4byte Move_AUTOMOTIZE
	.4byte Move_HI_HORSEPOWER
	.4byte Move_HEAL_BLOCK
	.4byte Move_GULP
	.4byte Move_GROUND_POUND
	.4byte Move_PSYSTORM
	.4byte Move_SHADOW_IMAGES
	.4byte Move_G_MAX_CUDDLE
	.4byte Move_EXTREME_EVOBOOST
	.4byte Move_VEEVEE_VOLLEY
	.4byte Move_NORMALLY_NORMAL
	.4byte Move_MOONBLAST
	.4byte Move_MYSTICAL_FIRE
	.4byte Move_JUDGEMENT
	.4byte Move_RAGE_POWDER
	.4byte Move_TRICK_ROOM
	.4byte Move_ALLY_SWITCH
	.4byte Move_DUSK_BALL
	.4byte Move_TM07
	.4byte Move_ZAP_TAP
	.4byte Move_THUNDERJOLT
	.4byte Move_LIGHTNING
	.4byte Move_WIDE_SLASH
	.4byte Move_VACUUM_CUT
	.4byte Move_FOCUS_MISS
	.4byte Move_TRY_ATTACK
	.4byte Move_TAX_FRAUD
	.4byte Move_PYRO_BALL
	.4byte Move_FICKLE_BEAM
	.4byte Move_LEAF_STORM
	.4byte Move_BARRAGE_2
	.4byte Move_BARRAGE_3
	.4byte Move_BARRAGE_4
	.4byte Move_WOOD_HAMMER
	.4byte Move_BREADBUTT
	.4byte Move_BUTTER_BLADE
	.4byte Move_PICKLE_BEAM
	.4byte Move_CHEESE_DRY
	.4byte Move_LEAF_TOMATO
	.4byte Move_LETTUCE_SNUGGLE
	.4byte Move_MEATEOR_BEAM
	.4byte Move_BREAD_CHARGE
	.4byte Move_MIND_BLOWN
	.4byte Move_ICE_O_CUT
	.4byte Move_FURRY_SWIPES
	.4byte Move_FURY_SWIPE_6
	.4byte Move_FOLLOW_MIE
	.4byte Move_MIE_FIRST
	.4byte Move_MIETEOR_MASH
	.4byte Move_MIETEOR_BEAM
	.4byte Move_DRACO_MIETEOR
	.4byte Move_MIELING_WISH
	.4byte Move_MIEF
	.4byte Move_PSYCHO_CUT
	.4byte Move_AQUA_CUTTER
	.4byte Move_BUG_BITE
	.4byte Move_QUIVER_DANCE
	.4byte Move_U_TURN
	.4byte Move_FIRST_IMPRESSION
	.4byte Move_SAVAGE_SPIN_OUT
	.4byte Move_SINGLE_WINGBEAT
	.4byte Move_CONFUSION_PSYDUCK
	.4byte Move_DYNAMIC_CRUNCH
	.4byte Move_MUD_SPOUT
	.4byte Move_FOURSIGHT
	.4byte Move_STEEL_WANG
	.4byte Move_WONDER_SEED
	.4byte Move_COPYCAT
	.4byte Move_BLOOD_MOON
	.4byte Move_EVIL_METRONOME
	.4byte Move_SHADOW_FORCE
	.4byte Move_DARK_PULSE
	.4byte Move_TRUMP_CARD
	.4byte Move_DRAGON_PULSE
	.4byte Move_HEAL_PULSE
	.4byte Move_ORIGIN_PULSE
	.4byte Move_WICKED_TORQUE
	.4byte Move_NOXIOUS_TORQUE
	.4byte Move_MAGICAL_TORQUE
	.4byte Move_COMBAT_TORQUE
	.4byte Move_SPARKLY_SWIRL
	.4byte Move_SYRUP_BOMB
	.4byte Move_MAKE_IT_RAIN
	.4byte Move_FLASH_CANNON
	.4byte Move_BROCK_TOMB
	.4byte Move_BROCK_BLAST
	.4byte Move_BROCK_WRECKER
	.4byte Move_UPPER_HAND
	.4byte Move_HORN_LEECH
	.4byte Move_FISHIOUS_REND
	.4byte Move_BRAVE_BIRD
	.4byte Move_MAX_AIRSTREAM
	.4byte Move_STEAMROLLER
	.4byte Move_SLASH_TCG
	.4byte Move_SWORDSDANCE_TCG
	.4byte Move_SUBSTITUTE_2
	.4byte Move_GUILLOTINE_2
	.4byte Move_LICK_DOUBLE_SLAP
	.4byte Move_LICK_TICKLE
	.4byte Move_LICK_DISARMING_VOICE
	.4byte Move_LICK_WATER_GUN
	.4byte Move_LICK_STRING_SHOT
	.4byte Move_LICK_WRAP
	.4byte Move_LICK_HYPNOSIS
	.4byte Move_LICK_SOFTBOILED
	.4byte Move_LICK_BODY_SLAM
	.4byte Move_LICK_JUNGLE_HEALING
	.4byte Move_LICK_THRASH
	.4byte Move_LICK_HYDRO_PUMP
	.4byte Move_LICK_RELIC_SONG
	.4byte Move_DIVE_CANCEL
	.4byte Move_DIG_CANCEL
	.4byte Move_SHADOW_FORCE_CANCEL
	.4byte Move_RAZOR_WIND_CANCEL
	.4byte Move_CLANGAROUS_SOUL_CANCEL
	.4byte Move_CONFUSEON
	.4byte Move_FRUSTRATEON
	.4byte Move_LIQUIDATEON
	.4byte Move_EON_DELUGE
	.4byte Move_RUINATEON
	.4byte Move_ERUPTEON
	.4byte Move_EXPLOSEON
	.4byte Move_BUZZY_BUZZ
	.4byte Move_SIZZLY_SLIDE
	.4byte Move_BADDY_BAD
	.4byte Move_FREEZY_FLOW
	.4byte Move_SAPPY_SEED
	.4byte Move_GLITZY_GLOSSED
	.4byte Move_JET_PUNCH_2
	.4byte Move_FLYING_PRESS
	.4byte Move_TAIL_SLAP
	.4byte Move_ZEKROM_KICK
	.4byte Move_RAIN_DANCE_2
	.4byte Move_AQUA
	.4byte Move_WHIP
	.4byte Move_SLAP
	.4byte Move_POISON
	.4byte Move_IRON
	.4byte Move_SHED
	.4byte Move_WIND
	.4byte Move_GLOW
	.4byte Move_REFLECT_2
	.4byte Move_QWICK_ATTACK
	.4byte Move_WHISH
	.4byte Move_AURA_SPHERE_2
	.4byte Move_GYRO_BALL
	.4byte Move_SYHNCRHONOZHE
	.4byte Move_CURSE_GRENINJA
	.4byte Move_LION_LADDER
	.4byte Move_STRANGE_STEAM
	.4byte Move_DARK_VOID
	.4byte Move_ELECTRIFY
	.4byte Move_FLARE_BLITZ
	.4byte Move_AGILITY_DUMB
	.4byte Move_MAGNET_RISE
	.4byte Move_SHOOT
	.4byte Move_108_TUPLE_TEAM
	.4byte Move_THUNDER_WAVE_CYNTHIA
	.4byte Move_THORN_WHIP
	.4byte Move_RAINBOW_BEAM
	.4byte Move_TRIPLE_WINGBEAT
	.4byte Move_DOUBLE_DIP
	.4byte Move_DOUBLE_DAD
	.4byte Move_FLY_CYNTHIA
	.4byte Move_FREEZE_DRY
	.4byte Move_LEAFAGE
	.4byte Move_SHOOT_BIG
	.4byte Move_ADOBE_FLASH
	.4byte Move_RAPID_WIN
	.4byte Move_ONEISHMENT
	.4byte Move_ME_FIRST
	.4byte Move_WEEDLE_ARM
	.4byte Move_HYPER_BEE
	.4byte Move_ROAR_OF_PRIME
	.4byte Move_SONIC_BOOM_2
	.4byte Move_MEAN_LOOK_LOOK
	.4byte Move_CHIP_AWAY
	.4byte Move_DRAINING_KISS
	.4byte Move_PLAY_ROUGH
	.4byte Move_LIGHT_SNEAK
	.4byte Move_LIGHT_PUNCH
	.4byte Move_LIGHT_BALL
	.4byte Move_LIGHT_OF_RUIN
	.4byte Move_PLAY_NICE
	.4byte Move_SHADOW_SCREEN
	.4byte Move_SHADOW_OF_RUIN
	.4byte Move_SENTENNIEL_KICK
	.4byte Move_TRIPLE_PSYCLE
	.4byte Move_TENTAZOOKA
	.4byte Move_TOEDSZOOKA
	.4byte Move_INCINERATE
	.4byte Move_FACADE_PSYDUCK
	.4byte Move_QUICK_BALL
	.4byte Move_ENERGY_BALL
	.4byte Move_DIVE_BALL
	.4byte Move_REPEAT_BALL
	.4byte Move_LURE_BALL
	.4byte Move_HEAL_BALL
	.4byte Move_DREAM_BALL
	.4byte Move_TIMER_BALL
	.4byte Move_SKILL_ISSUE
	.4byte Move_FALCON_PUNCH
	.4byte Move_SLURF
	.4byte Move_LEAF_BLADE_DUCK
	.4byte Move_WATER_GUN_2
	.4byte Move_BADGEBOOST
	.4byte Move_RHYDON
	.4byte Move_CANCEL
	.4byte Move_COOLTRAINERM
	.4byte Move_TMTRAINER
	.4byte Move_KINICES
	.4byte Move_AL_LURING_VOICE
	.4byte Move_HYPNOSICE
	.4byte Move_CREAM_EATER
	.4byte Move_CEREAL_PULSE
	.4byte Move_SPOONGEIST_BEAM
	.4byte Move_SPOON_STEEL_STRIKE
	.4byte Move_SOUPERPOWER
	.4byte Move_PSYCHO_SCOOP
	.4byte Move_AL_OUT_PUMMELING
	.4byte Move_SNOWGRAVY
	.4byte Move_LANDS_WRATH
	.4byte Move_FLING
	.4byte Move_DUO_ATTACK
	.4byte Move_LITTHBRNTHEYES
	.4byte Move_SYSTEM32
	.4byte Move_CLICK_HERE
	.4byte Move_MOVIES_FREE
	.4byte Move_GAMING_TOOLBARS
	.4byte Move_ZIPBOMB
	.4byte Move_FIREREDCHEATS
	.4byte Move_ANTI_VIRUS
	.4byte Move_SHE_LL_SMASH
	.4byte Move_SHE_HER_COLD
	.4byte Move_MISTY_EXPLOSION
	.4byte Move_BRAVE_BIRTH
	.4byte Move_ACCELEBROCK
	.4byte Move_LICKLE_BEAM
	.4byte Move_NICE_SHARD
	.4byte Move_CHERRY_FACE
	.4byte Move_NICICLE_CRASH
	.4byte Move_TWIN_BEAM
	.4byte Move_NICE_HAMMER
	.4byte Move_NICE_SPINNER
	.4byte Move_NICE_BEAM
	.4byte Move_DANKEST_LARIAT
	.4byte Move_CLANGSOULBLAZE
	.4byte Move_AZUBATICS
	.4byte Move_AGOLBATICS
	.4byte Move_ACROBATICS
	.4byte Move_W_TURN
	.4byte Move_AWOOBATICS
	.4byte Move_WOMP
	.4byte Move_WOOST
	.4byte Move_WAGON_ASCENT
	.4byte Move_MING_ATTACK
	.4byte Move_NOGGIN_FLOGGIN
	.4byte Move_STAMPETE
	.4byte Move_TOUCH_FUZZY
	.4byte Move_DISCHARGE
	.4byte Move_CRY_ATTACK
	.4byte Move_DENIAL
	.4byte Move_ANGER
	.4byte Move_BARGAINING
	.4byte Move_DEPRESSION
	.4byte Move_ACCEPTANCE
	.4byte Move_TASTY_PLOT
	.4byte Move_DARKEST_LARIAT
	.4byte Move_CHOC_WAVE
	.4byte Move_DAZZLING_CREAM
	.4byte Move_SKETCHUP
	.4byte Move_TACHYONIONCTTR
	.4byte Move_EXTREMESPEENUT
	.4byte Move_DOUBLE_CHOCK
	.4byte Move_HYPER_CREAM
	.4byte Move_SESAMESEEDBOMB
	.4byte Move_DYNAMICLUNCH
	.4byte Move_CLAM_MIND
	.4byte Move_EXTREMESLOTH
	.4byte Move_SHELLSIDEASS
	.4byte Move_SLOWTH
	.4byte Move_BROWTH
	.4byte Move_SUNNY_DAYCARE
	.4byte Move_MART_STRIKE
	.4byte Move_SWEET_CENTER
	.4byte Move_ASSURANCH
	.4byte Move_CEFEINT_ATTACK
	.4byte Move_HIDDEN_TOWER
	.4byte Move_ANCIENT_TOWER
	.4byte Move_LIGHT_OF_RUINS
	.4byte Move_GRASSYTERRAIN
	.4byte Move_ASTRAL_BARRAGE
	.4byte Move_NOT_CUT
	.4byte Move_ICEBLADE
	.4byte Move_KOWTOW_CLEAVE
	.4byte Move_BITTER_BLADE
	.4byte Move_ARMOR_CANNON
	.4byte Move_DEFOG
	.4byte Move_LUNAR_BLESSING
	.4byte Move_LUNAR_DANCE
	.4byte Move_ROAR_OF_GRIME
	.4byte Move_BELCH
	.4byte Move_MUSTARD_SLAP
	.4byte Move_BONEMERANCH
	.4byte Move_BARBEQUAKE
	.4byte Move_TARTARBOLT
	.4byte Move_ALIOLI_ACE
	.4byte Move_CHILI_RECEPTION
	.4byte Move_SRIRACHA_GOTCHA
	.4byte Move_HAPPY_HOUR
	.4byte Move_HAIR_BLITZ
	.4byte Move_COTTON_GUARD
	.4byte Move_COTTON_GONE
	.4byte Move_HAIR_CUTTER
	.4byte Move_ELECTRO_BALD
	.4byte Move_MAGNINUDE
	.4byte Move_NAKE_IT_RAIN
	.4byte Move_BOLT_STREAK
	.4byte Move_FLASH_AMPHAROS
	.4byte Move_FURY_ATTACK_2
	.4byte Move_FURY_ATTACK_3
	.4byte Move_ITS_NOT_OAK
	.4byte Move_FURRY_ATTACK_2
	.4byte Move_BURNING_JEALOUSY
	.4byte Move_DISARMINGCHOICE
	.4byte Move_LOWER_HAND
	.4byte Move_TOO_SLOWER_HAND
	.4byte Move_CLAMPUTATE
	.4byte Move_DISARMED_VOICE
	.4byte Move_BLEEDLE_ARM
	.4byte Move_PAIN_DANCE
	.4byte Move_PHANTOM_PUNCH
	.4byte Move_ROCK_KICK
	.4byte Move_PSY_BIEM
	.4byte Move_BUBBBIEM
	.4byte Move_BLAST_OFF
	.4byte Move_FLOWER_TRICK
	.4byte Move_PARTING_SHOT
	.4byte Move_SPARKLING_ARIA
	.4byte Move_CUTE
	.4byte Move_BROCK_THROW
	.4byte Move_SHADOW_SHIELD
	.4byte Move_QUINTUPLE_WINGBEAT
	.4byte Move_VOLCANIC_HEALING
	.4byte Move_10000_VOLTS
	.4byte Move_BOLT_STRIKE
	.4byte Move_BLUE_FLARE
	.4byte Move_GOLD_WIND
	.4byte Move_CRYSTAL_WIND
	.4byte Move_PLUCK
	.4byte Move_RIGHT_SCREEN
	.4byte Move_THUNDER_ARMOR
	.4byte Move_PUFF_UP
	.4byte Move_INFESTATION
	.4byte Move_TOXIC_TREAD
	.4byte Move_GRASS_KNOT
	.4byte Move_AERIAL_LACE
	.4byte Move_NIKE_CANNON
	.4byte Move_CLANGOROUS_SOLE
	.4byte Move_REFLECT_TYPE
	.4byte Move_SKULL_ISSUE
	.4byte Move_POWER_UP_PUNCH
	.4byte Move_FACADE_DUCK
	.4byte Move_NOTHING
	.4byte Move_WATER_GUN_MISSINGNO
	.4byte Move_COOLTRAINER_M
	.4byte Move_MAIL_SLAP
	.4byte Move_STRAP_ON
	.4byte Move_FLARE_CLITZ
	.4byte Move_LUSTER_PUBE
	.4byte Move_RISING_VULVAGE
	.4byte Move_PANTY_SHOT
	.4byte Move_MOONLIGHT_YEAR
	.4byte Move_CHERRY_BOMB
	.4byte Move_TRAILBLAZE
	.4byte Move_POWER_TRIP
	.4byte Move_CLANGOROUS_SOULBLAZE
	.4byte Move_ABSORB_ZUBAT
	.4byte Move_CEASELESS_BREADGE
	.4byte Move_BREADLONG_RUSH
	.4byte Move_SLOW_KICK
	.4byte Move_EXTREME_SLOW
	.4byte Move_SHELL_SIDE_ASS
	.4byte Move_MAGNET_BOMB
	.4byte Move_CAFEINT_ATTACK
	.4byte Move_GRASSY_TERRAIN
	.4byte Move_NIGHT_SLASH
	.4byte Move_CUTRAGE
	.4byte Move_FLYING_ASCENT
	.4byte Move_DOODLE
	.4byte Move_DARK_VOID_SMEARGLE
	.4byte Move_FURY_ATTACK1
	.4byte Move_FURY_ATTACK2
	.4byte Move_FURY_ATTACK3
	.4byte Move_FURY_ATTACK5
	.4byte Move_FURRY_ATTACK1
	.4byte Move_FURRY_ATTACK2
	.4byte Move_PSY_MIEM
	.4byte Move_BUBBLE_MIEM
	.4byte Move_AFTER_YU
	.4byte Move_HAPPY_OUR
	.4byte Move_FISH_US_REND
	.4byte Move_DIRE_IT
	.4byte Move_FOUL_THEY
	.4byte Move_BLUE_HAIR
	.4byte Move_HONE_CLAWS
	.4byte Move_BABY_DOLL_EYES
	.4byte Move_RELIC_SONG
	.4byte Move_DAZZLING_GLEAM
	.4byte Move_VACUUM_WAVE
	.4byte Move_CRUSH_GRIP
	.4byte Move_CLEAR_SMOG
	.4byte Move_LAVA_PLUME
	.4byte Move_HIGH_HORSEPOWER
	.4byte Move_FIRE_PLAST
	.4byte Move_IRAN_TAIL
	.4byte Move_MIRAQLE_EYE
	.4byte Move_ARABOLIC_CHARGE
	.4byte Move_TRIPLE_DIVE
	.4byte Move_TRIPLE_DIVE_2
	.4byte Move_TRIPLE_DIVE_3
	.4byte Move_TEHRANDERBOLT
	.4byte Move_RAGING_FURRY
	.4byte Move_HARDBOILED
	.4byte Move_YESPER_WING
	.4byte Move_PSYCH_YUP
	.4byte Move_AQUA_YEP
	.4byte Move_SURE_UP
	.4byte Move_MIRACLE_AYE
	.4byte Move_FILLET_OKAY
	.4byte Move_YESIPICE_BLADES
	.4byte Move_OBLIVION_OUING
	.4byte Move_MISTER
	.4byte Move_CHILLY_RECEPTION
	.4byte Move_MISTER_TERRAIN
	.4byte Move_MISTER_EXPLOSION
	.4byte Move_DADDY_DAD
	.4byte Move_ITCHY_POLLEN
	.4byte Move_DO_THE_WAVE
	.4byte Move_MIND_GAMES
	.4byte Move_GARBOTOXIN
	.4byte Move_EEEEEEEK
	.4byte Move_EEEEEEEEK
	.4byte Move_EEEEEEEEEK
	.4byte Move_EK
	.4byte Move_CALL_FOR_GOONS
	.4byte Move_EVERYBODY_EXPLODE_NOW
	.4byte Move_VISUAL_SNOW
	.4byte Move_PSYCHIC_SPINNER
	.4byte Move_SNOW_FORECAST
	.4byte Move_ICE_TERRAIN
	.4byte Move_EXPANDING_FROST
	.4byte Move_ICESTRIKE
	.4byte Move_F_STINGER
	.4byte Move_F_BOMB
	.4byte Move_O_POWER
	.4byte Move_G_M_B_FUDDLE
	.4byte Move_C_STINGER
	.4byte Move_H_ORDER
	.4byte Move_A_ORDER
	.4byte Move_P_MISSILE
	.4byte Move_T_GLOW
	.4byte Move_E_EXIT
	.4byte Move_R_POWDER
	.4byte Move_3_KICK
	.4byte Move_ROCK_GUN
	.4byte Move_BREAKING_BIND
	.4byte Move_ANCIENT_BITE
	.4byte Move_CONSTRACKLE
	.4byte Move_GIGA_BRINE
	.4byte Move_EARTHPUMP
	.4byte Move_DRAGON_CANNON
	.4byte Move_CHARM_SMASH
	.4byte Move_FUSION_FLARE
	.4byte Move_BITE_POWER
	.4byte Move_CAMBRIAN_EXPLOSION
	.4byte Move_FAKE_TREERS
	.4byte Move_REAL_TREERS
	.4byte Move_VEIN_WHIP
	.4byte Move_BRANCH_POKE
	.4byte Move_BARK_SLIDE
	.4byte Move_GRAVEL_APPLE
	.4byte Move_SHOWER_GEM
	.4byte Move_REAL_AXE
	.4byte Move_FLIP_TURN
	.4byte Move_HEART_BEAT
	.4byte Move_BITTER_SPADE
	.4byte Move_DIAMOND_STORM
	.4byte Move_BRANCH_POKER
	.4byte Move_HEARTING_SHOT
	.4byte Move_PSYSICLE_CRASH
	.4byte Move_DOUBLE_IRON_BASH
	.4byte Move_PLAY_NPSYCHIC
	.4byte Move_IRON_TAILS
	.4byte Move_CONFUSING_GLARE
	.4byte Move_SECRET_LIFE_DEW
	.4byte Move_G_MAX_CHILDFIRE
	.4byte Move_DEMOND_STORM
	.4byte Move_TAIL_BLOW
	.4byte Move_FAIL_GLOW
	.4byte Move_P_CREATE
	.4byte Move_SCARED_FIRE
	.4byte Move_AEROBLASS
	.4byte Move_SHYSTRIKE
	.4byte Move_SPACIAL_FRIEND
	.4byte Move_ROAR_OF_THYME
	.4byte Move_DARK_LLOYD
	.4byte Move_BORE_ENFORCER
	.4byte Move_LANDS_BATH
	.4byte Move_PSYCHO_BOOTS
	.4byte Move_FUDGEMENT
	.4byte Move_PHIOMANCY
	.4byte Move_SKYRIM_WING
	.4byte Move_ETERNABEAM
	.4byte Move_FORCE_PALM
	.4byte Move_MONSTER_MASH
	.4byte Move_NIHIL_LIGHT
	.4byte Move_OBLIVION_ZING
	.4byte Move_ZEOMANCY
	.4byte Move_NONUPLE_WINGBEAT
	.4byte Move_POWER_UP_PUP
	.4byte Move_BARK_BARRAGE
	.4byte Move_ROLLOVER
	.4byte Move_VACUUM_FEAR
	.4byte Move_WOOF_HAMMER
	.4byte Move_NINE_WHIP
	.4byte Move_BEHEMOTH_BLAST
	.4byte Move_PSYSTRIKE
	.4byte Move_GENESIS_SUPERNOVA
	.4byte Move_FLAMETHROWER_MEWTWO
	.4byte Move_LAST_RESORT
	.4byte Move_DOUBLE_FURY_SWIPE
	.4byte Move_NEUTRAL_METRONOME
	.4byte Move_PLAY_DAY
	.4byte Move_PAY_ROUGH
	.4byte Move_VINE_SLAP
	.4byte Move_PUNCTURE
	.4byte Move_BLUNDERBOLT
	.4byte Move_FAULTERGEIST
	.4byte Move_PHISHIOUS_REND
	.4byte Move_ANGRY_SLICE
	.4byte Move_ANGRY_SLICE_2
	.4byte Move_ANGRY_SLICE_3
	.4byte Move_BOMBARDMENT
	.4byte Move_LETS_STRUGGLE_FOREVER
	.4byte Move_CLOSE_MOMBAT
	.4byte Move_TEACH_LIFE
	.4byte Move_HEADBUS
	.4byte Move_LANDS_MATH
	.4byte Move_SPELLING_SALTS
	.4byte Move_ART_STRIKE
	.4byte Move_CHILLY_RECESSION
	.4byte Move_POWER_GYM
	.4byte Move_X_SCIENCER
	.4byte Move_HISTORY_EXPLOSION
	.4byte Move_BUS_BUZZ
	.4byte Move_BLAST_LEARN
	.4byte Move_HEART_STAMP
	.4byte Move_DRAGON
	.4byte Move_MOLTRES_KICK
	.4byte Move_WHITE_LIGHTNING
	.4byte Move_GASTER_BLASTER
	.4byte Move_TEATIME
	.4byte Move_COLONIZE
	.4byte Move_STUPORPOWER
	.4byte Move_YEST
	.4byte Move_PLEDGE_OF_ALLEGIANCE
	.4byte Move_PERISH_TONGUE
	.4byte Move_MULTISHINE
	.4byte Move_REVELATION_DANCE
	.4byte Move_TRICK_OR_TREAT
	.4byte Move_AURORA_VEIL
	.4byte Move_COUNT @ cannot be reached

	.align 2
gBattleAnims_StatusConditions::
	.4byte Status_Poison                    @ B_ANIM_STATUS_PSN
	.4byte Status_Confusion                 @ B_ANIM_STATUS_CONFUSION
	.4byte Status_Burn                      @ B_ANIM_STATUS_BRN
	.4byte Status_Infatuation               @ B_ANIM_STATUS_INFATUATION
	.4byte Status_Sleep                     @ B_ANIM_STATUS_SLP
	.4byte Status_Paralysis                 @ B_ANIM_STATUS_PRZ
	.4byte Status_Freeze                    @ B_ANIM_STATUS_FRZ
	.4byte Status_Curse                     @ B_ANIM_STATUS_CURSED
	.4byte Status_Nightmare                 @ B_ANIM_STATUS_NIGHTMARE

	.align 2
gBattleAnims_General::
	.4byte General_CastformChange           @ B_ANIM_CASTFORM_CHANGE
	.4byte General_StatsChange              @ B_ANIM_STATS_CHANGE
	.4byte General_SubstituteFade           @ B_ANIM_SUBSTITUTE_FADE
	.4byte General_SubstituteAppear         @ B_ANIM_SUBSTITUTE_APPEAR
	.4byte General_BaitThrow                @ B_ANIM_BAIT_THROW
	.4byte General_ItemKnockoff             @ B_ANIM_ITEM_KNOCKOFF
	.4byte General_TurnTrap                 @ B_ANIM_TURN_TRAP
	.4byte General_HeldItemEffect           @ B_ANIM_HELD_ITEM_EFFECT
	.4byte General_SmokeballEscape          @ B_ANIM_SMOKEBALL_ESCAPE
	.4byte General_FocusBand                @ B_ANIM_FOCUS_BAND
	.4byte General_Rain                     @ B_ANIM_RAIN_CONTINUES
	.4byte General_Sun                      @ B_ANIM_SUN_CONTINUES
	.4byte General_Sandstorm                @ B_ANIM_SANDSTORM_CONTINUES
	.4byte General_Hail                     @ B_ANIM_HAIL_CONTINUES
	.4byte General_LeechSeedDrain           @ B_ANIM_LEECH_SEED_DRAIN
	.4byte General_MonHit                   @ B_ANIM_MON_HIT
	.4byte General_ItemSteal                @ B_ANIM_ITEM_STEAL
	.4byte General_SnatchMove               @ B_ANIM_SNATCH_MOVE
	.4byte General_FutureSightHit           @ B_ANIM_FUTURE_SIGHT_HIT
	.4byte General_DoomDesireHit            @ B_ANIM_DOOM_DESIRE_HIT
	.4byte General_FocusPunchSetUp          @ B_ANIM_FOCUS_PUNCH_SETUP
	.4byte General_IngrainHeal              @ B_ANIM_INGRAIN_HEAL
	.4byte General_WishHeal                 @ B_ANIM_WISH_HEAL
	.4byte General_MonScared                @ B_ANIM_MON_SCARED
	.4byte General_GhostGetOut              @ B_ANIM_GHOST_GET_OUT
	.4byte General_SilphScoped              @ B_ANIM_SILPH_SCOPED
	.4byte General_SafariRockThrow          @ B_ANIM_ROCK_THROW
	.4byte General_SafariReaction           @ B_ANIM_SAFARI_REACTION
	.4byte General_AlomomolaEvolve          @ B_ANIM_ALOMOMOLA_EVOLVE
	.4byte General_HangedOn                 @ B_ANIM_HANGED_ON
	.4byte General_TeraCharge               @ B_ANIM_TERA_CHARGE
	.4byte General_TeraActivate             @ B_ANIM_TERA_ACTIVATE
	.4byte General_TrickRoom                @ B_ANIM_TRICK_ROOM_CONTINUES
	.4byte General_SeelHoopaTransform       @ B_ANIM_SEEL_HOOPA_TRANSFORM
	.4byte General_ShadowSky    			@ B_ANIM_SHADOW_SKY_CONTINUES
	.4byte General_ShadowSpikes 			@ B_ANIM_SHADOW_SPIKES
	.4byte General_ZapmolcunoTransform      @ B_ANIM_ZAPMOLCUNO_TRANSFORM
	.4byte General_RotomAppears             @ B_ANIM_ROTOM_APPEARS
	.4byte General_RotomComesDown           @ B_ANIM_ROTOM_COMES_DOWN
	.4byte General_DoubleDipHit             @ B_ANIM_DOUBLE_DIP_HIT
	.4byte General_ChargeTurn               @ B_ANIM_CHARGE_TURN

	.align 2
gBattleAnims_Special::
	.4byte Special_LevelUp                  @ B_ANIM_LVL_UP
	.4byte Special_SwitchOutPlayerMon       @ B_ANIM_SWITCH_OUT_PLAYER_MON
	.4byte Special_SwitchOutOpponentMon     @ B_ANIM_SWITCH_OUT_OPPONENT_MON
	.4byte Special_BallThrow                @ B_ANIM_BALL_THROW
	.4byte Special_BallThrowWithTrainer     @ B_ANIM_BALL_THROW_WITH_TRAINER
	.4byte Special_SubstituteToMon          @ B_ANIM_SUBSTITUTE_TO_MON
	.4byte Special_MonToSubstitute          @ B_ANIM_MON_TO_SUBSTITUTE

Move_NONE:
Move_MIRROR_MOVE:
Move_POUND:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_DOUBLE_SLAP:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	choosetwoturnanim DoubleSlapLeft, DoubleSlapRight

DoubleSlapContinue:
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

DoubleSlapLeft:
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, 0, ANIM_TARGET, 2
	goto DoubleSlapContinue

DoubleSlapRight:
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 8, 0, ANIM_TARGET, 2
	goto DoubleSlapContinue

Move_POISON_POWDER:
	loadspritegfx ANIM_TAG_POISON_POWDER
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	loopsewithpan SE_M_POISON_POWDER, SOUND_PAN_TARGET, 10, 6
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -30, -22, 117, 80, 5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, 10, -22, 117, 80, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -25, -22, 117, 112, 5, 3
	delay 15
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -5, -22, 117, 80, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, 5, -22, 117, 96, 5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, 0, -22, 117, 69, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -15, -22, 117, 112, 5, 2
	delay 30
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -15, -22, 117, 112, 5, 2
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, 15, -22, 117, 80, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -10, -22, 117, 96, 7, 2
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -5, -22, 117, 90, -8, 0
	delay 20
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -10, -22, 117, 80, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, 0, -22, 117, 89, 5, 2
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, 20, -22, 117, 112, -8, 2
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, 5, -22, 117, 80, 5, 1
	waitforvisualfinish
	end

Move_STUN_SPORE:
	loadspritegfx ANIM_TAG_STUN_SPORE
	loopsewithpan SE_M_POISON_POWDER, SOUND_PAN_TARGET, 10, 6
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -30, -22, 117, 80, 5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 10, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -25, -22, 117, 112, 5, 3
	delay 15
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -5, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 5, -22, 117, 96, 5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 0, -22, 117, 69, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -15, -22, 117, 112, 5, 2
	delay 30
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -15, -22, 117, 112, 5, 2
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 15, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -10, -22, 117, 96, 7, 2
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -5, -22, 117, 90, -8, 0
	delay 20
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -10, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 0, -22, 117, 89, 5, 2
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 20, -22, 117, 112, -8, 2
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 5, -22, 117, 80, 5, 1
	waitforvisualfinish
	end

Move_SLEEP_POWDER:
	loadspritegfx ANIM_TAG_SLEEP_POWDER
	loopsewithpan SE_M_POISON_POWDER, SOUND_PAN_TARGET, 10, 6
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -30, -22, 117, 80, 5, 1
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, 10, -22, 117, 80, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -25, -22, 117, 112, 5, 3
	delay 15
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -5, -22, 117, 80, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, 5, -22, 117, 96, 5, 1
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, 0, -22, 117, 69, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -15, -22, 117, 112, 5, 2
	delay 30
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -15, -22, 117, 112, 5, 2
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, 15, -22, 117, 80, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -10, -22, 117, 96, 7, 2
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -5, -22, 117, 90, -8, 0
	delay 20
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -10, -22, 117, 80, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, 0, -22, 117, 89, 5, 2
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, 20, -22, 117, 112, -8, 2
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, 5, -22, 117, 80, 5, 1
	waitforvisualfinish
	end

Move_SWIFT:
	loadspritegfx ANIM_TAG_YELLOW_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, 20, 1
	delay 5
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 5, 22, -18, 1
	delay 5
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, -10, 22, 15, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 18, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 2, 0, 18, 1
	delay 5
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, -20, 1
	delay 5
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, 12, 1
	delay 5
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_STRENGTH:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ShakeAndSinkMon, 5, ANIM_ATTACKER, 2, 0, 96, 30
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 4
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_TARGET, 18, 6, 2, 4
	delay 4
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 16, 12, ANIM_TARGET, 1
	delay 4
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -16, -12, ANIM_TARGET, 1
	delay 4
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 3, 4, ANIM_TARGET, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_TACKLE:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_BODY_SLAM:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, ANIM_ATTACKER
	waitforvisualfinish
	delay 11
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 26, 0, 0, 5
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 4, -10, 0, ANIM_TARGET, 0
	loopsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET, 10, 2
	delay 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -28, 0, 0, 3
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 4, 0, 12, 1
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 6
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_SUPERSONIC:
	loadspritegfx ANIM_TAG_GOLD_RING
	monbg ANIM_ATK_PARTNER
	splitbgprio_foes ANIM_ATTACKER
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 2, 0, 8, 1
	call SupersonicRing
	call SupersonicRing
	call SupersonicRing
	call SupersonicRing
	call SupersonicRing
	call SupersonicRing
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

SupersonicRing:
	playsewithpan SE_M_SUPERSONIC, SOUND_PAN_ATTACKER
	createsprite gSupersonicRingSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 30, 0
	delay 2
	return

Move_SCREECH:
	loadspritegfx ANIM_TAG_PURPLE_RING
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 3, 0, 2, 1
	call ScreechRing
	call ScreechRing
	delay 16
	createvisualtask AnimTask_SwayMon, 5, 0, 6, 2048, 2, ANIM_TARGET
	waitforvisualfinish
	end

ScreechRing:
	playsewithpan SE_M_SCREECH, SOUND_PAN_ATTACKER
	createsprite gScreechRingSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 30, 0
	delay 2
	return

Move_SIZZLY_SLIDE:
Move_FLAME_WHEEL:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg ANIM_DEF_PARTNER
	splitbgprio_foes ANIM_TARGET
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 0
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 4
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 8
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 12
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 16
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 20
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 24
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 6
	delay 4
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 8, 1
	createvisualtask AnimTask_BlendMonInAndOut, 3, ANIM_TARGET, RGB_RED, 12, 1, 1
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	call FireSpreadEffect
	delay 7
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 9
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

FlameWheel1: @ Unused
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 50
	delay 4
	return

Move_PIN_MISSILE:
	loadspritegfx ANIM_TAG_NEEDLE
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	createsprite gPinMissileSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, -8, -8, 20, -32
	delay 15
	createsprite gPinMissileSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, 8, 8, 20, -40
	delay 4
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -8, -8, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 2, 1
	delay 9
	createsprite gPinMissileSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, 0, 0, 20, -32
	delay 4
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 8, 8, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 2, 1
	delay 14
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_ICICLE_SPEAR:
	loadspritegfx ANIM_TAG_ICICLE_SPEAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_ATTACKER
	createsprite gIcicleSpearSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, -8, -8, 20, -32
	delay 15
	createsprite gIcicleSpearSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, 8, 8, 20, -40
	delay 4
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -8, -8, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 2, 1
	delay 9
	createsprite gIcicleSpearSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, 0, 0, 20, -32
	delay 4
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 8, 8, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 2, 1
	delay 14
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_TAKE_DOWN:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_WindUpLunge, 5, ANIM_ATTACKER, -24, 8, 23, 10, 40, 10
	delay 35
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB_BLACK, 10, RGB_BLACK, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 4, -10, 0, ANIM_TARGET, 0
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	delay 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -16, 0, 0, 4
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 4, 0, 12, 1
	waitforvisualfinish
	delay 2
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_DOUBLE_EDGE:
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_ATTACKER, 4, 2, RGB_WHITE, 10, RGB_BLACK, 0
	waitforvisualfinish
	delay 10
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 18, 6, 2, 4
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 16, 16, RGB_WHITE
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 3
	waitforvisualfinish
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -10, 0, ANIM_TARGET, 0
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -32, 0, 0, 3
	waitforvisualfinish
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_ATTACKER, 0
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 4, 0, 12, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 4, 0, 12, 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 16, 0, RGB_WHITE
	waitforvisualfinish
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_ATTACKER, 1
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_TARGET, 1
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7
	waitforvisualfinish
	end

Move_POISON_STING:
	loadspritegfx ANIM_TAG_NEEDLE
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	createsprite gLinearStingerSpriteTemplate, ANIM_TARGET, 2, 20, 0, -8, 0, 20
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 5, 1
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	waitforvisualfinish
	call PoisonBubblesEffect
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_TWINEEDLE:
	loadspritegfx ANIM_TAG_NEEDLE
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	loopsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER, 6, 2
	createsprite gLinearStingerSpriteTemplate, ANIM_TARGET, 2, 10, -4, 0, -4, 20
	createsprite gLinearStingerSpriteTemplate, ANIM_TARGET, 2, 20, 12, 10, 12, 20
	delay 20
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 5, 1
	createsprite gHandleInvertHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -4, 1, 3
	loopsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET, 5, 2
	delay 1
	createsprite gHandleInvertHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 10, 12, 1, 3
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_FIRE_BLAST:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	createsoundtask SoundTask_FireBlast, SE_M_FLAME_WHEEL, SE_M_FLAME_WHEEL2
	call FireBlastRing
	call FireBlastRing
	call FireBlastRing
	delay 24
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 3, 0, 8, RGB_BLACK
	waitforvisualfinish
	delay 19
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 20, 1
	call FireBlastCross
	delay 3
	call FireBlastCross
	delay 3
	call FireBlastCross
	delay 3
	call FireBlastCross
	delay 3
	call FireBlastCross
	delay 3
	call FireBlastCross
	delay 3
	call FireBlastCross
	delay 3
	call FireBlastCross
	delay 3
	call FireBlastCross
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 2, 8, 0, RGB_BLACK
	waitforvisualfinish
	end

FireBlastRing:
	createsprite gFireBlastRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0
	createsprite gFireBlastRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 51
	createsprite gFireBlastRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 102
	createsprite gFireBlastRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 153
	createsprite gFireBlastRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 204
	delay 5
	return

FireBlastCross:
	createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, 0, 0, 10, 0, -2
	createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, 0, 0, 13, -2, 0
	createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, 0, 0, 13, 2, 0
	createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, 0, 0, 15, -2, 2
	createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, 0, 0, 15, 2, 2
	return

Move_LEECH_SEED:
	loadspritegfx ANIM_TAG_SEED
	playsewithpan SE_M_POISON_POWDER, SOUND_PAN_ATTACKER
	createsprite gLeechSeedSpriteTemplate, ANIM_TARGET, 2, 15, 0, 0, 24, 35, -32
	delay 8
	playsewithpan SE_M_POISON_POWDER, SOUND_PAN_ATTACKER
	createsprite gLeechSeedSpriteTemplate, ANIM_TARGET, 2, 15, 0, -16, 24, 35, -40
	delay 8
	playsewithpan SE_M_POISON_POWDER, SOUND_PAN_ATTACKER
	createsprite gLeechSeedSpriteTemplate, ANIM_TARGET, 2, 15, 0, 16, 24, 35, -37
	delay 12
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_TARGET, 10, 8
	waitforvisualfinish
	end

Move_RAZOR_LEAF:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loopsewithpan SE_M_EMBER, SOUND_PAN_ATTACKER, 5, 2
	createsprite gEmberSpriteTemplate, ANIM_TARGET, 2, 20, 0, -16, 24, 20, 1
	delay 4
	createsprite gEmberSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 24, 20, 1
	delay 4
	createsprite gEmberSpriteTemplate, ANIM_TARGET, 2, 20, 0, 16, 24, 20, 1
	delay 16
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_TARGET
	call EmberFireHit
	call EmberFireHit
	call EmberFireHit
	end

EmberFireHit:
	createsprite gEmberFlareSpriteTemplate, ANIM_TARGET, 2, -24, 24, 24, 24, 20, ANIM_TARGET, 1
	delay 4
	return

Move_MEGA_PUNCH:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_TARGET
	delay 2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 0, 16, RGB_BLACK
	setalpha 12, 8
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_TARGET
	createsprite gMegaPunchKickSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 50
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 7, RGB_WHITE
	delay 50
	call SetImpactBackground
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 22, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 0, RGB_WHITE
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB_BLACK, 8, RGB_BLACK, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	delay 2
	restorebg
	waitbgfadein
	end

SetImpactBackground:
	delay 2
	createvisualtask AnimTask_IsContest, 2
	jumprettrue SetImpactContestsBG
	createvisualtask AnimTask_IsTargetPlayerSide, 2
	jumpretfalse SetImpactOpponentBG
	jumprettrue SetImpactPlayerBG
SetImpactBackgroundRet:
	return

SetImpactOpponentBG:
	changebg BG_IMPACT_OPPONENT
	goto SetImpactBackgroundRet

SetImpactPlayerBG:
	changebg BG_IMPACT_PLAYER
	goto SetImpactBackgroundRet

SetImpactContestsBG:
	changebg BG_IMPACT_CONTESTS
	goto SetImpactBackgroundRet

Move_MEGA_KICK:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_TARGET
	delay 2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 0, 16, RGB_BLACK
	setalpha 12, 8
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_TARGET
	createsprite gMegaPunchKickSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 50
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 7, RGB_WHITE
	delay 50
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	call SetImpactBackground
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 22, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 0, RGB_WHITE
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB_BLACK, 8, RGB_BLACK, 0
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	delay 2
	restorebg
	waitbgfadein
	end

Move_COMET_PUNCH:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_TARGET
	setalpha 12, 8
	choosetwoturnanim CometPunchLeft, CometPunchRight

CometPunchContinue:
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

CometPunchLeft:
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, -8, ANIM_TARGET, 2
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, -8, 0, 8, 1, 0
	goto CometPunchContinue

CometPunchRight:
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 8, -8, ANIM_TARGET, 2
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, 8, 0, 8, 1, 0
	goto CometPunchContinue

Move_SONIC_BOOM:
	loadspritegfx ANIM_TAG_AIR_WAVE
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	call SonicBoomProjectile
	call SonicBoomProjectile
	call SonicBoomProjectile
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 10, 1
	call SonicBoomHit
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

SonicBoomProjectile:
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	createsprite gSonicBoomSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 15
	delay 4
	return

SonicBoomHit:
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 2
	delay 4
	return

Move_THUNDER_SHOCK:
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_SPARK_2
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 0, 6, RGB_BLACK
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_ElectricBolt, 5, 0, -44, 0
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_TARGET
	delay 9
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 0, 0, 13, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 0, 13, 0, RGB_BLACK
	waitforvisualfinish
	delay 20
	call ElectricityEffect
	waitforvisualfinish
	delay 20
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 6, 0, RGB_BLACK
	waitforvisualfinish
	end
	
Move_FUSION_BOLT:
Move_10000_VOLTS:
Move_THUNDERBOLT:
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_SHOCK_3
	loadspritegfx ANIM_TAG_SPARK_2
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 0, 6, RGB_BLACK
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_ElectricBolt, 5, 24, -52, 0
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_TARGET
	delay 7
	createvisualtask AnimTask_ElectricBolt, 5, -24, -52, 0
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_TARGET
	delay 7
	createvisualtask AnimTask_ElectricBolt, 5, 0, -60, 1
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_TARGET
	delay 9
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 0, 0, 13, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 0, 13, 0, RGB_BLACK
	waitforvisualfinish
	delay 20
	createsprite gThunderboltOrbSpriteTemplate, ANIM_TARGET, 3, 44, 0, 0, 3
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 0, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 64, 40, 1, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 128, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 192, 40, 2, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 32, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 96, 40, 1, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 160, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 224, 40, 2, -32765
	playsewithpan SE_M_HYPER_BEAM, SOUND_PAN_TARGET
	delay 0
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 2, 2, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 6, 6, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 2, 2, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 6, 6, RGB_BLACK
	waitforvisualfinish
	delay 20
	waitplaysewithpan SE_M_THUNDERBOLT2, SOUND_PAN_TARGET, 19
	call ElectricityEffect
	waitforvisualfinish
	delay 20
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 6, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_THUNDER_WAVE:
Move_THUNDER_WAVE_CYNTHIA:
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_SPARK_2
	loadspritegfx ANIM_TAG_SPARK_H
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 0, 6, RGB_BLACK
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_ElectricBolt, 5, 0, -48, 0
	playsewithpan SE_M_THUNDER_WAVE, SOUND_PAN_TARGET
	delay 20
	loopsewithpan SE_M_THUNDERBOLT2, SOUND_PAN_TARGET, 10, 4
	createsprite gThunderWaveSpriteTemplate, ANIM_TARGET, 2, -16, -16
	delay 4
	createsprite gThunderWaveSpriteTemplate, ANIM_TARGET, 2, -16, 0
	delay 4
	createsprite gThunderWaveSpriteTemplate, ANIM_TARGET, 2, -16, 16
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 6, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_BEAT_UP:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_TARGET
	setalpha 12, 8
	choosetwoturnanim BeatUpLeft, BeatUpRight

BeatUpContinue:
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

BeatUpLeft:
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -20, -20, ANIM_TARGET, 2
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, -20, -12, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 8, 0, ANIM_TARGET, 2
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, 8, 8, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	goto BeatUpContinue

BeatUpRight:
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 12, -20, ANIM_TARGET, 2
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, 12, -12, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -12, 0, ANIM_TARGET, 2
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, -12, 8, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	goto BeatUpContinue

Move_STOMP:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_TARGET
	createsprite gStompFootSpriteTemplate, ANIM_ATTACKER, 3, 0, -32, 15
	delay 19
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, -8, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 4, 9, 1
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_TAIL_WHIP:
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 24, 3
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 12, 4, 2, 3
	waitforvisualfinish
	end

Move_CUT:
	loadspritegfx ANIM_TAG_CUT
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_CUT, SOUND_PAN_TARGET
	createsprite gCuttingSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0
	delay 5
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 10, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	waitforvisualfinish
	end

Move_HIDDEN_POWER:
	loadspritegfx ANIM_TAG_RED_ORB
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 11, ANIM_ATTACKER, 0
	waitforvisualfinish
	delay 30
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_ATTACKER, RGB(31, 31, 19), 12, 5, 1
	delay 4
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 11, ANIM_ATTACKER, 0
	playsewithpan SE_M_REVERSAL, SOUND_PAN_ATTACKER
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 0
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 42
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 84
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 126
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 168
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 210
	delay 52
	setarg 7, 0xFFFF
	playsewithpan SE_M_REFLECT, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 11, ANIM_ATTACKER, 0
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 0
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 32
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 64
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 96
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 128
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 160
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 192
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 224
	end

Move_REVERSAL:
	loadspritegfx ANIM_TAG_BLUE_ORB
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_M_DETECT, SOUND_PAN_ATTACKER
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 3, RGB_WHITE, 8, RGB_BLACK, 0
	waitforvisualfinish
	delay 30
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 2, 0, 10, RGB_WHITE
	delay 10
	playsewithpan SE_M_REVERSAL, SOUND_PAN_ATTACKER
	createsprite gReversalOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 0
	createsprite gReversalOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 42
	createsprite gReversalOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 84
	createsprite gReversalOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 126
	createsprite gReversalOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 168
	createsprite gReversalOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 210
	waitforvisualfinish
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 8
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB_WHITE, 8, RGB_BLACK, 0
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 10, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 5, FALSE, 1, 8, 1, 0
	end

Move_PURSUIT:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	fadetobg BG_DARK
	waitbgfadein
	delay 0
	setalpha 12, 8
	choosetwoturnanim PursuitNormal, PursuitOnSwitchout

PursuitContinue:
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	delay 0
	restorebg
	waitbgfadein
	end

PursuitNormal:
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 5, FALSE, 1, 6, 1, 0
	goto PursuitContinue

PursuitOnSwitchout:
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 5, FALSE, 1, 6, 1, 0
	goto PursuitContinue

Move_SPIKE_CANNON:
	loadspritegfx ANIM_TAG_NEEDLE
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_WindUpLunge, 5, ANIM_ATTACKER, -4, 0, 4, 6, 8, 4
	waitforvisualfinish
	loopsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER, 5, 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	createsprite gLinearStingerSpriteTemplate, ANIM_ATTACKER, 2, 10, -8, -8, -8, 20
	createsprite gLinearStingerSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 0, 0, 20
	createsprite gLinearStingerSpriteTemplate, ANIM_ATTACKER, 2, 26, 8, 8, 8, 20
	waitforvisualfinish
	createsprite gHandleInvertHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -8, -8, 1, 2
	createsprite gHandleInvertHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createsprite gHandleInvertHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 8, 8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 7, 1
	loopsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET, 5, 3
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_SWORDS_DANCE:
	loadspritegfx ANIM_TAG_SWORD
	monbg ANIM_ATTACKER
	setalpha 12, 8
	playsewithpan SE_M_SWORDS_DANCE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 16, 6, 1, 4
	createsprite gSwordsDanceBladeSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	delay 22
	createvisualtask AnimTask_FlashAnimTagWithColor, 2, ANIM_TAG_SWORD, 2, 2, RGB(18, 31, 31), 16, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	delay 1
	end

Move_PSYCH_UP:
	loadspritegfx ANIM_TAG_SPIRAL
	monbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_BlendColorCycleExclude, 2, 1, 2, 6, 1, 11, RGB_BLACK
	setalpha 12, 8
	loopsewithpan SE_M_PSYBEAM2, SOUND_PAN_ATTACKER, 5, 10
	createsprite gPsychUpSpiralSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0, 0
	createvisualtask AnimTask_SwayMon, 5, 0, 5, 2560, 8, ANIM_ATTACKER
	delay 127
	delay 4
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 10, ANIM_ATTACKER, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 9, F_PAL_ATTACKER, 2, 10, 0, RGB_YELLOW
	delay 30
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	waitforvisualfinish
	end

Move_DIZZY_PUNCH:
	loadspritegfx ANIM_TAG_DUCK
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	call DizzyPunchLunge
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 5, 16, 8, 20, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, 16, 0, ANIM_TARGET, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, 16, 8, 160, -32
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, 16, 8, -256, -40
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, 16, 8, 128, -16
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, 16, 8, 416, -38
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, 16, 8, -128, -22
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, 16, 8, -384, -31
	delay 10
	call DizzyPunchLunge
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 5, -16, -8, 20, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -16, -16, ANIM_TARGET, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, -16, -8, 160, -32
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, -16, -8, -256, -40
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, -16, -8, 128, -16
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, -16, -8, 416, -38
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, -16, -8, -128, -22
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, -16, -8, -384, -31
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

DizzyPunchLunge:
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 6
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 7, 1
	return

Move_FIRE_SPIN:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	playsewithpan SE_M_SACRED_FIRE2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 2, 47, 1
	call FireSpinEffect
	call FireSpinEffect
	call FireSpinEffect
	waitforvisualfinish
	end

FireSpinEffect:
	createsprite gFireSpinSpriteTemplate, ANIM_TARGET, 2, 0, 28, 528, 30, 13, 50, ANIM_TARGET
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_TARGET, 2, 0, 32, 480, 20, 16, -46, ANIM_TARGET
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_TARGET, 2, 0, 33, 576, 20, 8, 42, ANIM_TARGET
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_TARGET, 2, 0, 31, 400, 25, 11, -42, ANIM_TARGET
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_TARGET, 2, 0, 28, 512, 25, 16, 46, ANIM_TARGET
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_TARGET, 2, 0, 33, 464, 30, 15, -50, ANIM_TARGET
	delay 2
	return

Move_FURY_CUTTER:
	loadspritegfx ANIM_TAG_CUT
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createvisualtask AnimTask_IsFuryCutterHitRight, 2
	jumpretfalse FuryCutterLeft
	goto FuryCutterRight

FuryCutterContinue:
	createvisualtask AnimTask_GetFuryCutterHitCount, 2
	jumpreteq 1, FuryCutterContinue2
	jumpreteq 2, FuryCutterMedium
	jumpreteq 3, FuryCutterStrong
	goto FuryCutterStrongest

FuryCutterContinue2:
	delay 5
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 10, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	waitforvisualfinish
	end

FuryCutterLeft:
	createsprite gCuttingSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0
	goto FuryCutterContinue

FuryCutterRight:
	createsprite gCuttingSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 1
	goto FuryCutterContinue

FuryCutterMedium:
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB(9, 8, 10), 4, RGB_BLACK, 0
	goto FuryCutterContinue2

FuryCutterStrong:
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 3, RGB(9, 8, 10), 4, RGB_BLACK, 0
	goto FuryCutterContinue2

FuryCutterStrongest:
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 3, RGB(9, 8, 10), 4, RGB_BLACK, 0
	goto FuryCutterContinue2

Move_SELF_DESTRUCT:
	loadspritegfx ANIM_TAG_EXPLOSION
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 1, 0, 9, RGB_RED
	createvisualtask AnimTask_ShakeMon2, 5, 4, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 5, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 6, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 7, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 8, 6, 0, 38, 1
	call SelfDestructExplode
	call SelfDestructExplode
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 1, 9, 0, RGB_RED
	end

SelfDestructExplode:
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 0, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 0, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 0, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 0, 1
	delay 6
	return

Move_SLAM:
	loadspritegfx ANIM_TAG_SLAM_HIT
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_ATTACKER
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 3, 0, 4
	delay 1
	createsprite gSlamHitSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	delay 3
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -12, 10, 0, 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	delay 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 0, 3, 6, 1
	waitforvisualfinish
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_VINE_WHIP:
	loadspritegfx ANIM_TAG_WHIP_HIT
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 6
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	createsprite gVineWhipSpriteTemplate, ANIM_TARGET, 2, 0, 0
	delay 6
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 6, 1
	end

Move_DRILL_PECK:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_WHIRLWIND_LINES
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	delay 2
	loopsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET, 4, 8
	createvisualtask AnimTask_DrillPeckHitSplats, 5
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 18, 1
	waitforvisualfinish
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 6
	waitforvisualfinish
	end

Move_WATERFALL:
	loadspritegfx ANIM_TAG_WATER_IMPACT
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 23, 1
	delay 5
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -15, 0, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 20, 10, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -10, 15, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 25, 20, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -20, 20, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 12, 0, 25, ANIM_ATTACKER
	waitforvisualfinish
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 5
	delay 6
	call RisingWaterHitEffect
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

RisingWaterHitEffect:
	playsewithpan SE_M_WATERFALL, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 4, 0, 17, 1
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 20, ANIM_TARGET, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 20
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 20
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 15, ANIM_TARGET, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 15
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 15
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 10, ANIM_TARGET, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 10
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 10
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, ANIM_TARGET, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 5
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 5
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -5, ANIM_TARGET, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -5
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -5
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -10, ANIM_TARGET, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -10
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -10
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, ANIM_TARGET, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -15
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -15
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -20, ANIM_TARGET, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -20
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -20
	return

Move_EXPLOSION:
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 8, 9, RGB(26, 8, 8), 8, RGB_BLACK, 8
	createvisualtask AnimTask_ShakeMon2, 5, 4, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 5, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 6, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 7, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 8, 8, 0, 40, 1
	call Explosion1
	call Explosion1
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 1, 16, 16, RGB_WHITE
	delay 50
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 3, 16, 0, RGB_WHITE
	end

Move_EXPLOSION_USELESS:
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 8, 9, RGB(26, 8, 8), 8, RGB_BLACK, 8
	createvisualtask AnimTask_ShakeMon2, 5, 4, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 5, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 6, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 7, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 8, 8, 0, 40, 1
	call Explosion1
	call Explosion1
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 1, 16, 16, RGB_WHITE
	delay 50
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 3, 16, 0, RGB_WHITE
	end

Explosion1:
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 1
	delay 6
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 0, 1
	delay 6
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 0, 1
	delay 6
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 0, 1
	delay 6
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 0, 1
	delay 6
	return

Move_DEFENSE_CURL:
	loadspritegfx ANIM_TAG_ECLIPSING_ORB
	loopsewithpan SE_M_TRI_ATTACK, SOUND_PAN_ATTACKER, 18, 3
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, ANIM_ATTACKER, 0
	createvisualtask AnimTask_DefenseCurlDeformMon, 5
	waitforvisualfinish
	createsprite gEclipsingOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, 6, 0, 1
	waitforvisualfinish
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, ANIM_ATTACKER, 1
	waitforvisualfinish
	end

Move_PROTECT:
	loadspritegfx ANIM_TAG_PROTECT
	monbg ANIM_ATK_PARTNER
	splitbgprio ANIM_ATTACKER
	waitplaysewithpan SE_M_REFLECT, SOUND_PAN_ATTACKER, 16
	createsprite gProtectSpriteTemplate, ANIM_ATTACKER, 2, 24, 0, 90
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	end

Move_DETECT:
	loadspritegfx ANIM_TAG_SPARKLE_4
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 9, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 1, 0, 9, RGB_WHITE
	delay 18
	playsewithpan SE_M_DETECT, SOUND_PAN_ATTACKER
	createsprite gSpinningSparkleSpriteTemplate, ANIM_ATTACKER, 13, 20, -20
	waitforvisualfinish
	delay 10
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 9, 0, RGB_BLACK
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 2, 9, 0, RGB_WHITE
	waitforvisualfinish
	end

Move_FRUSTRATEON:
Move_FRUSTRATION:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ANGER
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_GetFrustrationPowerLevel, 1
	jumpreteq 0, Frustration_Strongest
	jumpreteq 1, Frustration_Strong
	jumpreteq 2, Frustration_Medium
	goto Frustration_Weak

Frustration_Continue:
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Frustration_Strongest:
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_ATTACKER, 1, 0, 15, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 3, 0, 9, RGB_RED
	waitforvisualfinish
	delay 20
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_ATTACKER
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	waitforvisualfinish
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_ATTACKER
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_SwayMon, 5, 0, 16, 6144, 8, ANIM_ATTACKER
	delay 5
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 4, 0, 30, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 0
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 24, 8, ANIM_TARGET, 0
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -24, -16, ANIM_TARGET, 0
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 8, 4, ANIM_TARGET, 0
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -16, 19, ANIM_TARGET, 0
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 18, -18, ANIM_TARGET, 0
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 3, 9, 0, RGB_RED
	goto Frustration_Continue

Frustration_Strong:
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_ATTACKER, 1, 0, 15, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 3, 0, 9, RGB_RED
	waitforvisualfinish
	delay 20
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_ATTACKER
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	waitforvisualfinish
	delay 5
	createvisualtask AnimTask_StrongFrustrationGrowAndShrink, 5
	delay 7
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 8, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 4, 0, 6, 1
	delay 14
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 12, -6, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 4, 0, 6, 1
	delay 14
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -12, -6, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 4, 0, 6, 1
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 3, 9, 0, RGB_RED
	goto Frustration_Continue

Frustration_Medium:
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_ATTACKER
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	waitforvisualfinish
	delay 5
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 4, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -4, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 6, 1
	goto Frustration_Continue

Frustration_Weak:
	createsprite gWeakFrustrationAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 20, -28
	waitforvisualfinish
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 10, 2
	delay 12
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 6, 1
	goto Frustration_Continue

Move_SAFEGUARD:
	loadspritegfx ANIM_TAG_GUARD_RING
	monbg ANIM_ATK_PARTNER
	setalpha 8, 8
	playsewithpan SE_M_MILK_DRINK, SOUND_PAN_ATTACKER
	createsprite gGuardRingSpriteTemplate, ANIM_ATTACKER, 2
	delay 4
	createsprite gGuardRingSpriteTemplate, ANIM_ATTACKER, 2
	delay 4
	createsprite gGuardRingSpriteTemplate, ANIM_ATTACKER, 2
	waitforvisualfinish
	playsewithpan SE_SHINY, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATK_SIDE, 0, 2, 0, 10, RGB_WHITE
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

Move_PAIN_SPLIT:
	loadspritegfx ANIM_TAG_PAIN_SPLIT
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_ATTACKER, 2, -8, -42, ANIM_ATTACKER
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_TARGET, 2, -8, -42, ANIM_TARGET
	delay 10
	playsewithpan SE_M_SWAGGER2, 0
	createvisualtask AnimTask_PainSplitMovement, 2, ANIM_ATTACKER, 0
	createvisualtask AnimTask_PainSplitMovement, 2, ANIM_TARGET, 0
	waitforvisualfinish
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_ATTACKER, 2, -24, -42, ANIM_ATTACKER
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_TARGET, 2, -24, -42, ANIM_TARGET
	delay 10
	playsewithpan SE_M_SWAGGER2, 0
	createvisualtask AnimTask_PainSplitMovement, 2, ANIM_ATTACKER, 1
	createvisualtask AnimTask_PainSplitMovement, 2, ANIM_TARGET, 1
	waitforvisualfinish
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_ATTACKER, 2, 8, -42, ANIM_ATTACKER
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_TARGET, 2, 8, -42, ANIM_TARGET
	delay 10
	playsewithpan SE_M_SWAGGER2, 0
	createvisualtask AnimTask_PainSplitMovement, 2, ANIM_ATTACKER, 2
	createvisualtask AnimTask_PainSplitMovement, 2, ANIM_TARGET, 2
	end

Move_VICE_GRIP:
	loadspritegfx ANIM_TAG_CUT
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_VICEGRIP, SOUND_PAN_TARGET
	createsprite gViceGripSpriteTemplate, ANIM_ATTACKER, 2, 0
	createsprite gViceGripSpriteTemplate, ANIM_ATTACKER, 2, 1
	delay 9
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 2, 0, 5, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_GUILLOTINE:
	loadspritegfx ANIM_TAG_CUT
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	fadetobgfromset BG_GUILLOTINE_OPPONENT, BG_GUILLOTINE_PLAYER, BG_GUILLOTINE_CONTESTS
	waitbgfadein
	playsewithpan SE_M_VICEGRIP, SOUND_PAN_TARGET
	createsprite gGuillotineSpriteTemplate, ANIM_ATTACKER, 2, 0
	createsprite gGuillotineSpriteTemplate, ANIM_ATTACKER, 2, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 16, RGB_BLACK
	delay 9
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 2, 0, 23, 1
	delay 46
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 4, 0, 8, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 0
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB_BLACK, 8, RGB_BLACK, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	restorebg
	waitbgfadein
	end

Move_PAY_DAY:
	loadspritegfx ANIM_TAG_COIN
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	createsprite gCoinThrowSpriteTemplate, ANIM_ATTACKER, 2, 20, 0, 0, 0, 1152
	waitforvisualfinish
	playsewithpan SE_M_PAY_DAY, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, ANIM_TARGET, 2
	createsprite gFallingCoinSpriteTemplate, ANIM_ATTACKER, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_OUTRAGE:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loopsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER, 8, 3
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_BG | F_PAL_ATTACKER | F_PAL_TARGET, 2, 5, 3, 8, RGB(14, 13, 0)
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 12, 6, 5, 4
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 1280, 0, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, -1280, 0, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 0, 1280, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 0, -1280, 3
	delay 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 40, 1
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 1280, 768, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, -1280, 768, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 1280, -768, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, -1280, -768, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 1280, 0, 3
	call OutrageFlames
	call OutrageFlames
	waitforvisualfinish
	end

OutrageFlames:
	delay 3
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, -1280, 0, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 0, 1280, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 0, -1280, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 1280, 768, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, -1280, 768, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 1280, -768, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, -1280, -768, 3
	return

Move_BUZZY_BUZZ:
Move_SPARK:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_SPARK_2
	delay 0
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_BG | F_PAL_ATTACKER, -31, 1, 5, 5, RGB(31, 31, 22)
	playsewithpan SE_M_THUNDERBOLT2, SOUND_PAN_ATTACKER
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 32, 24, 190, 12, ANIM_ATTACKER, 1, 0
	delay 0
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 80, 24, 22, 12, ANIM_ATTACKER, 1, 0
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 156, 24, 121, 13, ANIM_ATTACKER, 1, 1
	delay 0
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_BG | F_PAL_ATTACKER, -31, 1, 0, 0, RGB(31, 31, 22)
	delay 10
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_BG | F_PAL_ATTACKER, -31, 1, 5, 5, RGB(31, 31, 22)
	playsewithpan SE_M_THUNDERBOLT2, SOUND_PAN_ATTACKER
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 100, 24, 60, 10, ANIM_ATTACKER, 1, 0
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 170, 24, 42, 11, ANIM_ATTACKER, 1, 1
	delay 0
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 238, 24, 165, 10, ANIM_ATTACKER, 1, 1
	delay 0
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_BG | F_PAL_ATTACKER, -31, 1, 0, 0, RGB(31, 31, 22)
	delay 20
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_BG | F_PAL_ATTACKER, -31, 1, 7, 7, RGB(31, 31, 22)
	playsewithpan SE_M_THUNDERBOLT2, SOUND_PAN_ATTACKER
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 32, 12, 0, 20, 0, 0
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 32, 12, 64, 20, 1, 0
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 32, 12, 128, 20, 0, 0
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 32, 12, 192, 20, 2, 0
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 16, 12, 32, 20, 0, 0
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 16, 12, 96, 20, 1, 0
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 16, 12, 160, 20, 0, 0
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 16, 12, 224, 20, 2, 0
	delay 4
	waitforvisualfinish
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_BG | F_PAL_ATTACKER, -31, 1, 0, 0, RGB(31, 31, 22)
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 4
	playsewithpan SE_M_HYPER_BEAM, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, -31, 2, 0, 6, RGB(31, 31, 22)
	call ElectricityEffect
	waitforvisualfinish
	end

Move_ATTRACT:
	loopsewithpan SE_M_HARDEN, SOUND_PAN_ATTACKER, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	waitforvisualfinish
	end

Move_GROWTH:
	call GrowthEffect
	waitforvisualfinish
	call GrowthEffect
	waitforvisualfinish
	end

GrowthEffect:
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 0, 2, 0, 8, RGB_WHITE
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -3, -3, 16, ANIM_ATTACKER, 0
	return

Move_WHIRLWIND:
	loadspritegfx ANIM_TAG_WHIRLWIND_LINES
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, -8, ANIM_TARGET, 60, 0
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 60, 1
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 8, ANIM_TARGET, 60, 2
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, ANIM_TARGET, 60, 3
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, ANIM_TARGET, 60, 4
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, ANIM_TARGET, 60, 0
	delay 5
	loopsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_TARGET, 10, 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 15, 1
	delay 29
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_TARGET, 12, 6, 1, 5
	delay 7
	playsewithpan SE_M_STRING_SHOT, SOUND_PAN_TARGET
	createvisualtask AnimTask_SlideOffScreen, 5, ANIM_TARGET, 8
	waitforvisualfinish
	end

Move_CONFUSE_RAY:
	loadspritegfx ANIM_TAG_YELLOW_BALL
	monbg ANIM_DEF_PARTNER
	fadetobg BG_GHOST
	waitbgfadein
	createvisualtask SoundTask_AdjustPanningVar, 2, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, 2, 0
	createvisualtask AnimTask_BlendColorCycleByTag, 2, ANIM_TAG_YELLOW_BALL, 0, 6, 0, 14, RGB(31, 10, 0)
	createsprite gConfuseRayBallBounceSpriteTemplate, ANIM_TARGET, 2, 28, 0, 288
	waitforvisualfinish
	setalpha 8, 8
	playsewithpan SE_M_STRING_SHOT2, SOUND_PAN_TARGET
	createsprite gConfuseRayBallSpiralSpriteTemplate, ANIM_TARGET, 2, 0, -16
	waitforvisualfinish
	delay 0
	blendoff
	clearmonbg ANIM_DEF_PARTNER
	restorebg
	waitbgfadein
	end

Move_LOCK_ON:
	loadspritegfx ANIM_TAG_LOCK_ON
	createsprite gLockOnTargetSpriteTemplate, ANIM_ATTACKER, 40
	createsprite gLockOnMoveTargetSpriteTemplate, ANIM_ATTACKER, 40, 1
	createsprite gLockOnMoveTargetSpriteTemplate, ANIM_ATTACKER, 40, 2
	createsprite gLockOnMoveTargetSpriteTemplate, ANIM_ATTACKER, 40, 3
	createsprite gLockOnMoveTargetSpriteTemplate, ANIM_ATTACKER, 40, 4  @ Also transitions to red target
	delay 120
	setarg 7, 0xFFFF  @ Signal target to flash/disappear
	waitforvisualfinish
	end

Move_MEAN_LOOK:
	loadspritegfx ANIM_TAG_EYE
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 0, 16, RGB_BLACK
	loopsewithpan SE_M_CONFUSE_RAY, SOUND_PAN_TARGET, 15, 4
	waitplaysewithpan SE_M_LEER, SOUND_PAN_TARGET, 85
	createsprite gMeanLookEyeSpriteTemplate, ANIM_ATTACKER, 2
	delay 120
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 16, 0, RGB_BLACK
	delay 30
	clearmonbg ANIM_DEF_PARTNER
	waitforvisualfinish
	end

Move_ROCK_THROW:
	loadspritegfx ANIM_TAG_ROCKS
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_TARGET, 2, 6, 1, 15, 1
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 0, 1, 0, 0
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 6
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 19, 1, 10, 0
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 6
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -23, 2, -10, 0
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 5, 20, 1
	delay 6
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -15, 1, -10, 0
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 6
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 23, 2, 10, 0
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	waitforvisualfinish
	end

Move_BROCK_THROW:
	loadspritegfx ANIM_TAG_BROCKS
	monbg ANIM_DEF_PARTNER
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 7, 1, 11, 1
	createsprite gFallingBrockSpriteTemplate, ANIM_TARGET, 2, -5, 1, -5, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingBrockSpriteTemplate, ANIM_TARGET, 2, 5, 0, 6, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingBrockSpriteTemplate, ANIM_TARGET, 2, 19, 1, 10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingBrockSpriteTemplate, ANIM_TARGET, 2, -23, 2, -10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 5, 50, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_DEF_PARTNER, 0, 5, 50, 1
	delay 2
	call BrockSlideBrocks
	call BrockSlideBrocks
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

BrockSlideBrocks:
	createsprite gFallingBrockSpriteTemplate, ANIM_TARGET, 2, -20, 0, -10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingBrockSpriteTemplate, ANIM_TARGET, 2, 28, 1, 10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingBrockSpriteTemplate, ANIM_TARGET, 2, -10, 1, -5, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingBrockSpriteTemplate, ANIM_TARGET, 2, 10, 0, 6, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingBrockSpriteTemplate, ANIM_TARGET, 2, 24, 1, 10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingBrockSpriteTemplate, ANIM_TARGET, 2, -32, 2, -10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingBrockSpriteTemplate, ANIM_TARGET, 2, -20, 0, -10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingBrockSpriteTemplate, ANIM_TARGET, 2, 30, 2, 10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	return

Move_ROCK_SLIDE:
	loadspritegfx ANIM_TAG_ROCKS
	monbg ANIM_DEF_PARTNER
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 7, 1, 11, 1
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -5, 1, -5, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 5, 0, 6, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 19, 1, 10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -23, 2, -10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 5, 50, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_DEF_PARTNER, 0, 5, 50, 1
	delay 2
	call RockSlideRocks
	call RockSlideRocks
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

RockSlideRocks:
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -20, 0, -10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 28, 1, 10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -10, 1, -5, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 10, 0, 6, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 24, 1, 10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -32, 2, -10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -20, 0, -10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 30, 2, 10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	return

Move_THIEF:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	delay 1
	fadetobg BG_DARK
	waitbgfadein
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 6
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 8, 1
	waitforvisualfinish
	delay 20
	clearmonbg ANIM_TARGET
	blendoff
	restorebg
	waitbgfadein
	end

Move_BUBBLE_MIEM:
Move_BUBBBIEM:
Move_BUBBLE_BEAM:
	loadspritegfx ANIM_TAG_BUBBLE
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	delay 1
	call BulbblebeamCreateBubbles
	createvisualtask AnimTask_SwayMon, 5, 0, 3, 3072, 8, ANIM_TARGET
	call BulbblebeamCreateBubbles
	call BulbblebeamCreateBubbles
	waitforvisualfinish
	call WaterBubblesEffectShort
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

BulbblebeamCreateBubbles:
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 35, 70, 0, 256, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 3
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 20, 40, -10, 256, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 3
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 10, -60, 0, 256, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 3
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 15, -15, 10, 256, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 3
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 30, 10, -10, 256, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 3
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 25, -30, 10, 256, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 3
	return

Move_FREEZY_FLOW:
Move_ICY_WIND:
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	loadspritegfx ANIM_TAG_ICE_SPIKES
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG | F_PAL_ATK_SIDE, 4, 0, 4, RGB_BLACK
	fadetobg BG_ICE
	waitbgfadeout
	playsewithpan SE_M_ICY_WIND, 0
	waitbgfadein
	waitforvisualfinish
	panse SE_M_GUST, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	call IcyWindSwirlingSnowballs
	delay 5
	call IcyWindSwirlingSnowballs
	playsewithpan SE_M_GUST2, SOUND_PAN_TARGET
	delay 55
	call IceSpikesEffectLong
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	restorebg
	waitbgfadeout
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG | F_PAL_ATK_SIDE, 4, 4, 0, RGB_BLACK
	waitbgfadein
	end

IcyWindSwirlingSnowballs:
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_TARGET, 40, 0, 0, 0, 0, 72, 1
	delay 5
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_TARGET, 40, 0, 10, 0, 10, 72, 1
	delay 5
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_TARGET, 40, 0, -10, 0, -10, 72, 1
	delay 5
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_TARGET, 40, 0, 15, 0, 15, 72, 1
	delay 5
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_TARGET, 40, 0, -5, 0, -5, 72, 1
	return

Move_SMOKESCREEN:
	loadspritegfx ANIM_TAG_BLACK_SMOKE
	loadspritegfx ANIM_TAG_BLACK_BALL
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	createsprite gBlackBallSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 0, 35, -25
	waitforvisualfinish
	createvisualtask AnimTask_SmokescreenImpact, 2
	delay 2
	playsewithpan SE_M_SAND_ATTACK, SOUND_PAN_TARGET
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, -12, 104, 0, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, -12, 72, 1, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, -6, 56, 1, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, -6, 88, 0, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 0, 56, 0, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 0, 88, 1, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 6, 72, 0, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 6, 104, 1, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 12, 72, 0, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 12, 56, 1, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 18, 80, 0, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 18, 72, 1, 75
	waitforvisualfinish
	end

Move_CONVERSION:
	loadspritegfx ANIM_TAG_CONVERSION
	monbg ANIM_ATK_PARTNER
	splitbgprio ANIM_ATTACKER
	setalpha 16, 0
	delay 0
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -24, -24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -8, -24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 8, -24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 24, -24
	delay 3
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -24, -8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -8, -8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 8, -8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 24, -8
	delay 3
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -24, 8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -8, 8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 8, 8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 24, 8
	delay 3
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -24, 24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -8, 24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 8, 24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 24, 24
	delay 20
	playsewithpan SE_M_BARRIER, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_FlashAnimTagWithColor, 2, ANIM_TAG_CONVERSION, 1, 1, RGB(31, 31, 13), 12, 0, 0
	delay 6
	createvisualtask AnimTask_ConversionAlphaBlend, 5
	waitforvisualfinish
	delay 1
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

Move_CONVERSION_2:
	loadspritegfx ANIM_TAG_CONVERSION
	monbg ANIM_DEF_PARTNER
	splitbgprio_foes ANIM_TARGET
	setalpha 0, 16
	delay 0
	playsewithpan SE_M_BARRIER, SOUND_PAN_TARGET
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -24, -24, 60
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -8, -24, 65
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 8, -24, 70
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 24, -24, 75
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -24, -8, 80
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -8, -8, 85
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 8, -8, 90
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 24, -8, 95
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -24, 8, 100
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -8, 8, 105
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 8, 8, 110
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 24, 8, 115
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -24, 24, 120
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -8, 24, 125
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 8, 24, 130
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 24, 24, 135
	createvisualtask AnimTask_Conversion2AlphaBlend, 5
	delay 60
	playsewithpan SE_M_SWIFT, SOUND_PAN_TARGET
	delay 10
	playsewithpan SE_M_SWIFT, SOUND_PAN_TARGET
	delay 10
	playsewithpan SE_M_SWIFT, SOUND_PAN_TARGET
	delay 10
	playsewithpan SE_M_SWIFT, SOUND_PAN_TARGET
	delay 10
	playsewithpan SE_M_SWIFT, SOUND_PAN_TARGET
	delay 10
	playsewithpan SE_M_SWIFT, SOUND_PAN_TARGET
	delay 10
	playsewithpan SE_M_SWIFT, SOUND_PAN_TARGET
	delay 10
	playsewithpan SE_M_SWIFT, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_ROLLING_KICK:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 18, 6, 1, 4
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 6
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	createsprite gSlidingKickSpriteTemplate, ANIM_ATTACKER, 2, -24, 0, 48, 10, 160, 0
	delay 5
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 6, 1
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 8
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_HEADBUTT:
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 2, 0, 4, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 6, 1
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	end

Move_HORN_ATTACK:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HORN_HIT
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	createsprite gHornHitSpriteTemplate, ANIM_TARGET, 4, 0, 0, 10
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 2, 0, 4, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 6, 1
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	waitforvisualfinish
	end

Move_FURY_ATTACK:
	loadspritegfx ANIM_TAG_PAW_PRINT
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 112, -16, 140, 128, 36
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 208, 128, -16, 48, 36
	playsewithpan SE_M_SCRATCH, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, -16, 112, 256, -16, 36
	playsewithpan SE_M_SCRATCH, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 108, 128, 84, -16, 36
	playsewithpan SE_M_SCRATCH, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, -16, 56, 256, 56, 36
	playsewithpan SE_M_SCRATCH, 0
	end

FuryAttackContinue:
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 6, 1
	waitforvisualfinish
	end

FuryAttackRight:
	createsprite gHornHitSpriteTemplate, ANIM_TARGET, 4, 8, 8, 10
	waitforvisualfinish
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	goto FuryAttackContinue

FuryAttackLeft:
	createsprite gHornHitSpriteTemplate, ANIM_TARGET, 4, -8, -8, 10
	waitforvisualfinish
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	goto FuryAttackContinue

Move_HORN_DRILL:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HORN_HIT
	jumpifcontest HornDrillInContest
	fadetobg BG_DRILL
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -2304, 768, 1, -1
HornDrillContinue:
	waitbgfadein
	setalpha 12, 8
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	createsprite gHornHitSpriteTemplate, ANIM_TARGET, 4, 0, 0, 12
	waitforvisualfinish
	playse SE_BANG
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 2, 0, 40, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 10, 0, 40, 1
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 3
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 2, ANIM_TARGET, 3
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, -4, 3, ANIM_TARGET, 3
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, -8, -5, ANIM_TARGET, 3
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 4, -12, ANIM_TARGET, 3
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 16, 0, ANIM_TARGET, 3
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 5, 18, ANIM_TARGET, 3
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, -17, 12, ANIM_TARGET, 2
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, -21, -15, ANIM_TARGET, 2
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 8, -27, ANIM_TARGET, 2
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 32, 0, ANIM_TARGET, 2
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	delay 4
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, 0xFFFF
	waitbgfadein
	end

HornDrillInContest:
	fadetobg BG_DRILL_CONTESTS
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, 2304, 768, 0, -1
	goto HornDrillContinue

Move_THRASH:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	createvisualtask AnimTask_ThrashMoveMonHorizontal, 2
	createvisualtask AnimTask_ThrashMoveMonVertical, 2
	createsprite gFistFootRandomPosSpriteTemplate, ANIM_TARGET, 3, 1, 10, 0
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 4, 0, 7, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	delay 28
	createsprite gFistFootRandomPosSpriteTemplate, ANIM_TARGET, 3, 1, 10, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 4, 0, 7, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 28
	createsprite gFistFootRandomPosSpriteTemplate, ANIM_TARGET, 3, 1, 10, 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 8, 0, 16, 1
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	end

Move_SING:
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_MusicNotesRainbowBlend, 2
	waitforvisualfinish
	panse SE_M_SING, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 7, 0, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 6, 1, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 1, 2, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 3, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 3, 0, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 5, 2, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 6, 3, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 0, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 1, 2, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 5, 3, 12
	delay 4
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_MusicNotesClearRainbowBlend, 2
	waitforvisualfinish
	end

Move_LOW_KICK:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	createsprite gSlidingKickSpriteTemplate, ANIM_TARGET, 2, -24, 28, 40, 8, 160, 0
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -8, 8, ANIM_TARGET, 2
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 6, 384, ANIM_TARGET, 2
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 4
	end

Move_EARTHQUAKE:
	createvisualtask AnimTask_HorizontalShake, 5, (MAX_BATTLERS_COUNT + 1), 10, 50
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 10, 50
	playsewithpan SE_M_EARTHQUAKE, 0
	delay 10
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	delay 16
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	end

Move_FISSURE:
	loadspritegfx ANIM_TAG_MUD_SAND
	createvisualtask AnimTask_HorizontalShake, 3, (MAX_BATTLERS_COUNT + 1), 10, 50
	createvisualtask AnimTask_HorizontalShake, 3, ANIM_TARGET, 10, 50
	playsewithpan SE_M_EARTHQUAKE, SOUND_PAN_TARGET
	delay 8
	call FissureDirtPlumeFar
	delay 15
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	delay 15
	call FissureDirtPlumeClose
	delay 15
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	delay 15
	call FissureDirtPlumeFar
	delay 50
	fadetobg BG_FISSURE
	waitbgfadeout
	createvisualtask AnimTask_PositionFissureBgOnBattler, 5, ANIM_TARGET, 5, -1
	waitbgfadein
	delay 40
	restorebg
	waitbgfadeout
	setarg 7, -1
	waitbgfadein
	end

FissureDirtPlumeFar:
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 12, -48, -16, 24
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 16, -16, -10, 24
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 14, -52, -18, 24
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 12, -32, -16, 24
	playsewithpan SE_M_DIG, SOUND_PAN_TARGET
	return

FissureDirtPlumeClose:
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 12, -24, -16, 24
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 16, -38, -10, 24
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 14, -20, -18, 24
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 12, -36, -16, 24
	playsewithpan SE_M_DIG, SOUND_PAN_TARGET
	return

Move_DIG:
	choosetwoturnanim DigSetUp, DigUnleash
DigEnd:
	end

DigSetUp:
	loadspritegfx ANIM_TAG_MUD_SAND
	loadspritegfx ANIM_TAG_DIRT_MOUND
	createsprite gDirtMoundSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, 180
	createsprite gDirtMoundSpriteTemplate, ANIM_ATTACKER, 1, 0, 1, 180
	monbg_static ANIM_ATTACKER
	delay 1
	createvisualtask AnimTask_DigDownMovement, 2, FALSE
	delay 6
	call DigThrowDirt
	call DigThrowDirt
	call DigThrowDirt
	call DigThrowDirt
	call DigThrowDirt
	waitforvisualfinish
	clearmonbg_static ANIM_ATTACKER
	delay 1
	createvisualtask AnimTask_DigDownMovement, 2, TRUE
	goto DigEnd

DigUnleash:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_DIRT_MOUND
	createvisualtask AnimTask_DigUpMovement, 2, FALSE
	waitforvisualfinish
	monbg ANIM_ATTACKER
	createsprite gDirtMoundSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, 48
	createsprite gDirtMoundSpriteTemplate, ANIM_ATTACKER, 1, 0, 1, 48
	delay 1
	createvisualtask AnimTask_DigUpMovement, 2, TRUE
	delay 16
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 6, 1
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_ATTACKER
	clearmonbg ANIM_ATTACKER
	goto DigEnd

DigThrowDirt:
	createsprite gDirtPlumeSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 12, 4, -16, 18
	createsprite gDirtPlumeSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 16, 4, -10, 18
	createsprite gDirtPlumeSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 14, 4, -18, 18
	createsprite gDirtPlumeSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 12, 4, -16, 18
	playsewithpan SE_M_DIG, SOUND_PAN_ATTACKER
	delay 32
	return

Move_MEDITATE:
	call SetPsychicBackground
	createvisualtask AnimTask_MeditateStretchAttacker, 2
	playsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER
	delay 16
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	waitforvisualfinish
	call UnsetPsychicBackground
	end

Move_AGILITY:
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 24, 6, 4, 4
	createvisualtask AnimTask_TraceMonBlended, 2, 0, 4, 7, 10
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 12
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 12
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 12
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 12
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 12
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	delay 1
	end

Move_AGILITY_DUMB:
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 24, 6, 4, 4
	createvisualtask AnimTask_TraceMonBlended, 2, 0, 4, 7, 10
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 12
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 12
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 12
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 12
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 12
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	delay 1
	end

Move_QUICK_ATTACK:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 24, 6, 1, 5
	createvisualtask AnimTask_TraceMonBlended, 2, 0, 4, 7, 3
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	delay 4
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 6, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, 0, 0, ANIM_TARGET, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	waitforvisualfinish
	end

Move_RAGE_SNOUT:
Move_RAGE:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ANGER
	monbg ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_BlendMonInAndOut, 3, ANIM_ATTACKER, RGB_RED, 10, 0, 2
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, -20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_ATTACKER
	delay 20
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, TRUE, 1, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	end

Move_TELEPORT:
	playsewithpan SE_M_LEER, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_Flash, 2
	waitforvisualfinish
	end

Move_RETREAT:
	loadspritegfx ANIM_TAG_POKEBALL
	playsewithpan SE_M_BATON_PASS, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_BG | F_PAL_BATTLERS, 1, 2, 0, 11, RGB(31, 22, 30)
	createsprite gBatonPassPokeballSpriteTemplate, ANIM_ATTACKER, 2
	blendoff
	delay 1
	end

Move_108_TUPLE_TEAM: 
Move_DOUBLE_TEAM:
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_DoubleTeam, 2
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 32
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 24
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 16
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	delay 1
	end





Move_MINIMIZE:
	setalpha 10, 8
	createvisualtask AnimTask_Minimize, 2
	loopsewithpan SE_M_MINIMIZE, SOUND_PAN_ATTACKER, 34, 3
	waitforvisualfinish
	blendoff
	end

Move_METRONOME:
	loadspritegfx ANIM_TAG_FINGER
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	createsprite gThoughtBubbleSpriteTemplate, ANIM_ATTACKER, 11, 0, 100
	playsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER
	delay 6
	createsprite gMetronomeFingerSpriteTemplate, ANIM_ATTACKER, 12, 0
	delay 24
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 22, 3
	waitforvisualfinish
	end

Move_SKULL_BASH:
	choosetwoturnanim SkullBashSetUp, SkullBashAttack
SkullBashEnd:
	end

SkullBashSetUp:
	call SkullBashSetUpHeadDown
	call SkullBashSetUpHeadDown
	waitforvisualfinish
	goto SkullBashEnd

SkullBashSetUpHeadDown:
	createsprite gSlideMonToOffsetAndBackSpriteTemplate, ANIM_ATTACKER, 2, ANIM_ATTACKER, -24, 0, 0, 10, 0
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 16, 96, ANIM_ATTACKER, 2
	waitforvisualfinish
	createsprite gSlideMonToOffsetAndBackSpriteTemplate, ANIM_ATTACKER, 2, ANIM_ATTACKER, 24, 0, 0, 10, 1
	waitforvisualfinish
	return

SkullBashAttack:
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_SkullBashPosition, 2, 0
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	waitforvisualfinish
	playse SE_BANG
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 2, 0, 40, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 10, 0, 40, 1
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 4, 0, 0, ANIM_TARGET, 0
	loopsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET, 8, 3
	waitforvisualfinish
	createvisualtask AnimTask_SkullBashPosition, 2, 1
	goto SkullBashEnd

Move_AMNESIA:
	loadspritegfx ANIM_TAG_AMNESIA
	call SetPsychicBackground
	delay 8
	createsprite gQuestionMarkSpriteTemplate, ANIM_ATTACKER, 20
	playsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER
	delay 54
	loopsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER, 16, 3
	waitforvisualfinish
	call UnsetPsychicBackground
	end

Move_KINESIS:
	loadspritegfx ANIM_TAG_ALERT
	loadspritegfx ANIM_TAG_BENT_SPOON
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	call SetPsychicBackground
	createsprite gBentSpoonSpriteTemplate, ANIM_ATTACKER, 20
	createsprite gKinesisZapEnergySpriteTemplate, ANIM_ATTACKER, 19, 32, -8, 0
	createsprite gKinesisZapEnergySpriteTemplate, ANIM_ATTACKER, 19, 32, 16, 1
	loopsewithpan SE_M_CONFUSE_RAY, SOUND_PAN_ATTACKER, 21, 2
	delay 60
	playsewithpan SE_M_DIZZY_PUNCH, SOUND_PAN_ATTACKER
	delay 30
	loopsewithpan SE_M_DIZZY_PUNCH, SOUND_PAN_ATTACKER, 20, 2
	delay 70
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_ATTACKER
	waitforvisualfinish
	call UnsetPsychicBackground
	end

Move_GLARE:
	loadspritegfx ANIM_TAG_SMALL_RED_EYE
	loadspritegfx ANIM_TAG_EYE_SPARKLE
	createvisualtask AnimTask_GlareEyeDots, 5, 0
	playsewithpan SE_M_PSYBEAM2, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 5, F_PAL_BG, 0, 0, 16, RGB_BLACK
	waitforvisualfinish
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, -16, -8
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, 16, -8
	createvisualtask AnimTask_ScaryFace, 5
	playsewithpan SE_M_LEER, SOUND_PAN_ATTACKER
	delay 2
	createvisualtask AnimTask_ShakeTargetInPattern, 3, 20, 1, FALSE
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 5, F_PAL_BG, 0, 16, 0, RGB_BLACK
	end

Move_BARRAGE:
	loadspritegfx ANIM_TAG_RED_BALL
	createvisualtask AnimTask_BarrageBall, 3
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	delay 24
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, 40, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_TARGET, 0, 4, 20, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_DEF_PARTNER, 0, 4, 20, 1
	loopsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET, 8, 2
	end

Move_SKY_ATTACK:
	choosetwoturnanim SkyAttackSetUp, SkyAttackUnleash
SkyAttackEnd:
	end

SkyAttackSetUp:
	monbg ANIM_DEF_PARTNER
	setalpha 12, 11
	createvisualtask AnimTask_GetTargetIsAttackerPartner, 5, ARG_RET_ID
	jumpretfalse SkyAttackSetUpAgainstOpponent
	goto SkyAttackSetUpAgainstPartner

SkyAttackSetUpAgainstOpponent:
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG | F_PAL_ATK_SIDE | F_PAL_DEF_PARTNER, 1, 0, 12, RGB_BLACK
	waitforvisualfinish
	delay 12
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 1, 8, 0, RGB_BLACK
	createvisualtask AnimTask_HorizontalShake, 5, ANIM_ATTACKER, 2, 16
	loopsewithpan SE_M_STAT_INCREASE, SOUND_PAN_ATTACKER, 4, 8
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 1, 0, 15, RGB_WHITE
	delay 20
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 1, 15, 0, RGB_WHITE
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG | F_PAL_ATK_PARTNER | F_PAL_DEF_PARTNER, 1, 8, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto SkyAttackEnd

SkyAttackSetUpAgainstPartner:
	createvisualtask AnimTask_BlendBattleAnimPalExclude, 10, ANIM_TARGET, 1, 0, 12, RGB_BLACK
	waitforvisualfinish
	delay 12
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 1, 8, 0, RGB_BLACK
	createvisualtask AnimTask_HorizontalShake, 5, ANIM_ATTACKER, 2, 16
	playsewithpan SE_M_STAT_INCREASE, SOUND_PAN_ATTACKER
	delay 8
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 1, 0, 15, RGB_WHITE
	delay 20
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 1, 15, 0, RGB_WHITE
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPalExclude, 10, 4, 1, 8, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto SkyAttackEnd

SkyAttackUnleash:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_BIRD
	call SetSkyBg
	monbg ANIM_ATTACKER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 0, 0, 16, RGB_WHITE
	delay 4
	createvisualtask AnimTask_AttackerFadeToInvisible, 5, 0
	waitforvisualfinish
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_SKY_UPPERCUT, SOUND_PAN_ATTACKER
	createsprite gSkyAttackBirdSpriteTemplate, ANIM_TARGET, 2
	delay 14
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 10, 0, 18, 1
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	delay 20
	createvisualtask AnimTask_AttackerFadeFromInvisible, 5, 1
	delay 2
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 0, 15, 0, RGB_WHITE
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	call UnsetSkyBg
	goto SkyAttackEnd

Move_ADOBE_FLASH:
	loadspritegfx ANIM_TAG_CRASHED
	playsewithpan SE_M_LEER, SOUND_PAN_ATTACKER
	monbg ANIM_TARGET
	createvisualtask AnimTask_BlendEveryBattleAnimPal, 5, 0, 0, 0, 16, RGB_WHITEALPHA
	waitforvisualfinish
	@createvisualtask AnimTask_Flash, 2
	delay 20
	createsprite gFlashCrashSpriteTemplate, ANIM_TARGET, 5, 0, 90
	createvisualtask AnimTask_BlendEveryBattleAnimPal, 5, 2, 2, 16, 0, RGB_WHITEALPHA
	clearmonbg ANIM_TARGET
	waitforvisualfinish

	end
Move_FLASH:
	playsewithpan SE_M_LEER, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_Flash, 2
	waitforvisualfinish
	end

Move_SPLASH:
	createvisualtask AnimTask_Splash, 2, 0, 3
	delay 8
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 38, 3
	waitforvisualfinish
	end

Move_ACID_ARMOR:
	monbg ANIM_ATTACKER
	setalpha 15, 0
	createvisualtask AnimTask_AcidArmor, 2, ANIM_ATTACKER
	playsewithpan SE_M_ACID_ARMOR, SOUND_PAN_ATTACKER
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_ATTACKER
	delay 1
	end

Move_SHARPEN:
	loadspritegfx ANIM_TAG_SPHERE_TO_CUBE
	createsprite gSharpenSphereSpriteTemplate, ANIM_ATTACKER, 2
	waitforvisualfinish
	end

Move_SUPER_FANG:
	loadspritegfx ANIM_TAG_FANG_ATTACK
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 1, 0, 20, 1
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 3, 0, 48, 1
	createvisualtask AnimTask_BlendMonInAndOut, 2, ANIM_ATTACKER, RGB(31, 6, 1), 12, 4, 1
	waitforvisualfinish
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 4
	createsprite gSuperFangSpriteTemplate, ANIM_TARGET, 2
	playsewithpan SE_M_BITE, SOUND_PAN_TARGET
	delay 8
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB(31, 2, 2), 14, RGB_WHITE, 14
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 7, 12, 1
	waitforvisualfinish
	blendoff
	end

Move_WIDE_SLASH:
Move_SLASH:
	loadspritegfx ANIM_TAG_SLASH
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, -8, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, 8, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 18, 1
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	end

Move_STRUGGLE:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_MOVEMENT_WAVES
	monbg ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 3, 0, 12, 4
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 2
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 2
	loopsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER, 12, 4
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_SKETCH:
	loadspritegfx ANIM_TAG_PENCIL
	monbg ANIM_TARGET
	createvisualtask AnimTask_SketchDrawMon, 2
	createsprite gPencilSpriteTemplate, ANIM_TARGET, 2
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	createvisualtask AnimTask_Splash, 2, 0, 2
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 38, 2
	end

Move_NIGHTMARE:
	fadetobg BG_GHOST
	waitbgfadein
	jumpifcontest NightmareInContest
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_NightmareClone, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 40, 1
	playsewithpan SE_M_NIGHTMARE, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	restorebg
	waitbgfadein
	end

NightmareInContest:
	createvisualtask AnimTask_BlendMonInAndOut, 2, ANIM_ATTACKER, RGB_WHITE, 10, 2, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_ATTACKER, 3, 0, 32, 1
	playsewithpan SE_M_NIGHTMARE, SOUND_PAN_TARGET
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

Move_FLAIL:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_FlailMovement, 2, ANIM_ATTACKER
	loopsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER, 8, 2
	waitforvisualfinish
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, ANIM_TARGET, 3
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, FALSE, 1, 30, 1, 0
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_SPITE:
	fadetobg BG_GHOST
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	waitbgfadein
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 2, 6, 0, 8, RGB_WHITE
	createvisualtask AnimTask_SpiteTargetShadow, 2
	loopsewithpan SE_M_PSYBEAM, SOUND_PAN_TARGET, 20, 3
	waitforvisualfinish
	restorebg
	waitbgfadein
	clearmonbg ANIM_TARGET
	end

Move_POWER_UP_PUNCH:
Move_JET_PUNCH_2:
Move_MACH_PUNCH:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_GetAttackerSide, 2
	jumprettrue MachPunchAgainstPlayer
	fadetobg BG_HIGHSPEED_OPPONENT
MachPunchContinue:
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -2304, 0, 1, -1
	waitbgfadein
	delay 0
	setalpha 9, 8
	createvisualtask AnimTask_AttackerPunchWithTrace, 2, RGB(8, 9, 28), 10
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 8, 1, 0
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	restorebg
	waitbgfadeout
	setarg 7, 0xFFFF
	waitbgfadein
	end

MachPunchAgainstPlayer:
	fadetobg BG_HIGHSPEED_PLAYER
	goto MachPunchContinue

Move_FORESIGHT:
	loadspritegfx ANIM_TAG_MAGNIFYING_GLASS
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 16, 0
	createsprite gForesightMagnifyingGlassSpriteTemplate, ANIM_TARGET, 2, ANIM_TARGET
	delay 17
	loopsewithpan SE_M_SKETCH, SOUND_PAN_TARGET, 16, 4
	delay 48
	delay 24
	playsewithpan SE_M_SKETCH, SOUND_PAN_TARGET
	delay 10
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_TARGET, RGB_WHITE, 12, 2, 1
	playsewithpan SE_M_DETECT, SOUND_PAN_TARGET
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_DEF_PARTNER
	end

Move_DESTINY_BOND:
	loadspritegfx ANIM_TAG_WHITE_SHADOW
	fadetobg BG_GHOST
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	waitbgfadein
	createvisualtask AnimTask_DestinyBondWhiteShadow, 5, 0, 48
	playsewithpan SE_M_CONFUSE_RAY, SOUND_PAN_ATTACKER
	delay 48
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 2, 0, 24, 1
	createvisualtask AnimTask_BlendBattleAnimPalExclude, 2, 6, 1, 0, 12, RGB(29, 29, 29)
	delay 24
	createvisualtask AnimTask_BlendBattleAnimPalExclude, 2, 6, 1, 12, 0, RGB(29, 29, 29)
	playsewithpan SE_M_NIGHTMARE, SOUND_PAN_TARGET
	waitforvisualfinish
	restorebg
	waitbgfadein
	blendoff
	clearmonbg 5
	end

Move_ENDURE:
	loadspritegfx ANIM_TAG_FOCUS_ENERGY
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	call EndureEffect
	delay 8
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 2, 2, 0, 11, RGB_RED
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 32, 1
	call EndureEffect
	delay 8
	call EndureEffect
	waitforvisualfinish
	end

EndureEffect:
	createsprite gEndureEnergySpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 26, 2
	delay 4
	createsprite gEndureEnergySpriteTemplate, ANIM_ATTACKER, 2, 0, 14, 28, 1
	delay 4
	createsprite gEndureEnergySpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 10, 2
	delay 4
	createsprite gEndureEnergySpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 26, 3
	delay 4
	createsprite gEndureEnergySpriteTemplate, ANIM_ATTACKER, 2, 0, -12, 0, 1
	return

Move_CHARM:
	loadspritegfx ANIM_TAG_MAGENTA_HEART
	createvisualtask AnimTask_RockMonBackAndForth, 5, ANIM_ATTACKER, 2, 0
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 0, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, -20, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 20, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	waitforvisualfinish
	end

Move_ROLLOUT:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_MUD_SAND
	loadspritegfx ANIM_TAG_ROCKS
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_Rollout, 2
	waitforvisualfinish
	waitsound
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 6, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, ANIM_TARGET, 2
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_FALSE_SWIPE:
	loadspritegfx ANIM_TAG_SLASH_2
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gFalseSwipeSliceSpriteTemplate, ANIM_TARGET, 2
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_TARGET
	delay 16
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 0
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_TARGET
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 16
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 32
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_TARGET
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 48
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 64
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_TARGET
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 80
	delay 2
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 6, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, 0, 0, ANIM_TARGET, 3
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	end

Move_SWAGGER:
	loadspritegfx ANIM_TAG_BREATH
	loadspritegfx ANIM_TAG_ANGER
	createvisualtask AnimTask_GrowAndShrink, 2
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gBreathPuffSpriteTemplate, ANIM_ATTACKER, 2
	loopsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER, 4, 2
	waitforvisualfinish
	delay 24
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, -20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_TARGET
	delay 12
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, 20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_TARGET
	waitforvisualfinish
	end

Move_MILK_DRINK:
	loadspritegfx ANIM_TAG_MILK_BOTTLE
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg ANIM_TARGET
	createsprite gMilkBottleSpriteTemplate, ANIM_ATTACKER, 2
	delay 40
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	delay 12
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	delay 20
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 0
	playsewithpan SE_M_MILK_DRINK, SOUND_PAN_ATTACKER
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	call HealingEffect2
	waitforvisualfinish
	end

Move_MAGNITUDE:
	createvisualtask AnimTask_IsPowerOver99, 2
	waitforvisualfinish
	jumpargeq 15, FALSE, MagnitudeRegular
	jumpargeq 15, TRUE, MagnitudeIntense
MagnitudeEnd:
	end

MagnitudeRegular:
	createvisualtask AnimTask_HorizontalShake, 5, (MAX_BATTLERS_COUNT + 1), 0, 50
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 0, 50
	loopsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET, 8, 10
	goto MagnitudeEnd

MagnitudeIntense:
	createvisualtask AnimTask_HorizontalShake, 5, (MAX_BATTLERS_COUNT + 1), 0, 50
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 0, 50
	loopsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET, 8, 10
	delay 10
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	delay 16
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	goto MagnitudeEnd

Move_WICKED_TORQUE:
Move_NOXIOUS_TORQUE:
Move_MAGICAL_TORQUE:
Move_COMBAT_TORQUE:
Move_RAPID_SPIN:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_RAPID_SPIN
	monbg ANIM_ATTACKER
	createsprite gRapidSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 32, -32, 40, -2
	createvisualtask AnimTask_RapinSpinMonElevation, 2, 0, 2, 0
	loopsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER, 8, 4
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, FALSE, 1, 10, 1, 0
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	waitforvisualfinish
	delay 8
	createvisualtask AnimTask_RapinSpinMonElevation, 2, 0, 2, 1
	loopsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER, 8, 4
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	end

Move_MOONLIGHT:
	loadspritegfx ANIM_TAG_MOON
	loadspritegfx ANIM_TAG_GREEN_SPARKLE
	loadspritegfx ANIM_TAG_BLUE_STAR
	setalpha 0, 16
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 0, 16, RGB_BLACK
	waitforvisualfinish
	createsprite gMoonSpriteTemplate, ANIM_ATTACKER, 2, 120, 56
	createvisualtask AnimTask_AlphaFadeIn, 3, 0, 16, 16, 0, 1
	playsewithpan SE_M_MOONLIGHT, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, -12, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, -24, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, 21, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, 0, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, 10, 0
	delay 20
	createvisualtask AnimTask_MoonlightEndFade, 2
	waitforvisualfinish
	call HealingEffect
	waitforvisualfinish
	end

Move_EXTREME_SPEED:
	loadspritegfx ANIM_TAG_SPEED_DUST
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_GetAttackerSide, 2
	jumprettrue ExtremeSpeedAgainstPlayer
	fadetobg BG_HIGHSPEED_OPPONENT
ExtremeSpeedContinue:
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -2304, 0, 1, -1
	waitbgfadein
	createvisualtask AnimTask_AttackerStretchAndDisappear, 2
	loopsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER, 8, 3
	waitforvisualfinish
	delay 1
	createvisualtask AnimTask_SetAttackerInvisibleWaitForSignal, 2
	monbg ANIM_TARGET
	setalpha 12, 8
	delay 18
	createvisualtask AnimTask_ExtremeSpeedImpact, 2
	delay 2
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gMonEdgeHitSplatSpriteTemplate, ANIM_TARGET, 2, ANIM_TARGET, 0, -12, 3
	delay 10
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gMonEdgeHitSplatSpriteTemplate, ANIM_TARGET, 2, ANIM_TARGET, 0, 12, 3
	delay 10
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gMonEdgeHitSplatSpriteTemplate, ANIM_TARGET, 2, ANIM_TARGET, 0, 0, 3
	waitforvisualfinish
	createvisualtask AnimTask_SpeedDust, 2
	delay 10
	createvisualtask AnimTask_ExtremeSpeedMonReappear, 2
	loopsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER, 8, 4
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, 0xFFFF
	waitbgfadein
	clearmonbg ANIM_TARGET
	blendoff
	delay 1
	setarg 7, 0x1000
	delay 1
	end

ExtremeSpeedAgainstPlayer:
	fadetobg BG_HIGHSPEED_PLAYER
	goto ExtremeSpeedContinue

Move_UPROAR:
	loadspritegfx ANIM_TAG_JAGGED_MUSIC_NOTE
	loadspritegfx ANIM_TAG_THIN_RING
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_UproarDistortion, 2, 0
	createsprite gUproarRingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0, 31, 8
	playsewithpan SE_M_UPROAR, SOUND_PAN_ATTACKER
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, 29, -12, 0
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, -12, -29, 1
	delay 16
	createvisualtask AnimTask_UproarDistortion, 2, 0
	createsprite gUproarRingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0, 31, 8
	playsewithpan SE_M_UPROAR, SOUND_PAN_ATTACKER
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, 12, -29, 1
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, -29, -12, 0
	delay 16
	createvisualtask AnimTask_UproarDistortion, 2, 0
	createsprite gUproarRingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0, 31, 8
	playsewithpan SE_M_UPROAR, SOUND_PAN_ATTACKER
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, -24, 1
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, -24, 0
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_HEAT_WAVE:
	loadspritegfx ANIM_TAG_FLYING_DIRT
	createvisualtask AnimTask_BlendParticle, 5, ANIM_TAG_FLYING_DIRT, 0, 6, 6, RGB_RED
	createvisualtask AnimTask_LoadSandstormBackground, 5, TRUE
	createvisualtask AnimTask_BlendBackground, 6, 6, RGB_RED
	panse SE_M_HEAT_WAVE, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	delay 4
	createvisualtask AnimTask_MoveHeatWaveTargets, 5
	delay 12
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 10, 2304, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 90, 2048, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 50, 2560, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 20, 2304, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 70, 1984, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 0, 2816, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 60, 2560, 96, 1
	end

@ Also used by Hail weather
Move_HAIL:
	loadspritegfx ANIM_TAG_HAIL
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 3, 0, 6, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_Hail, 5
	loopsewithpan SE_M_HAIL, 0, 8, 10
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 3, 6, 0, RGB_BLACK
	end

Move_TORMENT:
	loadspritegfx ANIM_TAG_ANGER
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	createvisualtask AnimTask_TormentAttacker, 2
	waitforvisualfinish
	createvisualtask AnimTask_BlendMonInAndOut, 2, ANIM_TARGET, RGB_RED, 10, 1, 1
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, -20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_TARGET
	delay 20
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, 20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_TARGET
	end

Move_MEMENTO:
	setalpha 0, 16
	delay 1
	createvisualtask AnimTask_InitMementoShadow, 2
	delay 1
	createvisualtask AnimTask_MoveAttackerMementoShadow, 5
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	delay 48
	playsewithpan SE_M_PSYBEAM2, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createvisualtask AnimTask_MementoHandleBg, 2
	delay 12
	setalpha 0, 16
	delay 1
	monbg_static ANIM_TARGET
	createvisualtask AnimTask_MoveTargetMementoShadow, 5
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg_static ANIM_TARGET
	delay 1
	blendoff
	delay 1
	end

Move_FACADE_DUCK:
Move_FACADE_PSYDUCK:
Move_FACADE:
	loadspritegfx ANIM_TAG_SWEAT_DROP
	createvisualtask AnimTask_SquishAndSweatDroplets, 2, ANIM_ATTACKER, 3
	createvisualtask AnimTask_FacadeColorBlend, 2, ANIM_ATTACKER, 72
	loopsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER, 24, 3
	end

Move_WAKE_UP_SLAP:
	loadspritegfx ANIM_TAG_TAG_HAND
	loadspritegfx ANIM_TAG_SMELLINGSALT_EFFECT
	createsprite gSmellingSaltsHandSpriteTemplate, ANIM_TARGET, 2, ANIM_TARGET, 0, 2
	createsprite gSmellingSaltsHandSpriteTemplate, ANIM_TARGET, 2, ANIM_TARGET, 1, 2
	delay 32
	createvisualtask AnimTask_SmellingSaltsSquish, 3, ANIM_TARGET, 2
	loopsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET, 12, 2
	waitforvisualfinish
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 6, 2
	createsprite gSmellingSaltExclamationSpriteTemplate, ANIM_TARGET, 2, ANIM_TARGET, 8, 3
	loopsewithpan SE_M_SWAGGER2, SOUND_PAN_TARGET, 16, 3
	end

Move_FOLLOW_ME:
	loadspritegfx ANIM_TAG_FINGER
	createsprite gFollowMeFingerSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	delay 18
	playsewithpan SE_M_ATTRACT, SOUND_PAN_ATTACKER
	delay 71
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 22, 3
	end

Move_CHARGE:
	loadspritegfx ANIM_TAG_ELECTRIC_ORBS
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_ELECTRICITY
	monbg ANIM_ATTACKER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 4, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_ElectricChargingParticles, 2, ANIM_ATTACKER, 60, 2, 12
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 30
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 30
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	createsprite gGrowingChargeOrbSpriteTemplate, ANIM_ATTACKER, 2, 0
	delay 25
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 20
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 15
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 10
	delay 6
	loopsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER, 6, 5
	waitforvisualfinish
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 16
	delay 2
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, -16, -16
	playsewithpan SE_M_THUNDERBOLT2, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 4, 0, RGB_BLACK
	clearmonbg ANIM_ATTACKER
	blendoff
	end

Move_TAUNT:
	loadspritegfx ANIM_TAG_FINGER_2
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	loadspritegfx ANIM_TAG_ANGER
	createsprite gThoughtBubbleSpriteTemplate, ANIM_ATTACKER, 11, 0, 45
	playsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER
	delay 6
	createsprite gTauntFingerSpriteTemplate, ANIM_ATTACKER, 12, 0
	delay 4
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 16, 2
	waitforvisualfinish
	delay 8
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, -20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_TARGET
	waitforvisualfinish
	delay 12
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, 20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_TARGET
	end

Move_HELPING_HAND:
	loadspritegfx ANIM_TAG_TAG_HAND
	createvisualtask AnimTask_HelpingHandAttackerMovement, 5
	createsprite gHelpingHandClapSpriteTemplate, ANIM_ATTACKER, 40, 0
	createsprite gHelpingHandClapSpriteTemplate, ANIM_ATTACKER, 40, 1
	delay 19
	playsewithpan SE_M_ENCORE, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATK_PARTNER, 2, 0, 5, 1
	delay 14
	playsewithpan SE_M_ENCORE, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATK_PARTNER, 2, 0, 5, 1
	delay 20
	playsewithpan SE_M_ENCORE, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATK_PARTNER, 3, 0, 10, 1
	createvisualtask AnimTask_BlendMonInAndOut, 2, ANIM_ATK_PARTNER, RGB_YELLOW, 12, 1, 1
	end

Move_FURRY_ATTACK1:
Move_FURRY_ATTACK2:
Move_FURRY_ATTACK_2:
Move_ASSIST:
	loadspritegfx ANIM_TAG_PAW_PRINT
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 112, -16, 140, 128, 36
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 208, 128, -16, 48, 36
	playsewithpan SE_M_SCRATCH, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, -16, 112, 256, -16, 36
	playsewithpan SE_M_SCRATCH, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 108, 128, 84, -16, 36
	playsewithpan SE_M_SCRATCH, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, -16, 56, 256, 56, 36
	playsewithpan SE_M_SCRATCH, 0
	end

Move_FURRY_SWIPES:
	loadspritegfx ANIM_TAG_PAW_PRINT
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 112, -16, 140, 128, 36
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 208, 128, -16, 48, 36
	playsewithpan SE_M_SCRATCH, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, -16, 112, 256, -16, 36
	playsewithpan SE_M_SCRATCH, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 108, 128, 84, -16, 36
	playsewithpan SE_M_SCRATCH, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, -16, 56, 256, 56, 36
	playsewithpan SE_M_SCRATCH, 0
	end

Move_FOCUS_MISS:
Move_SUPERPOWER:
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_METEOR
	loadspritegfx ANIM_TAG_FLAT_ROCK
	monbg ANIM_ATK_PARTNER
	splitbgprio ANIM_ATTACKER
	setalpha 12, 8
	createsprite gSuperpowerOrbSpriteTemplate, ANIM_TARGET, 2, ANIM_ATTACKER
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_ATTACKER
	delay 20
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 4, 1, 180, 1
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_EARTHQUAKE, 0
	delay 40
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 200, 96, 1, 120
	delay 8
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 20, 248, 4, 112
	delay 8
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 130, 160, 2, 104
	delay 8
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 160, 192, 0, 96
	delay 8
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 60, 288, 3, 88
	delay 74
	createsprite gSuperpowerFireballSpriteTemplate, ANIM_TARGET, 3, ANIM_ATTACKER
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	delay 16
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 8, 0, 16, 1
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	delay 1
	end

Move_RECYCLE:
	loadspritegfx ANIM_TAG_RECYCLE
	monbg ANIM_ATTACKER
	setalpha 0, 16
	delay 1
	createsprite gRecycleSpriteTemplate, ANIM_ATTACKER, 2
	loopsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER, 24, 3
	waitforvisualfinish
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_ATTACKER, RGB_WHITE, 12, 2, 1
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_ATTACKER
	delay 1
	end

Move_BRICK_BREAK:
	loadspritegfx ANIM_TAG_BLUE_LIGHT_WALL
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_TORN_METAL
	choosetwoturnanim BrickBreakNormal, BrickBreakShatteredWall

BrickBreakNormal:
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 8
	delay 4
	delay 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -18, -18, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, -18, -18, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_TARGET
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 8
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 18, 18, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 18, 18, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_TARGET
	delay 20
	createvisualtask AnimTask_WindUpLunge, 2, ANIM_ATTACKER, -24, 0, 24, 10, 24, 3
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 6, RGB_BLACK
	delay 37
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 6, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	end

BrickBreakShatteredWall:
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 8
	delay 4
	createsprite gBrickBreakWallSpriteTemplate, ANIM_ATTACKER, 3, ANIM_TARGET, 0, 0, 90, 10
	delay 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -18, -18, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, -18, -18, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_TARGET
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 8
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 18, 18, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 18, 18, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_TARGET
	delay 20
	createvisualtask AnimTask_WindUpLunge, 2, ANIM_ATTACKER, -24, 0, 24, 10, 24, 3
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 6, RGB_BLACK
	delay 37
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gBrickBreakWallShardSpriteTemplate, ANIM_ATTACKER, 2, ANIM_TARGET, 0, -8, -12
	createsprite gBrickBreakWallShardSpriteTemplate, ANIM_ATTACKER, 2, ANIM_TARGET, 1, 8, -12
	createsprite gBrickBreakWallShardSpriteTemplate, ANIM_ATTACKER, 2, ANIM_TARGET, 2, -8, 12
	createsprite gBrickBreakWallShardSpriteTemplate, ANIM_ATTACKER, 2, ANIM_TARGET, 3, 8, 12
	playsewithpan SE_M_BRICK_BREAK, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 6, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	end

Move_YAWN:
	loadspritegfx ANIM_TAG_PINK_CLOUD
	createvisualtask AnimTask_DeepInhale, 2, ANIM_ATTACKER
	playsewithpan SE_M_YAWN, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gYawnCloudSpriteTemplate, ANIM_TARGET, 5, 2
	playsewithpan SE_M_SPIT_UP, SOUND_PAN_ATTACKER
	delay 4
	createsprite gYawnCloudSpriteTemplate, ANIM_TARGET, 5, 1
	delay 4
	createsprite gYawnCloudSpriteTemplate, ANIM_TARGET, 5, 0
	waitforvisualfinish
	createvisualtask AnimTask_DeepInhale, 2, ANIM_TARGET
	playsewithpan SE_M_YAWN, SOUND_PAN_TARGET
	end

Move_ENDEAVOR:
	loadspritegfx ANIM_TAG_SWEAT_DROP
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_SquishAndSweatDroplets, 2, ANIM_ATTACKER, 2
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 24, 2
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_ATTACKER, RGB(31, 21, 0), 12, 1, 2
	delay 6
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 5, FALSE, 1, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 12, -12, ANIM_TARGET, 2
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	delay 24
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 5, FALSE, 1, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -12, 12, ANIM_TARGET, 2
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	end

Move_LAVA_PLUME:
Move_ERUPTION:
	loadspritegfx ANIM_TAG_WARM_ROCK
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 2, 0, 4, RGB_RED
	waitforvisualfinish
	createvisualtask AnimTask_EruptionLaunchRocks, 2
	waitplaysewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER, 60
	waitforvisualfinish
	createvisualtask AnimTask_EruptionLaunchRocks, 2
	waitplaysewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER, 60
	waitforvisualfinish
	delay 30
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 200, -32, 0, 100, 0
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 30, -32, 16, 90, 1
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 150, -32, 32, 60, 2
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 90, -32, 48, 80, 3
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 110, -32, 64, 50, 0
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 60, -32, 80, 70, 1
	delay 22
	createvisualtask AnimTask_HorizontalShake, 5, (MAX_BATTLERS_COUNT + 1), 8, 60
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 8, 60
	loopsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET, 16, 12
	delay 80
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 40, F_PAL_BG | F_PAL_BATTLERS, 4, 4, 0, RGB_RED
	end

Move_SKILL_SWAP:
	loadspritegfx ANIM_TAG_BLUEGREEN_ORB
	call SetPsychicBackground
	createvisualtask AnimTask_SkillSwap, 3, ANIM_TARGET
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_TARGET, RGB_WHITE, 12, 3, 1
	loopsewithpan SE_M_REVERSAL, SOUND_PAN_ATTACKER, 24, 3
	delay 16
	createvisualtask AnimTask_SkillSwap, 3, ANIM_ATTACKER
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_ATTACKER, RGB_WHITE, 12, 3, 1
	waitforvisualfinish
	call UnsetPsychicBackground
	end

Move_IMPRISON:
	loadspritegfx ANIM_TAG_HOLLOW_ORB
	loadspritegfx ANIM_TAG_X_SIGN
	call SetPsychicBackground
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_ImprisonOrbs, 5
	delay 8
	loopsewithpan SE_M_HORN_ATTACK, SOUND_PAN_ATTACKER, 8, 5
	waitforvisualfinish
	delay 4
	createsprite gRedXSpriteTemplate, ANIM_ATTACKER, 5, ANIM_ATTACKER, 40
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 1, 10
	playsewithpan SE_M_HYPER_BEAM, SOUND_PAN_ATTACKER
	clearmonbg ANIM_DEF_PARTNER
	call UnsetPsychicBackground
	end

Move_GRUDGE:
	loadspritegfx ANIM_TAG_PURPLE_FLAME
	monbg ANIM_ATTACKER
	splitbgprio_all
	fadetobg BG_GHOST
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	waitbgfadein
	createvisualtask AnimTask_GrudgeFlames, 3
	loopsewithpan SE_M_EMBER, SOUND_PAN_ATTACKER, 16, 4
	delay 10
	delay 80
	playsewithpan SE_M_NIGHTMARE, SOUND_PAN_TARGET
	waitforvisualfinish
	restorebg
	waitbgfadein
	clearmonbg ANIM_ATTACKER
	end

Move_CAMOUFLAGE:
	monbg ANIM_ATK_PARTNER
	splitbgprio ANIM_ATTACKER
	setalpha 16, 0
	createvisualtask AnimTask_SetCamouflageBlend, 5, F_PAL_ATTACKER, 3, 0, 14
	delay 16
	createvisualtask AnimTask_AttackerFadeToInvisible, 2, 4
	playsewithpan SE_M_FAINT_ATTACK, SOUND_PAN_ATTACKER
	waitforvisualfinish
	delay 8
	createvisualtask AnimTask_SetCamouflageBlend, 5, F_PAL_ATTACKER, 0, 0, 0
	waitforvisualfinish
	createvisualtask AnimTask_AttackerFadeFromInvisible, 2, 1
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_ATK_PARTNER
	end

Move_TAIL_GLOW:
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	monbg ANIM_ATTACKER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 4, RGB_BLACK
	waitforvisualfinish
	createsprite gTailGlowOrbSpriteTemplate, ANIM_ATTACKER, 66, ANIM_ATTACKER
	delay 18
	loopsewithpan SE_M_MORNING_SUN, SOUND_PAN_ATTACKER, 16, 6
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 4, 0, RGB_BLACK
	clearmonbg ANIM_ATTACKER
	blendoff
	delay 1
	end

Move_LUSTER_PURGE:
	loadspritegfx ANIM_TAG_WHITE_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_IMPACT
	fadetobg BG_PSYCHIC
	waitbgfadeout
	createvisualtask AnimTask_FadeScreenToWhite, 5
	waitbgfadein
	monbg ANIM_ATTACKER
	setalpha 12, 8
	playsewithpan SE_M_SOLAR_BEAM, SOUND_PAN_ATTACKER
	createsprite gLusterPurgeCircleSpriteTemplate, ANIM_ATTACKER, 41, 0, 0, 0, 0
	delay 20
	createvisualtask AnimTask_BlendBattleAnimPalExclude, 5, 5, 2, 0, 16, RGB_WHITEALPHA
	createvisualtask AnimTask_BlendParticle, 5, ANIM_TAG_WHITE_CIRCLE_OF_LIGHT, 2, 0, 16, RGB_WHITEALPHA
	waitforvisualfinish
	createvisualtask AnimTask_BlendParticle, 5, ANIM_TAG_IMPACT, 0, 12, 12, RGB(0, 0, 23)
	waitforvisualfinish
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_HYPER_BEAM, SOUND_PAN_TARGET
	delay 3
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_HYPER_BEAM, SOUND_PAN_TARGET
	delay 3
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_HYPER_BEAM, SOUND_PAN_TARGET
	delay 3
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_HYPER_BEAM, SOUND_PAN_TARGET
	delay 3
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_HYPER_BEAM, SOUND_PAN_TARGET
	delay 3
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_HYPER_BEAM, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPalExclude, 5, 5, 2, 16, 0, RGB_WHITEALPHA
	createvisualtask AnimTask_HorizontalShake, 5, ANIM_TARGET, 5, 14
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	call UnsetPsychicBackground
	end

Move_MIST_BALL:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_WHITE_FEATHER
	delay 0
	playsewithpan SE_M_STRING_SHOT, SOUND_PAN_ATTACKER
	createsprite gMistBallSpriteTemplate, ANIM_TARGET, 0, 0, 0, 0, 0, 30, 0
	waitforvisualfinish
	playsewithpan SE_M_SAND_ATTACK, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 10, 0
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_BG, 1, 1, RGB(23, 16, 31), 16, RGB_WHITE, 16
	delay 0
	playsewithpan SE_M_HAZE, 0
	createvisualtask AnimTask_MistBallFog, 5
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 3, 0, 16, RGB_WHITE
	delay 8
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 4, 0, 70, 0
	delay 70
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 16, 0, RGB_WHITE
	end

Move_FEATHER_DANCE:
	loadspritegfx ANIM_TAG_WHITE_FEATHER
	monbg ANIM_DEF_PARTNER
	splitbgprio_all
	playsewithpan SE_M_PETAL_DANCE, SOUND_PAN_TARGET
	delay 0
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 64, 2, 104, 11304, 32, 1
	delay 6
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 32, 2, 104, 11304, 32, 1
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 0, 2, 104, 11304, 32, 1
	delay 6
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 224, 2, 104, 11304, 32, 1
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 128, 2, 104, 11304, 32, 1
	delay 6
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 192, 2, 104, 11304, 32, 1
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 160, 2, 104, 11304, 32, 1
	delay 6
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 96, 2, 104, 11304, 32, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_VICTORY_DANCE:
Move_TEETER_DANCE:
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	loadspritegfx ANIM_TAG_DUCK
	createvisualtask AnimTask_TeeterDanceMovement, 5
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, -2
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -2
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, -16, -2
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 1, -8, -2
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 2, 8, -2
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	end

Move_MUD_SPORT:
	loadspritegfx ANIM_TAG_MUD_SAND
	createvisualtask AnimTask_Splash, 2, 0, 6
	delay 24
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, -4, -16
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, 4, -12
	playsewithpan SE_M_DIG, SOUND_PAN_ATTACKER
	delay 32
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, -3, -12
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, 5, -14
	playsewithpan SE_M_DIG, SOUND_PAN_ATTACKER
	delay 32
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, -5, -18
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, 3, -14
	playsewithpan SE_M_DIG, SOUND_PAN_ATTACKER
	delay 16
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 220, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 60, 100
	waitplaysewithpan SE_M_BUBBLE2, 0, 25
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 140, 55
	waitplaysewithpan SE_M_BUBBLE2, 0, 14
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 180, 50
	waitplaysewithpan SE_M_BUBBLE2, 0, 10
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 20, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 90, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 160, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 30, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 120, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 200, 40
	waitplaysewithpan SE_M_BUBBLE2, 0, 10
	end

Move_NEEDLE_ARM:
	loadspritegfx ANIM_TAG_GREEN_SPIKE
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loopsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET, 2, 16
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 0, -32, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 22, -22, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 30, 0, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 20, 20, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 0, 28, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, -19, 19, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, -27, 0, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, -18, -18, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 0, -25, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 17, -17, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 23, 0, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 16, 16, 16
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 18, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 8, 1, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 0, -24, 10
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 17, -17, 10
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 24, 0, 10
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 17, 17, 10
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 0, 24, 10
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, -17, 17, 10
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, -24, 0, 10
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, -17, -17, 10
	end

Move_SLACK_OFF:
	loadspritegfx ANIM_TAG_BLUE_STAR
	createvisualtask AnimTask_SlackOffSquish, 2, ANIM_ATTACKER
	playsewithpan SE_M_YAWN, SOUND_PAN_ATTACKER
	waitforvisualfinish
	call HealingEffect
	waitforvisualfinish
	end

Move_CRUSH_CLAW:
	loadspritegfx ANIM_TAG_BLUE_LIGHT_WALL
	loadspritegfx ANIM_TAG_CLAW_SLASH
	loadspritegfx ANIM_TAG_TORN_METAL
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 18, 1
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, -10, 0
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, 10, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	delay 12
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, -10, 1
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, 10, 1
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	waitforvisualfinish  @ Redundant
	blendoff
	clearmonbg ANIM_TARGET
	end

Move_AROMATHERAPY:
	playsewithpan SE_M_PETAL_DANCE, 0
	loadspritegfx ANIM_TAG_FLOWER
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_SPARKLE_2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_BG, 0, 0, 7, RGB(13, 31, 12)
	delay 1
	monbg ANIM_ATTACKER
	delay 1
	createsprite gAromatherapySmallFlowerSpriteTemplate, ANIM_ATTACKER, 0, 24, 16, 0, 2, 2, 0, 0
	createsprite gAromatherapySmallFlowerSpriteTemplate, ANIM_ATTACKER, 66, 64, 24, 0, 3, 1, 1, 0
	createsprite gAromatherapyBigFlowerSpriteTemplate, ANIM_ATTACKER, 0, 16, 24, 0, 2, 1, 0, 0
	delay 20
	createsprite gAromatherapySmallFlowerSpriteTemplate, ANIM_ATTACKER, 66, 48, 12, 0, 4, 3, 1, 0
	createsprite gAromatherapySmallFlowerSpriteTemplate, ANIM_ATTACKER, 0, 100, 16, 0, 3, 2, 0, 0
	createsprite gAromatherapySmallFlowerSpriteTemplate, ANIM_ATTACKER, 0, 74, 24, 180, 3, 2, 0, 0
	delay 10
	createsprite gAromatherapySmallFlowerSpriteTemplate, ANIM_ATTACKER, 66, 80, 30, 0, 4, 1, 1, 0
	createsprite gAromatherapySmallFlowerSpriteTemplate, ANIM_ATTACKER, 0, 128, 12, 0, 3, 3, 0, 0
	createsprite gAromatherapyBigFlowerSpriteTemplate, ANIM_ATTACKER, 0, 90, 16, 0, 2, 1, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_BG, 0, 7, 0, RGB(13, 31, 12)
	delay 1
	playsewithpan SE_M_STAT_INCREASE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_StatusClearedEffect, 2, 1
	waitforvisualfinish
	playsewithpan SE_M_MORNING_SUN, SOUND_PAN_ATTACKER
	createsprite gSparklingStarsSpriteTemplate, ANIM_ATTACKER, 16, -15, 0, 0, 0, 32, 60, 1
	delay 8
	createsprite gSparklingStarsSpriteTemplate, ANIM_ATTACKER, 16, 12, -5, 0, 0, 32, 60, 1
	waitforvisualfinish
	playsewithpan SE_SHINY, SOUND_PAN_ATTACKER
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_BG | F_PAL_ATK_SIDE | F_PAL_ANIM_1, 3, 10, 0, RGB(13, 31, 12)
	createsprite gBlendThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 16, 0, 0, 0, 1
	waitforvisualfinish
	end

Move_FAKE_TEARS:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	createvisualtask AnimTask_BlendParticle, 5, ANIM_TAG_SMALL_BUBBLES, 0, 4, 4, RGB(12, 11, 31)
	waitforvisualfinish
	createvisualtask AnimTask_RockMonBackAndForth, 5, ANIM_ATTACKER, 2, 1
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 12, 4
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	waitforvisualfinish
	end

Move_AIR_CUTTER:
	loadspritegfx ANIM_TAG_AIR_WAVE
	loadspritegfx ANIM_TAG_CUT
	loadspritegfx ANIM_TAG_IMPACT
	delay 0
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 0
	createvisualtask AnimTask_AirCutterProjectile, 2, 32, -24, 6 * 256, 2, 128  @ 6 * 256 == Q_8_8(6)
	waitforvisualfinish
	playsewithpan SE_M_CUT, SOUND_PAN_TARGET
	createsprite gAirCutterSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0, 2
	delay 5
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 2, 0, 8, 1
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_DEF_PARTNER
	delay 0
	end

Move_DIRE_IT:
Move_ODOR_SLEUTH:
	monbg ANIM_TARGET
	createvisualtask AnimTask_OdorSleuthMovement, 5
	delay 24
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 4
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	delay 6
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 4
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	delay 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_WHITEALPHA, 16, RGB_WHITEALPHA, 0
	playsewithpan SE_M_LEER, SOUND_PAN_ATTACKER
	end

Move_GRASS_WHISTLE:
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 4, RGB(18, 31, 12)
	waitforvisualfinish
	createvisualtask AnimTask_MusicNotesRainbowBlend, 2
	waitforvisualfinish
	panse SE_M_GRASSWHISTLE, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 7, 1, 0
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 6, 1, 0
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 1, 1, 0
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 0
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 3, 1, 0
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 0
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 5, 1, 0
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 6, 1, 0
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 0
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 0
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 1, 1, 0
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 5, 1, 0
	delay 4
	waitforvisualfinish
	createvisualtask AnimTask_MusicNotesClearRainbowBlend, 2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 4, 0, RGB(18, 31, 12)
	waitforvisualfinish
	end

Move_TICKLE:
	loadspritegfx ANIM_TAG_EYE_SPARKLE
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_ATTACKER, 0, 0, 16, RGB_BLACK
	waitforvisualfinish
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, -16, -8
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, 16, -8
	playsewithpan SE_M_DETECT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_ATTACKER, 0, 16, 0, RGB_BLACK
	waitforvisualfinish
	delay 20
	createvisualtask AnimTask_SwayMon, 3, 0, 6, 1280, 3, ANIM_ATTACKER
	delay 12
	createvisualtask AnimTask_RockMonBackAndForth, 3, ANIM_TARGET, 6, 2
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_TARGET, 8, 8
	waitforvisualfinish
	end

Move_WATER_SPOUT:
	loadspritegfx ANIM_TAG_GLOWY_BLUE_ORB
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_WaterSpoutLaunch, 5
	playsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER
	delay 44
	playsewithpan SE_M_DIVE, SOUND_PAN_ATTACKER
	waitforvisualfinish
	delay 16
	createvisualtask AnimTask_WaterSpoutRain, 5
	playsewithpan SE_M_SURF, SOUND_PAN_TARGET
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_SHADOW_PUNCH:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	fadetobg BG_GHOST
	waitbgfadein
	monbg ANIM_ATK_PARTNER
	setalpha 9, 8
	createvisualtask AnimTask_AttackerPunchWithTrace, 2, RGB_BLACK, 13
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 8, 1, 0
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	restorebg
	waitbgfadein
	end

Move_PSYCICLE_SPEAR:
Move_EXTRASENSORY:
	call SetPsychicBackground
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_ATTACKER, RGB(27, 27, 0), 12, 1, 1
	createvisualtask AnimTask_ExtrasensoryDistortion, 5, 0
	playsewithpan SE_M_BIND, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_ATTACKER, RGB(27, 27, 0), 12, 1, 1
	createvisualtask AnimTask_ExtrasensoryDistortion, 5, 1
	playsewithpan SE_M_BIND, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_TransparentCloneGrowAndShrink, 5, ANIM_ATTACKER
	createvisualtask AnimTask_ExtrasensoryDistortion, 5, 2
	playsewithpan SE_M_LEER, SOUND_PAN_ATTACKER
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_DEF_PARTNER
	call UnsetPsychicBackground
	end

Move_AERIAL_ACE:
	loadspritegfx ANIM_TAG_CUT
	monbg ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 24, 6, 1, 5
	createvisualtask AnimTask_TraceMonBlended, 2, 0, 4, 7, 3
	createsprite gCuttingSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	delay 5
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 10, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB_BLACK, 10, RGB_BLACK, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_IRON_DEFENSE:
	loopsewithpan SE_SHINY, SOUND_PAN_ATTACKER, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 8, 2, RGB_WHITEALPHA, 14, RGB_WHITEALPHA, 0
	waitforvisualfinish
	end

Move_BLOCK:
	loadspritegfx ANIM_TAG_X_SIGN
	createsprite gBlockXSpriteTemplate, ANIM_TARGET, 66
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	end

Move_HOWL:
	loadspritegfx ANIM_TAG_NOISE_LINE
	createvisualtask AnimTask_DeepInhale, 2, 0
	delay 12
	call RoarEffect
	createvisualtask SoundTask_PlayCryHighPitch, 2, ANIM_ATTACKER, 3
	waitforvisualfinish
	delay 30
	end

Move_PUFF_UP:
Move_BULK_UP:
	loadspritegfx ANIM_TAG_BREATH
	createvisualtask AnimTask_GrowAndShrink, 2
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gBreathPuffSpriteTemplate, ANIM_ATTACKER, 2
	loopsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER, 4, 2
	waitforvisualfinish
	end

Move_COVET:
	loadspritegfx ANIM_TAG_MAGENTA_HEART
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask AnimTask_RockMonBackAndForth, 5, ANIM_ATTACKER, 2, 0
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 0, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, -20, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 20, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	loopsewithpan SE_M_DIZZY_PUNCH, SOUND_PAN_TARGET, 4, 3
	end

Move_VOLT_TACKLE:
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_ELECTRICITY
	monbg ANIM_ATTACKER
	setalpha 12, 8
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 0, 8, RGB_BLACK
	waitforvisualfinish
	createsprite gVoltTackleOrbSlideSpriteTemplate, ANIM_ATTACKER, 1
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	delay 8
	createvisualtask AnimTask_VoltTackleBolt, 5, 0
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createvisualtask AnimTask_VoltTackleBolt, 5, 1
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_VoltTackleBolt, 5, 2
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createvisualtask AnimTask_VoltTackleBolt, 5, 3
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_VoltTackleBolt, 5, 4
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_ATTACKER
	delay 8
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 10, 0, 18, 1
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 1, 16, 16
	delay 2
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 1, -16, -16
	delay 8
	createvisualtask AnimTask_VoltTackleAttackerReappear, 5
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 3, 0, 9, 1
	playsewithpan SE_M_THUNDERBOLT2, SOUND_PAN_ATTACKER
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 16
	delay 2
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, -16, -16
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 8, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_WATER_SPORT:
	loadspritegfx ANIM_TAG_GLOWY_BLUE_ORB
	createvisualtask AnimTask_WaterSport, 5
	delay 8
	playsewithpan SE_M_SURF, SOUND_PAN_ATTACKER
	delay 44
	playsewithpan SE_M_SURF, SOUND_PAN_ATTACKER
	delay 44
	playsewithpan SE_M_SURF, SOUND_PAN_ATTACKER
	delay 44
	panse SE_M_SURF, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	end

Move_CALM_MIND:
	loadspritegfx ANIM_TAG_THIN_RING
	monbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_BlendBattleAnimPalExclude, 5, ANIM_ATTACKER, 0, 0, 16, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_SetAllNonAttackersInvisiblity, 5, TRUE
	waitforvisualfinish
	createsprite gThinRingShrinkingSpriteTemplate, ANIM_ATTACKER, 40, 0, 0, 0, 0
	playsewithpan SE_M_SUPERSONIC, SOUND_PAN_ATTACKER
	delay 14
	createsprite gThinRingShrinkingSpriteTemplate, ANIM_ATTACKER, 40, 0, 0, 0, 0
	playsewithpan SE_M_SUPERSONIC, SOUND_PAN_ATTACKER
	delay 14
	createsprite gThinRingShrinkingSpriteTemplate, ANIM_ATTACKER, 40, 0, 0, 0, 0
	playsewithpan SE_M_SUPERSONIC, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createvisualtask AnimTask_SetAllNonAttackersInvisiblity, 5, FALSE
	visible ANIM_ATTACKER  @ Redundant
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPalExclude, 5, ANIM_ATTACKER, 0, 16, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	end

Move_LEAF_BLADE_DUCK:
Move_LEAF_BLADE:
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_CROSS_IMPACT
	createvisualtask AnimTask_LeafBlade, 5
	delay 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	playsewithpan SE_M_CUT, SOUND_PAN_TARGET
	delay 50
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	playsewithpan SE_M_CUT, SOUND_PAN_TARGET
	delay 50
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	playsewithpan SE_M_CUT, SOUND_PAN_TARGET
	waitforvisualfinish
	monbg ANIM_TARGET
	setalpha 12, 8
	delay 12
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 8, 0, 18, 1
	createsprite gCrossImpactSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 36
	playsewithpan SE_M_LEER, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_DRAGON_DANCE:
	loadspritegfx ANIM_TAG_HOLLOW_ORB
	monbg ANIM_ATTACKER
	splitbgprio ANIM_ATTACKER
	delay 1
	createvisualtask AnimTask_DragonDanceWaver, 5
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	delay 8
	createvisualtask AnimTask_BlendPalInAndOutByTag, 5, ANIM_TAG_HOLLOW_ORB, RGB(0, 0, 19), 14, 0, 3
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 0
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 43
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 85
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 128
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 170
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 213
	delay 30
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	delay 30
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	delay 1
	end

Move_SHOCK_WAVE:
	loadspritegfx ANIM_TAG_ELECTRIC_ORBS
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_LIGHTNING
	monbg ANIM_ATTACKER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 4, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_ElectricChargingParticles, 2, ANIM_ATTACKER, 20, 0, 2
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 12
	createsprite gGrowingShockWaveOrbSpriteTemplate, ANIM_ATTACKER, 2
	delay 30
	createvisualtask AnimTask_ShockWaveProgressingBolt, 5
	delay 12
	waitforvisualfinish
	createvisualtask AnimTask_ShockWaveLightning, 5
	playsewithpan SE_M_TRI_ATTACK2, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 6, 18, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 5, F_PAL_BG, 3, 16, 0, RGB_WHITE
	createvisualtask AnimTask_BlendBattleAnimPal, 5, F_PAL_TARGET, 0, 16, 16, RGB_BLACK
	delay 4
	createvisualtask AnimTask_BlendBattleAnimPal, 5, F_PAL_TARGET, 0, 0, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	end

Move_HARDEN:
	loadspritegfx ANIM_TAG_BREATH
	createvisualtask AnimTask_GrowAndShrink, 2
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gBreathPuffSpriteTemplate, ANIM_ATTACKER, 2
	loopsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER, 4, 2
	waitforvisualfinish
	end

Move_BELLY_DRUM:
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	loadspritegfx ANIM_TAG_PURPLE_HAND_OUTLINE
	createvisualtask AnimTask_MusicNotesRainbowBlend, 2
	waitforvisualfinish
	call BellyDrumRight
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0, 0
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_ATTACKER
	delay 15
	call BellyDrumLeft
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 1, 0
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_ATTACKER
	delay 15
	call BellyDrumRight
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 3, 3, 128
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_ATTACKER
	delay 7
	call BellyDrumLeft
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 128
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_ATTACKER
	delay 7
	call BellyDrumRight
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 1, 0
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_ATTACKER
	delay 7
	call BellyDrumLeft
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 3, 0
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createvisualtask AnimTask_MusicNotesClearRainbowBlend, 2
	waitforvisualfinish
	end

BellyDrumLeft:
	createsprite gBellyDrumHandSpriteTemplate, ANIM_ATTACKER, 3, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_ATTACKER, 0, 8, 2, 1
	return

BellyDrumRight:
	createsprite gBellyDrumHandSpriteTemplate, ANIM_ATTACKER, 3, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_ATTACKER, 0, 8, 2, 1
	return

Move_MIND_READER:
	loadspritegfx ANIM_TAG_TEAL_ALERT
	loadspritegfx ANIM_TAG_OPENING_EYE
	loadspritegfx ANIM_TAG_ROUND_WHITE_HALO
	monbg 4
	playsewithpan SE_M_CONFUSE_RAY, SOUND_PAN_TARGET
	createsprite gOpeningEyeSpriteTemplate, ANIM_ATTACKER, 5, 0, 0, 1, 0
	createsprite gWhiteHaloSpriteTemplate, ANIM_ATTACKER, 5
	delay 40
	playsewithpan SE_M_LEER, SOUND_PAN_TARGET
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_BG, 1, 2, 0, 10, RGB_BLACK
	call MindReaderEyeSpikeEffect
	waitforvisualfinish
	clearmonbg 4
	end

MindReaderEyeSpikeEffect:
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 70, 0, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 40, 40, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 10, -60, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, -50, -40, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, -40, 40, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 50, -50, 6
	delay 2
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 50, -30, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 60, 10, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 0, 60, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 0, -40, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, -60, 20, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, -60, -30, 6
	delay 2
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, -50, 50, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, -60, 20, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, -40, -40, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 20, -60, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 50, -50, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 35, 40, 6
	delay 2
	return

Move_ICE_PUNCH:
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 0, 7, RGB_BLACK
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 9, RGB(12, 26, 31)
	delay 20
	playsewithpan SE_M_STRING_SHOT, SOUND_PAN_TARGET
	createsprite gIceCrystalSpiralInwardSmall, ANIM_ATTACKER, 2, 0
	createsprite gIceCrystalSpiralInwardSmall, ANIM_ATTACKER, 2, 64
	createsprite gIceCrystalSpiralInwardSmall, ANIM_ATTACKER, 2, 128
	createsprite gIceCrystalSpiralInwardSmall, ANIM_ATTACKER, 2, 192
	delay 5
	createsprite gIceCrystalSpiralInwardLarge, ANIM_ATTACKER, 2, 32
	createsprite gIceCrystalSpiralInwardLarge, ANIM_ATTACKER, 2, 96
	createsprite gIceCrystalSpiralInwardLarge, ANIM_ATTACKER, 2, 160
	createsprite gIceCrystalSpiralInwardLarge, ANIM_ATTACKER, 2, 224
	delay 17
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 4, 0, -10, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -10, ANIM_TARGET, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 3, 1
	waitforvisualfinish
	delay 15
	call IceCrystalEffectShort
	delay 5
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 9, 0, RGB(12, 26, 31)
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 7, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_VOLCANIC_HEALING:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	playsewithpan SE_M_SACRED_FIRE2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 2, 47, 1
	call FireSpinEffect
	call FireSpinEffect
	call FireSpinEffect
	waitforvisualfinish
	end
Move_REST:
	playsewithpan SE_M_SNORE, SOUND_PAN_ATTACKER
	loadspritegfx ANIM_TAG_LETTER_Z
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	delay 20
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	delay 20
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	waitforvisualfinish
	end

Move_CONFUSEON:
Move_CONFUSION:
	monbg ANIM_DEF_PARTNER
	call SetPsychicBackground
	setalpha 8, 8
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 10, 1
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 0, 2, 0, 8, RGB_WHITE
	waitforvisualfinish
	playsewithpan SE_M_SUPERSONIC, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, ANIM_TARGET, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 1
	call UnsetPsychicBackground
	end



Move_PSY_BEAM:
	monbg ANIM_DEF_PARTNER
	call SetPsychicBackground
	setalpha 8, 8
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 10, 1
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 0, 2, 0, 8, RGB(31, 23, 0)
	waitforvisualfinish
	loopsewithpan SE_M_SUPERSONIC, SOUND_PAN_TARGET, 10, 3
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -6, -6, 15, ANIM_TARGET, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 1
	call UnsetPsychicBackground
	end

Move_FUTURE_SIGHT:
	goto FutureSight

FutureSightContinue:
	waitforvisualfinish
	delay 1
	call UnsetPsychicBackground
	end

FutureSight:
	monbg ANIM_ATK_PARTNER
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	call SetPsychicBackground
	setalpha 8, 8
	playsewithpan SE_M_SUPERSONIC, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 0, 2, 0, 8, RGB_WHITE
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, ANIM_ATTACKER, 1
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	goto FutureSightContinue

UnusedFutureSightHit:
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	call SetPsychicBackground
	setalpha 8, 8
	playsewithpan SE_M_SUPERSONIC, SOUND_PAN_TARGET
	waitplaysewithpan SE_M_SUPERSONIC, SOUND_PAN_TARGET, 8
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 4, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 15, ANIM_TARGET, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 4, 0, 24, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto FutureSightContinue

Move_THUNDER:
	loadspritegfx ANIM_TAG_LIGHTNING
	fadetobg BG_THUNDER
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -256, 0, 1, -1
	waitbgfadein
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 16, RGB_BLACK
	delay 16
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	playsewithpan SE_M_THUNDER_WAVE, SOUND_PAN_TARGET
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 16, -36
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 16, -20
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 16, 12
	delay 20
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 6, -16, -32
	playsewithpan SE_M_THUNDER_WAVE, SOUND_PAN_TARGET
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 6, -16, -16
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 6, -16, 16
	playsewithpan SE_M_THUNDER_WAVE, SOUND_PAN_TARGET
	delay 5
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 24, -32
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 24, -16
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 24, 16
	delay 30
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 5
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, -32
	playsewithpan SE_M_TRI_ATTACK2, SOUND_PAN_TARGET
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, -16
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, 16
	delay 10
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	createvisualtask AnimTask_ShakeTargetInPattern, 2, 30, 3, TRUE, 0
	delay 2
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_TARGET, 2, F_PAL_BG, 2, 16, 0, RGB_BLACK
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, 0xFFFF
	waitbgfadein
	end

Move_THUNDER_PUNCH:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_LIGHTNING
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 16, RGB_BLACK
	waitforvisualfinish
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	delay 1
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, -48
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_ATTACKER, 2, 0, -16
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_ATTACKER, 2, 0, 16
	delay 1
	playsewithpan SE_M_TRI_ATTACK2, SOUND_PAN_TARGET
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 15, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 16, 0, RGB_BLACK
	delay 20
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_SACRED_FIRE:
	loadspritegfx ANIM_TAG_FIRE
	loadspritegfx ANIM_TAG_FIRE_PLUME
	loopsewithpan SE_M_SACRED_FIRE, SOUND_PAN_ATTACKER, 7, 5
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, -32, 0, 50, 5, -2, 0
	delay 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 66, -20, -10, 50, 5, -1, -1
	delay 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 66, 0, -16, 50, 5, 0, -1
	delay 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 66, 20, -10, 50, 5, 1, -1
	delay 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 50, 5, 2, 0
	delay 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, 20, 10, 50, 5, 1, 1
	delay 1
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 50, 5, 0, 1
	delay 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, -20, 10, 50, 5, -1, 1
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	waitforvisualfinish
	playsewithpan SE_M_SACRED_FIRE2, SOUND_PAN_TARGET
	createsprite gLargeFlameSpriteTemplate, ANIM_TARGET, 2, -16, 0, 70, 16, 0, 1
	delay 10
	playsewithpan SE_M_SACRED_FIRE2, SOUND_PAN_TARGET
	createsprite gLargeFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 70, 16, 0, 1
	delay 10
	playsewithpan SE_M_SACRED_FIRE2, SOUND_PAN_TARGET
	createsprite gLargeFlameSpriteTemplate, ANIM_TARGET, 2, 16, 0, 80, 16, 0, 1
	delay 1
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	waitforvisualfinish
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, -1, 0
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 0, 1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, -1, -1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 2, 1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 1, -1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, -1, 1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 1, -2
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 3, 1
	waitforvisualfinish
	end

Move_SCRATCH:
	loadspritegfx ANIM_TAG_SCRATCH
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	createsprite gScratchSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	waitforvisualfinish
	end

Move_DRAGON_BREATH:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	loopsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER, 7, 7
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 1, 0, 9, RGB_RED
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 21, 1
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 1, 9, 0, RGB_RED
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_ROAR:
	loadspritegfx ANIM_TAG_NOISE_LINE
	monbg ANIM_ATTACKER
	splitbgprio ANIM_ATTACKER
	setalpha 8, 8
	createvisualtask SoundTask_PlayDoubleCry, 2, ANIM_ATTACKER, DOUBLE_CRY_ROAR
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 10, ANIM_ATTACKER, 1
	call RoarEffect
	delay 20
	createvisualtask AnimTask_SlideOffScreen, 5, ANIM_TARGET, 2
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	waitforvisualfinish
	createvisualtask SoundTask_WaitForCry, 5
	waitforvisualfinish
	end

RoarEffect:
	createsprite gRoarNoiseLineSpriteTemplate, ANIM_ATTACKER, 2, 24, -8, 0
	createsprite gRoarNoiseLineSpriteTemplate, ANIM_ATTACKER, 2, 24, 0, 2
	createsprite gRoarNoiseLineSpriteTemplate, ANIM_ATTACKER, 2, 24, 8, 1
	delay 15
	createsprite gRoarNoiseLineSpriteTemplate, ANIM_ATTACKER, 2, 24, -8, 0
	createsprite gRoarNoiseLineSpriteTemplate, ANIM_ATTACKER, 2, 24, 0, 2
	createsprite gRoarNoiseLineSpriteTemplate, ANIM_ATTACKER, 2, 24, 8, 1
	return

Move_GROWL:
	loadspritegfx ANIM_TAG_NOISE_LINE
	createvisualtask SoundTask_PlayDoubleCry, 2, ANIM_ATTACKER, DOUBLE_CRY_GROWL
	call RoarEffect
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 9, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 1, 0, 9, 1
	waitforvisualfinish
	createvisualtask SoundTask_WaitForCry, 5
	waitforvisualfinish
	end

Move_SNORE:
	loadspritegfx ANIM_TAG_SNORE_Z
	monbg ANIM_ATK_PARTNER
	setalpha 8, 8
	call SnoreEffect
	delay 30
	call SnoreEffect
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

SnoreEffect:
	playsewithpan SE_M_SNORE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 7, ANIM_ATTACKER, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 7, 1
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 14, 0, 0
	createsprite gSnoreZSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -42, -38, 24, 0, 0
	createsprite gSnoreZSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0, -42, 24, 0, 0
	createsprite gSnoreZSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 42, -38, 24, 0, 0
	return

Move_LIGHT_SCREEN:
	loadspritegfx ANIM_TAG_SPARKLE_3
	loadspritegfx ANIM_TAG_GREEN_LIGHT_WALL
	setalpha 0, 16
	waitplaysewithpan SE_M_REFLECT, SOUND_PAN_ATTACKER, 15
	createsprite gLightScreenWallSpriteTemplate, ANIM_ATTACKER, 1, 40, 0, ANIM_TAG_GREEN_LIGHT_WALL
	delay 10
	call SpecialScreenSparkle
	waitforvisualfinish
	delay 1
	blendoff
	end

SpecialScreenSparkle:
	createsprite gSpecialScreenSparkleSpriteTemplate, ANIM_ATTACKER, 2, 23, 0, ANIM_ATTACKER, TRUE
	delay 6
	createsprite gSpecialScreenSparkleSpriteTemplate, ANIM_ATTACKER, 2, 31, -8, ANIM_ATTACKER, TRUE
	delay 5
	createsprite gSpecialScreenSparkleSpriteTemplate, ANIM_ATTACKER, 2, 30, 20, ANIM_ATTACKER, TRUE
	delay 7
	createsprite gSpecialScreenSparkleSpriteTemplate, ANIM_ATTACKER, 2, 10, -15, ANIM_ATTACKER, TRUE
	delay 6
	createsprite gSpecialScreenSparkleSpriteTemplate, ANIM_ATTACKER, 2, 20, 10, ANIM_ATTACKER, TRUE
	delay 6
	createsprite gSpecialScreenSparkleSpriteTemplate, ANIM_ATTACKER, 2, 10, 18, ANIM_ATTACKER, TRUE
	return

Move_MIRROR_COAT:
	loadspritegfx ANIM_TAG_SPARKLE_3
	loadspritegfx ANIM_TAG_RED_LIGHT_WALL
	setalpha 0, 16
	createsprite gMirrorCoatWallSpriteTemplate, ANIM_ATTACKER, 1, 40, 0, ANIM_TAG_RED_LIGHT_WALL
	delay 10
	playsewithpan SE_M_REFLECT, SOUND_PAN_ATTACKER
	call SpecialScreenSparkle
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_REFLECT:
	loadspritegfx ANIM_TAG_SPARKLE_4
	loadspritegfx ANIM_TAG_BLUE_LIGHT_WALL
	setalpha 0, 16
	waitplaysewithpan SE_M_REFLECT, SOUND_PAN_ATTACKER, 15
	createsprite gReflectWallSpriteTemplate, ANIM_ATTACKER, 1, 40, 0, ANIM_TAG_BLUE_LIGHT_WALL
	delay 20
	createsprite gReflectSparkleSpriteTemplate, ANIM_ATTACKER, 2, 30, 0, ANIM_ATTACKER, TRUE
	delay 7
	createsprite gReflectSparkleSpriteTemplate, ANIM_ATTACKER, 2, 19, -12, ANIM_ATTACKER, TRUE
	delay 7
	createsprite gReflectSparkleSpriteTemplate, ANIM_ATTACKER, 2, 10, 20, ANIM_ATTACKER, TRUE
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_BARRIER:
	loadspritegfx ANIM_TAG_GRAY_LIGHT_WALL
	setalpha 0, 16
	waitplaysewithpan SE_M_BARRIER, SOUND_PAN_ATTACKER, 15
	createsprite gBarrierWallSpriteTemplate, ANIM_ATTACKER, 3, 40, 0, ANIM_TAG_GRAY_LIGHT_WALL
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_BUBBLE:
	loadspritegfx ANIM_TAG_BUBBLE
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	monbg ANIM_TARGET
	setalpha 12, 8
	delay 1
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 15, -15, 10, 128, 100
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_BUBBLE2, SOUND_PAN_TARGET, 100
	delay 6
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 35, 37, 40, 128, 100
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_BUBBLE2, SOUND_PAN_TARGET, 100
	delay 6
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 10, -37, 30, 128, 100
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_BUBBLE2, SOUND_PAN_TARGET, 100
	delay 6
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 30, 10, 15, 128, 100
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_BUBBLE2, SOUND_PAN_TARGET, 100
	delay 6
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 20, 33, 20, 128, 100
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_BUBBLE2, SOUND_PAN_TARGET, 100
	delay 6
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 25, -30, 10, 128, 100
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_BUBBLE2, SOUND_PAN_TARGET, 100
	waitforvisualfinish
	call WaterBubblesEffectLong
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_SMOG:
	loadspritegfx ANIM_TAG_PURPLE_GAS_CLOUD
	monbg ANIM_DEF_PARTNER
	splitbgprio_all
	setalpha 12, 8
	loopsewithpan SE_M_MIST, SOUND_PAN_TARGET, 17, 10
	call SmogCloud
	call SmogCloud
	call SmogCloud
	call SmogCloud
	call SmogCloud
	call SmogCloud
	call SmogCloud
	delay 120
	loopsewithpan SE_M_TOXIC, SOUND_PAN_TARGET, 18, 2
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(26, 0, 26)
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 15, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

SmogCloud:
	createsprite gSmogCloudSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 48, 240, 1, 0
	delay 7
	return

Move_FAINT_ATTACK:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_ATTACKER
	fadetobg BG_DARK
	waitbgfadein
	delay 0
	playsewithpan SE_M_FAINT_ATTACK, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 18, 6, 1, 3
	createvisualtask AnimTask_AttackerFadeToInvisible, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	invisible ANIM_ATTACKER
	delay 1
	createvisualtask AnimTask_SetAttackerInvisibleWaitForSignal, 2
	monbg ANIM_TARGET
	setalpha 12, 8
	delay 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 9, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	delay 1
	setarg 7, 0x1000
	delay 32
	createvisualtask AnimTask_InitAttackerFadeFromInvisible, 2
	monbg ANIM_ATTACKER
	createvisualtask AnimTask_AttackerFadeFromInvisible, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	delay 1
	restorebg
	waitbgfadein
	end

Move_SAND_ATTACK:
	loadspritegfx ANIM_TAG_MUD_SAND
	monbg ANIM_ATK_PARTNER
	splitbgprio ANIM_ATTACKER
	setalpha 12, 8
	playsewithpan SE_M_SAND_ATTACK, SOUND_PAN_ATTACKER
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 0, 0, 3
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 2
	call SandAttackDirt
	call SandAttackDirt
	call SandAttackDirt
	call SandAttackDirt
	call SandAttackDirt
	call SandAttackDirt
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

SandAttackDirt:
	createsprite gSandAttackDirtSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, 0, 0
	createsprite gSandAttackDirtSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, 10, 10
	createsprite gSandAttackDirtSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, -10, -10
	createsprite gSandAttackDirtSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, 20, 5
	createsprite gSandAttackDirtSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, -20, -5
	delay 2
	return

Move_MUD_SLAP:
	loadspritegfx ANIM_TAG_MUD_SAND
	playsewithpan SE_M_SAND_ATTACK, SOUND_PAN_ATTACKER
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 0, 0, 3
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 2
	call MudSlapMud
	call MudSlapMud
	call MudSlapMud
	call MudSlapMud
	call MudSlapMud
	call MudSlapMud
	waitforvisualfinish
	end

MudSlapMud:
	createsprite gMudSlapMudSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, 0, 0
	createsprite gMudSlapMudSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, 10, 5
	createsprite gMudSlapMudSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, -10, -5
	createsprite gMudSlapMudSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, 20, 10
	createsprite gMudSlapMudSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, -20, -10
	delay 2
	return

Move_DRAGON_RAGE:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loadspritegfx ANIM_TAG_FIRE_PLUME
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 40, 1
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_TARGET, 2, 0, 15, 0, 0, 4
	waitforvisualfinish
	createsprite gDragonRageFireSpitSpriteTemplate, ANIM_TARGET, 2, 30, 15, 0, 10, 10
	waitforvisualfinish
	loopsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET, 11, 3
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 3, 25, 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 66, 1, 5, 0
	delay 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 66, 1, -10, -15
	delay 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 25
	delay 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 66, 1, 15, 5
	delay 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 66, 1, -25, 0
	delay 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 2, 1, 30, 30
	delay 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 2, 1, -27, 25
	delay 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 66, 1, 0, 8
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_TARGET, 66, 0, 0, 4
	waitforvisualfinish
	end

Move_RAIN_DANCE:
	loadspritegfx ANIM_TAG_RAIN_DROPS
	playsewithpan SE_M_RAIN_DANCE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG | F_PAL_BATTLERS_2, 2, 0, 4, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_CreateRaindrops, 2, 0, 3, 120
	createvisualtask AnimTask_CreateRaindrops, 2, 0, 3, 120
	delay 120
	delay 30
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG | F_PAL_BATTLERS_2, 2, 4, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_BUG_BITE:
Move_BITE:
	loadspritegfx ANIM_TAG_SHARP_TEETH
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_BITE, SOUND_PAN_TARGET
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 0, -32, 0, 0, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 4, 0, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 4, 7, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	delay 1
	end

Move_CRUNCH:
	loadspritegfx ANIM_TAG_SHARP_TEETH
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	fadetobg BG_DARK
	waitbgfadein
	setalpha 12, 8
	playsewithpan SE_M_BITE, SOUND_PAN_TARGET
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, -32, -32, 1, 819, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 32, 32, 5, -819, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 7, 5, 2
	waitforvisualfinish
	playsewithpan SE_M_BITE, SOUND_PAN_TARGET
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 32, -32, 7, -819, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, -32, 32, 3, 819, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 8, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 8, 4, 2
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	delay 1
	restorebg
	waitbgfadein
	end

Move_CLAMP:
	loadspritegfx ANIM_TAG_CLAMP
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_VICEGRIP, SOUND_PAN_TARGET
	createsprite gClampJawSpriteTemplate, ANIM_ATTACKER, 2, -32, 0, 2, 819, 0, 10
	createsprite gClampJawSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 6, -819, 0, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 5, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	waitforvisualfinish
	end

Move_ICEBEAM:
	loadspritegfx ANIM_TAG_RAINBOW_RINGS
	fadetobg BG_AURORA
	waitbgfadein
	playsewithpan SE_M_BUBBLE_BEAM, SOUND_PAN_ATTACKER
	setarg 7, 0
	createvisualtask AnimTask_RotateAuroraRingColors, 10, 130
	call AuroraBeamCreateRings
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 1, 0, 17, 1
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	setarg 7, 0xFFFF
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_BUBBLE_BEAM2, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, 3, 6, 0, 10
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 2, 0, 40, 1
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

IceBeamCreateCrystals:
	createsprite gIceBeamOuterCrystalSpriteTemplate, ANIM_ATTACKER, 2, 20, 12, 0, 12, 20
	createsprite gIceBeamOuterCrystalSpriteTemplate, ANIM_ATTACKER, 2, 20, -12, 0, -12, 20
	createsprite gIceBeamInnerCrystalSpriteTemplate, ANIM_ATTACKER, 2, 20, 0, 0, 0, 11
	delay 1
	return

Move_WITHDRAW:
	playsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_Withdraw, 5
	waitforvisualfinish
	end

Move_AURORA_BEAM:
	loadspritegfx ANIM_TAG_RAINBOW_RINGS
	fadetobg BG_AURORA
	waitbgfadein
	playsewithpan SE_M_BUBBLE_BEAM, SOUND_PAN_ATTACKER
	setarg 7, 0
	createvisualtask AnimTask_RotateAuroraRingColors, 10, 130
	call AuroraBeamCreateRings
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 1, 0, 17, 1
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	setarg 7, 0xFFFF
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_BUBBLE_BEAM2, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, 3, 6, 0, 10
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 2, 0, 40, 1
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

AuroraBeamCreateRings:
	createsprite gAuroraBeamRingSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 0, 17
	delay 1
	createsprite gAuroraBeamRingSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 0, 17
	delay 1
	createsprite gAuroraBeamRingSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 0, 17
	delay 1
	createsprite gAuroraBeamRingSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 0, 17
	delay 1
	return

Move_SOLAR_BEAM:
	loadspritegfx ANIM_TAG_ORBS
	choosetwoturnanim SolarBeamSetUp, SolarBeamUnleash

SolarBeamEnd:
	waitforvisualfinish
	end

SolarBeamSetUp:
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 1, 4, 0, 11, RGB(31, 31, 11)
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_ATTACKER
	call SolarBeamAbsorbEffect
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	goto SolarBeamEnd

SolarBeamAbsorbEffect:
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 40, 40, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -40, -40, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, 40, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, -40, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 40, -20, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 40, 20, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -40, -20, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -40, 20, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -20, 30, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 20, -30, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -20, -30, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 20, 30, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -40, 0, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 40, 0, 16
	delay 2
	return

SolarBeamUnleash:
	call SetSolarBeamBg
	panse SE_M_SOLAR_BEAM, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	createvisualtask AnimTask_CreateSmallSolarBeamOrbs, 5
	createsprite gSolarBeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 0
	delay 4
	createsprite gSolarBeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 1
	delay 4
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 1, 0, 10, RGB(25, 31, 0)
	createsprite gSolarBeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 2
	delay 4
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 2, 0, 65, 1
	createsprite gSolarBeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 3
	delay 4
	createsprite gSolarBeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 4
	delay 4
	createsprite gSolarBeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 5
	delay 4
	createsprite gSolarBeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 6
	delay 4
	call SolarBeamUnleash1
	call SolarBeamUnleash1
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 1, 10, 0, RGB(25, 31, 0)
	call UnsetSolarBeamBg
	goto SolarBeamEnd

SolarBeamUnleash1:
	createsprite gSolarBeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 0
	delay 4
	createsprite gSolarBeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 1
	delay 4
	createsprite gSolarBeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 2
	delay 4
	createsprite gSolarBeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 3
	delay 4
	createsprite gSolarBeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 4
	delay 4
	createsprite gSolarBeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 5
	delay 4
	createsprite gSolarBeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 6
	delay 4
	return

Move_GLACIATE:
Move_ICE:
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_GetAttackerSide, 2
	jumprettrue BlizzardAgainstPlayer
	fadetobg BG_HIGHSPEED_OPPONENT
BlizzardContinue:
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -2304, 0, 1, -1
	waitbgfadein
	waitforvisualfinish
	panse SE_M_BLIZZARD, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	call BlizzardIceCrystals
	call BlizzardIceCrystals
	playsewithpan SE_M_BLIZZARD2, SOUND_PAN_TARGET
	waitforvisualfinish
	call IceCrystalEffectLong
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	delay 20
	restorebg
	waitbgfadeout
	setarg 7, 0xFFFF
	waitbgfadein
	end

BlizzardIceCrystals:
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -10, 0, -10, 72, 1
	createsprite gBlizzardIceCrystalSpriteTemplate, ANIM_ATTACKER, 40, 0, 0, 0, 0, 80, 0, 0, 1
	delay 3
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -15, 0, -15, 72, 1
	createsprite gBlizzardIceCrystalSpriteTemplate, ANIM_ATTACKER, 40, 0, -10, 0, -10, 80, 0, 0, 1
	delay 3
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -5, 0, -5, 72, 1
	createsprite gBlizzardIceCrystalSpriteTemplate, ANIM_ATTACKER, 40, 0, 10, 0, 10, 80, 0, 0, 1
	delay 3
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -10, 0, -10, 72, 1
	createsprite gBlizzardIceCrystalSpriteTemplate, ANIM_ATTACKER, 40, 0, -20, 0, -20, 80, 0, 0, 1
	delay 3
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -20, 0, -20, 72, 1
	createsprite gBlizzardIceCrystalSpriteTemplate, ANIM_ATTACKER, 40, 0, 15, 0, 15, 80, 0, 0, 1
	delay 3
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -15, 0, -15, 72, 1
	createsprite gBlizzardIceCrystalSpriteTemplate, ANIM_ATTACKER, 40, 0, -20, 0, -20, 80, 0, 0, 1
	delay 3
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -25, 0, -25, 72, 1
	createsprite gBlizzardIceCrystalSpriteTemplate, ANIM_ATTACKER, 40, 0, 20, 0, 20, 80, 0, 0, 1
	delay 3
	return

BlizzardAgainstPlayer:
	fadetobg BG_HIGHSPEED_PLAYER
	goto BlizzardContinue

Move_FREEZE:
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	monbg ANIM_DEF_PARTNER
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 1, 0, 3, RGB_BLACK
	waitforvisualfinish
	panse SE_M_GUST, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	call PowderSnowSnowballs
	call PowderSnowSnowballs
	playsewithpan SE_M_GUST2, SOUND_PAN_TARGET
	waitforvisualfinish
	waitsound
	call IceCrystalEffectLong
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	delay 20
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 1, 3, 0, RGB_BLACK
	end

PowderSnowSnowballs:
	createsprite gPowderSnowSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, 0, 0, 0, 56, 4, 4, 1
	delay 3
	createsprite gPowderSnowSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -10, 0, -10, 56, 4, 4, 1
	delay 3
	createsprite gPowderSnowSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, 10, 0, 10, 56, -4, 3, 1
	delay 3
	createsprite gPowderSnowSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -20, 0, -20, 56, -4, 5, 1
	delay 3
	createsprite gPowderSnowSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, 15, 0, 15, 56, 4, 4, 1
	delay 3
	createsprite gPowderSnowSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -20, 0, -20, 56, 4, 4, 1
	delay 3
	createsprite gPowderSnowSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, 20, 0, 20, 56, 4, 4, 1
	delay 3
	return

Move_HYDRO_PUMP:
	loadspritegfx ANIM_TAG_WATER_ORB
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 40, 1
	delay 6
	panse SE_M_HYDRO_PUMP, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpBeams
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 37, 1
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	delay 1
	delay 1
	call HydroPumpHitSplats
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

HydroPumpBeams:
	createsprite gHydroPumpOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, 16
	createsprite gHydroPumpOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, -16
	delay 1
	createsprite gHydroPumpOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, 16
	createsprite gHydroPumpOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, -16
	delay 1
	return

HydroPumpHitSplats	:
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 4, 0, 15, ANIM_TARGET, 1
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 4, 0, -15, ANIM_TARGET, 1
	return

Move_SIGNAL_BEAM:
	loadspritegfx ANIM_TAG_GLOWY_RED_ORB
	loadspritegfx ANIM_TAG_GLOWY_GREEN_ORB
	loadspritegfx ANIM_TAG_DUCK
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 25, 1
	delay 6
	panse SE_M_BUBBLE_BEAM, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +1, 0
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 25, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_TARGET, 8, 5, RGB_RED, 8, RGB(1, 30, 0), 8
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	waitforvisualfinish
	end

SignalBeamOrbs:
	createsprite gSignalBeamRedOrbSpriteTemplate, ANIM_TARGET, 3, 10, 10, 0, 16
	createsprite gSignalBeamGreenOrbSpriteTemplate, ANIM_TARGET, 3, 10, 10, 0, -16
	delay 1
	return

Move_ABSORB:
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio_foes ANIM_TARGET
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 0, 4, RGB(13, 31, 12)
	waitforvisualfinish
	playsewithpan SE_M_ABSORB, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 5, 1
	waitforvisualfinish
	delay 3
	call AbsorbEffect
	waitforvisualfinish
	delay 15
	call HealingEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 4, 0, RGB(13, 31, 12)
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

AbsorbEffect:
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -20, 35
	delay 4
	return

Move_MEGA_DRAIN:
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio_foes ANIM_TARGET
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 0, 8, RGB(13, 31, 12)
	waitforvisualfinish
	playsewithpan SE_M_ABSORB, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 1
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 5, 1
	waitforvisualfinish
	delay 3
	call MegaDrainAbsorbEffect
	waitforvisualfinish
	delay 15
	call HealingEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 8, 0, RGB(13, 31, 12)
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

MegaDrainAbsorbEffect:
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -20, 35
	delay 4
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	delay 4
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	delay 4
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -20, 35
	delay 4
	return

Move_GIGA_DRAIN:
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio_foes ANIM_TARGET
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 0, 12, RGB(13, 31, 12)
	waitforvisualfinish
	playsewithpan SE_M_ABSORB, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 0
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 5, 1
	waitforvisualfinish
	delay 3
	call GigaDrainAbsorbEffect
	waitforvisualfinish
	delay 15
	call HealingEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 12, 0, RGB(13, 31, 12)
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

GigaDrainAbsorbEffect:
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -40, 35
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 28, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 40, 39
	delay 4
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -32, 26
	delay 4
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -40, 26
	delay 4
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 36, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -20, 35
	delay 4
	return

Move_LEECH_LIFE:
	loadspritegfx ANIM_TAG_NEEDLE
	loadspritegfx ANIM_TAG_ORBS
	delay 1
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio_foes ANIM_TARGET
	setalpha 12, 8
	delay 1
	createsprite gLeechLifeNeedleSpriteTemplate, ANIM_ATTACKER, 2, -20, 15, 12
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	playsewithpan SE_M_ABSORB, SOUND_PAN_TARGET
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 5, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 0, 7, RGB_BLACK
	waitforvisualfinish
	call AbsorbEffect
	waitforvisualfinish
	delay 15
	call HealingEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 7, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_SYNTHESIS:
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_SPARKLE_2
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 2, 2, 0, 16, RGB(27, 31, 18)
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_ATTACKER
	call GrantingStarsEffect
	waitforvisualfinish
	call HealingEffect
	waitforvisualfinish
	end

Move_TOXIC:
	loadspritegfx ANIM_TAG_TOXIC_BUBBLE
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	call ToxicBubbles
	call ToxicBubbles
	waitforvisualfinish
	delay 15
	call PoisonBubblesEffect
	waitforvisualfinish
	end

ToxicBubbles:
	createsprite gToxicBubbleSpriteTemplate, ANIM_TARGET, 2, -24, 16, 1, 1
	playsewithpan SE_M_TOXIC, SOUND_PAN_TARGET
	delay 15
	createsprite gToxicBubbleSpriteTemplate, ANIM_TARGET, 2, 8, 16, 1, 1
	playsewithpan SE_M_TOXIC, SOUND_PAN_TARGET
	delay 15
	createsprite gToxicBubbleSpriteTemplate, ANIM_TARGET, 2, -8, 16, 1, 1
	playsewithpan SE_M_TOXIC, SOUND_PAN_TARGET
	delay 15
	createsprite gToxicBubbleSpriteTemplate, ANIM_TARGET, 2, 24, 16, 1, 1
	playsewithpan SE_M_TOXIC, SOUND_PAN_TARGET
	delay 15
	return

Move_SLUDGE:
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	createsprite gSludgeProjectileSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 0
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 5, 1
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 1, 2, 0, 12, RGB(30, 0, 31)
	call PoisonBubblesEffect
	waitforvisualfinish
	end

Move_SLUDGE_BOMB:
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 3, 0, 15, 1
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 1, 2, 0, 12, RGB(30, 0, 31)
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, 42, 27, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, -27, 44, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, 39, -28, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, -42, -42, 20
	playsewithpan SE_M_DIG, SOUND_PAN_TARGET
	delay 5
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, 0, 40, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, -8, -44, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, -46, -28, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, 46, 9, 20
	playsewithpan SE_M_DIG, SOUND_PAN_TARGET
	delay 5
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, 42, 0, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, -43, -12, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, 16, -46, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, -16, 44, 20
	playsewithpan SE_M_DIG, SOUND_PAN_TARGET
	delay 0
	waitsound
	waitforvisualfinish
	call PoisonBubblesEffect
	waitforvisualfinish
	end

SludgeBombProjectile:
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	createsprite gSludgeProjectileSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 0
	delay 3
	return

Move_ACID:
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	monbg ANIM_DEF_PARTNER
	createsprite gAcidPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 1, 0, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	delay 5
	createsprite gAcidPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 1, 24, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	delay 5
	createsprite gAcidPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 1, -24, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	delay 15
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 2, 0, 10, 1
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_DEF_PARTNER, 2, 0, 10, 1
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_DEF_SIDE, 2, 2, 0, 12, RGB(30, 0, 31)
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 15, 55
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 15, 55
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 15, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 10, 45
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 15, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_BONEMERANG:
	loadspritegfx ANIM_TAG_BONE
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_BONEMERANG, SOUND_PAN_ATTACKER
	createsprite gBonemerangSpriteTemplate, ANIM_ATTACKER, 2
	delay 20
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 5, 0, 5, 1
	delay 17
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_ATTACKER
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, -4
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_BONE_CLUB:
	loadspritegfx ANIM_TAG_BONE
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_BONEMERANG, SOUND_PAN_TARGET
	createsprite gSpinningBoneSpriteTemplate, ANIM_ATTACKER, 2, -42, -25, 0, 0, 15
	delay 12
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 5, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_ATTACKER | F_PAL_TARGET, 5, 1, RGB_BLACK, 10, RGB_BLACK, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_BONE_RUSH:
	loadspritegfx ANIM_TAG_BONE
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_BONEMERANG, SOUND_PAN_TARGET
	createsprite gSpinningBoneSpriteTemplate, ANIM_ATTACKER, 2, -42, -25, 0, 0, 15
	delay 12
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 3, 5, 1
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_SPIKES:
	loadspritegfx ANIM_TAG_SPIKES
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET, 28
	createsprite gSpikesSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 24, 30
	delay 10
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET, 28
	createsprite gSpikesSpriteTemplate, ANIM_TARGET, 2, 20, 0, -24, 24, 30
	delay 10
	waitplaysewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET, 28
	createsprite gSpikesSpriteTemplate, ANIM_TARGET, 2, 20, 0, 24, 24, 30
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_FURY_ATTACK5:
Move_MEGAHORN:
	loadspritegfx ANIM_TAG_HORN_HIT_2
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	jumpifcontest MegahornInContest
	fadetobg BG_DRILL
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -2304, 768, 1, -1
MegahornContinue:
	waitbgfadein
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 2, 0, 15, 1
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 6
	delay 3
	createsprite gMegahornHornSpriteTemplate, ANIM_ATTACKER, 3, -42, 25, 0, 0, 6
	delay 4
	playsewithpan SE_M_VICEGRIP, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 0
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -16, 4, 1, 4
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, -4, 1, 12, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_ATTACKER | F_PAL_TARGET, 5, 1, RGB_WHITE, 10, RGB_BLACK, 0
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 11
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7
	waitforvisualfinish
	waitforvisualfinish  @ Redundant
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	restorebg
	waitbgfadeout
	setarg 7, 0xFFFF
	waitbgfadein
	end

MegahornInContest:
	fadetobg BG_DRILL_CONTESTS
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, 2304, 768, 0, -1
	goto MegahornContinue

Move_GUST:
	loadspritegfx ANIM_TAG_GUST
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_GUST, SOUND_PAN_TARGET
	createsprite gEllipticalGustSpriteTemplate, ANIM_ATTACKER, 2, 0, -16
	createvisualtask AnimTask_AnimateGustTornadoPalette, 5, 1, 70
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 1, 0, 7, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	playsewithpan SE_M_GUST2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_WING_ATTACK:
	loadspritegfx ANIM_TAG_GUST
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	loopsewithpan SE_M_WING_ATTACK, SOUND_PAN_ATTACKER, 20, 2
	createvisualtask AnimTask_TranslateMonElliptical, 2, 0, 12, 4, 1, 4
	createvisualtask AnimTask_AnimateGustTornadoPalette, 5, 1, 70
	createsprite gGustToTargetSpriteTemplate, ANIM_ATTACKER, 2, -25, 0, 0, 0, 20
	createsprite gGustToTargetSpriteTemplate, ANIM_ATTACKER, 2, 25, 0, 0, 0, 20
	delay 24
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 9
	delay 17
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 16, 0, ANIM_TARGET, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -16, 0, ANIM_TARGET, 1
	loopsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET, 5, 2
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 11
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_FURY_ATTACK_2:
Move_FURY_ATTACK_3:
Move_FURY_ATTACK1:
Move_FURY_ATTACK2:
Move_FURY_ATTACK3:
Move_PLUCK:
Move_PECK:
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 3, -768, ANIM_TARGET, 2
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, -12, 0, ANIM_TARGET, 3
	waitforvisualfinish
	end

Move_AEROBLAST:
	loadspritegfx ANIM_TAG_AIR_WAVE_2
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	call SetSkyBg
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	call AeroblastBeam
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 5, 0, 50, 1
	call AeroblastBeam
	call AeroblastBeam
	call AeroblastBeam
	call AeroblastBeam
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 0
	call UnsetSkyBg
	end

AeroblastBeam:
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 14, -12, 0, -12, 15, 0, 0
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 26, 8, 12, 8, 15, 0, 0
	delay 3
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 14, -12, 0, -12, 15, 1, 0
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 26, 8, 12, 8, 15, 1, 0
	delay 3
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 14, -12, 0, -12, 15, 2, 0
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 26, 8, 12, 8, 15, 2, 0
	delay 3
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 14, -12, 0, -12, 15, 3, 0
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 26, 8, 12, 8, 15, 3, 0
	delay 3
	return

Move_WATER_GUN_MISSINGNO:
Move_WATER_GUN_2:
Move_EMBER:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createsprite gWaterGunProjectileSpriteTemplate, ANIM_ATTACKER, 2, 20, 0, 0, 0, 40, -25
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 1, 0, 8, 1
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, ANIM_TARGET, 2
	createsprite gWaterGunDropletSpriteTemplate, ANIM_ATTACKER, 2, 0, -15, 0, 15, 55
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET
	delay 10
	createsprite gWaterGunDropletSpriteTemplate, ANIM_ATTACKER, 2, 15, -20, 0, 15, 50
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET
	delay 10
	createsprite gWaterGunDropletSpriteTemplate, ANIM_ATTACKER, 2, -15, -10, 0, 10, 45
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_CRABHAMMER:
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, ANIM_TARGET, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB(13, 21, 31), 10, RGB_BLACK, 0
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -24, 0, 0, 4
	waitforvisualfinish
	delay 8
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 4
	waitforvisualfinish
	loopsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET, 20, 3
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 4, 8, 1
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 20, -20, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -15, 15, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -10, -20, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 16, -8, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 5, 8, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -16, 0, 20, ANIM_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_SURF:
	createvisualtask AnimTask_CreateSurfWave, 2, FALSE
	delay 24
	panse SE_M_SURF, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	waitforvisualfinish
	end

Move_FLAMETHROWER_MEWTWO:
Move_SEARING_SHOT:
Move_FLAMETHROWER:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 46, 1
	delay 6
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	panse SE_M_FLAMETHROWER, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 43, 1
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

FlamethrowerCreateFlames:
	createsprite gFlamethrowerFlameSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, 16
	delay 2
	createsprite gFlamethrowerFlameSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, 16
	delay 2
	return

@ Also used by Sandstorm weather
Move_SANDSTORM:
	loadspritegfx ANIM_TAG_FLYING_DIRT
	panse SE_NOTE_G, SOUND_PAN_ATTACKER, SOUND_PAN_ATTACKER, +2, 0
	createvisualtask AnimTask_LoadSandstormBackground, 5, FALSE
	delay 16
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 10, 2304, 96, 0
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 90, 2048, 96, 0
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 50, 2560, 96, 0
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 20, 2304, 96, 0
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 70, 1984, 96, 0
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 0, 2816, 96, 0
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 60, 2560, 96, 0
	end

Move_WHIRLPOOL:
	loadspritegfx ANIM_TAG_WATER_ORB
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_TARGET, 2, 0, 7, RGB(0, 13, 23)
	playsewithpan SE_M_WHIRLPOOL, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 2, 50, 1
	call WhirlpoolEffect
	call WhirlpoolEffect
	call WhirlpoolEffect
	delay 12
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_TARGET, 2, 7, 0, RGB(0, 13, 23)
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

WhirlpoolEffect:
	createsprite gWhirlpoolSpriteTemplate, ANIM_TARGET, 2, 0, 28, 384, 50, 8, 50, ANIM_TARGET
	delay 2
	createsprite gWhirlpoolSpriteTemplate, ANIM_TARGET, 2, 0, 32, 240, 40, 11, -46, ANIM_TARGET
	delay 2
	createsprite gWhirlpoolSpriteTemplate, ANIM_TARGET, 2, 0, 33, 416, 40, 4, 42, ANIM_TARGET
	delay 2
	createsprite gWhirlpoolSpriteTemplate, ANIM_TARGET, 2, 0, 31, 288, 45, 6, -42, ANIM_TARGET
	delay 2
	createsprite gWhirlpoolSpriteTemplate, ANIM_TARGET, 2, 0, 28, 448, 45, 11, 46, ANIM_TARGET
	delay 2
	createsprite gWhirlpoolSpriteTemplate, ANIM_TARGET, 2, 0, 33, 464, 50, 10, -50, ANIM_TARGET
	delay 2
	return

Move_FLY_CYNTHIA:
Move_FLY:
	loadspritegfx ANIM_TAG_ROUND_SHADOW
	loadspritegfx ANIM_TAG_IMPACT
	choosetwoturnanim FlySetUp, FlyUnleash

FlyEnd:
	waitforvisualfinish
	end

FlySetUp:
	playsewithpan SE_M_FLY, SOUND_PAN_ATTACKER
	createsprite gFlyBallUpSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 13, 336
	goto FlyEnd

FlyUnleash:
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	createsprite gFlyBallAttackSpriteTemplate, ANIM_ATTACKER, 2, 20
	delay 20
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 6, 0, 8, 1
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto FlyEnd

Move_BOUNCE:
	loadspritegfx ANIM_TAG_ROUND_SHADOW
	loadspritegfx ANIM_TAG_IMPACT
	choosetwoturnanim BounceSetUp, BounceUnleash
BounceEnd:
	end

BounceSetUp:
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	createsprite gBounceBallShrinkSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	goto BounceEnd

BounceUnleash:
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gBounceBallLandSpriteTemplate, ANIM_TARGET, 3
	delay 7
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 11, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto BounceEnd

Move_KARATE_CHOP:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_TARGET
	createsprite gKarateChopSpriteTemplate, ANIM_ATTACKER, 2, -16, 0, 0, 0, 10, 1, 3, 0
	waitforvisualfinish
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 4, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_CROSS_CHOP:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_CROSS_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_TARGET
	createsprite gCrossChopHandSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0
	createsprite gCrossChopHandSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1
	delay 40
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB_WHITE, 10, RGB_BLACK, 10
	createsprite gCrossImpactSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 20
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 7, 0, 9, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_JUMP_KICK:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 3
	createsprite gJumpKickSpriteTemplate, ANIM_ATTACKER, 2, -16, 8, 0, 0, 10, ANIM_TARGET, 1, 1
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 5, 0, 7, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_HI_JUMP_KICK:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 0, 0, 8
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 3
	delay 2
	createsprite gJumpKickSpriteTemplate, ANIM_ATTACKER, 2, -16, 8, 0, 0, 10, ANIM_TARGET, 1, 1
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -28, 0, 0, 3
	delay 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 3, 0, 11, 1
	waitforvisualfinish
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_DOUBLE_KICK:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gFistFootRandomPosSpriteTemplate, ANIM_ATTACKER, 3, 1, 20, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 4, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	waitforvisualfinish  @ Redundant
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_TRIPLE_KICK:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	jumpifmoveturn 0, TripleKickLeft
	jumpifmoveturn 1, TripleKickRight
	goto TripleKickCenter

TripleKickContinue:
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

TripleKickLeft:
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, -16, -8, 20, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -16, -16, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 4, 0, 6, 1
	goto TripleKickContinue

TripleKickRight:
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 8, 8, 20, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 8, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 4, 0, 6, 1
	goto TripleKickContinue

TripleKickCenter:
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 20, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, -8, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 6, 0, 8, 1
	goto TripleKickContinue

Move_DYNAMIC_PUNCH:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_EXPLOSION
	loadspritegfx ANIM_TAG_EXPLOSION_6
	delay 1
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, 0, 0, 20, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 5, 0, 7, 1
	delay 1
	waitsound
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 5, 0, 28, 1
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 1, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_COUNTER:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 18, 6, 1, 4
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -15, 18, ANIM_TARGET, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 25, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, -15, 18, 8, 1, 0
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, -4, ANIM_TARGET, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, 0, -4, 8, 1, 0
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 15, 9, ANIM_TARGET, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, 15, 9, 8, 1, 0
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_VITAL_THROW:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 12, 4, 1, 2
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 2
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -24, 0, 0, 4
	waitforvisualfinish
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 7
	delay 11
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 10
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_ROCK_SMASH:
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 8, 1, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 5, 1
	waitforvisualfinish
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 20, 24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 5, 0, -20, 24, 14, 1
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 5, 20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, -5, 0, -20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 30, 18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 30, -18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -30, 18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -30, -18, 8, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 7, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_SUBMISSION:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET, 10
	waitplaysewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER, 20
	waitplaysewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET, 30
	waitplaysewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER, 40
	waitplaysewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET, 50
	waitplaysewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER, 60
	waitplaysewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET, 70
	waitplaysewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER, 80
	waitplaysewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET, 90
	createvisualtask AnimTask_TranslateMonElliptical, 2, 0, -18, 6, 6, 4
	createvisualtask AnimTask_TranslateMonElliptical, 2, 1, 18, 6, 6, 4
	call SubmissionHit
	call SubmissionHit
	call SubmissionHit
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

SubmissionHit:
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -12, ANIM_TARGET, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -12, 8, ANIM_TARGET, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 12, 0, ANIM_TARGET, 1
	delay 8
	return

@ Also used by Sunny weather
Move_SUNNY_DAY:
	loadspritegfx ANIM_TAG_SUNLIGHT
	monbg ANIM_ATK_PARTNER
	setalpha 13, 3
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG | F_PAL_BATTLERS_2, 1, 0, 6, RGB_WHITE
	waitforvisualfinish
	panse_adjustnone SE_M_PETAL_DANCE, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +1, 0
	call SunnyDayLightRay
	call SunnyDayLightRay
	call SunnyDayLightRay
	call SunnyDayLightRay
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG | F_PAL_BATTLERS_2, 1, 6, 0, RGB_WHITE
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

SunnyDayLightRay:
	createsprite gSunlightRaySpriteTemplate, ANIM_ATTACKER, 40
	delay 6
	return

Move_COTTON_SPORE:
	loadspritegfx ANIM_TAG_SPORE
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	loopsewithpan SE_M_POISON_POWDER, SOUND_PAN_TARGET, 18, 10
	call CreateCottonSpores
	call CreateCottonSpores
	call CreateCottonSpores
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

CreateCottonSpores:
	createsprite gSporeParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -20, 85, 80, 0
	delay 12
	createsprite gSporeParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 170, 80, 0
	delay 12
	createsprite gSporeParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -15, 0, 80, 0
	delay 12
	return

Move_SPORE:
	loadspritegfx ANIM_TAG_SPORE
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_SporeDoubleBattle, 2
	loopsewithpan SE_M_POISON_POWDER, SOUND_PAN_TARGET, 16, 11
	call CreateSpore
	call CreateSpore
	call CreateSpore
	waitforvisualfinish
	delay 1
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

CreateSpore:
	createsprite gSporeParticleSpriteTemplate, ANIM_TARGET, 2, 0, -20, 85, 80, 1
	delay 12
	createsprite gSporeParticleSpriteTemplate, ANIM_TARGET, 2, 0, -10, 170, 80, 1
	delay 12
	createsprite gSporeParticleSpriteTemplate, ANIM_TARGET, 2, 0, -15, 0, 80, 1
	delay 12
	return

Move_PETAL_DANCE:
	loadspritegfx ANIM_TAG_FLOWER
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_PETAL_DANCE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 12, 6, 6, 3
	createsprite gPetalDanceBigFlowerSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 8, 140
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, 16, -24, 8, 100
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, -16, -24, 8, 100
	delay 15
	createsprite gPetalDanceBigFlowerSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 8, 140
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, 32, -24, 8, 100
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, -32, -24, 8, 100
	delay 15
	createsprite gPetalDanceBigFlowerSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 8, 140
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, 24, -24, 8, 100
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, -24, -24, 8, 100
	delay 30
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, 16, -24, 0, 100
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, -16, -24, 0, 100
	delay 30
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, 20, -16, 14, 80
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, -20, -14, 16, 80
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 5
	delay 3
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 6, 0, 8, 1
	waitforvisualfinish
	delay 8
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 7
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_WATER_GUN:
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_RAZOR_LEAF
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 1
	loopsewithpan SE_M_POISON_POWDER, SOUND_PAN_ATTACKER, 10, 5
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -2, 10
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -1, 15
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -4, -4, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 3, -3, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -6, 8
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -1, 12
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -4, 13
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 4, -5, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -6, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -5, 8
	delay 60
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, 20, 1
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, -20, 1
	delay 20
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 2, 0, 8, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_NATURE_POWER:
	@ No actual animation, uses the animation of a move from sNaturePowerMoves instead

Move_ANCIENT_POWER:
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 4, 1, 10, 1
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 20, 32, -48, 50, 2
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, -38, 25, 5
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 32, 32, -28, 40, 3
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, -20, 32, -48, 50, 2
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 20, 32, -28, 60, 1
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, -28, 30, 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 30, 1
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	delay 10
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 15, 32, -48, 25, 5
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, -10, 32, -42, 30, 4
	delay 10
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, -42, 25, 5
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, -25, 32, -48, 30, 4
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 0, 0, 4
	delay 3
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 7
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_TENTAZOOKA:
Move_TOEDSZOOKA:
Move_OCTAZOOKA:
	loadspritegfx ANIM_TAG_GRAY_SMOKE
	loadspritegfx ANIM_TAG_BLACK_BALL
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_ATTACKER
	createsprite gOctazookaBallSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 0, 20, 0
	waitforvisualfinish
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gOctazookaSmokeSpriteTemplate, ANIM_TARGET, 2, 8, 8, 1, 0
	delay 2
	createsprite gOctazookaSmokeSpriteTemplate, ANIM_TARGET, 2, -8, -8, 1, 0
	delay 2
	createsprite gOctazookaSmokeSpriteTemplate, ANIM_TARGET, 2, 8, -8, 1, 0
	delay 2
	createsprite gOctazookaSmokeSpriteTemplate, ANIM_TARGET, 2, -8, 8, 1, 0
	waitforvisualfinish
	end

Move_MIST:
	loadspritegfx ANIM_TAG_MIST_CLOUD
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	loopsewithpan SE_M_MIST, SOUND_PAN_ATTACKER, 20, 15
	call MistCloud
	call MistCloud
	call MistCloud
	call MistCloud
	call MistCloud
	call MistCloud
	call MistCloud
	delay 32
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATK_SIDE, 8, 2, 0, 14, RGB_WHITE
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

MistCloud:
	createsprite gMistCloudSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 48, 240, 0, 1
	delay 7
	return

Move_HAZE:
	waitforvisualfinish
	playsewithpan SE_M_HAZE, 0
	createvisualtask AnimTask_HazeScrollingFog, 5
	delay 30
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BATTLERS_2, 2, 0, 16, RGB_BLACK
	delay 90
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BATTLERS_2, 1, 16, 0, RGB_BLACK
	end

Move_FIRE_PUNCH:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 9, RGB_RED
	createsprite gFireSpiralInwardSpriteTemplate, ANIM_TARGET, 1, 0
	createsprite gFireSpiralInwardSpriteTemplate, ANIM_TARGET, 1, 64
	createsprite gFireSpiralInwardSpriteTemplate, ANIM_TARGET, 1, 128
	createsprite gFireSpiralInwardSpriteTemplate, ANIM_TARGET, 1, 196
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, 0, 0, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 15, 1
	call FireSpreadEffect
	delay 4
	playsewithpan SE_M_FIRE_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 0, 9, 0, RGB_RED
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

FireSpreadEffect:
	createsprite gFireSpreadSpriteTemplate, ANIM_TARGET, 1, 0, 10, 192, 176, 40
	createsprite gFireSpreadSpriteTemplate, ANIM_TARGET, 1, 0, 10, -192, 240, 40
	createsprite gFireSpreadSpriteTemplate, ANIM_TARGET, 1, 0, 10, 192, -160, 40
	createsprite gFireSpreadSpriteTemplate, ANIM_TARGET, 1, 0, 10, -192, -112, 40
	createsprite gFireSpreadSpriteTemplate, ANIM_TARGET, 1, 0, 10, 160, 48, 40
	createsprite gFireSpreadSpriteTemplate, ANIM_TARGET, 1, 0, 10, -224, -32, 40
	createsprite gFireSpreadSpriteTemplate, ANIM_TARGET, 1, 0, 10, 112, -128, 40
	return

Move_LEER:
	loadspritegfx ANIM_TAG_LEER
	monbg ANIM_ATTACKER
	splitbgprio ANIM_ATTACKER
	setalpha 8, 8
	playsewithpan SE_M_LEER, SOUND_PAN_ATTACKER
	createsprite gLeerSpriteTemplate, ANIM_ATTACKER, 2, 24, -12
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 10, ANIM_ATTACKER, 1
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 9, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 1, 0, 9, 1
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	delay 1
	waitforvisualfinish
	end

Move_DREAM_EATER:
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg ANIM_DEF_PARTNER
	splitbgprio_foes ANIM_TARGET
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	call SetPsychicBackground
	setalpha 8, 8
	playsewithpan SE_M_MINIMIZE, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -6, -6, 15, ANIM_TARGET, 1
	waitforvisualfinish
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 2, 25, 1
	call DreamEaterAbsorb
	waitforvisualfinish
	delay 15
	call HealingEffect
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 1
	call UnsetPsychicBackground
	end

DreamEaterAbsorb:
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -40, 35
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 28, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 40, 39
	delay 4
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -32, 26
	delay 4
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -40, 26
	delay 4
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 36, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -20, 35
	delay 4
	return

Move_POISON_GAS:
	loadspritegfx ANIM_TAG_PURPLE_GAS_CLOUD
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	delay 0
	monbg ANIM_DEF_PARTNER
	splitbgprio_all
	setalpha 12, 8
	delay 0
	playsewithpan SE_M_MIST, SOUND_PAN_ATTACKER
	createsprite gPoisonGasCloudSpriteTemplate, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_M_MIST, SOUND_PAN_ATTACKER
	createsprite gPoisonGasCloudSpriteTemplate, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_M_MIST, SOUND_PAN_ATTACKER
	createsprite gPoisonGasCloudSpriteTemplate, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_M_MIST, SOUND_PAN_ATTACKER
	createsprite gPoisonGasCloudSpriteTemplate, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_M_MIST, SOUND_PAN_ATTACKER
	createsprite gPoisonGasCloudSpriteTemplate, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_M_MIST, SOUND_PAN_ATTACKER
	createsprite gPoisonGasCloudSpriteTemplate, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 40
	loopsewithpan SE_M_MIST, SOUND_PAN_TARGET, 28, 6
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 6, 2, 0, 12, RGB(26, 0, 26)
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_DEF_PARTNER
	delay 0
	end

Move_BIND:
	createvisualtask AnimTask_SwayMon, 5, 0, 6, 3328, 4, ANIM_ATTACKER
	goto BindWrap

BindWrap:
	playsewithpan SE_M_BIND, SOUND_PAN_TARGET
	call BindWrapSqueezeTarget
	call BindWrapSqueezeTarget
	waitforvisualfinish
	end

BindWrapSqueezeTarget:
	createvisualtask AnimTask_ScaleMonAndRestore, 5, 10, -5, 5, ANIM_TARGET, 0
	delay 16
	return

Move_WRAP:
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 6, 4, 2, 4
	goto BindWrap

Move_PSY_MIEM:
Move_PSY_BIEM:
Move_PSY_WIND:
	loadspritegfx ANIM_TAG_BLUE_RING
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	call SetPsychicBackground
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_TELEPORT, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, 2, 9, 0, 10
	call PsywaveRings
	call PsywaveRings
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 1, 4, 0, 12, RGB(31, 18, 31)
	call PsywaveRings
	call PsywaveRings
	call PsywaveRings
	call PsywaveRings
	waitforvisualfinish
	delay 1
	call UnsetPsychicBackground
	end

PsybeamRings:
	createsprite gGoldRingSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 13, 0
	delay 4
	return

Move_HYPNOSIS:
	loadspritegfx ANIM_TAG_GOLD_RING
	call SetPsychicBackground
	call HypnosisRings
	call HypnosisRings
	call HypnosisRings
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(31, 18, 31)
	waitforvisualfinish
	delay 1
	call UnsetPsychicBackground
	end

HypnosisRings:
	playsewithpan SE_M_SUPERSONIC, SOUND_PAN_ATTACKER
	createsprite gGoldRingSpriteTemplate, ANIM_TARGET, 2, 0, 8, 0, 8, 27, 0
	createsprite gGoldRingSpriteTemplate, ANIM_TARGET, 2, 16, -8, 0, -8, 27, 0
	delay 6
	return

Move_PSYWAVE:
	loadspritegfx ANIM_TAG_BLUE_RING
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	call SetPsychicBackground
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_TELEPORT, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, 2, 9, 0, 10
	call PsywaveRings
	call PsywaveRings
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 1, 4, 0, 12, RGB(31, 18, 31)
	call PsywaveRings
	call PsywaveRings
	call PsywaveRings
	call PsywaveRings
	waitforvisualfinish
	delay 1
	call UnsetPsychicBackground
	end

PsywaveRings:
	createsprite gPsywaveRingSpriteTemplate, ANIM_TARGET, 3, 10, 10, 0, 16
	delay 4
	createsprite gPsywaveRingSpriteTemplate, ANIM_TARGET, 3, 10, 10, 0, 16
	delay 4
	return

Move_ZAP_CANNON:
	loadspritegfx ANIM_TAG_BLACK_BALL_2
	loadspritegfx ANIM_TAG_SPARK_2
	playsewithpan SE_M_THUNDER_WAVE, SOUND_PAN_ATTACKER
	createsprite gZapCannonBallSpriteTemplate, ANIM_TARGET, 3, 10, 0, 0, 0, 30, 0
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 16, 30, 0, 40, 0
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 16, 30, 64, 40, 1
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 16, 30, 128, 40, 0
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 16, 30, 192, 40, 2
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 8, 30, 32, 40, 0
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 8, 30, 96, 40, 1
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 8, 30, 160, 40, 0
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 8, 30, 224, 40, 2
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 5, 1
	delay 15
	waitplaysewithpan SE_M_THUNDERBOLT2, SOUND_PAN_TARGET, 19
	call ElectricityEffect
	waitforvisualfinish
	end

Move_STEEL_WING:
	loadspritegfx ANIM_TAG_GUST
	loadspritegfx ANIM_TAG_IMPACT
	loopsewithpan SE_M_HARDEN, SOUND_PAN_ATTACKER, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	waitforvisualfinish
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	loopsewithpan SE_M_WING_ATTACK, SOUND_PAN_ATTACKER, 20, 2
	createvisualtask AnimTask_TranslateMonElliptical, 2, 0, 12, 4, 1, 4
	createvisualtask AnimTask_AnimateGustTornadoPalette, 5, 1, 70
	createsprite gGustToTargetSpriteTemplate, ANIM_ATTACKER, 2, -25, 0, 0, 0, 20
	createsprite gGustToTargetSpriteTemplate, ANIM_ATTACKER, 2, 25, 0, 0, 0, 20
	delay 24
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 9
	delay 17
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 16, 0, ANIM_TARGET, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -16, 0, ANIM_TARGET, 1
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 11
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_IRON_TAIL:
	loadspritegfx ANIM_TAG_IMPACT
	loopsewithpan SE_M_HARDEN, SOUND_PAN_ATTACKER, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 1, 0, 0
	waitforvisualfinish
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, ANIM_ATTACKER, 1
	clearmonbg ANIM_TARGET
	blendoff
	waitforvisualfinish
	end

Move_POISON_TAIL:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	loopsewithpan SE_M_HARDEN, SOUND_PAN_ATTACKER, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 1, 1, RGB(24, 6, 23)
	waitforvisualfinish
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, ANIM_ATTACKER, 1
	clearmonbg ANIM_TARGET
	blendoff
	call PoisonBubblesEffect
	waitforvisualfinish
	end

Move_METAL_CLAW:
	loadspritegfx ANIM_TAG_CLAW_SLASH
	loopsewithpan SE_M_HARDEN, SOUND_PAN_ATTACKER, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 2
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, -10, 0
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, 10, 0
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	delay 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 2
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, -10, 1
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, 10, 1
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	waitforvisualfinish
	end

Move_NIGHT_SHADE:
	monbg ANIM_ATTACKER
	splitbgprio ANIM_ATTACKER
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	fadetobg BG_GHOST
	waitbgfadein
	delay 10
	playsewithpan SE_M_LEER, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_NightShadeClone, 5, 85
	delay 70
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 12, 1
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 0, 2, 0, 13, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	delay 1
	restorebg
	waitbgfadein
	end

Move_EGG_BOMB:
	loadspritegfx ANIM_TAG_EXPLOSION
	loadspritegfx ANIM_TAG_YOSHI_EGG
	@ANIM_TAG_LARGE_FRESH_EGG
	playsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	createsprite gYoshiEggThrowSpriteTemplate, ANIM_TARGET, 2, 10, 0, 0, 0, 25, -32
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 16, 1
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 6, 5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, -16, -15, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 16, -5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, -12, 18, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 0, 5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	waitforvisualfinish
	end

Move_SHADOW_BALL:
	loadspritegfx ANIM_TAG_SHADOW_BALL
	fadetobg BG_GHOST
	waitbgfadein
	delay 15
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_MIST, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, 5, 5, 0, 5
	createsprite gShadowBallSpriteTemplate, ANIM_TARGET, 2, 16, 16, 8
	waitforvisualfinish
	playsewithpan SE_M_SAND_ATTACK, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 8, 1
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

Move_LICK:
	loadspritegfx ANIM_TAG_LICK
	delay 15
	playsewithpan SE_M_LICK, SOUND_PAN_TARGET
	createsprite gLickSpriteTemplate, ANIM_TARGET, 2, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 16, 1
	waitforvisualfinish
	end

Move_FOCUS_ENERGY:
	loadspritegfx ANIM_TAG_FOCUS_ENERGY
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	call EndureEffect
	delay 8
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 2, 2, 0, 11, RGB_WHITE
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 32, 1
	call EndureEffect
	delay 8
	call EndureEffect
	waitforvisualfinish
	end

Move_BIDE:
	choosetwoturnanim BideSetUp, BideUnleash
	end

BideSetUp:
	loopsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER, 9, 2
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 2, 2, 0, 11, RGB_RED
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 32, 1
	waitforvisualfinish
	end

BideUnleash:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	loopsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER, 9, 2
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 2, 0, 11, RGB_RED
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 32, 1
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 4
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 2, 0, 12, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 16, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 18, -8, ANIM_TARGET, 1
	delay 5
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, -18, 8, ANIM_TARGET, 1
	delay 5
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, -8, -5, ANIM_TARGET, 1
	waitforvisualfinish
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 7
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 2, 11, 0, RGB_RED
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_STRING_SHOT:
	loadspritegfx ANIM_TAG_STRING
	loadspritegfx ANIM_TAG_WEB_THREAD
	monbg ANIM_DEF_PARTNER
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 5, F_PAL_BG, 2, 0, 9, RGB_BLACK
	waitforvisualfinish
	loopsewithpan SE_M_STRING_SHOT, SOUND_PAN_ATTACKER, 9, 6
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	waitforvisualfinish
	playsewithpan SE_M_STRING_SHOT2, SOUND_PAN_TARGET
	createsprite gStringWrapSpriteTemplate, ANIM_TARGET, 2, 0, 10
	delay 4
	createsprite gStringWrapSpriteTemplate, ANIM_TARGET, 2, 0, -2
	delay 4
	createsprite gStringWrapSpriteTemplate, ANIM_TARGET, 2, 0, 22
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	delay 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 5, F_PAL_BG, 2, 9, 0, RGB_BLACK
	end

StringShotThread:
	createsprite gWebThreadSpriteTemplate, ANIM_TARGET, 2, 20, 0, 512, 20, 1
	delay 1
	return

Move_SPIDER_WEB:
	loadspritegfx ANIM_TAG_SPIDER_WEB
	loadspritegfx ANIM_TAG_WEB_THREAD
	monbg ANIM_DEF_PARTNER
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 5, F_PAL_BG, 2, 0, 9, RGB_BLACK
	waitforvisualfinish
	splitbgprio ANIM_TARGET
	loopsewithpan SE_M_STRING_SHOT, SOUND_PAN_ATTACKER, 9, 6
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	waitforvisualfinish
	playsewithpan SE_M_STRING_SHOT2, SOUND_PAN_TARGET
	createsprite gSpiderWebSpriteTemplate, ANIM_ATTACKER, 2
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 5, F_PAL_BG, 2, 9, 0, RGB_BLACK
	end

SpiderWebThread:
	createsprite gWebThreadSpriteTemplate, ANIM_TARGET, 2, 20, 0, 512, 20, 0
	delay 1
	return

Move_RAZOR_WIND:
	choosetwoturnanim RazorWindSetUp, RazorWindUnleash

RazorWindEnd:
	waitforvisualfinish
	end

RazorWindSetUp:
	loadspritegfx ANIM_TAG_GUST
	playsewithpan SE_M_GUST, SOUND_PAN_ATTACKER
	createsprite gRazorWindTornadoSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 16, 16, 0, 7, 40
	createsprite gRazorWindTornadoSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 16, 16, 85, 7, 40
	createsprite gRazorWindTornadoSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 16, 16, 170, 7, 40
	waitforvisualfinish
	playsewithpan SE_M_GUST2, SOUND_PAN_ATTACKER
	goto RazorWindEnd

RazorWindUnleash:
	loadspritegfx ANIM_TAG_AIR_WAVE_2
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 14, 8, 0, 0, 22, 2, 1
	delay 2
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 14, -8, 16, 14, 22, 1, 1
	delay 2
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 14, 12, -16, -14, 22, 0, 1
	delay 17
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 10, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 2, 0, 10, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	goto RazorWindEnd

Move_DISABLE:
	loadspritegfx ANIM_TAG_SPARKLE_4
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 8, 8
	playsewithpan SE_M_DETECT, SOUND_PAN_ATTACKER
	createsprite gSpinningSparkleSpriteTemplate, ANIM_ATTACKER, 13, 24, -16
	waitforvisualfinish
	createvisualtask AnimTask_GrowAndGrayscale, 5
	loopsewithpan SE_M_BIND, SOUND_PAN_TARGET, 15, 4
	waitforvisualfinish
	delay 1
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_RECOVER:
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	loopsewithpan SE_M_MEGA_KICK, SOUND_PAN_ATTACKER, 13, 3
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 0, 6, 0, 11, RGB(31, 31, 11)
	call RecoverAbsorbEffect
	call RecoverAbsorbEffect
	call RecoverAbsorbEffect
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	delay 1
	call HealingEffect
	waitforvisualfinish
	end

RecoverAbsorbEffect:
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 40, -10, 13
	delay 3
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -35, -10, 13
	delay 3
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 15, -40, 13
	delay 3
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -10, -32, 13
	delay 3
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 25, -20, 13
	delay 3
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -40, -20, 13
	delay 3
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 5, -40, 13
	delay 3
	return

Move_MIMIC:
	loadspritegfx ANIM_TAG_ORBS
	monbg_static ANIM_DEF_PARTNER
	setalpha 11, 5
	panse SE_M_MINIMIZE, SOUND_PAN_TARGET, SOUND_PAN_ATTACKER, -3, 0
	createvisualtask AnimTask_ShrinkTargetCopy, 5, 128, 24
	delay 15
	createsprite gMimicOrbSpriteTemplate, ANIM_TARGET, 2, -12, 24
	delay 10
	setarg 7, 0xFFFF
	waitforvisualfinish
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 0, 2, 0, 11, RGB_WHITE
	waitforvisualfinish
	clearmonbg_static ANIM_DEF_PARTNER
	blendoff
	end

Move_CONSTRICT:
	loadspritegfx ANIM_TAG_TENDRILS
	loopsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET, 6, 4
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 4, 0, 16, 0, 2
	delay 7
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 3, 0, 0, 0, 2
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 2, 0, 8, 1, 2
	delay 7
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 3, 0, -8, 1, 2
	delay 8
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 6, 1
	delay 20
	playsewithpan SE_M_BIND, SOUND_PAN_TARGET
	setarg 7, 0xFFFF
	waitforvisualfinish
	end

Move_CURSE:
	choosetwoturnanim CurseGhost, CurseStats

CurseGhost:
	loadspritegfx ANIM_TAG_NAIL
	loadspritegfx ANIM_TAG_GHOSTLY_SPIRIT
	monbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_CurseStretchingBlackBg, 5
	waitforvisualfinish
	delay 20
	createsprite gCurseNailSpriteTemplate, ANIM_ATTACKER, 2
	delay 60
	call CurseGhostShakeFromNail
	delay 41
	call CurseGhostShakeFromNail
	delay 41
	call CurseGhostShakeFromNail
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	delay 1
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_NIGHTMARE, SOUND_PAN_TARGET
	createsprite gCurseGhostSpriteTemplate, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 14, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 16, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

CurseGhostShakeFromNail:
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 4, 0, 10, 0
	playsewithpan SE_M_BIND, SOUND_PAN_ATTACKER
	return

CurseStats:
	loadspritegfx ANIM_TAG_NOISE_LINE
	createvisualtask SoundTask_PlayDoubleCry, 2, ANIM_ATTACKER, DOUBLE_CRY_GROWL
	call RoarEffect
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 9, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 1, 0, 9, 1
	waitforvisualfinish
	createvisualtask SoundTask_WaitForCry, 5
	waitforvisualfinish
	end

CurseStats1:
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_DrawFallingWhiteLinesOnAttacker, 5
	createvisualtask AnimTask_BlendColorCycle, 5, F_PAL_ATTACKER, 4, 2, 0, 10, RGB_RED
	return

Move_LICK_SOFTBOILED:
Move_SOFT_BOILED:
	loadspritegfx ANIM_TAG_BREAKING_EGG
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg ANIM_ATK_PARTNER
	playsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ShakeMon, 2, ANIM_ATTACKER, 0, 2, 6, 1
	createsprite gSoftBoiledEggSpriteTemplate, ANIM_ATTACKER, 4, 0, 16, 0
	createsprite gSoftBoiledEggSpriteTemplate, ANIM_ATTACKER, 4, 0, 16, 1
	delay 120
	delay 7
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_ATTACKER
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 10, 0, RGB(12, 24, 30)
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 31, 16, 0, 1
	delay 8
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 31, 16, 0, 1
	delay 60
	setarg 7, 0xFFFF
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	call HealingEffect2
	end

Move_HEAL_BELL:
	loadspritegfx ANIM_TAG_BELL
	loadspritegfx ANIM_TAG_MUSIC_NOTES_2
	loadspritegfx ANIM_TAG_THIN_RING
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATK_SIDE, 0, 0, 10, RGB_WHITE
	waitforvisualfinish
	createvisualtask AnimTask_LoadMusicNotesPals, 5
	createsprite gBellSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 0, 1
	delay 12
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 48, -18, 35, 0, 0
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -48, 20, 30, 1, 1
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -38, -29, 30, 2, 2
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 36, 18, 30, 3, 3
	call HealBellRing
	delay 33
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 19, 26, 35, 4, 4
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -34, -12, 30, 5, 5
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 41, -20, 34, 6, 2
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -15, 26, 32, 7, 0
	call HealBellRing
	delay 33
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -48, 18, 31, 0, 2
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 48, -20, 30, 2, 5
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 38, 29, 33, 4, 3
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -36, -18, 30, 6, 1
	call HealBellRing
	waitforvisualfinish
	createvisualtask AnimTask_FreeMusicNotesPals, 5
	waitforvisualfinish
	unloadspritegfx ANIM_TAG_BELL
	unloadspritegfx ANIM_TAG_MUSIC_NOTES_2
	unloadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_SPARKLE_2
	playsewithpan SE_M_MORNING_SUN, SOUND_PAN_ATTACKER
	createsprite gSparklingStarsSpriteTemplate, ANIM_ATTACKER, 16, -15, 0, 0, 0, 32, 60, 1
	delay 8
	createsprite gSparklingStarsSpriteTemplate, ANIM_ATTACKER, 16, 12, -5, 0, 0, 32, 60, 1
	waitforvisualfinish
	unloadspritegfx ANIM_TAG_SPARKLE_2
	loadspritegfx ANIM_TAG_THIN_RING
	playsewithpan SE_SHINY, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendBattleAnimPalExclude, 10, 4, 3, 10, 0, RGB(12, 24, 30)
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATK_SIDE, 3, 10, 0, RGB_WHITE
	createsprite gBlendThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 16, 0, 0, 0, 1
	end

HealBellRing:
	createvisualtask AnimTask_BlendBattleAnimPalExclude, 10, 4, 3, 8, 0, RGB(12, 24, 30)
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATK_SIDE, 3, 2, 10, RGB_WHITE
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 0, 1
	playsewithpan SE_M_HEAL_BELL, SOUND_PAN_ATTACKER
	return

Move_FAKE_OUT:
	playsewithpan SE_M_FLATTER, 0
	createvisualtask AnimTask_FakeOut, 5
	waitforvisualfinish
	playsewithpan SE_M_SKETCH, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 5, 1
	createvisualtask AnimTask_StretchTargetUp, 3
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 16, 0, RGB_WHITE
	end

Move_SCARY_FACE:
	loadspritegfx ANIM_TAG_EYE_SPARKLE
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_ATK_SIDE | F_PAL_DEF_PARTNER, 3, 0, 16, RGB_BLACK
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	waitforvisualfinish
	delay 10
	playsewithpan SE_M_LEER, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ScaryFace, 5
	delay 13
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, -16, -8
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, 16, -8
	waitforvisualfinish
	createvisualtask AnimTask_ShakeTargetInPattern, 3, 20, 1, FALSE
	playsewithpan SE_M_STRING_SHOT2, SOUND_PAN_TARGET
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_ATK_SIDE | F_PAL_DEF_PARTNER, 3, 16, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_SWEET_KISS:
	loadspritegfx ANIM_TAG_RED_HEART
	loadspritegfx ANIM_TAG_ANGEL
	createsprite gAngelSpriteTemplate, ANIM_TARGET, 2, 16, -48
	playsewithpan SE_M_HEAL_BELL, SOUND_PAN_TARGET
	delay 23
	playsewithpan SE_M_HEAL_BELL, SOUND_PAN_TARGET
	delay 23
	playsewithpan SE_M_HEAL_BELL, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 160, -30
	playsewithpan SE_M_ATTRACT, SOUND_PAN_TARGET
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -256, -42
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 128, -14
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 416, -38
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -128, -22
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -384, -31
	end

Move_LOVELY_KISS:
	loadspritegfx ANIM_TAG_PINK_HEART
	loadspritegfx ANIM_TAG_DEVIL
	createsprite gDevilSpriteTemplate, ANIM_TARGET, 2, 0, -24
	playsewithpan SE_M_PSYBEAM2, SOUND_PAN_TARGET
	waitforvisualfinish
	playsewithpan SE_M_ATTRACT, SOUND_PAN_TARGET
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, -256, -42
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, 128, -14
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, 416, -38
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, -128, -22
	end

Move_FURY_SWIPES:
	loadspritegfx ANIM_TAG_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 5, 5
	delay 4
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, 16, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 5, 1
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, ANIM_TARGET, 2, 5, 5
	delay 4
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, -16, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 7, 1
	end

Move_LICK_JUNGLE_HEALING:
Move_INGRAIN:
	loadspritegfx ANIM_TAG_ROOTS
	loadspritegfx ANIM_TAG_ORBS
	createsprite gIngrainRootSpriteTemplate, ANIM_ATTACKER, 2, 16, 26, -1, 2, 150
	playsewithpan SE_M_SCRATCH, SOUND_PAN_ATTACKER
	delay 10
	createsprite gIngrainRootSpriteTemplate, ANIM_ATTACKER, 2, -32, 20, 1, 1, 140
	playsewithpan SE_M_SCRATCH, SOUND_PAN_ATTACKER
	delay 10
	createsprite gIngrainRootSpriteTemplate, ANIM_ATTACKER, 2, 32, 22, 1, 0, 130
	playsewithpan SE_M_SCRATCH, SOUND_PAN_ATTACKER
	delay 10
	createsprite gIngrainRootSpriteTemplate, ANIM_ATTACKER, 2, -16, 25, -1, 3, 120
	playsewithpan SE_M_SCRATCH, SOUND_PAN_ATTACKER
	delay 40
	createsprite gIngrainOrbSpriteTemplate, ANIM_ATTACKER, 3, 32, 26, -1, 3, 30
	delay 5
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	delay 5
	createsprite gIngrainOrbSpriteTemplate, ANIM_ATTACKER, 3, -48, 20, 1, 2, 30
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	delay 5
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	delay 5
	createsprite gIngrainOrbSpriteTemplate, ANIM_ATTACKER, 3, 48, 26, -2, 3, 18
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	delay 10
	waitforvisualfinish
	end

Move_PRESENT:
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask AnimTask_IsHealingMove, 2
	createsprite gPresentSpriteTemplate, ANIM_TARGET, 2, 0, -5, 10, 2, -1
	playsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	delay 14
	playsewithpan SE_M_BUBBLE2, SOUND_PAN_ATTACKER
	delay 14
	playsewithpan SE_M_BUBBLE2, 0
	delay 20
	playsewithpan SE_M_BUBBLE2, SOUND_PAN_TARGET
	waitforvisualfinish
	jumpretfalse PresentDamage
	jumprettrue PresentHeal
	end

PresentDamage:
	loadspritegfx ANIM_TAG_EXPLOSION
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, 16, 16, 1, 1
	end

PresentHeal:
	loadspritegfx ANIM_TAG_GREEN_SPARKLE
	loadspritegfx ANIM_TAG_BLUE_STAR
	playsewithpan SE_M_MORNING_SUN, SOUND_PAN_TARGET
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, -16, 32, -3, 1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, 16, 32, -3, -1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, 32, 32, -3, 1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, -32, 32, -3, 1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, 0, 32, -3, 1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, -8, 32, -3, 1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, -8, 32, -3, 1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, 24, 32, -3, 1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, -24, 32, -3, 1
	waitforvisualfinish
	waitsound
	call HealingEffect2
	end

Move_BATON_PASS:
	loadspritegfx ANIM_TAG_POKEBALL
	playsewithpan SE_M_BATON_PASS, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_BG | F_PAL_BATTLERS, 1, 2, 0, 11, RGB(31, 22, 30)
	createsprite gBatonPassPokeballSpriteTemplate, ANIM_ATTACKER, 2
	end

Move_PERISH_SONG:
	loadspritegfx ANIM_TAG_MUSIC_NOTES_2
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 0
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 1, 1, 16
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 2, 1, 32
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 3, 2, 48
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 4, 2, 64
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 5, 0, 80
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 6, 0, 96
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 7, 1, 112
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 8, 2, 128
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 9, 0, 144
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 10, 2, 160
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 11, 0, 176
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 12, 1, 192
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 13, 3, 208
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 14, 3, 224
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 15, 0, 240
	createsprite gPerishSongMusicNote2SpriteTemplate, ANIM_ATTACKER, 4, 15, 0, 0
	delay 20
	panse SE_M_PERISH_SONG, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	delay 80
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 0, 16, RGB_BLACK
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, 4, 0
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, 5, 0
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, 6, 0
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, 7, 0
	delay 100
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 16, 0, RGB_BLACK
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, 4, 1
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, 5, 1
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, 6, 1
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, 7, 1
	waitforvisualfinish
	end

Move_SLEEP_TALK:
	loadspritegfx ANIM_TAG_LETTER_Z
	createvisualtask AnimTask_SwayMon, 5, 0, 4, 4096, 2, ANIM_ATTACKER
	delay 20
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -1
	playsewithpan SE_M_SNORE, SOUND_PAN_ATTACKER
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -1
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -1
	delay 20
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -5
	playsewithpan SE_M_SNORE, SOUND_PAN_ATTACKER
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -5
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -5
	delay 20
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -3
	playsewithpan SE_M_SNORE, SOUND_PAN_ATTACKER
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -3
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -3
	waitforvisualfinish
	end

Move_HYPER_FANG:
	loadspritegfx ANIM_TAG_FANG_ATTACK
	playsewithpan SE_M_BITE, SOUND_PAN_TARGET
	delay 1
	delay 2
	createvisualtask AnimTask_IsContest, 2
	jumprettrue HyperFangInContest
	createvisualtask AnimTask_IsTargetPlayerSide, 2
	jumpretfalse HyperFangOnOpponent
	goto HyperFangOnPlayer

HyperFangContinue:
	waitbgfadeout
	createsprite gFangSpriteTemplate, ANIM_TARGET, 2
	waitbgfadein
	createvisualtask AnimTask_ShakeMon, 3, ANIM_TARGET, 0, 10, 10, 1
	playsewithpan SE_M_LEER, SOUND_PAN_TARGET
	delay 20
	restorebg
	waitbgfadein
	waitforvisualfinish
	end

HyperFangOnOpponent:
	fadetobg BG_IMPACT_OPPONENT
	goto HyperFangContinue

HyperFangOnPlayer:
	fadetobg BG_IMPACT_PLAYER
	goto HyperFangContinue

HyperFangInContest:
	fadetobg BG_IMPACT_CONTESTS
	goto HyperFangContinue

Move_TRI_ATTACK:
	loadspritegfx ANIM_TAG_TRI_ATTACK_TRIANGLE
	createsprite gTriAttackTriangleSpriteTemplate, ANIM_TARGET, 2, 16, 0
	playsewithpan SE_M_TRI_ATTACK, SOUND_PAN_ATTACKER
	delay 20
	playsewithpan SE_M_TRI_ATTACK, SOUND_PAN_ATTACKER
	delay 20
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_TRI_ATTACK, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, 5, 6, 0, 7
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 16, RGB_BLACK
	delay 16
	loadspritegfx ANIM_TAG_FIRE
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, -1, 0
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 0, 1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, -1, -1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 2, 1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 1, -1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, -1, 1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 1, -2
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 3, 1
	delay 2
	createvisualtask AnimTask_ShakeTargetInPattern, 2, 20, 3, TRUE, 1
	waitforvisualfinish
	loadspritegfx ANIM_TAG_LIGHTNING
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	playsewithpan SE_M_TRI_ATTACK2, SOUND_PAN_TARGET
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, -48
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, -16
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, 16
	delay 20
	createvisualtask AnimTask_ShakeTargetInPattern, 2, 20, 3, TRUE, 0
	delay 2
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	waitforvisualfinish
	playsewithpan SE_M_SUPERSONIC, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, ANIM_TARGET, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 16, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_WILL_O_WISP:
	loadspritegfx ANIM_TAG_WISP_FIRE
	loadspritegfx ANIM_TAG_WISP_ORB
	monbg ANIM_DEF_PARTNER
	splitbgprio_foes ANIM_TARGET
	playsewithpan SE_M_EMBER, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_EMBER, SOUND_PAN_ATTACKER, 10
	createvisualtask SoundTask_AdjustPanningVar, 2, SOUND_PAN_ATTACKER, SOUND_PAN_ATTACKER, 1, 0
	createsprite gWillOWispOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0
	delay 3
	createsprite gWillOWispOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1
	delay 3
	createsprite gWillOWispOrbSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 2
	delay 3
	createsprite gWillOWispOrbSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 3
	delay 40
	createvisualtask SoundTask_AdjustPanningVar, 2, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, 2, 0
	waitforvisualfinish
	splitbgprio_all
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 13, 1
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 0
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 42
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 84
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 126
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 168
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 210
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_ENCORE:
	loadspritegfx ANIM_TAG_SPOTLIGHT
	loadspritegfx ANIM_TAG_TAG_HAND
	createvisualtask AnimTask_CreateSpotlight, 2
	createvisualtask AnimTask_HardwarePaletteFade, 2, 248, 3, 0, 10, 0
	waitforvisualfinish
	createsprite gSpotlightSpriteTemplate, ANIM_TARGET, 2, 0, -8
	createsprite gClappingHandSpriteTemplate, ANIM_ATTACKER, 2, -2, 0, 0, 0, 9
	createsprite gClappingHandSpriteTemplate, ANIM_ATTACKER, 2, 2, 0, 1, 0, 9
	createsprite gClappingHand2SpriteTemplate, ANIM_ATTACKER, 3, -2, 0, 0, 0, 9
	createsprite gClappingHand2SpriteTemplate, ANIM_ATTACKER, 3, 2, 0, 1, 0, 9
	delay 16
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_ENCORE2, SOUND_PAN_TARGET
	createvisualtask AnimTask_SwayMon, 5, 1, 8, 1536, 5, ANIM_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_HardwarePaletteFade, 2, 248, 3, 10, 0, 1
	waitforvisualfinish
	createvisualtask AnimTask_RemoveSpotlight, 2
	end

Move_TRICK:
	loadspritegfx ANIM_TAG_ITEM_BAG
	loadspritegfx ANIM_TAG_SPEED_DUST
	createsprite gTrickBagSpriteTemplate, ANIM_ATTACKER, 2, -40, 80
	createsprite gTrickBagSpriteTemplate, ANIM_ATTACKER, 2, -40, 208
	delay 16
	playsewithpan SE_M_SKETCH, 0
	createvisualtask AnimTask_StretchTargetUp, 3
	createvisualtask AnimTask_StretchAttackerUp, 3
	delay 30
	playsewithpan SE_M_DOUBLE_TEAM, 0
	delay 24
	playsewithpan SE_M_DOUBLE_TEAM, 0
	delay 16
	playsewithpan SE_M_DOUBLE_TEAM, 0
	delay 16
	playsewithpan SE_M_DOUBLE_TEAM, 0
	delay 16
	playsewithpan SE_M_DOUBLE_TEAM, 0
	delay 16
	playsewithpan SE_M_DOUBLE_TEAM, 0
	delay 16
	playsewithpan SE_M_ATTRACT, 0
	createvisualtask AnimTask_ShakeMon, 3, ANIM_ATTACKER, 5, 0, 7, 2
	createvisualtask AnimTask_ShakeMon, 3, ANIM_TARGET, 5, 0, 7, 2
	waitforvisualfinish
	end

Move_WISH:
	loadspritegfx ANIM_TAG_GOLD_STARS
	loadspritegfx ANIM_TAG_SPARKLE_2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 0, 10, RGB_BLACK
	waitforvisualfinish
	panse_adjustall SE_M_REFLECT, SOUND_PAN_TARGET, SOUND_PAN_ATTACKER, -3, 0
	createsprite gWishStarSpriteTemplate, ANIM_ATTACKER, 40
	waitforvisualfinish
	delay 60
	loopsewithpan SE_M_HEAL_BELL, SOUND_PAN_ATTACKER, 16, 3
	call GrantingStarsEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 10, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_STOCKPILE:
	loadspritegfx ANIM_TAG_GRAY_ORB
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 8, 1, 0, 12, RGB_WHITE
	createvisualtask AnimTask_StockpileDeformMon, 5
	call StockpileAbsorb
	call StockpileAbsorb
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_ATTACKER, 0, 12, 0, RGB_WHITE
	end

StockpileAbsorb:
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 55, 55, 13
	delay 1
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -55, -55, 13
	delay 1
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, 55, 13
	delay 1
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, -55, 13
	delay 1
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 55, -34, 13
	delay 1
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 55, 34, 13
	delay 1
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -55, -34, 13
	delay 1
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -55, 34, 13
	delay 1
	return

Move_SPIT_UP:
	loadspritegfx ANIM_TAG_RED_ORB_2
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_SpitUpDeformMon, 5
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 8, 2
	delay 45
	playsewithpan SE_M_SPIT_UP, SOUND_PAN_ATTACKER
	delay 3
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, 12
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 32, 12
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 64, 12
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 96, 12
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 128, 12
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 160, 12
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 192, 12
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 224, 12
	delay 5
	jumpifmoveturn 2, SpitUpStrong
	jumpifmoveturn 3, SpitUpStrongest
SpitUpContinue:
	delay 5
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, FALSE, 1, 8, 1, 0
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, -12, 10, ANIM_TARGET, 1
	delay 5
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 12, -10, ANIM_TARGET, 1
	waitforvisualfinish
	end

SpitUpStrong:
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 16
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 80
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 144
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 208
	goto SpitUpContinue

SpitUpStrongest:
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 16
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 48
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 80
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 112
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 144
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 176
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 208
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 240
	goto SpitUpContinue

Move_SWALLOW:
	loadspritegfx ANIM_TAG_BLUE_ORB
	loadspritegfx ANIM_TAG_BLUE_STAR
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_SwallowDeformMon, 5
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 8, 2
	delay 38
	playsewithpan SE_M_SPIT_UP, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 2, 0, 12, 1
	call SwallowEffect
	jumpifmoveturn 2, SwallowGood
	jumpifmoveturn 3, SwallowBest
SwallowContinue:
	waitforvisualfinish
	call HealingEffect
	end

SwallowEffect:
	createsprite gSwallowBlueOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, -8
	delay 1
	createsprite gSwallowBlueOrbSpriteTemplate, ANIM_ATTACKER, 2, -24, -8
	delay 1
	createsprite gSwallowBlueOrbSpriteTemplate, ANIM_ATTACKER, 2, 16, -8
	delay 1
	createsprite gSwallowBlueOrbSpriteTemplate, ANIM_ATTACKER, 2, -16, -8
	delay 1
	createsprite gSwallowBlueOrbSpriteTemplate, ANIM_ATTACKER, 2, 24, -8
	delay 1
	return

SwallowGood:
	call SwallowEffect
	goto SwallowContinue

SwallowBest:
	call SwallowEffect
	call SwallowEffect
	goto SwallowContinue

Move_TRANSFORM:
	monbg ANIM_ATTACKER
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_MINIMIZE, SOUND_PAN_ATTACKER, 48
	createvisualtask AnimTask_TransformMon, 2, 0
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	end

Move_MORNING_SUN:
	loadspritegfx ANIM_TAG_GREEN_STAR
	loadspritegfx ANIM_TAG_BLUE_STAR
	createvisualtask AnimTask_MorningSunLightBeam, 5
	delay 8
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG | F_PAL_BATTLERS_2, 8, 0, 12, RGB_WHITE
	delay 14
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG | F_PAL_BATTLERS_2, 3, 12, 0, RGB_WHITE
	waitforvisualfinish
	waitsound
	call HealingEffect
	end

MorningSunStar:
	createsprite gGreenStarSpriteTemplate, ANIM_ATTACKER, 2, 30, 640
	delay 5
	return

Move_SWEET_SCENT:
	loadspritegfx ANIM_TAG_PINK_PETAL
	playsewithpan SE_M_SWEET_SCENT, SOUND_PAN_ATTACKER
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 100, 0, 100
	delay 25
	setpan 0
	call SweetScentEffect
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 55, 0
	setpan SOUND_PAN_TARGET
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_DEF_SIDE, 1, 5, 5, 13, RGB(31, 21, 21)
	call SweetScentEffect
	waitforvisualfinish
	end

SweetScentEffect:
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 70, 1, 64
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 60, 0, 64
	delay 5
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 80, 1, 64
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 58, 0, 120
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 100, 0, 120
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 90, 0, 64
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 48, 0, 64
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 95, 1, 80
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 100, 0, 120
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 75, 1, 64
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 85, 0, 120
	delay 2
	return

Move_HYPER_BEAM:
	loadspritegfx ANIM_TAG_ORBS
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 0, 16, RGB_BLACK
	waitforvisualfinish
	delay 10
	playsewithpan SE_M_HYPER_BEAM, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 4, 1
	waitforvisualfinish
	delay 30
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_HYPER_BEAM2, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, 1, 15, 0, 5
	createvisualtask AnimTask_ShakeMon, 2, ANIM_ATTACKER, 0, 4, 50, 1
	createvisualtask AnimTask_FlashAnimTagWithColor, 2, ANIM_TAG_ORBS, 1, 12, RGB(31, 0, 0), 16, 0, 0
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 50, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 11, RGB(25, 25, 25)
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 11, 0, RGB(25, 25, 25)
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 16, 0, RGB_BLACK
	end

HyperBeamOrbs:
	createsprite gHyperBeamOrbSpriteTemplate, ANIM_TARGET, 2
	createsprite gHyperBeamOrbSpriteTemplate, ANIM_TARGET, 2
	delay 1
	return

Move_FLATTER:
	loadspritegfx ANIM_TAG_SPOTLIGHT
	loadspritegfx ANIM_TAG_CONFETTI
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_ENCORE2, SOUND_PAN_TARGET
	createvisualtask AnimTask_CreateSpotlight, 2
	createvisualtask AnimTask_HardwarePaletteFade, 2, 248, 3, 0, 10, 0
	waitforvisualfinish
	createsprite gFlatterSpotlightSpriteTemplate, ANIM_TARGET, 2, 0, -8, 80
	delay 0
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 5, 2, ANIM_TARGET
	delay 10
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 5, 2, ANIM_TARGET
	delay 0
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_FLATTER, SOUND_PAN_ATTACKER
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	delay 5
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_FLATTER, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_HardwarePaletteFade, 2, 248, 3, 10, 0, 1
	waitforvisualfinish
	createvisualtask AnimTask_RemoveSpotlight, 2
	end

CreateFlatterConfetti:
	createsprite gFlatterConfettiSpriteTemplate, ANIM_ATTACKER, 40, ANIM_ATTACKER
	createsprite gFlatterConfettiSpriteTemplate, ANIM_ATTACKER, 40, ANIM_TARGET
	return

Move_ROLE_PLAY:
	monbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 16, RGB_WHITE
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 10, RGB_BLACK
	waitforvisualfinish
	playsewithpan SE_M_TRI_ATTACK, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_DETECT, SOUND_PAN_ATTACKER, 30
	createvisualtask AnimTask_RolePlaySilhouette, 2
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 16, 0, RGB_WHITE
	delay 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 10, 0, RGB_BLACK
	end

Move_REFRESH:
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_SPARKLE_2
	playsewithpan SE_M_STAT_INCREASE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_StatusClearedEffect, 2, 0
	waitforvisualfinish
	playsewithpan SE_M_MORNING_SUN, SOUND_PAN_ATTACKER
	call GrantingStarsEffect
	waitforvisualfinish
	playsewithpan SE_SHINY, SOUND_PAN_ATTACKER
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 10, 0, RGB(12, 24, 30)
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0
	end

Move_BLAZE_KICK:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_TARGET
	createsprite gSpinningHandOrFootSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 30
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 7, RGB_WHITE
	delay 30
	playsewithpan SE_M_FIRE_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 14, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 0, RGB_WHITE
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB_BLACK, 8, RGB_BLACK, 0
	call FireSpreadEffect
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_HYPER_VOICE:
	loadspritegfx ANIM_TAG_THIN_RING
	call HyperVoiceEffect
	waitforvisualfinish
	delay 8
	call HyperVoiceEffect
	waitforvisualfinish
	end

HyperVoiceEffect:
	createvisualtask SoundTask_PlayCryWithEcho, 5
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 8, 0, RGB_YELLOW
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 5, ANIM_ATTACKER, 0
	createsprite gHyperVoiceRingSpriteTemplate, ANIM_ATTACKER, 0, 45, 0, 0, 0, 0, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 6, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 1, 0, 6, 1
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 1, 0, 6, 1
	createvisualtask SoundTask_WaitForCry, 5
	return

Move_SAND_TOMB:
	loadspritegfx ANIM_TAG_MUD_SAND
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_TARGET, 2, 0, 7, RGB(19, 17, 0)
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 2, 43, 1
	playsewithpan SE_M_SAND_TOMB, SOUND_PAN_TARGET
	call SandTombSwirlingDirt
	call SandTombSwirlingDirt
	call SandTombSwirlingDirt
	delay 22
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_TARGET, 2, 7, 0, RGB(19, 17, 0)
	waitforvisualfinish
	end

SandTombSwirlingDirt:
	createsprite gSwirlingDirtSpriteTemplate, ANIM_TARGET, 2, 0, 32, 528, 30, 10, 50, ANIM_TARGET
	delay 2
	createsprite gSwirlingDirtSpriteTemplate, ANIM_TARGET, 2, 0, 36, 480, 20, 13, -46, ANIM_TARGET
	delay 2
	createsprite gSwirlingDirtSpriteTemplate, ANIM_TARGET, 2, 0, 37, 576, 20, 5, 42, ANIM_TARGET
	delay 2
	createsprite gSwirlingDirtSpriteTemplate, ANIM_TARGET, 2, 0, 35, 400, 25, 8, -42, ANIM_TARGET
	delay 2
	createsprite gSwirlingDirtSpriteTemplate, ANIM_TARGET, 2, 0, 32, 512, 25, 13, 46, ANIM_TARGET
	delay 2
	createsprite gSwirlingDirtSpriteTemplate, ANIM_TARGET, 2, 0, 37, 464, 30, 12, -50, ANIM_TARGET
	delay 2
	return

Move_SHEER_COLD:
	fadetobg BG_ICE
	waitbgfadeout
	playsewithpan SE_M_ICY_WIND, 0
	waitbgfadein
	loadspritegfx ANIM_TAG_ICE_CUBE
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_FrozenIceCube, 2
	waitplaysewithpan SE_M_HAIL, SOUND_PAN_TARGET, 17
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	restorebg
	waitbgfadein
	end

Move_ARM_THRUST:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_RotateMonSpriteToSide, 5, 8, 5, ANIM_ATTACKER, 0
	delay 6
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 3
	delay 4
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gArmThrustHandSpriteTemplate, ANIM_TARGET, 2, 10, -8, 14, 3
	waitforvisualfinish
	createvisualtask AnimTask_RotateMonSpriteToSide, 5, 8, 5, ANIM_ATTACKER, 1
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	choosetwoturnanim ArmThrustRight, ArmThrustLeft

ArmThrustContinue:
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 4, 0, 6, 1
	waitforvisualfinish
	blendoff
	end

ArmThrustRight:
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 8, 0, ANIM_TARGET, 2
	goto ArmThrustContinue

ArmThrustLeft:
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -8, 0, ANIM_TARGET, 2
	goto ArmThrustContinue

Move_MUDDY_WATER:
	panse SE_M_WHIRLPOOL, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	createvisualtask AnimTask_CreateSurfWave, 2, TRUE
	waitforvisualfinish
	end

Move_BULLET_SEED:
	loadspritegfx ANIM_TAG_SEED
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 30, 1
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	waitforvisualfinish
	end

Move_DRAGON_CLAW:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loadspritegfx ANIM_TAG_CLAW_SLASH
	playsewithpan SE_M_SACRED_FIRE2, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 4, 0, 8, RGB(31, 19, 0)
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 15, 1
	call DragonClawFireSpiral
	call DragonClawFireSpiral
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 528, 30, 13, 50, ANIM_ATTACKER
	delay 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, -10, 0
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, 10, 0
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 480, 20, 16, -46, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 576, 20, 8, 42, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 31, 400, 25, 11, -42, ANIM_ATTACKER
	delay 2
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 512, 25, 16, 46, ANIM_ATTACKER
	delay 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, -10, 1
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, 10, 1
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 464, 30, 15, -50, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 528, 30, 13, 50, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 480, 20, 16, -46, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 576, 20, 8, 42, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 31, 400, 25, 11, -42, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 512, 25, 16, 46, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 464, 30, 15, -50, ANIM_ATTACKER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 4, 8, 0, RGB(31, 19, 0)
	waitforvisualfinish
	end

DragonClawFireSpiral:
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 528, 30, 13, 50, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 480, 20, 16, -46, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 576, 20, 8, 42, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 31, 400, 25, 11, -42, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 512, 25, 16, 46, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 464, 30, 15, -50, ANIM_ATTACKER
	delay 2
	return

	end

Move_MUD_SHOT:
	loadspritegfx ANIM_TAG_BROWN_ORB
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 46, 1
	delay 6
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	panse SE_M_WHIRLPOOL, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +1, 0
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 43, 1
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

MudShotOrbs:
	createsprite gMudShotOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, 16
	delay 2
	createsprite gMudShotOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, 16
	delay 2
	return

Move_METEOR_MASH:
	loadspritegfx ANIM_TAG_GOLD_STARS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	panse SE_M_BARRIER, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +3, 0
	fadetobg BG_COSMIC
	waitbgfadein
	waitforvisualfinish
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -48, -64, 72, 32, 30
	delay 10
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -112, -64, 8, 32, 30
	delay 40
	createsprite gSpinningHandOrFootSpriteTemplate, ANIM_TARGET, 3, 0, 0, 0, 30
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -80, -64, 40, 32, 30
	delay 20
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 5, 0, 20, 1
	waitforvisualfinish
	delay 10
	restorebg
	waitbgfadein
	waitforvisualfinish
	end

Move_REVENGE:
	loadspritegfx ANIM_TAG_PURPLE_SCRATCH
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createsprite gRevengeSmallScratchSpriteTemplate, ANIM_ATTACKER, 2, 10, -10
	waitforvisualfinish
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 0, 4, 2, 8, RGB_RED
	waitforvisualfinish
	unloadspritegfx ANIM_TAG_PURPLE_SCRATCH
	loadspritegfx ANIM_TAG_PURPLE_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 4
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gRevengeBigScratchSpriteTemplate, ANIM_TARGET, 2, 10, -10
	waitforvisualfinish
	unloadspritegfx ANIM_TAG_PURPLE_SWIPE
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 10, 1
	createsprite gPersistHitSplatSpriteTemplate, ANIM_TARGET, 3, -10, -8, ANIM_TARGET, 1, 8
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 8
	createsprite gPersistHitSplatSpriteTemplate, ANIM_TARGET, 3, 10, 8, ANIM_TARGET, 1, 8
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_POISON_FANG:
	loadspritegfx ANIM_TAG_FANG_ATTACK
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	playsewithpan SE_M_BITE, SOUND_PAN_TARGET
	createsprite gFangSpriteTemplate, ANIM_TARGET, 2
	delay 10
	createvisualtask AnimTask_ShakeMon, 3, ANIM_TARGET, 3, 0, 10, 1
	waitforvisualfinish
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 0, 4, 0, 12, RGB(26, 0, 26)
	call PoisonBubblesEffect
	waitforvisualfinish
	end

Move_SUBSTITUTE:
	playsewithpan SE_M_ATTRACT, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_MonToSubstitute, 2
	end

Move_GRASS_PLEDGE:
	loadspritegfx ANIM_TAG_WEED_SMALL
	loadspritegfx ANIM_TAG_MIST_CLOUD
	createsprite gGrassPledgeSpriteTemplate, ANIM_TARGET, 2, 0, -5, 10, 2, -1
	playsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	delay 14
	playsewithpan SE_M_BUBBLE2, SOUND_PAN_ATTACKER
	delay 14
	playsewithpan SE_M_BUBBLE2, 0
	delay 20
	playsewithpan SE_M_BUBBLE2, SOUND_PAN_TARGET
	waitforvisualfinish
	monbg ANIM_TARGET
	setalpha 12, 8
	loopsewithpan SE_M_MIST, SOUND_PAN_TARGET, 20, 15
	
	createsprite gMistCloudSpriteTemplate, ANIM_TARGET, 2, 0, 24, -48, 240, 1, 1
	delay 7
	createsprite gMistCloudSpriteTemplate, ANIM_TARGET, 2, 0, 24, -48, 240, 1, 1
	delay 7
	createsprite gMistCloudSpriteTemplate, ANIM_TARGET, 2, 0, 24, -48, 240, 1, 1
	delay 7
	createsprite gMistCloudSpriteTemplate, ANIM_TARGET, 2, 0, 24, -48, 240, 1, 1
	delay 7
	createsprite gMistCloudSpriteTemplate, ANIM_TARGET, 2, 0, 24, -48, 240, 1, 1
	delay 7
	createsprite gMistCloudSpriteTemplate, ANIM_TARGET, 2, 0, 24, -48, 240, 1, 1
	delay 7
	createsprite gMistCloudSpriteTemplate, ANIM_TARGET, 2, 0, 24, -48, 240, 1, 1
	delay 7
	delay 32
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 8, 2, 0, 14, RGB_GREEN
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_METAL_SOUND:
	loadspritegfx ANIM_TAG_METAL_SOUND_WAVES
	monbg ANIM_DEF_PARTNER
	splitbgprio_foes ANIM_TARGET
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 2, 0, 8, 1
	call MetalSoundRings
	call MetalSoundRings
	call MetalSoundRings
	call MetalSoundRings
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	delay 0
	waitforvisualfinish
	end

MetalSoundRings:
	panse SE_M_SCREECH, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	createsprite gMetalSoundSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 30, 0
	delay 2
	return

Move_FOCUS_PUNCH:
	goto FocusPunch

FocusPunchEnd:
	waitforvisualfinish
	end

FocusPunch:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	delay 1
	createvisualtask AnimTask_IsContest, 2
	jumprettrue FocusPunchInContest
	createvisualtask AnimTask_IsTargetPlayerSide, 2
	jumpretfalse FocusPunchOnOpponent
	jumprettrue FocusPunchOnPlayer
FocusPunchContinue:
	waitbgfadein
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gFocusPunchFistSpriteTemplate, ANIM_TARGET, 2
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 8, 0, 24, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 2, ANIM_TARGET, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, -6, ANIM_TARGET, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 8, ANIM_TARGET, 0
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	waitforvisualfinish
	restorebg
	waitbgfadein
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto FocusPunchEnd

FocusPunchOnOpponent:
	fadetobg BG_IMPACT_OPPONENT
	goto FocusPunchContinue

FocusPunchOnPlayer:
	fadetobg BG_IMPACT_PLAYER
	goto FocusPunchContinue

FocusPunchInContest:
	fadetobg BG_IMPACT_CONTESTS
	goto FocusPunchContinue

Move_RETURN:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_GetReturnPowerLevel, 2
	delay 2
	jumpreteq 0, ReturnWeak
	jumpreteq 1, ReturnMedium
	jumpreteq 2, ReturnStrong
	jumpreteq 3, ReturnStrongest
ReturnContinue:
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

ReturnWeak:
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 16, 1, ANIM_ATTACKER
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 16, 1, ANIM_ATTACKER
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, ANIM_TARGET, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	goto ReturnContinue

ReturnMedium:
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, ANIM_ATTACKER
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, ANIM_ATTACKER
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	waitforvisualfinish
	delay 11
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 5, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	goto ReturnContinue

ReturnStrong:
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, ANIM_ATTACKER
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, ANIM_ATTACKER
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, ANIM_ATTACKER
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, ANIM_ATTACKER
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, ANIM_TARGET, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 6, 0, 8, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, ANIM_TARGET, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 6, 0, 8, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 3, -5, ANIM_TARGET, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 6, 0, 8, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -5, 3, ANIM_TARGET, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 6, 0, 8, 1
	goto ReturnContinue

ReturnStrongest:
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 0, 6, RGB_BLACK
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 16, 1, ANIM_ATTACKER
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 3, -5, ANIM_TARGET, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 12, 1, ANIM_ATTACKER
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, ANIM_TARGET, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 6, 0, 8, 1
	waitforvisualfinish
	delay 4
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, ANIM_ATTACKER
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, ANIM_TARGET, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 6, 0, 8, 1
	waitforvisualfinish
	delay 2
	createvisualtask AnimTask_TraceMonBlended, 2, 0, 4, 5, 1
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 4, 1, ANIM_ATTACKER
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, ANIM_TARGET, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 6, 0, 8, 1
	createvisualtask AnimTask_TraceMonBlended, 2, 0, 4, 5, 1
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 4, 2, ANIM_ATTACKER
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, ANIM_TARGET, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 6, 0, 8, 1
	createvisualtask AnimTask_TraceMonBlended, 2, 0, 4, 5, 1
	waitforvisualfinish
	call ReturnStrongestHit
	call ReturnStrongestHit
	call ReturnStrongestHit
	call ReturnStrongestHit
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, ANIM_TARGET, 0
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 8, 0, 24, 1
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, ANIM_TARGET, 0
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 3, -5, ANIM_TARGET, 0
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -5, 3, ANIM_TARGET, 0
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 6, 0, RGB_BLACK
	goto ReturnContinue

ReturnStrongestHit:
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 4, 3, ANIM_ATTACKER
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 6, 0, 8, 1
	createvisualtask AnimTask_TraceMonBlended, 2, 0, 4, 5, 1
	waitforvisualfinish
	return

Move_COSMIC_POWER:
	loadspritegfx ANIM_TAG_SPARKLE_2
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_COSMIC_POWER, 0
	playsewithpan SE_M_COSMIC_POWER, 0
	createvisualtask AnimTask_BlendNonAttackerPalettes, 2, 0, 0, 15, RGB_BLACK
	waitforvisualfinish
	fadetobg BG_COSMIC
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 2, 0, 128, 0, -1
	waitbgfadein
	delay 70
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MORNING_SUN, SOUND_PAN_ATTACKER
	createsprite gGrantingStarsSpriteTemplate, ANIM_ATTACKER, 2, -15, 0, 0, 0, 32, 60
	delay 8
	createsprite gGrantingStarsSpriteTemplate, ANIM_ATTACKER, 2, 12, -5, 0, 0, 32, 60
	delay 40
	createvisualtask AnimTask_BlendNonAttackerPalettes, 2, 0, 15, 0, RGB_BLACK
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, 0xFFFF
	waitbgfadein
	waitforvisualfinish
	end

Move_FIRE_PLEDGE:
	loadspritegfx ANIM_TAG_FIRE_PLUME
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_SACRED_FIRE, SOUND_PAN_TARGET
	createsprite gFirePlumeUnanchoredSpriteTemplate, ANIM_TARGET, 2, -16, 16, 24, 0, 0, 0, 0, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 6, 0, 8, 1
	delay 10
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	createsprite gFirePlumeUnanchoredSpriteTemplate, ANIM_TARGET, 2,  16, 16, 24, 0, 0, 0, 0, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 10, 0, 12, 1
	delay 10
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	createsprite gFirePlumeUnanchoredSpriteTemplate, ANIM_TARGET, 2,   0, 16, 24, 0, 0, 0, 0, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 12, 0, 20, 1

	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end


Move_ROCK_TOMB:
	loadspritegfx ANIM_TAG_X_SIGN
	loadspritegfx ANIM_TAG_ROCKS
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 2, 0, 10, 1
	waitforvisualfinish
	createsprite gRockTombRockSpriteTemplate, ANIM_TARGET, 2, 20, 12, 64, 114, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET
	delay 8
	createsprite gRockTombRockSpriteTemplate, ANIM_TARGET, 2, -20, 12, 64, 98, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET
	delay 8
	createsprite gRockTombRockSpriteTemplate, ANIM_TARGET, 66, 3, 6, 64, 82, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET
	delay 8
	createsprite gRockTombRockSpriteTemplate, ANIM_TARGET, 2, -3, 13, 64, 66, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET
	delay 24
	playsewithpan SE_M_HYPER_BEAM, SOUND_PAN_TARGET
	createsprite gRedXSpriteTemplate, ANIM_TARGET, 5, ANIM_TARGET, 50
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 20, 1
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 2, 0, 10, 1
	waitforvisualfinish
	end

Move_SILVER_WIND:
	loadspritegfx ANIM_TAG_SPARKLE_6
	panse SE_M_GUST, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	playsewithpan SE_M_MORNING_SUN, 0
	delay 0
	monbg ANIM_DEF_PARTNER
	splitbgprio_all
	delay 0
	createvisualtask AnimTask_BlendBattleAnimPalExclude, 10, ANIM_TARGET, 0, 0, 4, RGB_BLACK
	createvisualtask AnimTask_GetTargetSide, 2
	jumprettrue SilverWindOnPlayer
	fadetobg BG_BUG_OPPONENT
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, 1536, 0, 0, -1
SilverWindContinue:
	delay 0
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 4, 4, RGB_BLACK
	waitbgfadein
	createsprite gSilverWindBigSparkSpriteTemplate, ANIM_TARGET, 66, -32, 16, 0, 6, 2, 3, 1
	createsprite gSilverWindBigSparkSpriteTemplate, ANIM_TARGET, 66, -8, 18, 64, 3, 2, 2, 1
	createsprite gSilverWindBigSparkSpriteTemplate, ANIM_ATTACKER, 120, -24, 18, 90, 5, 1, 2, 1
	createsprite gSilverWindBigSparkSpriteTemplate, ANIM_ATTACKER, 120, -40, 14, 128, 4, 1, 2, 1
	delay 0
	createsprite gSilverWindMediumSparkSpriteTemplate, ANIM_TARGET, 66, -32, 16, 0, 6, 2, 3, 1
	createsprite gSilverWindMediumSparkSpriteTemplate, ANIM_TARGET, 66, -8, 18, 64, 3, 2, 2, 1
	createsprite gSilverWindMediumSparkSpriteTemplate, ANIM_ATTACKER, 120, -24, 18, 90, 5, 1, 2, 1
	createsprite gSilverWindMediumSparkSpriteTemplate, ANIM_ATTACKER, 120, -40, 14, 128, 4, 1, 2, 1
	delay 0
	createsprite gSilverWindSmallSparkSpriteTemplate, ANIM_TARGET, 66, -32, 16, 0, 6, 2, 3, 1
	createsprite gSilverWindSmallSparkSpriteTemplate, ANIM_TARGET, 66, -8, 18, 64, 3, 2, 2, 1
	createsprite gSilverWindSmallSparkSpriteTemplate, ANIM_ATTACKER, 120, -24, 18, 90, 5, 1, 2, 1
	createsprite gSilverWindSmallSparkSpriteTemplate, ANIM_ATTACKER, 120, -40, 14, 128, 4, 1, 2, 1
	delay 6
	createsprite gSilverWindBigSparkSpriteTemplate, ANIM_TARGET, 66, -4, 16, 0, 6, 1, 2, 1
	createsprite gSilverWindBigSparkSpriteTemplate, ANIM_TARGET, 66, -16, 12, 192, 5, 2, 3, 1
	delay 0
	createsprite gSilverWindMediumSparkSpriteTemplate, ANIM_TARGET, 66, -4, 16, 0, 6, 1, 2, 1
	createsprite gSilverWindMediumSparkSpriteTemplate, ANIM_TARGET, 66, -16, 12, 192, 5, 2, 3, 1
	delay 0
	createsprite gSilverWindSmallSparkSpriteTemplate, ANIM_TARGET, 66, -4, 16, 0, 6, 1, 2, 1
	createsprite gSilverWindSmallSparkSpriteTemplate, ANIM_TARGET, 66, -16, 12, 192, 5, 2, 3, 1
	waitforvisualfinish
	playsewithpan SE_M_GUST2, SOUND_PAN_TARGET
	clearmonbg ANIM_DEF_PARTNER
	delay 0
	restorebg
	waitbgfadeout
	createvisualtask AnimTask_BlendBattleAnimPalExclude, 10, ANIM_TARGET, 0, 4, 0, RGB_BLACK
	setarg 7, 0xFFFF
	waitbgfadein
	end

SilverWindOnPlayer:
	fadetobg BG_BUG_PLAYER
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -1536, 0, 0, -1
	goto SilverWindContinue

Move_SNATCH:
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_WindUpLunge, 5, ANIM_ATTACKER, -12, 4, 10, 10, 12, 6
	end

Move_DIVE:
	loadspritegfx ANIM_TAG_SPLASH
	loadspritegfx ANIM_TAG_SWEAT_BEAD
	choosetwoturnanim DiveSetUp, DiveAttack

DiveSetUp:
	loadspritegfx ANIM_TAG_ROUND_SHADOW
	playsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER
	createsprite gDiveBallSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 13, 336
	waitforvisualfinish
	playsewithpan SE_M_DIVE, SOUND_PAN_ATTACKER
	createsprite gDiveWaterSplashSpriteTemplate, ANIM_ATTACKER, 3, 0
	call DiveSetUpWaterDroplets
	call DiveSetUpWaterDroplets
	call DiveSetUpWaterDroplets
	call DiveSetUpWaterDroplets
	call DiveSetUpWaterDroplets
	end

DiveSetUpWaterDroplets:
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_ATTACKER, 5, 0, 0
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_ATTACKER, 5, 1, 0
	return

DiveAttack:
	loadspritegfx ANIM_TAG_WATER_IMPACT
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_TARGET
	createsprite gDiveWaterSplashSpriteTemplate, ANIM_TARGET, 3, 1
	call DiveAttackWaterDroplets
	call DiveAttackWaterDroplets
	call DiveAttackWaterDroplets
	call DiveAttackWaterDroplets
	call DiveAttackWaterDroplets
	delay 12
	call RisingWaterHitEffect
	waitforvisualfinish
	visible ANIM_ATTACKER
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

DiveAttackWaterDroplets:
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 0, 1
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 1, 1
	return

Move_BOFFA:
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 3
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	createsprite gRockBlastRockSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 25, 257
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	createsprite gRockFragmentSpriteTemplate, ANIM_TARGET, 2, 0, 0, 20, 24, 14, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 5, 1
	createsprite gRockFragmentSpriteTemplate, ANIM_TARGET, 2, 5, 0, -20, 24, 14, 1
	createsprite gRockFragmentSpriteTemplate, ANIM_TARGET, 2, 0, 5, 20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_TARGET, 2, -5, 0, -20, -24, 14, 2
	waitforvisualfinish
	end

Move_OVERHEAT:
	loadspritegfx ANIM_TAG_GLOWY_RED_ORB
	loadspritegfx ANIM_TAG_GLOWY_GREEN_ORB
	loadspritegfx ANIM_TAG_DUCK
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 25, 1
	delay 6
	panse SE_M_BUBBLE_BEAM, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +1, 0
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 25, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_TARGET, 8, 5, RGB_RED, 8, RGB(1, 30, 0), 8
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	waitforvisualfinish
	end

HydroCannonBeam:
	createsprite gHydroCannonBeamSpriteTemplate, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gHydroCannonBeamSpriteTemplate, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gHydroCannonBeamSpriteTemplate, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gHydroCannonBeamSpriteTemplate, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gHydroCannonBeamSpriteTemplate, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	return

Move_WATER_PLEDGE:
	loadspritegfx ANIM_TAG_WATER_IMPACT
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 10, 0, 12, 1
	call WaterPledgeEffectLeft
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 10, 0, 12, 1
	call WaterPledgeEffectRight
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 10, 0, 12, 1
	call WaterPledgeEffectMiddle
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end


WaterPledgeEffectLeft:
	playsewithpan SE_M_WATERFALL, SOUND_PAN_TARGET
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -16, 15, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, -16, 15
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, -16, 15
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -16, 10, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, -16, 10
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, -16, 10
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -16, 5, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, -16, 5
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, -16, 5
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -16, 0, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, -16, 0
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, -16, 0
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -16, -5, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, -16, -5
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, -16, -5
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -16, -10, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, -16, -10
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, -16, -10
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -16, -15, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, -16, -15
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, -16, -15
    return

WaterPledgeEffectMiddle:
	playsewithpan SE_M_WATERFALL, SOUND_PAN_TARGET
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 15, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 15
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 15
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 10, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 10
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 10
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 5
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 5
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -5, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -5
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -5
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -10, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -10
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -10
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -15
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -15
    return

WaterPledgeEffectRight:
	playsewithpan SE_M_WATERFALL, SOUND_PAN_TARGET
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 16, 15, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 16, 15
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 16, 15
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 16, 10, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 16, 10
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 16, 10
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 16, 5, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 16, 5
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 16, 5
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 16, 0, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 16, 0
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 16, 0
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 16, -5, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 16, -5
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 16, -5
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 16, -10, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 16, -10
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 16, -10
    delay 2
    createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 16, -15, ANIM_TARGET, 1
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 16, -15
    createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 16, -15
	return

Move_ASTONISH:
	loadspritegfx ANIM_TAG_SWEAT_BEAD
	playsewithpan SE_M_ENCORE, SOUND_PAN_ATTACKER
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 25
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 0, 1
	playsewithpan SE_M_SKETCH, SOUND_PAN_TARGET
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 5, 1
	createvisualtask AnimTask_StretchTargetUp, 3
	waitforvisualfinish
	end

Move_SEISMIC_TOSS:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ROCKS
	setarg 7, 0
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	waitforvisualfinish
	createvisualtask AnimTask_GetSeismicTossDamageLevel, 3
	delay 1
	fadetobg BG_IN_AIR
	waitbgfadeout
	createvisualtask AnimTask_MoveSeismicTossBg, 3
	playsewithpan SE_M_SKY_UPPERCUT, 0
	waitbgfadein
	waitforvisualfinish
	createvisualtask AnimTask_SeismicTossBgAccelerateDownAtEnd, 3
	jumpreteq 0, SeismicTossWeak
	jumpreteq 1, SeismicTossMedium
	jumpreteq 2, SeismicTossStrong
SeismicTossContinue:
	restorebg
	waitbgfadeout
	setarg 7, 0xFFF
	waitbgfadein
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

SeismicTossWeak:
	call SeismicTossRockScatter1
	delay 16
	call SeismicTossRockScatter2
	goto SeismicTossContinue

SeismicTossMedium:
	call SeismicTossRockScatter1
	delay 14
	call SeismicTossRockScatter2
	delay 14
	call SeismicTossRockScatter1
	goto SeismicTossContinue

SeismicTossStrong:
	call SeismicTossRockScatter2
	delay 10
	call SeismicTossRockScatter1
	delay 10
	call SeismicTossRockScatter2
	delay 10
	call SeismicTossRockScatter1
	goto SeismicTossContinue

SeismicTossRockScatter1:
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -10, -8, ANIM_TARGET, 1
	playsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 5, 1
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, -12, 27, 2, 3
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, 8, 28, 3, 4
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, -4, 30, 2, 3
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, 12, 25, 4, 4
	return

SeismicTossRockScatter2:
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 10, -8, ANIM_TARGET, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 5, 1
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, -12, 32, 3, 4
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, 8, 31, 2, 2
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, -4, 28, 2, 3
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, 12, 30, 4, 3
	return

Move_MAGIC_COAT:
	loadspritegfx ANIM_TAG_ORANGE_LIGHT_WALL
	setalpha 0, 16
	waitplaysewithpan SE_M_BARRIER, SOUND_PAN_ATTACKER, 15
	createsprite gMagicCoatWallSpriteTemplate, ANIM_ATTACKER, 3, 40, 0, ANIM_TAG_ORANGE_LIGHT_WALL
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_WATER_PULSE:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_BLUE_RING_2
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 0, 7, RGB(0, 25, 28)
	delay 10
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 100, 100, 8, 1, 20, 40, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 20, 100, 16, 2, 10, 35, 1
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 200, 80, 8, 1, 40, 20, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 80, 60, 10, 3, 20, 50, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 140, 100, 16, 1, 20, 30, 1
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	waitforvisualfinish
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 5
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 5
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 13
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 8, 18, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 7, 0, RGB(0, 25, 28)
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_SLUSH_RUSH:
	fadetobg BG_ICE
	waitbgfadeout
	playsewithpan SE_M_ICY_WIND, 0
	waitbgfadein
	loadspritegfx ANIM_TAG_ICE_CUBE
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_FrozenIceCube, 2
	waitplaysewithpan SE_M_HAIL, SOUND_PAN_TARGET, 17
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	restorebg
	waitbgfadein
	end


Move_HEART_SWAP:
	end

Move_KNOCK_OFF:
	loadspritegfx ANIM_TAG_SLAM_HIT_2
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 4
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_TARGET
	createsprite gKnockOffStrikeSpriteTemplate, ANIM_TARGET, 2, -16, -16
	delay 8
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 5, 1, RGB_WHITE, 10, RGB_BLACK, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 2
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -12, 10, 0, 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	delay 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 0, 3, 6, 1
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6
	delay 10
	waitforvisualfinish
	end

Move_DOOM_DESIRE:
	createvisualtask GetIsDoomDesireHitTurn, 2
	delay 1
	monbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, ANIM_TARGET, FALSE
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 0, 4, RGB_BLACK
	waitforvisualfinish
	setalpha 8, 8
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, ANIM_ATTACKER, 1
	waitforvisualfinish
	delay 20
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, ANIM_TARGET, TRUE
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 4, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

UnusedDoomDesireHit:
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 0, 16, RGB_WHITE
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_DoomDesireLightBeam, 5
	delay 5
	playsewithpan SE_M_CONFUSE_RAY, SOUND_PAN_ATTACKER
	delay 10
	playsewithpan SE_M_CONFUSE_RAY, 0
	delay 10
	playsewithpan SE_M_CONFUSE_RAY, SOUND_PAN_TARGET
	delay 23
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 10, 0, 20, 1
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 1, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 16, 0, RGB_WHITE
	waitforvisualfinish
	end

Move_SKY_UPPERCUT:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	fadetobg BG_IN_AIR
	waitbgfadeout
	playsewithpan SE_M_SKY_UPPERCUT, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_MoveSkyUppercutBg, 5, 55
	waitbgfadein
	setalpha 12, 8
	delay 38
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 0, 0, 5
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -28, 28, ANIM_TARGET, 1
	delay 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -15, 8, ANIM_TARGET, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -5, -12, ANIM_TARGET, 1
	delay 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, -32, ANIM_TARGET, 1
	delay 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 5, -52, ANIM_TARGET, 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -26, 16, 1, 4
	delay 4
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 0, 3, 6, 1
	delay 30
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 6
	delay 4
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	restorebg
	waitbgfadeout
	setarg 7, 0xFFFF
	waitbgfadein
	end

Move_SECRET_POWER:
	createvisualtask AnimTask_GetBattleTerrain, 5
	jumpargeq 0, BATTLE_TERRAIN_GRASS,      Move_NEEDLE_ARM
	jumpargeq 0, BATTLE_TERRAIN_LONG_GRASS, Move_MAGICAL_LEAF
	jumpargeq 0, BATTLE_TERRAIN_SAND,       Move_MUD_SHOT
	jumpargeq 0, BATTLE_TERRAIN_UNDERWATER, Move_WATERFALL
	jumpargeq 0, BATTLE_TERRAIN_WATER,      Move_SURF
	jumpargeq 0, BATTLE_TERRAIN_POND,       Move_BUBBLE_BEAM
	jumpargeq 0, BATTLE_TERRAIN_MOUNTAIN,   Move_ROCK_THROW
	jumpargeq 0, BATTLE_TERRAIN_CAVE,       Move_BITE
	jumpargeq 0, BATTLE_TERRAIN_BUILDING,   Move_STRENGTH
	goto Move_SLAM

Move_TWISTER:
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ROCKS
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	playsewithpan SE_M_TWISTER, SOUND_PAN_TARGET
	createsprite gTwisterLeafSpriteTemplate, ANIM_TARGET, 2, 120, 70, 5, 70, 30
	delay 1
	createsprite gTwisterLeafSpriteTemplate, ANIM_TARGET, 2, 115, 55, 6, 60, 25
	delay 1
	createsprite gTwisterLeafSpriteTemplate, ANIM_TARGET, 2, 115, 60, 7, 60, 30
	createsprite gTwisterLeafSpriteTemplate, ANIM_TARGET, 2, 115, 55, 10, 60, 30
	delay 3
	createsprite gTwisterRockSpriteTemplate, ANIM_TARGET, 2, 100, 50, 4, 50, 26
	delay 1
	createsprite gTwisterLeafSpriteTemplate, ANIM_TARGET, 2, 105, 25, 8, 60, 20
	delay 1
	createsprite gTwisterLeafSpriteTemplate, ANIM_TARGET, 2, 115, 40, 10, 48, 30
	delay 3
	createsprite gTwisterRockSpriteTemplate, ANIM_TARGET, 2, 120, 30, 6, 45, 25
	createsprite gTwisterLeafSpriteTemplate, ANIM_TARGET, 2, 115, 35, 10, 60, 30
	delay 3
	createsprite gTwisterRockSpriteTemplate, ANIM_TARGET, 2, 105, 20, 8, 40, 0
	delay 3
	createsprite gTwisterLeafSpriteTemplate, ANIM_TARGET, 2, 20, 255, 15, 32, 0
	createsprite gTwisterLeafSpriteTemplate, ANIM_TARGET, 2, 110, 10, 8, 32, 20
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -32, -16, ANIM_TARGET, 3
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 3, 0, 12, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_DEF_PARTNER, 3, 0, 12, 1
	delay 4
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 3
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	delay 4
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 3
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 32, 20, ANIM_TARGET, 3
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_MAGICAL_LEAF:
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_RAZOR_LEAF
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 1
	loopsewithpan SE_M_POISON_POWDER, SOUND_PAN_ATTACKER, 10, 5
	createvisualtask AnimTask_CycleMagicalLeafPal, 5
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -2, 10
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -1, 15
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -4, -4, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 3, -3, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -6, 8
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -1, 12
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -4, 13
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 4, -5, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -6, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -5, 8
	delay 60
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 32, 20, 0
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 32, -20, 0
	delay 30
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -10, -4, ANIM_TARGET, 2
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, 10, 4, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	delay 20
	setarg 7, 0xFFFF
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_ICE_BALL:
	loadspritegfx ANIM_TAG_ICE_CHUNK
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	createvisualtask AnimTask_GetRolloutCounter, 5, 0
	jumpargeq 0, 4, IceBallSetIceBg
IceBallContinue:
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_ATTACKER
	createsprite gIceBallChunkSpriteTemplate, ANIM_TARGET, 2, 15, 0, -12, -16, 30, -40
	delay 28
	playsewithpan SE_M_BRICK_BREAK, SOUND_PAN_TARGET
	createvisualtask AnimTask_GetRolloutCounter, 5, 0
	jumpargeq 0, 0, IceBallWeakest
	jumpargeq 0, 1, IceBallWeak
	jumpargeq 0, 2, IceBallMediun
	jumpargeq 0, 3, IceBallStrong
	jumpargeq 0, 4, IceBallStrongest
IceBallContinue2:
	createvisualtask AnimTask_GetRolloutCounter, 5, 0
	jumpargeq 0, 4, IceBallUnsetIceBg
IceBallEnd:
	end

IceBallSetIceBg:
	fadetobg BG_ICE
	goto IceBallContinue

IceBallUnsetIceBg:
	waitbgfadein
	delay 45
	restorebg
	waitbgfadein
	goto IceBallEnd

IceBallWeakest:
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, FALSE, 1, 8, 1, 0
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	goto IceBallContinue2

IceBallWeak:
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, FALSE, 1, 10, 1, 0
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	goto IceBallContinue2

IceBallMediun:
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, FALSE, 1, 14, 1, 0
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	goto IceBallContinue2

IceBallStrong:
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, FALSE, 1, 18, 1, 0
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	goto IceBallContinue2

IceBallStrongest:
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, FALSE, 1, 30, 1, 0
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	goto IceBallContinue2

IceBallImpactShard:
	createsprite gIceBallImpactShardSpriteTemplate, ANIM_TARGET, 4, -12, -16
	return

Move_WEATHER_BALL:
	loadspritegfx ANIM_TAG_WEATHER_BALL
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, ANIM_ATTACKER
	delay 8
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	createsprite gWeatherBallUpSpriteTemplate, ANIM_ATTACKER, 2
	waitforvisualfinish
	delay 15
	playsewithpan SE_M_DETECT, 0
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 5, 1, RGB_WHITE, 10, RGB_BLACK, 0
	waitforvisualfinish
	createvisualtask AnimTask_GetWeather, 2
	delay 1
	jumpreteq ANIM_WEATHER_NONE, WeatherBallNormal
	jumpreteq ANIM_WEATHER_SUN, WeatherBallFire
	jumpreteq ANIM_WEATHER_RAIN, WeatherBallWater
	jumpreteq ANIM_WEATHER_SANDSTORM, WeatherBallSandstorm
	jumpreteq ANIM_WEATHER_HAIL, WeatherBallIce
WeatherBallNormal:
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gWeatherBallNormalDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, 0, 0
	waitforvisualfinish
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -10, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 8, 1
	waitforvisualfinish
	end

WeatherBallFire:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	createsprite gWeatherBallFireDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, 40, 10
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_TARGET
	delay 10
	createsprite gWeatherBallFireDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, -40, 20
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_TARGET
	delay 10
	createsprite gWeatherBallFireDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, 0, 0
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_TARGET
	waitforvisualfinish
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 8, 1
	waitforvisualfinish
	end

WeatherBallWater:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	createsprite gWeatherBallWaterDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, 50, 10
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET
	delay 8
	createsprite gWeatherBallWaterDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, -20, 20
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET
	delay 13
	createsprite gWeatherBallWaterDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, 0, 0
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 8, 1
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_TARGET
	waitforvisualfinish
	end

WeatherBallSandstorm:
	loadspritegfx ANIM_TAG_ROCKS
	createsprite gWeatherBallRockDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, 30, 0
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 5
	createsprite gWeatherBallRockDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, -40, 20
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 14
	createsprite gWeatherBallRockDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, 0, 0
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	waitforvisualfinish
	playsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, -12, 27, 2, 3
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, 8, 28, 3, 4
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, -4, 30, 2, 3
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, 12, 25, 4, 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	waitforvisualfinish
	end

WeatherBallIce:
	loadspritegfx ANIM_TAG_HAIL
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	createsprite gWeatherBallIceDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 25, -40, 20
	playsewithpan SE_M_HAIL, SOUND_PAN_TARGET
	delay 10
	createsprite gWeatherBallIceDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 25, 40, 0
	playsewithpan SE_M_HAIL, SOUND_PAN_TARGET
	delay 10
	createsprite gWeatherBallIceDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 25, 0, 0
	playsewithpan SE_M_HAIL, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	call IceCrystalEffectShort
	waitforvisualfinish
	end

Move_COUNT:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

IceCrystalEffectShort:
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, -10, -10, 0
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 10, 20, 0
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, -5, 10, 0
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 17, -12, 0
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, -15, 15, 0
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, 20, 2, 0
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	return

IceCrystalEffectLong:
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, -10, -10, 1
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 10, 20, 1
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, -29, 0, 1
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 29, -20, 1
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, -5, 10, 1
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 17, -12, 1
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, -20, 0, 1
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, -15, 15, 1
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 26, -5, 1
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, 20, 2, 1
	playsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET
	return

IceSpikesEffectShort: @ Unused
	loopsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET, 6, 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 0, 24, 0
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 8, 24, 0
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -8, 24, 0
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 16, 24, 0
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -16, 24, 0
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 24, 24, 0
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -24, 24, 0
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 32, 24, 0
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -32, 24, 0
	return

IceSpikesEffectLong:
	loopsewithpan SE_M_ICY_WIND, SOUND_PAN_TARGET, 6, 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 0, 24, 1
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 8, 24, 1
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -8, 24, 1
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 16, 24, 1
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -16, 24, 1
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 24, 24, 1
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -24, 24, 1
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 32, 24, 1
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -32, 24, 1
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 40, 24, 1
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -40, 24, 1
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 48, 24, 1
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -48, 24, 1
	return

GrantingStarsEffect:
	createsprite gGrantingStarsSpriteTemplate, ANIM_ATTACKER, 2, -15, 0, 0, 0, 32, 60
	delay 8
	createsprite gGrantingStarsSpriteTemplate, ANIM_ATTACKER, 2, 12, -5, 0, 0, 32, 60
	delay 8
	return

HealingEffect:
	playsewithpan SE_M_ABSORB_2, SOUND_PAN_ATTACKER
	createsprite gHealingBlueStarSpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 0, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_ATTACKER, 2, -15, 10, 0, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_ATTACKER, 2, -15, -15, 0, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_ATTACKER, 2, 10, -5, 0, 0
	delay 7
	return

HealingEffect2:
	playsewithpan SE_M_ABSORB_2, SOUND_PAN_TARGET
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, 0, -5, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, -15, 10, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, -15, -15, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, 10, -5, 1, 0
	delay 7
	return

PoisonBubblesEffect:
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 10, 10, 0
	playsewithpan SE_M_TOXIC, SOUND_PAN_TARGET
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, -20, 0
	playsewithpan SE_M_TOXIC, SOUND_PAN_TARGET
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, -20, 15, 0
	playsewithpan SE_M_TOXIC, SOUND_PAN_TARGET
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0
	playsewithpan SE_M_TOXIC, SOUND_PAN_TARGET
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, -20, -20, 0
	playsewithpan SE_M_TOXIC, SOUND_PAN_TARGET
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 16, -8, 0
	playsewithpan SE_M_TOXIC, SOUND_PAN_TARGET
	return

WaterBubblesEffectShort:
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 20, -20, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -20, 15, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -20, -20, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 16, -8, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	return

WaterBubblesEffectLong:
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 1
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -28, -10, 1
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 20, -20, 1
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -20, 15, 1
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 27, 8, 1
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -20, -20, 1
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 16, -8, 1
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	return

ElectricityEffect:
	playsewithpan SE_M_THUNDERBOLT2, SOUND_PAN_TARGET
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 5, 0, 5, 0
	delay 2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, -5, 10, 5, 1
	delay 2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 15, 20, 5, 2
	delay 2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, -15, -10, 5, 0
	delay 2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 25, 0, 5, 1
	delay 2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, -8, 8, 5, 2
	delay 2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 2, -8, 5, 0
	delay 2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, -20, 15, 5, 1
	return

ConfusionEffect:
	loopsewithpan SE_M_DIZZY_PUNCH, SOUND_PAN_TARGET, 13, 6
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 0, 3, 90
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 51, 3, 90
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 102, 3, 90
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 153, 3, 90
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 204, 3, 90
	return

SetPsychicBackground:
	fadetobg BG_PSYCHIC
	waitbgfadeout
	createvisualtask AnimTask_SetPsychicBackground, 5
	waitbgfadein
	return

UnsetPsychicBackground:
	restorebg
	waitbgfadeout
	setarg 7, 0xFFFF
	waitbgfadein
	return

SetSkyBg:
	jumpifcontest SetSkyBgContest
	fadetobg BG_SKY
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -2304, 768, 1, -1
SetSkyBgContinue:
	waitbgfadein
	return

SetSkyBgContest:
	fadetobg BG_SKY_CONTESTS
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, 2304, 768, 0, -1
	goto SetSkyBgContinue

UnsetSkyBg:
	restorebg
	waitbgfadeout
	setarg 7, 0xFFFF
	waitbgfadein
	return

SetSolarBeamBg:
	createvisualtask AnimTask_IsContest, 2
	jumprettrue SetSolarBeamBgContest
	createvisualtask AnimTask_IsTargetPlayerSide, 2
	jumpretfalse SetSolarBeamBgOpponent
	goto SetSolarBeamBgPlayer

SetSolarBeamBgContinue:
	waitbgfadein
	return

SetSolarBeamBgContest:
	fadetobg BG_SOLAR_BEAM_CONTESTS
	goto SetSolarBeamBgContinue

SetSolarBeamBgPlayer:
	fadetobg BG_SOLAR_BEAM_PLAYER
	goto SetSolarBeamBgContinue

SetSolarBeamBgOpponent:
	fadetobg BG_SOLAR_BEAM_OPPONENT
	goto SetSolarBeamBgContinue

UnsetSolarBeamBg:
	restorebg
	waitbgfadein
	return

Status_Poison:
	loopsewithpan SE_M_TOXIC, SOUND_PAN_TARGET, 13, 6
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 18, 2
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 2, 2, 0, 12, RGB(30, 0, 31)
	end

Status_Confusion:
	loadspritegfx ANIM_TAG_DUCK
	call ConfusionEffect
	end

Status_Burn:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_TARGET
	call BurnFlame
	call BurnFlame
	call BurnFlame
	waitforvisualfinish
	end

BurnFlame:
	createsprite gBurnFlameSpriteTemplate, ANIM_TARGET, 2, -24, 24, 24, 24, 20, 1, 1
	delay 4
	return

Status_Infatuation:
	loadspritegfx ANIM_TAG_MAGENTA_HEART
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 0, 20
	delay 15
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, -20, 20
	delay 15
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 20, 20
	end

Status_Sleep:
	loadspritegfx ANIM_TAG_LETTER_Z
	playsewithpan SE_M_SNORE, SOUND_PAN_ATTACKER
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	delay 30
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	end

Status_Paralysis:
	loadspritegfx ANIM_TAG_SPARK_2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 10, 1
	call ElectricityEffect
	end

Status_Freeze:
	playsewithpan SE_M_ICY_WIND, 0
	loadspritegfx ANIM_TAG_ICE_CUBE
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	waitplaysewithpan SE_M_HAIL, SOUND_PAN_TARGET, 17
	createvisualtask AnimTask_FrozenIceCube, 2
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Status_Curse:
	loadspritegfx ANIM_TAG_GHOSTLY_SPIRIT
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_NIGHTMARE, SOUND_PAN_TARGET
	createsprite gCurseGhostSpriteTemplate, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 14, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Status_Nightmare:
	loadspritegfx ANIM_TAG_DEVIL
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_NIGHTMARE, SOUND_PAN_TARGET
	createsprite gNightmareDevilSpriteTemplate, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 14, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

General_CastformChange:
	createvisualtask AnimTask_IsMonInvisible, 2
	jumpreteq TRUE, CastformChangeSkipAnim
	goto CastformChangeContinue

CastformChangeContinue:
	monbg ANIM_ATTACKER
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_MINIMIZE, SOUND_PAN_ATTACKER, 48
	createvisualtask AnimTask_TransformMon, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	end

CastformChangeSkipAnim:
	createvisualtask AnimTask_CastformGfxChange, 2, 1
	end

General_StatsChange:
	createvisualtask AnimTask_StatsChange, 5
	waitforvisualfinish
	end

General_SubstituteFade:
	monbg ANIM_ATTACKER
	createvisualtask AnimTask_SubstituteFadeToInvisible, 5
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 0, 0, 16, RGB_WHITE
	waitforvisualfinish
	delay 1
	clearmonbg ANIM_ATTACKER
	delay 2
	blendoff
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 0, 0, 0, RGB_WHITE
	createvisualtask AnimTask_SwapMonSpriteToFromSubstitute, 2, TRUE
	end

General_SubstituteAppear:
	createvisualtask AnimTask_MonToSubstitute, 2
	end

General_BaitThrow:
	createvisualtask AnimTask_SafariOrGhost_DecideAnimSides, 2, 0
	createvisualtask AnimTask_LoadBaitGfx, 2
	delay 0
	waitplaysewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER, 22
	createsprite gSafariBaitSpriteTemplate, ANIM_TARGET, 3, -18, 12, 0, 32
	delay 50
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_TARGET, 19, 2
	createvisualtask AnimTask_SwayMon, 5, 1, 8, 1536, 2, ANIM_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_FreeBaitGfx, 2
	end

General_ItemKnockoff:
	loadspritegfx ANIM_TAG_ITEM_BAG
	createsprite gKnockOffItemSpriteTemplate, ANIM_TARGET, 2
	end

General_TurnTrap:
	createvisualtask AnimTask_GetTrappedMoveAnimId, 5
	jumpargeq 0, TRAP_ANIM_FIRE_SPIN, Status_FireSpin
	jumpargeq 0, TRAP_ANIM_WHIRLPOOL, Status_Whirlpool
	jumpargeq 0, TRAP_ANIM_CLAMP,     Status_Clamp
	jumpargeq 0, TRAP_ANIM_SAND_TOMB, Status_SandTomb
	goto Status_BindWrap

Status_BindWrap:
	loadspritegfx ANIM_TAG_TENDRILS
	loopsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET, 6, 2
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 4, 0, 16, 0, 1
	delay 7
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 2, 0, 8, 1, 1
	delay 3
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	delay 20
	setarg 7, 0xFFFF
	playsewithpan SE_M_BIND, SOUND_PAN_TARGET
	waitforvisualfinish
	end

Status_FireSpin:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	playsewithpan SE_M_SACRED_FIRE2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 2, 30, 1
	call FireSpinEffect
	call FireSpinEffect
	waitforvisualfinish
	stopsound
	end

Status_Whirlpool:
	loadspritegfx ANIM_TAG_WATER_ORB
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_TARGET, 2, 0, 7, RGB(0, 13, 23)
	playsewithpan SE_M_WHIRLPOOL, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 2, 30, 1
	call WhirlpoolEffect
	call WhirlpoolEffect
	delay 12
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_TARGET, 2, 7, 0, RGB(0, 13, 23)
	waitforvisualfinish
	stopsound
	clearmonbg ANIM_DEF_PARTNER
	end

Status_Clamp:
	loadspritegfx ANIM_TAG_CLAMP
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_VICEGRIP, SOUND_PAN_TARGET
	createsprite gClampJawSpriteTemplate, ANIM_ATTACKER, 2, -32, 0, 2, 819, 0, 10
	createsprite gClampJawSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 6, -819, 0, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 5, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	waitforvisualfinish
	end

Status_SandTomb:
	loadspritegfx ANIM_TAG_MUD_SAND
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_TARGET, 2, 0, 7, RGB(19, 17, 0)
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 2, 30, 1
	playsewithpan SE_M_SAND_TOMB, SOUND_PAN_TARGET
	call SandTombSwirlingDirt
	call SandTombSwirlingDirt
	delay 22
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_TARGET, 2, 7, 0, RGB(19, 17, 0)
	waitforvisualfinish
	stopsound
	end

General_HeldItemEffect:
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_SPARKLE_2
	delay 0
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 16, 128, ANIM_ATTACKER, 2
	waitforvisualfinish
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 16, 128, ANIM_ATTACKER, 2
	waitforvisualfinish
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 16, 128, ANIM_ATTACKER, 2
	waitforvisualfinish
	playsewithpan SE_M_MORNING_SUN, SOUND_PAN_ATTACKER
	call GrantingStarsEffect
	waitforvisualfinish
	playsewithpan SE_SHINY, SOUND_PAN_ATTACKER
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_ATTACKER, 3, 7, 0, RGB(17, 31, 25)
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0
	waitforvisualfinish
	end

General_SmokeballEscape:
	loadspritegfx ANIM_TAG_PINK_CLOUD
	monbg ANIM_ATTACKER
	setalpha 12, 4
	delay 0
	playsewithpan SE_BALL_OPEN, SOUND_PAN_TARGET
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_TARGET, 0, 0, 32, 28, 30
	delay 4
	playsewithpan SE_BALL_OPEN, SOUND_PAN_TARGET
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 127, 2, 12, 20, 30
	delay 12
	playsewithpan SE_BALL_OPEN, SOUND_PAN_TARGET
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 126, 2, -28, 4, 30
	delay 12
	playsewithpan SE_BALL_OPEN, SOUND_PAN_TARGET
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 124, 2, 14, -20, 30
	delay 4
	playsewithpan SE_BALL_OPEN, SOUND_PAN_TARGET
	createvisualtask AnimTask_AttackerFadeToInvisible, 2, 2
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 123, 3, 4, 4, 30
	delay 14
	playsewithpan SE_BALL_OPEN, SOUND_PAN_TARGET
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 122, 3, -14, 18, 46
	delay 0
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 121, 3, 14, -14, 46
	delay 0
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 120, 3, -12, -10, 46
	delay 0
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 119, 3, 14, 14, 46
	delay 0
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 118, 3, 0, 0, 46
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	invisible ANIM_ATTACKER
	delay 0
	blendoff
	end

General_FocusBand:
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_ATTACKER, 7, 0, 9, RGB_RED
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_SlideMonForFocusBand, 5, 30, 128, 0, 1, 2, 0, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_ATTACKER, 4, 9, 0, RGB_RED
	waitforvisualfinish
	delay 6
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 0, 0, 0, 15
	end

General_Rain:
	loadspritegfx ANIM_TAG_RAIN_DROPS
	playsewithpan SE_M_RAIN_DANCE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG | F_PAL_BATTLERS_2, 2, 0, 4, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_CreateRaindrops, 2, 0, 3, 60
	createvisualtask AnimTask_CreateRaindrops, 2, 0, 3, 60
	delay 50
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG | F_PAL_BATTLERS_2, 2, 4, 0, RGB_BLACK
	waitforvisualfinish
	end

General_Sun:
	goto Move_SUNNY_DAY

General_Sandstorm:
	goto Move_SANDSTORM

General_ShadowSky:
	loadspritegfx ANIM_TAG_FLYING_DIRT
	createvisualtask AnimTask_BlendParticle, 5, ANIM_TAG_FLYING_DIRT, 0, 6, 6, RGB(15, 0, 21)
	createvisualtask AnimTask_LoadSandstormBackground, 5, TRUE
	createvisualtask AnimTask_BlendBackground, 6, 6, RGB(15, 0, 21)
	panse SE_M_HEAT_WAVE, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	delay 4
	createvisualtask AnimTask_SetAnimTargetFromArg, 5, ANIM_PLAYER_LEFT
	delay 0 // so it updates before the next task is called
	createvisualtask AnimTask_MoveHeatWaveTargets, 5
	delay 12
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 10, 2304, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 90, 2048, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 50, 2560, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 20, 2304, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 70, 1984, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 0, 2816, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 60, 2560, 96, 1
	end


General_ShadowSpikes:
	goto Move_SPIKES

General_Hail:
	goto Move_HAIL

General_LeechSeedDrain:
	createvisualtask AnimTask_GetBattlersFromArg, 5
	delay 0
	goto Move_ABSORB

General_MonHit:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

General_ItemSteal:
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask AnimTask_SetAnimAttackerAndTargetForEffectAtk, 2
	createvisualtask AnimTask_SetTargetToEffectBattler, 2  @ Redundant with above
	delay 1
	createsprite gItemStealSpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 10, 2, -1
	end

General_SnatchMove:
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask AnimTask_SetAnimAttackerAndTargetForEffectTgt, 2
	call SnatchMoveTrySwapFromSubstitute
	delay 1
	createvisualtask AnimTask_SwayMon, 2, 0, 5, 5120, 4, ANIM_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_IsTargetSameSide, 2
	jumpretfalse SnatchOpposingMonMove
	goto SnatchPartnerMonMove

SnatchMoveContinue:
	waitforvisualfinish
	call SnatchMoveTrySwapToSubstitute
	end

SnatchOpposingMonMove:
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_SnatchOpposingMonMove, 2
	goto SnatchMoveContinue

SnatchPartnerMonMove:
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_SnatchPartnerMove, 2
	goto SnatchMoveContinue

General_FutureSightHit:
	createvisualtask AnimTask_SetAnimTargetToBattlerTarget, 2
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	call SetPsychicBackground
	setalpha 8, 8
	playsewithpan SE_M_SUPERSONIC, SOUND_PAN_TARGET
	waitplaysewithpan SE_M_SUPERSONIC, SOUND_PAN_TARGET, 8
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 4, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 15, ANIM_TARGET, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 4, 0, 24, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	waitforvisualfinish
	delay 1
	call UnsetPsychicBackground
	end

General_DoomDesireHit:
	createvisualtask AnimTask_SetAnimTargetToBattlerTarget, 2
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 0, 16, RGB_WHITE
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_DoomDesireLightBeam, 5
	delay 9
	playsewithpan SE_M_CONFUSE_RAY, SOUND_PAN_ATTACKER
	delay 9
	playsewithpan SE_M_CONFUSE_RAY, 0
	delay 9
	playsewithpan SE_M_CONFUSE_RAY, SOUND_PAN_TARGET
	delay 25
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 10, 0, 20, 1
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 1, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 16, 0, RGB_WHITE
	waitforvisualfinish
	end

General_FocusPunchSetUp:
	loadspritegfx ANIM_TAG_FOCUS_ENERGY
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	call EndureEffect
	delay 8
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 2, 2, 0, 11, RGB_RED
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 32, 1
	call EndureEffect
	delay 8
	call EndureEffect
	waitforvisualfinish
	end

General_IngrainHeal:
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 0, 4, RGB(13, 31, 12)
	waitforvisualfinish
	delay 3
	call AbsorbEffect
	waitforvisualfinish
	delay 15
	call HealingEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 4, 0, RGB(13, 31, 12)
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

General_WishHeal:
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_SPARKLE_2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 0, 10, RGB_BLACK
	waitforvisualfinish
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_ATTACKER
	call GrantingStarsEffect
	waitforvisualfinish
	call HealingEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 10, 0, RGB_BLACK
	end

General_MonScared:
	createvisualtask AnimTask_SafariOrGhost_DecideAnimSides, 2, 1
	waitforvisualfinish
	loadspritegfx ANIM_TAG_SWEAT_BEAD
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_TARGET, 2, 0, 10, RGB(0, 23, 25)
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 10, 1
	delay 20
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 0, 1
	playsewithpan SE_M_SKETCH, SOUND_PAN_TARGET
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 5, 1
	createvisualtask AnimTask_StretchTargetUp, 3
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_TARGET, 2, 10, 0, RGB(0, 23, 25)
	waitforvisualfinish
	end

General_GhostGetOut:
	createvisualtask AnimTask_SafariOrGhost_DecideAnimSides, 2, 1
	waitforvisualfinish
	fadetobg BG_GHOST
	waitbgfadeout
	monbg_static ANIM_ATTACKER
	createvisualtask AnimTask_GhostGetOut, 2
	waitbgfadein
	loopsewithpan SE_M_PSYBEAM, SOUND_PAN_TARGET, 20, 3
	waitforvisualfinish
	clearmonbg_static ANIM_ATTACKER
	delay 1
	loadspritegfx ANIM_TAG_SWEAT_BEAD
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_TARGET, -1, 0, 6, RGB(21, 22, 26)
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 0, 1
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 5, 1
	createvisualtask AnimTask_StretchTargetUp, 3
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_TARGET, -1, 6, 0, RGB(21, 22, 26)
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

General_SilphScoped:
	monbg ANIM_ATTACKER
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_MINIMIZE, SOUND_PAN_ATTACKER, 48
	createvisualtask AnimTask_TransformMon, 2, 255
	waitsound
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	end

General_AlomomolaEvolve:
	monbg ANIM_ATTACKER
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_MINIMIZE, SOUND_PAN_ATTACKER, 48
	createvisualtask AnimTask_TransformMon, 2, 255
	waitsound
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	end

General_SeelHoopaTransform:
	monbg ANIM_ATTACKER
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_MINIMIZE, SOUND_PAN_ATTACKER, 48
	createvisualtask AnimTask_TransformMon, 2, 255
	waitsound
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	end

General_ZapmolcunoTransform: @ doesn't need an actual transformation since it won't be visible
	end

General_HangedOn:
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_ATTACKER, 7, 0, 9, RGB_RED
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_SlideMonForFocusBand, 5, 30, 128, 0, 1, 2, 0, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_ATTACKER, 4, 9, 0, RGB_RED
	waitforvisualfinish
	delay 6
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 0, 0, 0, 15
	end

General_TeraCharge::
	loadspritegfx ANIM_TAG_TERA_CRYSTAL
	loadspritegfx ANIM_TAG_TERA_SHATTER
	loadspritegfx ANIM_TAG_FOCUS_ENERGY
	loadspritegfx ANIM_TAG_WHIP_HIT @green color
	loadspritegfx ANIM_TAG_SWEAT_BEAD @blue color
	loadspritegfx ANIM_TAG_PAW_PRINT @yellow color
	monbg ANIM_ATTACKER
	setalpha 12, 8
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 0, 6, 0, 11, RGB_RED
	call RainbowEndureEffect
	call RainbowEndureEffect
	call RainbowEndureEffect
	call RainbowEndureEffect
	call RainbowEndureEffect
	waitforvisualfinish
	playsewithpan SE_M_SOLAR_BEAM, SOUND_PAN_ATTACKER
	createsprite gTeraCrystalSpriteTemplate, ANIM_ATTACKER, 41, 0, 0, 0, 0
	delay 20
	createvisualtask AnimTask_BlendBattleAnimPalExclude, 5, 5, 2, 0, 16, RGB_WHITEALPHA
	waitforvisualfinish
	call TeraChargeParticles
	playsewithpan SE_M_BRICK_BREAK, SOUND_PAN_ATTACKER
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

RainbowEndureEffect:
	createsprite gBlueEndureEnergySpriteTemplate, ANIM_ATTACKER, 2, 0x0, 0xffe8, 0x1a, 0x2
	delay 0x3
	createsprite gEndureEnergySpriteTemplate, ANIM_ATTACKER, 2, 0x0, 0xe, 0x1c, 0x1 @Red Buff
	delay 0x3
	createsprite gGreenEndureEnergySpriteTemplate, ANIM_ATTACKER, 2, 0x0, 0xfffb, 0xa, 0x2
	delay 0x3
	createsprite gYellowEndureEnergySpriteTemplate, ANIM_ATTACKER, 2, 0x0, 0x1c, 0x1a, 0x3
	delay 0x3
	return

TeraChargeParticles:
	createsprite gTeraCrystalSpreadSpriteTemplate, ANIM_TARGET, 0, 0, -5, 8
	createsprite gTeraCrystalSpreadSpriteTemplate, ANIM_TARGET, 0, 1, 5, 9
	createsprite gTeraCrystalSpreadSpriteTemplate, ANIM_TARGET, 0, 2, 5, -8
	createsprite gTeraCrystalSpreadSpriteTemplate, ANIM_TARGET, 0, 2, -5, -8
	createsprite gTeraCrystalSpreadSpriteTemplate, ANIM_TARGET, 0, 1, -10, 0
	createsprite gTeraCrystalSpreadSpriteTemplate, ANIM_TARGET, 0, 0, 10, 0
	return

General_TeraActivate::
	createvisualtask AnimTask_BlendBattleAnimPalExclude, 5, 5, 2, 16, 0, RGB_WHITEALPHA
	createvisualtask AnimTask_HorizontalShake, 5, ANIM_TARGET, 5, 14
	waitforvisualfinish
	createvisualtask SoundTask_WaitForCry, 5
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

General_TrickRoom::
	@ call InitRoomAnimation
@ gBattleAnimGeneral_TrickRoom::
	playsewithpan SE_M_SUPERSONIC, SOUND_PAN_TARGET
	fadetobg BG_TRICK_ROOM
	waitbgfadein
	delay 0x40
	restorebg
	waitbgfadein
	blendoff
	end
InitRoomAnimation:
	setalpha 8, 8
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -6, -6, 15, ANIM_TARGET, 1
	return

Move_DARK_VOID::
	loadspritegfx ANIM_TAG_WHITE_SHADOW @Destiny Bond
	loadspritegfx ANIM_TAG_QUICK_GUARD_HAND @Black Colour
	loadspritegfx ANIM_TAG_SPARKLE_2 @Healing Stars
	loadspritegfx ANIM_TAG_POISON_BUBBLE @Poison
	fadetobg BG_DARK_VOID
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, 0, 0xFFA0, 1, 0xffff
	waitbgfadein
	createvisualtask AnimTask_DestinyBondWhiteShadow, 5, 0, 0x30
	loopsewithpan SE_M_CONFUSE_RAY, SOUND_PAN_ATTACKER, 5, 2
	delay 48
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, ANIM_TARGET, -768, 21, 0, 112 @Last is duration
	createsprite gSlideMonToOffsetPartnerSpriteTemplate, ANIM_ATTACKER, 2, ANIM_DEF_PARTNER, -768, 21, 0, 112 @Last is duration
	delay 64
	invisible ANIM_TARGET
	invisible ANIM_DEF_PARTNER
	createsprite gDarkVoidPurpleStarsTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 0, 32, 60
	createsprite gDarkVoidPurpleStarsTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_DEF_PARTNER, 0, 32, 60
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, ANIM_TARGET, 0, 16
	createsprite gSlideMonToOriginalPosPartnerSpriteTemplate, ANIM_ATTACKER, 2, ANIM_DEF_PARTNER, 0, 16
	delay 32
	call UnsetPsychicBg
	visible ANIM_TARGET
	visible ANIM_DEF_PARTNER
	end

UnsetPsychicBg:
	restorebg
	waitbgfadeout
	setarg 7, 0xFFFF
	waitbgfadein
	return

Move_ELECTRIFY::
	loadspritegfx ANIM_TAG_GUARD_RING @ring around user
	loadspritegfx ANIM_TAG_SPARK_2 @yellow color
	loadspritegfx ANIM_TAG_SMALL_EMBER @yellow color
	loadspritegfx ANIM_TAG_SPARK @electric travel
	loadspritegfx ANIM_TAG_THIN_RING @ring
	monbg ANIM_ATTACKER
	loopsewithpan SE_M_THUNDERBOLT2, SOUND_PAN_TARGET 0xa 0x4
	createsprite gElectrifyRingTemplate, ANIM_ATTACKER, 2
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 32, 0x18, 190, 12, ANIM_ATTACKER, 1, 0
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 80, 0x18, 22, 12, ANIM_ATTACKER, 1, 0
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 156, 0x18, 121, 13, ANIM_ATTACKER, 1, 1
	delay 0x4
	createsprite gElectrifyRingTemplate, ANIM_ATTACKER, 2
	delay 0x4
	createsprite gElectrifyRingTemplate, ANIM_ATTACKER, 2
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 100, 0x18, 60, 10, ANIM_ATTACKER, 1, 0
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 170, 0x18, 42, 11, ANIM_ATTACKER, 1, 1
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 238, 0x18, 165, 10, ANIM_ATTACKER, 1, 1
	waitforvisualfinish
	playsewithpan SE_M_THUNDER_WAVE, SOUND_PAN_ATTACKER
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 0xa, 0x0, 0x10, 0x1e, 0x0, 0x28, 0x0
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 0xa, 0x0, 0x10, 0x1e, 0x40, 0x28, 0x1
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 0xa, 0x0, 0x10, 0x1e, 0x80, 0x28, 0x0
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 0xa, 0x0, 0x10, 0x1e, 0, 0x28, 0x2
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 0xa, 0x0, 0x8, 0x1e, 0x20, 0x28, 0x0
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 0xa, 0x0, 0x8, 0x1e, 0x60, 0x28, 0x1
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 0xa, 0x0, 0x8, 0x1e, 0xa0, 0x28, 0x0
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 0xa, 0x0, 0x8, 0x1e, 0xe0, 0x28, 0x2
	delay 0xA
	createvisualtask AnimTask_BlendBattleAnimPal, 0xA, F_PAL_TARGET, 0x2, 0x0, 0xB, 0x039B
	createvisualtask AnimTask_BlendBattleAnimPal, 0xa, F_PAL_BG, 0x1, 0x0, 0x3, 0x039B
	delay 0x4
	clearmonbg ANIM_ATTACKER
	delay 0x1
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_THUNDERBOLT2, SOUND_PAN_TARGET
	createsprite gElectrifyYellowRingTemplate, ANIM_ATTACKER, 3, 0x0, 0x0, 0x1, 0x0, 0x1f, 0x8
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 4, 0, 6, 1
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 0x5, 0x0, 0x5, 0x0
	delay 0x1
	createsprite gElectrifyYellowRingTemplate, ANIM_ATTACKER, 3, 0x0, 0x0, 0x1, 0x0, 0x1f, 0x8
	delay 0x1
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 0xfffb, 0xa, 0x5, 0x1
	createsprite gElectrifyYellowRingTemplate, ANIM_ATTACKER, 3, 0x0, 0x0, 0x1, 0x0, 0x1f, 0x8
	delay 0x1
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 0xf, 0x14, 0x5, 0x2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 0xfff1, 0xfff6, 0x5, 0x0
	delay 0x2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 0x19, 0x0, 0x5, 0x1
	delay 0x2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 0xfff8, 0x8, 0x5, 0x2
	delay 0x2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 0x2, 0xfff8, 0x5, 0x0
	delay 0x2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 0xffec, 0xf, 0x5, 0x1
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 0xA, F_PAL_TARGET, 0x2, 0xB, 0x0, 0x039B
	createvisualtask AnimTask_BlendBattleAnimPal, 0xa, F_PAL_BG, 0x1, 0x3, 0x0, 0x039B
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

General_SafariRockThrow:
	createvisualtask AnimTask_SafariOrGhost_DecideAnimSides, 2, 0
	waitforvisualfinish
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	delay 0
	waitplaysewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER, 22
	createsprite gSafariRockTemplate, ANIM_TARGET, 3, -17, 14, 8, 0
	delay 50
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 0
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -4, -20, 1, 2
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	waitforvisualfinish
	end

General_SafariReaction:
	createvisualtask AnimTask_SafariGetReaction, 2
	waitforvisualfinish
	jumpreteq B_MSG_MON_WATCHING, SafariReaction_WatchingCarefully
	jumpreteq B_MSG_MON_ANGRY, SafariReaction_Angry
	jumpreteq B_MSG_MON_EATING, SafariReaction_Eating
	end

SafariReaction_WatchingCarefully:
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_TARGET
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 16, 96, 0, 2
	waitforvisualfinish
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_TARGET
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 16, -96, 0, 2
	end

SafariReaction_Angry:
	loadspritegfx ANIM_TAG_ANGER
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, 20, -20
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_TARGET
	waitforvisualfinish
	delay 12
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, -20, -20
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_TARGET
	end

SafariReaction_Eating:
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_TARGET
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 8, 136, 0, 2
	waitforvisualfinish
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_TARGET
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 8, 136, 0, 2
	end

SnatchMoveTrySwapFromSubstitute:
	createvisualtask AnimTask_IsAttackerBehindSubstitute, 2
	jumprettrue SnatchMoveSwapSubstituteForMon
SnatchMoveTrySwapFromSubstituteEnd:
	waitforvisualfinish
	return

SnatchMoveSwapSubstituteForMon:
	createvisualtask AnimTask_SwapMonSpriteToFromSubstitute, 2, TRUE
	waitforvisualfinish
	goto SnatchMoveTrySwapFromSubstituteEnd

SnatchMoveTrySwapToSubstitute:
	createvisualtask AnimTask_IsAttackerBehindSubstitute, 2
	jumprettrue SnatchMoveSwapMonForSubstitute
SnatchMoveTrySwapToSubstituteEnd:
	waitforvisualfinish
	return

SnatchMoveSwapMonForSubstitute:
	createvisualtask AnimTask_SwapMonSpriteToFromSubstitute, 2, FALSE
	waitforvisualfinish
	goto SnatchMoveTrySwapToSubstituteEnd

@ Healthbox blue flash effect on level up
Special_LevelUp:
	playsewithpan SE_EXP_MAX, 0
	createvisualtask AnimTask_LoadHealthboxPalsForLevelUp, 2
	delay 0
	createvisualtask AnimTask_FlashHealthboxOnLevelUp, 5, 0, 0
	waitforvisualfinish
	createvisualtask AnimTask_FreeHealthboxPalsForLevelUp, 2
	end

Special_SwitchOutPlayerMon:
	createvisualtask AnimTask_SwitchOutBallEffect, 2
	delay 10
	createvisualtask AnimTask_SwitchOutShrinkMon, 2
	end

Special_SwitchOutOpponentMon:
	createvisualtask AnimTask_SwitchOutBallEffect, 2
	delay 10
	createvisualtask AnimTask_SwitchOutShrinkMon, 2
	end

Special_BallThrow:
	createvisualtask AnimTask_LoadBallGfx, 2
	delay 0
	playsewithpan SE_BALL_THROW, 0
	createvisualtask AnimTask_ThrowBall, 2
	createvisualtask AnimTask_IsBallBlockedByTrainerOrDodged, 2
	jumpreteq -1, BallThrowTrainerBlock
	jumpreteq -2, BallThrowGhostDodged
BallThrowEnd:
	waitforvisualfinish
	createvisualtask AnimTask_FreeBallGfx, 2
	end

BallThrowTrainerBlock:
	loadspritegfx ANIM_TAG_IMPACT
	delay 25
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 0
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -4, -20, ANIM_TARGET, 2
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto BallThrowEnd

BallThrowGhostDodged:
	delay 16
	createvisualtask AnimTask_WindUpLunge, 2, ANIM_TARGET, 48, 6, 16, 48, -48, 16
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_TARGET
	waitplaysewithpan SE_M_TAKE_DOWN, SOUND_PAN_TARGET, 48
	waitforvisualfinish
	goto BallThrowEnd

Special_BallThrowWithTrainer:
	createvisualtask AnimTask_LoadBallGfx, 2
	delay 0
	createvisualtask AnimTask_ThrowBallSpecial, 2
	waitforvisualfinish
	createvisualtask AnimTask_FreeBallGfx, 2
	end

Special_SubstituteToMon:
	createvisualtask AnimTask_SwapMonSpriteToFromSubstitute, 2, TRUE
	end

Special_MonToSubstitute:
	createvisualtask AnimTask_SwapMonSpriteToFromSubstitute, 2, FALSE
	end

Move_SUBSTITUTE_TEACHER:
	playsewithpan SE_M_ATTRACT, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_MonToSubstitute, 2
	end

Move_GROWL_CHARMANDER:
	loadspritegfx ANIM_TAG_NOISE_LINE
	createvisualtask SoundTask_PlayDoubleCry, 2, ANIM_ATTACKER, DOUBLE_CRY_GROWL
	call RoarEffect
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 9, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 1, 0, 9, 1
	waitforvisualfinish
	createvisualtask SoundTask_WaitForCry, 5
	waitforvisualfinish
	end

Move_WATER_SHURIKEN:
	loadspritegfx ANIM_TAG_WATER_SHURIKEN
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gWaterShurikenSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, 20, 1
	delay 5
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gWaterShurikenSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 5, 22, -18, 1
	delay 5
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gWaterShurikenSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, -10, 22, 15, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 18, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

@Credits to Skeli
Move_REVIVAL_BLESSING:
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_MOON
	loadspritegfx ANIM_TAG_SPARKLE_2
	loadspritegfx ANIM_TAG_GUARD_RING
	loadspritegfx ANIM_TAG_SMALL_EMBER @Yellow colour for ring
	monbg ANIM_ATK_PARTNER
	setalpha 16, 0
	createvisualtask AnimTask_BlendBattleAnimPal, 0xa, F_PAL_BG, 0x1, 0x0, 0x10, 0x0
	createvisualtask AnimTask_BlendNonAttackerPalettes, 0x2, 0x1, 0x0, 0x10, 0x0
	waitforvisualfinish
	createsprite gMoonSpriteTemplate, ANIM_ATTACKER, 2, 0x78, 0x38
	createvisualtask AnimTask_AlphaFadeIn, 0x3, 0x0, 0x10, 0x10, 0x0, 0x1
	createvisualtask AnimTask_BlendBattleAnimPal, 0xa, F_PAL_ATTACKER, 0x7, 0x0, 0x10, 0x0
	loopsewithpan SE_M_HEAL_BELL, SOUND_PAN_ATTACKER, 0x10, 0x3
	call HealingEffect2
	createsprite gSpriteTemplate_LunarDanceRing, ANIM_ATTACKER, 2,
	delay 0x4
	createsprite gSpriteTemplate_LunarDanceRing, ANIM_ATTACKER, 2,
	delay 0x4
	createsprite gSpriteTemplate_LunarDanceRing, ANIM_ATTACKER, 2,
	delay 0x24
	clearmonbg ANIM_ATK_PARTNER
	call HealingEffect
	delay 0x28
	createvisualtask AnimTask_AllBattlersInvisible, 0xA,
	createvisualtask AnimTask_MoonlightEndFade, 0x2,
	delay 0x10
	createvisualtask AnimTask_AllBattlersVisible, 0xA,
	waitforvisualfinish
	blendoff
	end

Move_TOMBSTONER:
	loadspritegfx ANIM_TAG_WEED
	loadspritegfx ANIM_TAG_STEALTH_ROCK
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 2, 0, 10, 1
	waitforvisualfinish
	createsprite gStealthRockSpriteTemplate, ANIM_TARGET, 2, 20, 12, 64, 114, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET
	delay 8
	createsprite gStealthRockSpriteTemplate, ANIM_TARGET, 2, -20, 12, 64, 98, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET
	delay 8
	createsprite gStealthRockSpriteTemplate, ANIM_TARGET, 66, 3, 6, 64, 82, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET
	delay 8
	createsprite gStealthRockSpriteTemplate, ANIM_TARGET, 2, -3, 13, 64, 66, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET
	delay 24
	playsewithpan SE_M_HYPER_BEAM, SOUND_PAN_TARGET
	createsprite gWeedSpriteTemplate, ANIM_TARGET, 5, ANIM_TARGET, 50
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 20, 1
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 2, 0, 10, 1
	waitforvisualfinish
	end

	
Move_FOLLOW_HIM:
	loadspritegfx ANIM_TAG_FINGER
	createsprite gFollowHimFingerSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	delay 18
	playsewithpan SE_M_ATTRACT, SOUND_PAN_ATTACKER
	delay 81
	playsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER
	end
	
Move_SPIKY_SHIELD:
	loadspritegfx ANIM_TAG_PROTECT
	loadspritegfx ANIM_TAG_GREEN_SPIKE
	monbg ANIM_ATK_PARTNER
	splitbgprio ANIM_ATTACKER
	waitplaysewithpan SE_M_REFLECT, SOUND_PAN_ATTACKER, 0x10
	createsprite gProtectSpriteTemplate, ANIM_ATTACKER, 2, 0x18, 0x0, 0x5a
	delay 0xF
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 0x0, 0x1, 0x0, 0xFFE0, 0x10
	delay 0x2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 0x0, 0x1, 0x16, 0xFFEA, 0x10
	delay 0x2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 0x0, 0x1, 0x1E, 0x0, 0x10
	delay 0x2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 0x0, 0x1, 0x14, 0x14, 0x10
	delay 0x2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 0x0, 0x1, 0x0, 0x1C, 0x10
	delay 0x2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 0x0, 0x1, 0xFFED, 0x13, 0x10
	delay 0x2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 0x0, 0x1, 0xFFE5, 0x0, 0x10
	delay 0x2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 0x0, 0x1, 0xFFEE, 0xFFEE, 0x10
	delay 0x2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 0x0, 0x1, 0x0, 0xFFE7, 0x10
	delay 0x2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 0x0, 0x1, 0x11, 0xFFEF, 0x10
	delay 0x2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 0x0, 0x1, 0x17, 0x0, 0x10
	delay 0x2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 0x0, 0x1, 0x10, 0x10, 0x10
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	end
	
	
	
Move_V_CREATE:
	loadspritegfx ANIM_TAG_SMALL_EMBER @fire blast flame
	loadspritegfx ANIM_TAG_THIN_RING @calm mind animation
	loadspritegfx ANIM_TAG_JAGGED_MUSIC_NOTE @red color
	loadspritegfx ANIM_TAG_ECLIPSING_ORB @defense curl animation
	monbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 1, 0, 12, RGB_BLACK @Darken
	createsprite gVCreateRedOrbTemplate, ANIM_ATTACKER, 2, 0x0, 0x11, 0x0, 0x1
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_ATTACKER
	delay 2
	createsprite gVCreateRedRingTemplate, ANIM_ATTACKER, 40, 0x0, 0x0, 0x0, 0x0
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 2, 0, 9, RGB_RED
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	call VCreateFlames
	call VCreateFlames
	call VCreateFlames
	call VCreateFlames
	call VCreateFlames
	call VCreateFlames
	call VCreateFlames
	call VCreateFlames
	call VCreateFlames
	call VCreateFlames
	waitforvisualfinish
	unloadspritegfx ANIM_TAG_SMALL_EMBER
	unloadspritegfx ANIM_TAG_THIN_RING
	unloadspritegfx ANIM_TAG_JAGGED_MUSIC_NOTE
	unloadspritegfx ANIM_TAG_ECLIPSING_ORB
	loadspritegfx ANIM_TAG_EXPLOSION @explosion animation
	loadspritegfx ANIM_TAG_CLAW_SLASH @dragon claw animation
	clearmonbg ANIM_ATK_PARTNER
	call SetImpactBackground
	waitbgfadein
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_WindUpLunge, 5, ANIM_ATTACKER, -24, 8, 23, 10, 40, 10
	delay 35
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 5, 50, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 9, RGB_RED
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0x0, 0x0, 0x1, 0x1
	delay 6
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0x18, 0xffe8, 0x1, 0x1
	delay 6
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0xfff0, 0x10, 0x1, 0x1
	delay 6
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0xffe8, 0xfff4, 0x1, 0x1
	delay 6
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0x10, 0x10, 0x1, 0x1
	waitforvisualfinish
	loadspritegfx ANIM_TAG_SMALL_EMBER
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 20, 1
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	call VShape
	delay 3
	call VShape
	delay 3
	call VShape
	delay 3
	call VShape
	delay 3
	call VShape
	delay 3
	call VShape
	delay 3
	call VShape
	delay 3
	call VShape
	delay 3
	call VShape
	delay 3
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 0x4, 0x4
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 2, 9, 0, RGB_RED
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 9, 0, RGB_RED
	delay 2
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, ANIM_ATTACKER, 0x0, 0x5
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	call UnsetPsychicBg
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 1, 0, 0, RGB_WHITEALPHA
	waitforvisualfinish
	end
VCreateFlames:
	createsprite gVCreateFlameTemplate, ANIM_TARGET, 2, 0x0, 0x1, 0x16, 0xFFEA, 0x10 @upperright
	createsprite gVCreateFlameTemplate, ANIM_TARGET, 2, 0x0, 0x1, 0xFFEE, 0xFFEE, 0x10 @upperleft
	delay 3
	return
VShape:
    createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, 0, 12, 20, -2, -3
    createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, 0, 12, 20,  2, -3
    return
	
Move_L_CREATE:
	loadspritegfx ANIM_TAG_WATER_ORB
	loadspritegfx ANIM_TAG_WATER_IMPACT
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 40, 1
	delay 6
	panse SE_M_HYDRO_PUMP, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpBeams
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 37, 1
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	delay 1
	delay 1
	call HydroPumpHitSplats
	waitforvisualfinish
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 20, 1
	call LShape
	delay 3
	call LShape
	delay 3
	call LShape
	delay 3
	call LShape
	delay 3
	call LShape
	delay 3
	call LShape
	delay 3
	call LShape
	delay 3
	call LShape
	delay 3
	call LShape
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

LShape:
    createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, -12, 12, 18, 0, -2
    createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, -12, 12, 20, 0, -2
    createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, -12, 12, 22, 0, -2

    createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, -12, 12, 10, 2, 0
    createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, -12, 12, 12, 2, 0
    return
	
Move_O_CREATE:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_WALUIGI:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_ONE_CLUB:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_ONE_CLAWS:
	loadspritegfx ANIM_TAG_CLAW_SLASH
	loopsewithpan SE_M_HARDEN, SOUND_PAN_ATTACKER, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 2
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, -10, 0
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, 10, 0
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	delay 60
	waitforvisualfinish
	end
	
Move_ONE_EDGE:
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_ATTACKER, 4, 2, RGB_WHITE, 10, RGB_BLACK, 0
	waitforvisualfinish
	delay 10
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 18, 6, 2, 4
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 16, 16, RGB_WHITE
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 3
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 16, 0, RGB_WHITE
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7
	waitforvisualfinish
	end
	
Move_ONEMERANG:
	loadspritegfx ANIM_TAG_ONE
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_BONEMERANG, SOUND_PAN_ATTACKER
	createsprite gOnemerangSpriteTemplate, ANIM_ATTACKER, 2
	delay 20
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 5, 0, 5, 1
	delay 17
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_ATTACKER
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, -4
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
	
Move_BANEFUL_1NKER:
	loadspritegfx ANIM_TAG_ONE_PROTECT
	monbg ANIM_ATK_PARTNER
	waitplaysewithpan SE_M_REFLECT, SOUND_PAN_ATTACKER, 16
	createsprite gOneProtectSpriteTemplate, ANIM_ATTACKER, 2, 24, 0, 90
	createvisualtask AnimTask_Withdraw, 5
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	end
	
Move_FINAL_GAMBIT:
	loadspritegfx ANIM_TAG_IMPACT
	setalpha 0, 16
	delay 1
	createvisualtask AnimTask_InitMementoShadow, 2
	delay 1
	createvisualtask AnimTask_MoveAttackerMementoShadow, 5
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	delay 48
	playsewithpan SE_M_PSYBEAM2, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createvisualtask AnimTask_MementoHandleBg, 2
	delay 12
	setalpha 0, 16
	delay 1
	monbg_static ANIM_TARGET
	createvisualtask AnimTask_MoveTargetMementoShadow, 5
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_TARGET
	waitforvisualfinish
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, ANIM_ATTACKER
	waitforvisualfinish
	delay 11
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 26, 0, 0, 5
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 4, -10, 0, ANIM_TARGET, 0
	loopsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET, 10, 2
	delay 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -28, 0, 0, 3
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 4, 0, 12, 1
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 6
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
	
Move_DRAGON_ASCENT:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_BIRD
	call SetSkyBg
	monbg ANIM_ATTACKER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 0, 0, 16, RGB_WHITE
	delay 4
	createvisualtask AnimTask_AttackerFadeToInvisible, 5, 0
	waitforvisualfinish
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_SKY_UPPERCUT, SOUND_PAN_ATTACKER
	createsprite gSkyAttackBirdSpriteTemplate, ANIM_TARGET, 2
	delay 14
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 10, 0, 18, 1
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	delay 20
	createvisualtask AnimTask_AttackerFadeFromInvisible, 5, 1
	delay 2
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 0, 15, 0, RGB_WHITE
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	call UnsetSkyBg
	goto SkyAttackEnd
	
Move_FLYING_CLAW:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loadspritegfx ANIM_TAG_CLAW_SLASH
	playsewithpan SE_M_SACRED_FIRE2, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 4, 0, 8, RGB(31, 19, 0)
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 15, 1
	call DragonClawFireSpiral
	call DragonClawFireSpiral
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 528, 30, 13, 50, ANIM_ATTACKER
	delay 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, -10, 0
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, 10, 0
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 480, 20, 16, -46, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 576, 20, 8, 42, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 31, 400, 25, 11, -42, ANIM_ATTACKER
	delay 2
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 512, 25, 16, 46, ANIM_ATTACKER
	delay 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, -10, 1
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, 10, 1
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 464, 30, 15, -50, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 528, 30, 13, 50, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 480, 20, 16, -46, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 576, 20, 8, 42, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 31, 400, 25, 11, -42, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 512, 25, 16, 46, ANIM_ATTACKER
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 464, 30, 15, -50, ANIM_ATTACKER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 4, 8, 0, RGB(31, 19, 0)
	waitforvisualfinish
	end
	
Move_FLYING_DANCE:
	loadspritegfx ANIM_TAG_HOLLOW_ORB
	monbg ANIM_ATTACKER
	splitbgprio ANIM_ATTACKER
	delay 1
	createvisualtask AnimTask_DragonDanceWaver, 5
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	delay 8
	createvisualtask AnimTask_BlendPalInAndOutByTag, 5, ANIM_TAG_HOLLOW_ORB, RGB(0, 0, 19), 14, 0, 3
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 0
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 43
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 85
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 128
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 170
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 213
	delay 30
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	delay 30
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	delay 1
	end
	
Move_FLY_O_METEOR:
	loadspritegfx ANIM_TAG_GOLD_STARS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ROCKS
	panse SE_M_BARRIER, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +3, 0
	fadetobg BG_COSMIC
	waitbgfadein
	waitforvisualfinish
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -48, -64, 72, 32, 30
	delay 10
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -112, -64, 8, 32, 30
	delay 40
	createsprite gRockTombRockSpriteTemplate, ANIM_TARGET, 2, -3, 13, 64, 66, 0
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -80, -64, 40, 32, 30
	delay 20
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 5, 0, 20, 1
	waitforvisualfinish
	delay 10
	restorebg
	waitbgfadein
	waitforvisualfinish
	end
	
Move_TRIPLE_FINISH:
	loadspritegfx ANIM_TAG_ROOTS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_WATER_ORB
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_BG, 2, 0, 5, RGB_BLACK
	waitforvisualfinish
	playsewithpan SE_M_SURF, SOUND_PAN_ATTACKER
	createsprite gHydroCannonChargeSpriteTemplate, ANIM_TARGET, 2
	delay 10
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 10, 8, 2, 0, 0, 100
	playsewithpan SE_M_SCRATCH, SOUND_PAN_ATTACKER
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, -2, 0, 1, 95
	playsewithpan SE_M_SCRATCH, -43
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 30, 8, -4, 0, 0, 90
	playsewithpan SE_M_SCRATCH, -22
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 40, -8, 4, 0, 1, 85
	playsewithpan SE_M_SCRATCH, 0
	delay 5
	createsprite gWaterHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 0
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 50, 8, 0, 0, 0, 85
	playsewithpan SE_M_SCRATCH, +21
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 60, -8, -2, 0, 1, 85
	playsewithpan SE_M_SCRATCH, +42
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 75, 8, 0, 0, 0, 85
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	delay 5
	panse SE_M_HYDRO_PUMP, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	call HydroCannonBeam
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 10, 0, 40, 1
	createsprite gWaterHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 0
	call HydroCannonBeam
	createsprite gWaterHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 0
	call HydroCannonBeam
	createsprite gWaterHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 0
	call HydroCannonBeam
	createsprite gWaterHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 0
	call HydroCannonBeam
	createsprite gWaterHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 0
	call HydroCannonBeam
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 85, 16, 6, 0, 3, 80
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 85, -16, -6, 0, 2, 75
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -10, ANIM_TARGET, 3
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 3, ANIM_TARGET, 8, 0, 20, 1
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 8, ANIM_TARGET, 3
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, -3, ANIM_TARGET, 2
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -3, 1, ANIM_TARGET, 2
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	delay 2
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, 1, ANIM_TARGET, 1
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	delay 2
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 10, ANIM_TARGET, 1
	playsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, F_PAL_BG, 2, 5, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
	
Move_ROCK_PUNCH:
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_TARGET
	delay 2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 0, 16, RGB_BLACK
	setalpha 12, 8
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_TARGET
	createsprite gMegaPunchKickSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 50
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 7, RGB_WHITE
	delay 50
	call SetImpactBackground
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 22, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 0, RGB_WHITE
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB_BLACK, 8, RGB_BLACK, 0	
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 20, 24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 5, 0, -20, 24, 14, 1
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 5, 20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, -5, 0, -20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 30, 18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 30, -18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -30, 18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -30, -18, 8, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 7, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	delay 2
	restorebg
	waitbgfadein
	end

Move_CELEBRATE:
	loadspritegfx ANIM_TAG_TAG_HAND
	
	loadspritegfx ANIM_TAG_CONFETTI
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_ENCORE2, SOUND_PAN_TARGET
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 5, 2, ANIM_TARGET
	delay 10
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 5, 2, ANIM_TARGET
	delay 0
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_FLATTER, SOUND_PAN_ATTACKER
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	delay 30
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	delay 30
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	waitforvisualfinish
	end
	
Move_HURRICANE:
	loadspritegfx ANIM_TAG_AIR_WAVE_2
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	call SetSkyBg
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	call AeroblastBeam
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 5, 0, 50, 1
	call AeroblastBeam
	call AeroblastBeam
	call AeroblastBeam
	call AeroblastBeam
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 0
	call UnsetSkyBg
	end
	
Move_AIR_SLASH:
	loadspritegfx ANIM_TAG_AIR_WAVE
	loadspritegfx ANIM_TAG_CUT
	loadspritegfx ANIM_TAG_IMPACT
	delay 0
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 0
	createvisualtask AnimTask_AirCutterProjectile, 2, 32, -24, 6 * 256, 2, 128  @ 6 * 256 == Q_8_8(6)
	waitforvisualfinish
	playsewithpan SE_M_CUT, SOUND_PAN_TARGET
	createsprite gAirCutterSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0, 2
	delay 5
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 2, 0, 8, 1
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_DEF_PARTNER
	delay 0
	end
	
Move_THE_BEE_MOVE:
	loadspritegfx ANIM_TAG_BEE
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	delay 1
	call BeeMoveCreateBees
	createvisualtask AnimTask_SwayMon, 5, 0, 3, 3072, 8, ANIM_TARGET
	call BeeMoveCreateBees
	call BeeMoveCreateBees
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

BeeMoveCreateBees:
	createsprite gBeeSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 35, 70, 0, 256, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 3
	createsprite gBeeSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 20, 40, -10, 256, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 3
	createsprite gBeeSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 10, -60, 0, 256, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 3
	createsprite gBeeSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 15, -15, 10, 256, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 3
	createsprite gBeeSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 30, 10, -10, 256, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 3
	createsprite gBeeSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 25, -30, 10, 256, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 3
	return
	
Move_WUMBOIZE:
	loadspritegfx ANIM_TAG_BREATH
	createvisualtask AnimTask_GrowAndShrink, 2
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gBreathPuffSpriteTemplate, ANIM_ATTACKER, 2
	loopsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER, 4, 2
	waitforvisualfinish
	end
	
Move_TAILWIND:
	loadspritegfx ANIM_TAG_WHIRLWIND_LINES
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, -8, ANIM_TARGET, 60, 0
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 60, 1
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 8, ANIM_TARGET, 60, 2
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, ANIM_TARGET, 60, 3
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, ANIM_TARGET, 60, 4
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, ANIM_TARGET, 60, 0
	delay 5
	loopsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_TARGET, 10, 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 15, 1
	delay 29
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_TARGET, 12, 6, 1, 5
	delay 7
	waitforvisualfinish
	end
	
Move_ROOST:
	loadspritegfx ANIM_TAG_WHITE_FEATHER
	monbg ANIM_DEF_PARTNER
	splitbgprio_all
	playsewithpan SE_M_PETAL_DANCE, SOUND_PAN_TARGET
	delay 0
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 64, 2, 104, 11304, 32, 1
	delay 6
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 32, 2, 104, 11304, 32, 1
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 0, 2, 104, 11304, 32, 1
	delay 6
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 224, 2, 104, 11304, 32, 1
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 128, 2, 104, 11304, 32, 1
	delay 6
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 192, 2, 104, 11304, 32, 1
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 160, 2, 104, 11304, 32, 1
	delay 6
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 96, 2, 104, 11304, 32, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end
	
Move_CSR_DUMMY:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_PRIMAL_RAGE:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ANGER
	monbg ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_BlendMonInAndOut, 3, ANIM_ATTACKER, RGB_RED, 10, 0, 2
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, -20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_ATTACKER
	delay 20
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, TRUE, 1, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	end
	
Move_CLOSE_COMBAT:
	loadspritegfx ANIM_TAG_BLUE_LIGHT_WALL
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_TORN_METAL
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 8
	delay 4
	delay 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -18, -18, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, -18, -18, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_TARGET
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 8
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 18, 18, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 18, 18, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_TARGET
	delay 20
	createvisualtask AnimTask_WindUpLunge, 2, ANIM_ATTACKER, -24, 0, 24, 10, 24, 3
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 6, RGB_BLACK
	delay 37
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 6, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	end
	
	
Move_BULLDOZE:
	loadspritegfx ANIM_TAG_BULLDOZER
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	@createsprite gBulldozerSpriteTemplate, ANIM_TARGET, 2, 1, 4, 160
	createsprite gBulldozerSpriteTemplate, ANIM_TARGET, 2, 2
	loopsewithpan SE_M_EARTHQUAKE, SOUND_PAN_TARGET, 7, 2
	@delay 80
	@delay 80
	createvisualtask AnimTask_PushTargetOffscreen, 2, ANIM_TARGET, 0, 2, 80, 150, 1
	waitforvisualfinish
	@setarg 7, 0xFFFF
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
	
Move_ELECTRO_BALL:
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_ELECTRICITY
	monbg ANIM_ATTACKER
	setalpha 12, 8
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 0, 8, RGB_BLACK
	waitforvisualfinish
	createsprite gVoltTackleOrbSlideSpriteTemplate, ANIM_ATTACKER, 1
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	delay 8
	createvisualtask AnimTask_VoltTackleBolt, 5, 0
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createvisualtask AnimTask_VoltTackleBolt, 5, 1
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_VoltTackleBolt, 5, 2
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createvisualtask AnimTask_VoltTackleBolt, 5, 3
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_VoltTackleBolt, 5, 4
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_ATTACKER
	delay 8
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 10, 0, 18, 1
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 1, 16, 16
	delay 2
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 1, -16, -16
	delay 8
	createvisualtask AnimTask_VoltTackleAttackerReappear, 5
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 3, 0, 9, 1
	playsewithpan SE_M_THUNDERBOLT2, SOUND_PAN_ATTACKER
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 16
	delay 2
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, -16, -16
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 8, 0, RGB_BLACK
	waitforvisualfinish
	end
	
Move_FLAME_CHARGE:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg ANIM_DEF_PARTNER
	splitbgprio_foes ANIM_TARGET
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 0
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 4
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 8
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 12
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 16
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 20
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 24
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 6
	delay 4
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 8, 1
	createvisualtask AnimTask_BlendMonInAndOut, 3, ANIM_TARGET, RGB_RED, 12, 1, 1
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	call FireSpreadEffect
	delay 7
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 9
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

	
Move_BOUNCY_BUBBLE:
	loadspritegfx ANIM_TAG_ROUND_SHADOW
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	createsprite gBounceBallShrinkSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gBounceBallLandSpriteTemplate, ANIM_TARGET, 3
	delay 7
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 11, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto BounceEnd
	
Move_COLLISION_COURSE:
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_ATTACKER, 4, 2, RGB_WHITE, 10, RGB_BLACK, 0
	waitforvisualfinish
	delay 10
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 18, 6, 2, 4
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 16, 16, RGB_WHITE
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 3
	waitforvisualfinish
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -10, 0, ANIM_TARGET, 0
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -32, 0, 0, 3
	waitforvisualfinish
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_ATTACKER, 0
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 4, 0, 12, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 4, 0, 12, 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 16, 0, RGB_WHITE
	waitforvisualfinish
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_ATTACKER, 1
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_TARGET, 1
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7
	waitforvisualfinish
	end
	
Move_COIL:
	loadspritegfx ANIM_TAG_TENDRILS
	loopsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET, 6, 4
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 4, 0, 16, 0, 2
	delay 7
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 3, 0, 0, 0, 2
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 2, 0, 8, 1, 2
	delay 7
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 3, 0, -8, 1, 2
	delay 8
	playsewithpan SE_M_BIND, SOUND_PAN_TARGET
	setarg 7, 0xFFFF
	waitforvisualfinish
	end
	
Move_ROCKET_PUNCH:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_TARGET
	delay 2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 0, 16, RGB_BLACK
	setalpha 12, 8
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_TARGET
	createsprite gMegaPunchKickSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 50
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 7, RGB_WHITE
	delay 50
	call SetImpactBackground
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 22, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 0, RGB_WHITE
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB_BLACK, 8, RGB_BLACK, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	delay 2
	restorebg
	waitbgfadein
	end
	
Move_DODGE_IT:
	call SkullBashSetUpHeadDown
	call SkullBashSetUpHeadDown
	waitforvisualfinish
	goto SkullBashEnd
	
Move_NUZZLE:
	loadspritegfx ANIM_TAG_RED_HEART
	loadspritegfx ANIM_TAG_ANGEL
	createsprite gAngelSpriteTemplate, ANIM_TARGET, 2, 16, -48
	playsewithpan SE_M_HEAL_BELL, SOUND_PAN_TARGET
	delay 23
	playsewithpan SE_M_HEAL_BELL, SOUND_PAN_TARGET
	delay 23
	playsewithpan SE_M_HEAL_BELL, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 160, -30
	playsewithpan SE_M_ATTRACT, SOUND_PAN_TARGET
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -256, -42
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 128, -14
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 416, -38
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -128, -22
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -384, -31
	end
	
Move_FAIRY_TAIL:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_DOUBLE_JUMP:
	loadspritegfx ANIM_TAG_ROUND_SHADOW
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	createsprite gBounceBallShrinkSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gBounceBallLandSpriteTemplate, ANIM_TARGET, 3
	delay 7
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 11, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto BounceEnd
	
	
Move_WATERBOLT:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_VAULT_TACKLE:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_BLU_FLARE:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_ROUND:
	loadspritegfx ANIM_TAG_SPHERE_TO_CUBE
	createsprite gRoundSphereSpriteTemplate, ANIM_ATTACKER, 2
	waitforvisualfinish
	end
	
Move_CIRCLE_THROW:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 12, 4, 1, 2
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 2
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -24, 0, 0, 4
	waitforvisualfinish
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 7
	delay 11
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 10
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
	
Move_CHILL_HEADBUTT:
	loadspritegfx ANIM_TAG_IMPACT
	fadetobg BG_AURORA
	waitbgfadein
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 2, 0, 4, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 6, 1
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	restorebg
	waitbgfadein
	end
	
Move_AURA_SPHERE:
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	monbg ANIM_ATK_PARTNER
	splitbgprio ANIM_ATTACKER
	setalpha 12, 8
	createsprite gSuperpowerOrbSpriteTemplate, ANIM_TARGET, 2, ANIM_ATTACKER
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_ATTACKER
	delay 20
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 4, 1, 180, 1
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_EARTHQUAKE, 0
	delay 40
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	delay 16
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 8, 0, 16, 1
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	delay 1
	end
	
Move_HEAD_SMASH:
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_SkullBashPosition, 2, 0
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	waitforvisualfinish
	playse SE_BANG
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 2, 0, 40, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 10, 0, 40, 1
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 4, 0, 0, ANIM_TARGET, 0
	loopsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET, 8, 3
	waitforvisualfinish
	createvisualtask AnimTask_SkullBashPosition, 2, 1
	goto SkullBashEnd
	
Move_HEAD_CHARGE:
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_SkullBashPosition, 2, 0
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	waitforvisualfinish
	playse SE_BANG
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 2, 0, 40, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 10, 0, 40, 1
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 4, 0, 0, ANIM_TARGET, 0
	loopsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET, 8, 3
	waitforvisualfinish
	createvisualtask AnimTask_SkullBashPosition, 2, 1
	goto SkullBashEnd
	
Move_BACK_AIR:
	loadspritegfx ANIM_TAG_SPARKLE_4
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 9, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 1, 0, 9, RGB_WHITE
	delay 18
	playsewithpan SE_M_DETECT, SOUND_PAN_ATTACKER
	createsprite gSpinningSparkleSpriteTemplate, ANIM_ATTACKER, 13, 20, -20
	waitforvisualfinish
	delay 10
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 9, 0, RGB_BLACK
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 2, 9, 0, RGB_WHITE
	waitforvisualfinish
	end
	
Move_REST_HBOX:
	playsewithpan SE_M_SNORE, SOUND_PAN_ATTACKER
	loadspritegfx ANIM_TAG_LETTER_Z
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	delay 20
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	delay 20
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	waitforvisualfinish
	end
	
Move_POP_OFF:
	loadspritegfx ANIM_TAG_NOISE_LINE
	createvisualtask AnimTask_DeepInhale, 2, 0
	delay 12
	call RoarEffect
	createvisualtask SoundTask_PlayCryHighPitch, 2, ANIM_ATTACKER, 3
	waitforvisualfinish
	delay 30
	end
	
Move_UP_THROW:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ROCKS
	setarg 7, 0
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	waitforvisualfinish
	createvisualtask AnimTask_GetSeismicTossDamageLevel, 3
	delay 1
	fadetobg BG_IN_AIR
	waitbgfadeout
	createvisualtask AnimTask_MoveSeismicTossBg, 3
	playsewithpan SE_M_SKY_UPPERCUT, 0
	waitbgfadein
	waitforvisualfinish
	createvisualtask AnimTask_SeismicTossBgAccelerateDownAtEnd, 3
	restorebg
	waitbgfadeout
	setarg 7, 0xFFF
	waitbgfadein
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	
Move_UP_DOG:
	loadspritegfx ANIM_TAG_FINGER_2
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	loadspritegfx ANIM_TAG_ANGER
	createsprite gThoughtBubbleSpriteTemplate, ANIM_ATTACKER, 11, 0, 45
	playsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER
	delay 6
	createsprite gTauntFingerSpriteTemplate, ANIM_ATTACKER, 12, 0
	delay 4
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 16, 2
	waitforvisualfinish
	delay 8
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, -20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_TARGET
	waitforvisualfinish
	delay 12
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, 20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_TARGET
	end
	
Move_CRAB_THROW:
	loadspritegfx ANIM_TAG_CSR_CRAB
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_BONEMERANG, SOUND_PAN_TARGET
	createsprite gSpinningCrabSpriteTemplate, ANIM_ATTACKER, 2, -42, -25, 0, 0, 15
	delay 12
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 5, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_ATTACKER | F_PAL_TARGET, 5, 1, RGB_BLACK, 10, RGB_BLACK, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
	
Move_WALL_OF_PAIN:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_SECRET_SWORD:
	loadspritegfx ANIM_TAG_SLASH
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, -8, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, 8, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 18, 1
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	end
	
Move_EARTH_POWER:
	loadspritegfx ANIM_TAG_BROWN_ORB
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 46, 1
	delay 6
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	panse SE_M_WHIRLPOOL, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +1, 0
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 43, 1
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
	
Move_SACRED_SWORD:
	loadspritegfx ANIM_TAG_SLASH
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, -8, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, 8, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 18, 1
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	end
	
Move_FAIRY_FANG:
	loadspritegfx ANIM_TAG_RED_HEART	
	loadspritegfx ANIM_TAG_SHARP_TEETH
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_BITE, SOUND_PAN_TARGET
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 0, -32, 0, 0, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 4, 0, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 4, 7, 1
	waitforvisualfinish
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 160, -30
	playsewithpan SE_M_ATTRACT, SOUND_PAN_TARGET
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -256, -42
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 128, -14
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 416, -38
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -128, -22
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -384, -31
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
	
Move_ATTACK_ORDER:
	loadspritegfx ANIM_TAG_BEE
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	delay 1
	call BeeMoveCreateBees
	createvisualtask AnimTask_SwayMon, 5, 0, 3, 3072, 8, ANIM_TARGET
	call BeeMoveCreateBees
	call BeeMoveCreateBees
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_STOMPING_TANTRUM:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ANGER
	monbg ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_BlendMonInAndOut, 3, ANIM_ATTACKER, RGB_RED, 10, 0, 2
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, -20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_ATTACKER
	delay 20
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gFistFootRandomPosSpriteTemplate, ANIM_ATTACKER, 3, 1, 20, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 4, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	waitforvisualfinish  @ Redundant
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
	
Move_THUNDURUS_KICK:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_LIGHTNING
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 16, RGB_BLACK
	waitforvisualfinish
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gMegaPunchKickSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 50
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	delay 1
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, -48
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_ATTACKER, 2, 0, -16
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_ATTACKER, 2, 0, 16
	delay 1
	playsewithpan SE_M_TRI_ATTACK2, SOUND_PAN_TARGET
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 15, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 16, 0, RGB_BLACK
	delay 20
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_TORNADUS_KICK:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_TARGET
	delay 2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 0, 16, RGB_BLACK
	setalpha 12, 8
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_TARGET
	createsprite gMegaPunchKickSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 50
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 7, RGB_WHITE
	delay 50
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	fadetobg BG_THUNDER
	waitbgfadeout
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 22, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 0, RGB_WHITE
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB_BLACK, 8, RGB_BLACK, 0
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	delay 2
	restorebg
	waitbgfadein
	end
	
Move_TAKE_HEART:
	loadspritegfx ANIM_TAG_MAGENTA_HEART
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask AnimTask_RockMonBackAndForth, 5, ANIM_ATTACKER, 2, 0
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 0, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, -20, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 20, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	loopsewithpan SE_M_DIZZY_PUNCH, SOUND_PAN_TARGET, 4, 3
	end
	
Move_POPULATION_BOMB:
	loadspritegfx ANIM_TAG_RED_BALL
	createvisualtask AnimTask_BarrageBall, 3
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	delay 24
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, 40, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_TARGET, 0, 4, 20, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_DEF_PARTNER, 0, 4, 20, 1
	loopsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET, 8, 2
	end
	
Move_DADDLING_GLEAM:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_PAY_DAD:
	loadspritegfx ANIM_TAG_COIN
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	createsprite gCoinThrowSpriteTemplate, ANIM_ATTACKER, 2, 20, 0, 0, 0, 1152
	waitforvisualfinish
	playsewithpan SE_M_PAY_DAY, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, ANIM_TARGET, 2
	createsprite gFallingCoinSpriteTemplate, ANIM_ATTACKER, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_SUNNY_DAD:
	loadspritegfx ANIM_TAG_COIN
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	createsprite gCoinThrowSpriteTemplate, ANIM_ATTACKER, 2, 20, 0, 0, 0, 1152
	waitforvisualfinish
	playsewithpan SE_M_PAY_DAY, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, ANIM_TARGET, 2
	createsprite gFallingCoinSpriteTemplate, ANIM_ATTACKER, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_LIQUIDADTION:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_CHATTER:
	loadspritegfx ANIM_TAG_NOISE_LINE
	createvisualtask SoundTask_PlayDoubleCry, 2, ANIM_ATTACKER, DOUBLE_CRY_GROWL
	call RoarEffect
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 9, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 1, 0, 9, 1
	waitforvisualfinish
	createvisualtask SoundTask_WaitForCry, 5
	waitforvisualfinish
	end
	
Move_FURY_SWIPE_1:
	loadspritegfx ANIM_TAG_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 5, 5
	delay 4
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, 16, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 5, 1
	delay 10
	end
	
Move_FURY_SWIPE_2:
	loadspritegfx ANIM_TAG_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_TARGET, 2, 5, 5
	delay 4
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, -16, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 7, 1
	end
	
Move_FURY_SWIPE_3:
	loadspritegfx ANIM_TAG_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 5, 5
	delay 4
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, 16, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 5, 1
	delay 10
	end
	
Move_FURY_SWIPE_4:
	loadspritegfx ANIM_TAG_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_TARGET, 2, 5, 5
	delay 4
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, -16, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 7, 1
	end
	
Move_FURY_SWIPE_5:
	loadspritegfx ANIM_TAG_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 5, 5
	delay 4
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, 16, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 5, 1
	delay 10
	end
	
Move_STRUGGLE_BUG:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_MOVEMENT_WAVES
	monbg ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 3, 0, 12, 4
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 2
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 2
	loopsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER, 12, 4
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_X_SCISSOR:
	loadspritegfx ANIM_TAG_CROSS_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	delay 12
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 8, 0, 18, 1
	createsprite gCrossImpactSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 36
	playsewithpan SE_M_LEER, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_IRON_HEAD:
	loopsewithpan SE_M_HARDEN, SOUND_PAN_ATTACKER, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	waitforvisualfinish
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 2, 0, 4, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 6, 1
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	end
	
Move_PRECIPICE_BLADES:
	loadspritegfx ANIM_TAG_MUD_SAND
	createvisualtask AnimTask_HorizontalShake, 3, (MAX_BATTLERS_COUNT + 1), 10, 50
	createvisualtask AnimTask_HorizontalShake, 3, ANIM_TARGET, 10, 50
	playsewithpan SE_M_EARTHQUAKE, SOUND_PAN_TARGET
	delay 8
	call FissureDirtPlumeFar
	delay 15
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	delay 15
	call FissureDirtPlumeClose
	delay 15
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	delay 15
	call FissureDirtPlumeFar
	delay 50
	fadetobg BG_FISSURE
	waitbgfadeout
	createvisualtask AnimTask_PositionFissureBgOnBattler, 5, ANIM_TARGET, 5, -1
	waitbgfadein
	delay 40
	restorebg
	waitbgfadeout
	setarg 7, -1
	waitbgfadein
	end
	
Move_AQUA_STEP:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_BLUE_RING_2
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 0, 7, RGB(0, 25, 28)
	delay 10
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 100, 100, 8, 1, 20, 40, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 20, 100, 16, 2, 10, 35, 1
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 200, 80, 8, 1, 40, 20, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 80, 60, 10, 3, 20, 50, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 140, 100, 16, 1, 20, 30, 1
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gFistFootRandomPosSpriteTemplate, ANIM_ATTACKER, 3, 1, 20, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 4, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 7, 0, RGB(0, 25, 28)
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_SOMESENSORY:
	call SetPsychicBackground
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_ATTACKER, RGB(27, 27, 0), 12, 1, 1
	createvisualtask AnimTask_ExtrasensoryDistortion, 5, 0
	playsewithpan SE_M_BIND, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_TransparentCloneGrowAndShrink, 2, ANIM_ATTACKER
	createvisualtask AnimTask_ExtrasensoryDistortion, 5, 2
	playsewithpan SE_M_LEER, SOUND_PAN_ATTACKER
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_DEF_PARTNER
	call UnsetPsychicBackground
	end
	
Move_NOSENSORY:
	loadspritegfx ANIM_TAG_AMNESIA
	call SetPsychicBackground
	delay 8
	createsprite gQuestionMarkSpriteTemplate, ANIM_ATTACKER, 20
	playsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER
	delay 54
	loopsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER, 16, 3
	waitforvisualfinish
	call UnsetPsychicBackground
	end
	
Move_HEALING_WISH:
	loadspritegfx ANIM_TAG_GOLD_STARS
	loadspritegfx ANIM_TAG_SPARKLE_2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 0, 10, RGB_BLACK
	waitforvisualfinish
	panse_adjustall SE_M_REFLECT, SOUND_PAN_TARGET, SOUND_PAN_ATTACKER, -3, 0
	createsprite gWishStarSpriteTemplate, ANIM_ATTACKER, 40
	waitforvisualfinish
	delay 60
	loopsewithpan SE_M_HEAL_BELL, SOUND_PAN_ATTACKER, 16, 3
	call GrantingStarsEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 10, 0, RGB_BLACK
	waitforvisualfinish
	end
	
Move_REAL_TEARS:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	createvisualtask AnimTask_BlendParticle, 5, ANIM_TAG_SMALL_BUBBLES, 0, 4, 4, RGB(12, 11, 31)
	waitforvisualfinish
	createvisualtask AnimTask_RockMonBackAndForth, 5, ANIM_ATTACKER, 2, 1
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 12, 4
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	waitforvisualfinish
	end
	
Move_SHADOW_SNEAK:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	fadetobg BG_GHOST
	waitbgfadein
	monbg ANIM_ATK_PARTNER
	setalpha 9, 8
	createvisualtask AnimTask_AttackerPunchWithTrace, 2, RGB_BLACK, 13
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 8, 1, 0
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	restorebg
	waitbgfadein
	end
	
Move_PUKE_BLOOD:
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	monbg ANIM_DEF_PARTNER
	createsprite gAcidPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 1, 0, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	delay 5
	createsprite gAcidPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 1, 24, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	delay 5
	createsprite gAcidPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 1, -24, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	delay 15
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 2, 0, 10, 1
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_DEF_PARTNER, 2, 0, 10, 1
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_DEF_SIDE, 2, 2, 0, 12, RGB(30, 0, 31)
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 15, 55
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 15, 55
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 15, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 10, 45
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 15, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end
	
Move_ACID_SPRAY:
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	monbg ANIM_DEF_PARTNER
	createsprite gAcidPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 1, 0, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	delay 5
	createsprite gAcidPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 1, 24, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	delay 5
	createsprite gAcidPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 1, -24, 0
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	delay 15
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 2, 0, 10, 1
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_DEF_PARTNER, 2, 0, 10, 1
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_DEF_SIDE, 2, 2, 0, 12, RGB(30, 0, 31)
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 15, 55
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 15, 55
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 15, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 10, 45
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 15, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end
	
Move_DRILL_RUN:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_WHIRLWIND_LINES
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	delay 2
	loopsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET, 4, 8
	createvisualtask AnimTask_DrillPeckHitSplats, 5
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 18, 1
	waitforvisualfinish
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 6
	waitforvisualfinish
	end

Move_ROCK_CLIMB:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ROCKS
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ShakeAndSinkMon, 5, ANIM_ATTACKER, 2, 0, 96, 30
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 4
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_TARGET, 18, 6, 2, 4
	delay 4
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 16, 12, ANIM_TARGET, 1
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 20, 24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 5, 0, -20, 24, 14, 1
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 5, 20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, -5, 0, -20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 30, 18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 30, -18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -30, 18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -30, -18, 8, 2
	delay 4
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -16, -12, ANIM_TARGET, 1
	delay 4
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 3, 4, ANIM_TARGET, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
	
Move_CONFIDE:
	loadspritegfx ANIM_TAG_NOISE_LINE
	createvisualtask SoundTask_PlayDoubleCry, 2, ANIM_ATTACKER, DOUBLE_CRY_GROWL
	call RoarEffect
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 9, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 1, 0, 9, 1
	waitforvisualfinish
	createvisualtask SoundTask_WaitForCry, 5
	waitforvisualfinish
	end

Move_QUINTUPLE_WINGBEAT:
Move_DUAL_WINGBEAT:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	loopsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET, 5, 2
	call WingbeatHitEffect
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_JAB:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_TARGET
	setalpha 12, 8
	choosetwoturnanim CometPunchLeft, CometPunchRight
	
Move_SPECIALPUNCH:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 9, RGB_RED
	createsprite gFireSpiralInwardSpriteTemplate, ANIM_TARGET, 1, 0
	createsprite gFireSpiralInwardSpriteTemplate, ANIM_TARGET, 1, 64
	createsprite gFireSpiralInwardSpriteTemplate, ANIM_TARGET, 1, 128
	createsprite gFireSpiralInwardSpriteTemplate, ANIM_TARGET, 1, 196
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, 0, 0, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 15, 1
	call FireSpreadEffect
	delay 4
	playsewithpan SE_M_FIRE_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 0, 9, 0, RGB_RED
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
	
Move_PSYCHIC_PUNCH:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_TARGET
	call SetPsychicBackground
	setalpha 8, 8
	delay 2
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_TARGET
	createsprite gMegaPunchKickSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 50
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 7, RGB_WHITE
	delay 50
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 22, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 0, RGB_WHITE
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB_BLACK, 8, RGB_BLACK, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 1
	call UnsetPsychicBackground
	waitbgfadein
	end
	
Move_MOONGEIST_BEAM:
	loadspritegfx ANIM_TAG_MOON
	loadspritegfx ANIM_TAG_GREEN_SPARKLE
	loadspritegfx ANIM_TAG_BLUE_STAR
	setalpha 0, 16
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 0, 16, RGB_BLACK
	waitforvisualfinish
	createsprite gMoonSpriteTemplate, ANIM_ATTACKER, 2, 120, 56
	createvisualtask AnimTask_AlphaFadeIn, 3, 0, 16, 16, 0, 1
	playsewithpan SE_M_MOONLIGHT, 0
	delay 30

	
	loadspritegfx ANIM_TAG_GLOWY_RED_ORB
	loadspritegfx ANIM_TAG_GLOWY_GREEN_ORB
	loadspritegfx ANIM_TAG_DUCK
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 25, 1
	delay 6
	panse SE_M_BUBBLE_BEAM, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +1, 0
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 25, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_TARGET, 8, 5, RGB_RED, 8, RGB(1, 30, 0), 8
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, -12, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, -24, 0
	delay 30
	createvisualtask AnimTask_MoonlightEndFade, 2
	waitforvisualfinish
	end
	
Move_SHELL_SMASH:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	

	
Move_CONVERSION_Z:
	monbg ANIM_ATK_PARTNER
	splitbgprio ANIM_ATTACKER
	setalpha 16, 0
	createvisualtask AnimTask_SetCamouflageBlend, 5, F_PAL_ATTACKER, 3, 0, 14
	delay 16
	createvisualtask AnimTask_AttackerFadeToInvisible, 2, 4
	playsewithpan SE_M_FAINT_ATTACK, SOUND_PAN_ATTACKER
	waitforvisualfinish
	delay 8
	createvisualtask AnimTask_SetCamouflageBlend, 5, F_PAL_ATTACKER, 0, 0, 0
	waitforvisualfinish
	createvisualtask AnimTask_AttackerFadeFromInvisible, 2, 1
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_ATK_PARTNER
	end
	
Move_BOLTBEAM:
	loadspritegfx ANIM_TAG_GLOWY_RED_ORB
	loadspritegfx ANIM_TAG_GLOWY_GREEN_ORB
	loadspritegfx ANIM_TAG_DUCK
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 25, 1
	delay 6
	panse SE_M_BUBBLE_BEAM, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +1, 0
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 25, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_TARGET, 8, 5, RGB_RED, 8, RGB(1, 30, 0), 8
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	waitforvisualfinish
	end
	
Move_ROUNDEN:
	loadspritegfx ANIM_TAG_SPHERE_TO_CUBE
	createsprite gRoundSphereSpriteTemplate, ANIM_ATTACKER, 2
	waitforvisualfinish
	end
	
Move_THROAT_CHOP:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	
	delay 1
	fadetobg BG_DARK
	waitbgfadein
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_TARGET
	createsprite gKarateChopSpriteTemplate, ANIM_ATTACKER, 2, -16, 0, 0, 0, 10, 1, 3, 0
	waitforvisualfinish
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 4, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	restorebg
	waitbgfadein
	end
	
Move_DRAGON_HAMMER:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_WOOD_HAMMER:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_PICKLE_SPEAR:
	loadspritegfx ANIM_TAG_PICKLE_SPEAR
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	createsprite gPickleSpearSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, -8, -8, 20, -32
	delay 15
	createsprite gPickleSpearSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, 8, 8, 20, -40
	delay 4
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -8, -8, ANIM_TARGET, 2
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 2, 1
	delay 9
	createsprite gPickleSpearSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, 0, 0, 20, -32
	delay 4
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 8, 8, ANIM_TARGET, 2
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 2, 1
	delay 14
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_DRUM_BEATING:
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	loadspritegfx ANIM_TAG_PURPLE_HAND_OUTLINE
	createvisualtask AnimTask_MusicNotesRainbowBlend, 2
	waitforvisualfinish
	call DrumBeatingRight
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_USER, 2, 0, 0, 0, 0
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_TARGET
	delay 15
	call DrumBeatingLeft
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_USER, 2, 1, 1, 1, 0
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_TARGET
	delay 15
	call DrumBeatingRight
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_USER, 2, 0, 3, 3, 128
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_TARGET
	delay 7
	call DrumBeatingLeft
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_USER, 2, 1, 2, 0, 128
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_TARGET
	delay 7
	call DrumBeatingRight
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_USER, 2, 0, 1, 1, 0
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_TARGET
	delay 7
	call DrumBeatingLeft
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_USER, 2, 1, 0, 3, 0
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_MusicNotesClearRainbowBlend, 2
	waitforvisualfinish
	end

DrumBeatingLeft:
	createsprite gBellyDrumHandSpriteTemplate, ANIM_USER, 5, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 8, 2, 1
	return
	
DrumBeatingRight:
	createsprite gBellyDrumHandSpriteTemplate, ANIM_USER, 5, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 8, 2, 1
	return
	
Move_BESTOW:	
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask AnimTask_IsHealingMove, 2
	createsprite gPresentSpriteTemplate, ANIM_TARGET, 2, 0, -5, 10, 2, -1
	playsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	delay 14
	playsewithpan SE_M_BUBBLE2, SOUND_PAN_ATTACKER
	delay 14
	playsewithpan SE_M_BUBBLE2, 0
	delay 20
	playsewithpan SE_M_BUBBLE2, SOUND_PAN_TARGET
	waitforvisualfinish
	waitsound
	end
	
Move_SKY_DROP:
	loadspritegfx ANIM_TAG_ROUND_SHADOW
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	createsprite gBounceBallShrinkSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gBounceBallLandSpriteTemplate, ANIM_TARGET, 3
	delay 7
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 11, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto BounceEnd
	
Move_DELIVERY:
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask AnimTask_IsHealingMove, 2
	createsprite gPresentSpriteTemplate, ANIM_TARGET, 2, 0, -5, 10, 2, -1
	playsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	delay 14
	playsewithpan SE_M_BUBBLE2, SOUND_PAN_ATTACKER
	delay 14
	playsewithpan SE_M_BUBBLE2, 0
	delay 20
	playsewithpan SE_M_BUBBLE2, SOUND_PAN_TARGET
	waitforvisualfinish
	loadspritegfx ANIM_TAG_EXPLOSION
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, 16, 16, 1, 1
	end
	
Move_AUTOMOTIZE:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_HI_HORSEPOWER:
	createvisualtask AnimTask_HorizontalShake, 5, (MAX_BATTLERS_COUNT + 1), 10, 50
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 10, 50
	playsewithpan SE_M_EARTHQUAKE, 0
	delay 10
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	delay 16
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	end
	
Move_HEAL_BLOCK:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_BLUE_RING_2
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_X_SIGN
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	playsewithpan SE_M_ABSORB_2, SOUND_PAN_TARGET
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, 0, -5, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, -15, 10, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, -15, -15, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, 10, -5, 1, 0
	delay 7
	createsprite gBlockXSpriteTemplate, ANIM_TARGET, 66
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	clearmonbg ANIM_TARGET
	end
	
Move_GULP:
	loadspritegfx ANIM_TAG_ORBS
	monbg_static ANIM_DEF_PARTNER
	setalpha 11, 5
	panse SE_M_MINIMIZE, SOUND_PAN_TARGET, SOUND_PAN_ATTACKER, -3, 0
	createvisualtask AnimTask_ShrinkTargetCopy, 5, 128, 24
	delay 15
	createsprite gMimicOrbSpriteTemplate, ANIM_TARGET, 2, -12, 24
	delay 10
	setarg 7, 0xFFFF
	waitforvisualfinish
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 0, 2, 0, 11, RGB_WHITE
	waitforvisualfinish
	clearmonbg_static ANIM_DEF_PARTNER
	blendoff
	end
	
Move_GROUND_POUND:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ROCKS
	setarg 7, 0
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	waitforvisualfinish
	createvisualtask AnimTask_GetSeismicTossDamageLevel, 3
	delay 1
	fadetobg BG_IN_AIR
	waitbgfadeout
	createvisualtask AnimTask_MoveSeismicTossBg, 3
	playsewithpan SE_M_SKY_UPPERCUT, 0
	waitbgfadein
	waitforvisualfinish
	createvisualtask AnimTask_SeismicTossBgAccelerateDownAtEnd, 3
	jumpreteq 0, SeismicTossWeak
	jumpreteq 1, SeismicTossMedium
	jumpreteq 2, SeismicTossStrong
	
Move_PSYSTORM:
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	monbg ANIM_ATK_PARTNER
	fadetobg BG_PSYCHIC
	waitbgfadeout
	createvisualtask AnimTask_FadeScreenToWhite, 5
	waitbgfadein
	delay 6
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_BG, 2, 8, 0, 10, RGB_BLACK
	delay 0
	splitbgprio ANIM_ATTACKER
	setalpha 8, 8
	delay 10
	createvisualtask AnimTask_ShakeMon, 2, ANIM_ATTACKER, 3, 0, 240, 0
	loopsewithpan SE_M_PSYBEAM2, SOUND_PAN_ATTACKER, 14, 10
	createsprite gPsychoBoostOrbSpriteTemplate, ANIM_ATTACKER, 2
	delay 110
	loopsewithpan SE_M_PSYBEAM2, SOUND_PAN_ATTACKER, 7, 10
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, -8, 1, 24, 1
	playsewithpan SE_M_LEER, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	call UnsetPsychicBackground
	end
	

	
Move_SHADOW_IMAGES:
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_DoubleTeam, 2
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 32
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 24
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 16
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	delay 1
	end
	
Move_G_MAX_CUDDLE:
	loadspritegfx ANIM_TAG_BREATH
	loadspritegfx ANIM_TAG_MAGENTA_HEART
	loadspritegfx ANIM_TAG_IMPACT

	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 0, 16, RGB(6,2,6)
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_GrowAndShrink, 2
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gBreathPuffSpriteTemplate, ANIM_ATTACKER, 2
	loopsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER, 4, 2
	waitforvisualfinish

	createvisualtask AnimTask_RockMonBackAndForth, 5, ANIM_ATTACKER, 4, 0
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 0, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, -20, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 20, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 0, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, -20, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 20, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 3
	waitforvisualfinish
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -10, 0, ANIM_TARGET, 0
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -32, 0, 0, 3
	waitforvisualfinish
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_ATTACKER, 0
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 4, 0, 12, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 4, 0, 12, 1
	waitforvisualfinish
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_ATTACKER, 1
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_TARGET, 1
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 16, 0, RGB(6,2,6)
	end
	
Move_EXTREME_EVOBOOST:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_MOVEMENT_WAVES
	monbg ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 3, 0, 12, 4
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 2
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 2
	loopsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER, 12, 4
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_VEEVEE_VOLLEY:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_MOVEMENT_WAVES
	monbg ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 3, 0, 12, 4
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 2
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 2
	loopsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER, 12, 4
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_NORMALLY_NORMAL:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_MOONBLAST:
	loadspritegfx ANIM_TAG_MOON
	loadspritegfx ANIM_TAG_GREEN_SPARKLE
	loadspritegfx ANIM_TAG_BLUE_STAR
	setalpha 0, 16
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 0, 16, RGB_BLACK
	waitforvisualfinish
	createsprite gMoonSpriteTemplate, ANIM_ATTACKER, 2, 120, 56
	createvisualtask AnimTask_AlphaFadeIn, 3, 0, 16, 16, 0, 1
	playsewithpan SE_M_MOONLIGHT, 0
	delay 30

	
	loadspritegfx ANIM_TAG_BLUE_RING_2
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 5
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 5
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 13
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 8, 18, 1
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, -12, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, -24, 0
	delay 30
	createvisualtask AnimTask_MoonlightEndFade, 2
	waitforvisualfinish
	end
	
Move_MYSTICAL_FIRE:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_BLUE_RING_2
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 0, 7, RGB(0, 25, 28)
	delay 10
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 100, 100, 8, 1, 20, 40, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 20, 100, 16, 2, 10, 35, 1
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 200, 80, 8, 1, 40, 20, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 80, 60, 10, 3, 20, 50, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 140, 100, 16, 1, 20, 30, 1
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	waitforvisualfinish
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 5
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 5
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 13
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 8, 18, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 7, 0, RGB(0, 25, 28)
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end
	
Move_JUDGEMENT:
	playsewithpan SE_M_LEER, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_Flash, 2
	waitforvisualfinish
	playsewithpan SE_M_LEER, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_Flash, 2
	waitforvisualfinish
	playsewithpan SE_M_LEER, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_Flash, 2
	waitforvisualfinish
	end
	
Move_RAGE_POWDER:
	loadspritegfx ANIM_TAG_STUN_SPORE
	loadspritegfx ANIM_TAG_ANGER
	loopsewithpan SE_M_POISON_POWDER, SOUND_PAN_TARGET, 10, 6
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -30, -22, 117, 80, 5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 10, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -25, -22, 117, 112, 5, 3
	delay 15
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -5, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 5, -22, 117, 96, 5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 0, -22, 117, 69, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -15, -22, 117, 112, 5, 2
	delay 30
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -15, -22, 117, 112, 5, 2
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 15, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -10, -22, 117, 96, 7, 2
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -5, -22, 117, 90, -8, 0
	delay 20
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -10, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 0, -22, 117, 89, 5, 2
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 20, -22, 117, 112, -8, 2
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 5, -22, 117, 80, 5, 1
	waitforvisualfinish
	delay 8
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, -20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_TARGET
	waitforvisualfinish
	delay 12
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, 20, -28
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_TARGET
	end
	
Move_TRICK_ROOM:
	call General_TrickRoom
	end
	

	
Move_ALLY_SWITCH:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_DUSK_BALL:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_TM07:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_ZAP_TAP:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_THUNDERJOLT:
	loadspritegfx ANIM_TAG_ELECTRIC_ORBS
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_LIGHTNING
	monbg ANIM_ATTACKER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 4, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_ElectricChargingParticles, 2, ANIM_ATTACKER, 20, 0, 2
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 12
	createsprite gGrowingShockWaveOrbSpriteTemplate, ANIM_ATTACKER, 2
	delay 30
	createvisualtask AnimTask_ShockWaveProgressingBolt, 5
	delay 12
	waitforvisualfinish
	createvisualtask AnimTask_ShockWaveLightning, 5
	playsewithpan SE_M_TRI_ATTACK2, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 6, 18, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 5, F_PAL_BG, 3, 16, 0, RGB_WHITE
	createvisualtask AnimTask_BlendBattleAnimPal, 5, F_PAL_TARGET, 0, 16, 16, RGB_BLACK
	delay 4
	createvisualtask AnimTask_BlendBattleAnimPal, 5, F_PAL_TARGET, 0, 0, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	end
	
Move_LIGHTNING:
	fadetobg BG_THUNDER
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -256, 0, 1, -1
	waitbgfadein
	createvisualtask AnimTask_HorizontalShake, 5, (MAX_BATTLERS_COUNT + 1), 10, 50
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 10, 50
	playsewithpan SE_M_EARTHQUAKE, 0
	delay 10
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	delay 16
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, 0xFFFF
	waitbgfadein
	end
	
	
Move_VACUUM_CUT:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
	
Move_TRY_ATTACK:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_MOVEMENT_WAVES
	monbg ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 3, 0, 12, 4
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 2
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 2
	loopsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER, 12, 4
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_TAX_FRAUD:
	loadspritegfx ANIM_TAG_MONEY
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_TAXES
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_SKY_UPPERCUT, SOUND_PAN_ATTACKER
	createsprite gTaxesSpriteTemplate, ANIM_TARGET, 2
	delay 14
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 10, 0, 18, 1
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	loopsewithpan SE_M_POISON_POWDER, SOUND_PAN_ATTACKER, 10, 5
	createsprite gMoneyParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -2, 10
	delay 2
	createsprite gMoneyParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -1, 15
	delay 2
	createsprite gMoneyParticleSpriteTemplate, ANIM_ATTACKER, 2, -4, -4, 7
	delay 2
	createsprite gMoneyParticleSpriteTemplate, ANIM_ATTACKER, 2, 3, -3, 11
	delay 2
	createsprite gMoneyParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -6, 8
	delay 2
	createsprite gMoneyParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -1, 12
	delay 2
	createsprite gMoneyParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -4, 13
	delay 2
	createsprite gMoneyParticleSpriteTemplate, ANIM_ATTACKER, 2, 4, -5, 7
	delay 2
	createsprite gMoneyParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -6, 11
	delay 2
	createsprite gMoneyParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -5, 8
	delay 2
	waitforvisualfinish
	end
	
Move_PYRO_BALL:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_FICKLE_BEAM:
	loadspritegfx ANIM_TAG_GLOWY_RED_ORB
	loadspritegfx ANIM_TAG_GLOWY_GREEN_ORB
	loadspritegfx ANIM_TAG_DUCK
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 25, 1
	delay 6
	panse SE_M_BUBBLE_BEAM, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +1, 0
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 25, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_TARGET, 8, 5, RGB_RED, 8, RGB(1, 30, 0), 8
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	waitforvisualfinish
	end
	
Move_LEAF_STORM:
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_RAZOR_LEAF
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 1
	loopsewithpan SE_M_POISON_POWDER, SOUND_PAN_ATTACKER, 10, 5
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -2, 10
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -1, 15
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -4, -4, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 3, -3, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -6, 8
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -1, 12
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -4, 13
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 4, -5, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -6, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -5, 8
	delay 60
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, 20, 1
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, -20, 1
	delay 20
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 2, 0, 8, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
	
Move_BARRAGE_2:
	loadspritegfx ANIM_TAG_RED_BALL
	createvisualtask AnimTask_BarrageBall, 3
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	delay 24
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, 40, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_TARGET, 0, 4, 20, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_DEF_PARTNER, 0, 4, 20, 1
	loopsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET, 8, 2
	end
	
Move_BARRAGE_3:
	loadspritegfx ANIM_TAG_RED_BALL
	createvisualtask AnimTask_BarrageBall, 3
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	delay 24
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, 40, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_TARGET, 0, 4, 20, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_DEF_PARTNER, 0, 4, 20, 1
	loopsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET, 8, 2
	end
	
Move_BARRAGE_4:
	loadspritegfx ANIM_TAG_RED_BALL
	createvisualtask AnimTask_BarrageBall, 3
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	delay 24
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, 40, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_TARGET, 0, 4, 20, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_DEF_PARTNER, 0, 4, 20, 1
	loopsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET, 8, 2
	end
	
	
Move_BREADBUTT:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_BREAD
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 2, 0, 4, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 6, 1
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gFallingBreadSpriteTemplate, ANIM_ATTACKER, 2
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_BUTTER_BLADE:
	loadspritegfx ANIM_TAG_BUTTER_BLADE
	createsprite gButterSliceSpriteTemplate, ANIM_TARGET, 2, 1, 0, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 18, 1
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_DEF_SIDE, 2, 2, 0, 12, RGB(30, 30, 0)
	waitforvisualfinish
	end
	
Move_PICKLE_BEAM:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_CHEESE_DRY:
	loadspritegfx ANIM_TAG_CHEESE
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	createvisualtask AnimTask_CheeseDry, 3
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	delay 24
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, 40, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_TARGET, 0, 4, 20, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_DEF_PARTNER, 0, 4, 20, 1
	loopsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET, 8, 2
	waitforvisualfinish
	playsewithpan SE_M_BLIZZARD2, SOUND_PAN_TARGET
	call IceCrystalEffectLong
	waitforvisualfinish
	end
	
Move_LEAF_TOMATO:
	loadspritegfx ANIM_TAG_TOMATO
	loadspritegfx ANIM_TAG_GUST
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	createvisualtask AnimTask_BlendParticle, 5, ANIM_TAG_POISON_BUBBLE, 0, 13, 13, RGB(250, 12, 12)
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_GUST, SOUND_PAN_TARGET
	createsprite gEllipticalGustSpriteTemplate, ANIM_ATTACKER, 2, 0, -16
	createvisualtask AnimTask_AnimateGustTornadoPalette, 5, 1, 50
	call WhirlpoolTomatoes
	call WhirlpoolTomatoes
	call WhirlpoolTomatoes
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 1, 0, 7, 1
	playsewithpan SE_M_GUST2, SOUND_PAN_TARGET
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(250, 4, 4)
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 15, 55
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 15, 55
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 15, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 10, 45
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 15, 50
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

WhirlpoolTomatoes:
	createsprite gWhirlpoolTomatoSpriteTemplate, ANIM_TARGET, 2, 0, 28, 384, 50, 8, 50, ANIM_TARGET
	delay 2
	createsprite gWhirlpoolTomatoSpriteTemplate, ANIM_TARGET, 2, 0, 32, 240, 40, 11, -46, ANIM_TARGET
	delay 2
	createsprite gWhirlpoolTomatoSpriteTemplate, ANIM_TARGET, 2, 0, 33, 416, 40, 4, 42, ANIM_TARGET
	delay 2
	createsprite gWhirlpoolTomatoSpriteTemplate, ANIM_TARGET, 2, 0, 31, 288, 45, 6, -42, ANIM_TARGET
	delay 2
	createsprite gWhirlpoolTomatoSpriteTemplate, ANIM_TARGET, 2, 0, 28, 448, 45, 11, 46, ANIM_TARGET
	delay 2
	createsprite gWhirlpoolTomatoSpriteTemplate, ANIM_TARGET, 2, 0, 33, 464, 50, 10, -50, ANIM_TARGET
	delay 2
	return
	
Move_LETTUCE_SNUGGLE:
	loadspritegfx ANIM_TAG_LETTUCE
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_MOVEMENT_WAVES
	createvisualtask AnimTask_RockMonBackAndForth, 5, ANIM_ATTACKER, 2, 0
	createsprite gLettuceSnuggleSpriteTemplate, ANIM_ATTACKER, 3, 0, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 5
	createsprite gLettuceSnuggleSpriteTemplate, ANIM_ATTACKER, 3, -15, 20
	delay 5
	createsprite gLettuceSnuggleSpriteTemplate, ANIM_ATTACKER, 3, 5, 20
	delay 5
	createsprite gLettuceSnuggleSpriteTemplate, ANIM_ATTACKER, 3, -20, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 5
	createsprite gLettuceSnuggleSpriteTemplate, ANIM_ATTACKER, 3, 15, 20
	delay 5
	createsprite gLettuceSnuggleSpriteTemplate, ANIM_ATTACKER, 3, -5, 20
	delay 5
	createsprite gLettuceSnuggleSpriteTemplate, ANIM_ATTACKER, 3, 20, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	waitforvisualfinish
	monbg ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 3, 0, 12, 4
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 2
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 2
	loopsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER, 12, 4
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 3, 0, 6, 1
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_DEF_SIDE, 2, 2, 0, 12, RGB(0, 30, 0)
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_MEATEOR_BEAM:
	loadspritegfx ANIM_TAG_MEATBALL
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 0, 16, RGB(8,2,0)
	waitforvisualfinish
	delay 10
	playsewithpan SE_M_HYPER_BEAM, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 4, 1
	waitforvisualfinish
	delay 30
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_WATERFALL, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, 1, 15, 0, 5
	createvisualtask AnimTask_ShakeMon, 2, ANIM_ATTACKER, 0, 4, 50, 1
	@createvisualtask AnimTask_FlashAnimTagWithColor, 2, ANIM_TAG_ORBS, 1, 12, RGB(31, 0, 0), 16, 0, 0
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 50, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 11, RGB(25, 25, 25)
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	call MeatballOrbs
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 11, 0, RGB(25, 25, 25)
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 16, 0, RGB(8,2,0)
	end

MeatballOrbs:
	createsprite gMeatballSpriteTemplate, ANIM_TARGET, 2
	createsprite gMeatballSpriteTemplate, ANIM_TARGET, 2
	delay 1
	return
	
Move_BREAD_CHARGE:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_BREAD
	playsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_ATTACKER, 4, 2, RGB_WHITE, 10, RGB_BLACK, 0
	waitforvisualfinish
	delay 10
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	waitplaysewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 18, 6, 2, 4
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 16, 16, RGB_WHITE
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 3
	waitforvisualfinish
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -10, 0, ANIM_TARGET, 0
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -32, 0, 0, 3
	waitforvisualfinish
	createsprite gFallingBreadSpriteTemplate, ANIM_ATTACKER, 2
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_ATTACKER, 0
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 4, 0, 12, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 4, 0, 12, 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 16, 0, RGB_WHITE
	waitforvisualfinish
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_ATTACKER, 1
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_TARGET, 1
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7
	waitforvisualfinish
	end

Move_MIND_BLOWN:
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 8, 9, RGB(26, 8, 8), 8, RGB_BLACK, 8
	createvisualtask AnimTask_ShakeMon2, 5, 4, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 5, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 6, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 7, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 8, 8, 0, 40, 1
	call Explosion1
	call Explosion1
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 1, 16, 16, RGB_WHITE
	delay 50
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 3, 16, 0, RGB_WHITE
	end


Move_ICE_O_CUT:
	loadspritegfx ANIM_TAG_CUT
	fadetobg BG_AURORA
	waitbgfadein
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_CUT, SOUND_PAN_TARGET
	createsprite gCuttingSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0
	delay 5
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 10, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	waitforvisualfinish
	restorebg
	waitbgfadein
	end




Move_FURY_SWIPE_6:
	loadspritegfx ANIM_TAG_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_TARGET, 2, 5, 5
	delay 4
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, -16, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 7, 1
	end

Move_FOLLOW_MIE:
	loadspritegfx ANIM_TAG_FINGER
	createsprite gFollowMeFingerSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	delay 18
	playsewithpan SE_M_ATTRACT, SOUND_PAN_ATTACKER
	delay 71
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 22, 3
	end

Move_MIE_FIRST:
	loadspritegfx ANIM_TAG_ORBS
	monbg_static ANIM_DEF_PARTNER
	setalpha 11, 5
	panse SE_M_MINIMIZE, SOUND_PAN_TARGET, SOUND_PAN_ATTACKER, -3, 0
	createvisualtask AnimTask_ShrinkTargetCopy, 5, 128, 24
	delay 15
	createsprite gMimicOrbSpriteTemplate, ANIM_TARGET, 2, -12, 24
	delay 10
	setarg 7, 0xFFFF
	waitforvisualfinish
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 0, 2, 0, 11, RGB_WHITE
	waitforvisualfinish
	clearmonbg_static ANIM_DEF_PARTNER
	blendoff
	end

Move_MIETEOR_MASH:
	loadspritegfx ANIM_TAG_GOLD_STARS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	panse SE_M_BARRIER, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +3, 0
	fadetobg BG_COSMIC
	waitbgfadein
	waitforvisualfinish
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -48, -64, 72, 32, 30
	delay 10
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -112, -64, 8, 32, 30
	delay 40
	createsprite gSpinningHandOrFootSpriteTemplate, ANIM_TARGET, 3, 0, 0, 0, 30
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -80, -64, 40, 32, 30
	delay 20
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 5, 0, 20, 1
	waitforvisualfinish
	delay 10
	restorebg
	waitbgfadein
	waitforvisualfinish
	end

Move_MIETEOR_BEAM:
	loadspritegfx ANIM_TAG_ORBS
	panse SE_M_BARRIER, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +3, 0
	fadetobg BG_COSMIC
	waitbgfadein
	waitforvisualfinish
	delay 10
	playsewithpan SE_M_HYPER_BEAM, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 4, 1
	waitforvisualfinish
	delay 30
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_HYPER_BEAM2, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, 1, 15, 0, 5
	createvisualtask AnimTask_ShakeMon, 2, ANIM_ATTACKER, 0, 4, 50, 1
	createvisualtask AnimTask_FlashAnimTagWithColor, 2, ANIM_TAG_ORBS, 1, 12, RGB(31, 0, 0), 16, 0, 0
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 50, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 11, RGB(25, 25, 25)
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	restorebg
	waitbgfadein
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 16, 0, RGB_BLACK
	end

Move_DRACO_MIETEOR:
	loadspritegfx ANIM_TAG_GOLD_STARS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ROCKS
	panse SE_M_BARRIER, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +3, 0
	fadetobg BG_COSMIC
	waitbgfadein
	waitforvisualfinish
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -48, -64, 72, 32, 30
	delay 10
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -112, -64, 8, 32, 30
	delay 40
	createsprite gRockTombRockSpriteTemplate, ANIM_TARGET, 2, -3, 13, 64, 66, 0
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -80, -64, 40, 32, 30
	delay 20
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 5, 0, 20, 1
	waitforvisualfinish
	delay 10
	restorebg
	waitbgfadein
	waitforvisualfinish
	end

Move_MIELING_WISH:
	loadspritegfx ANIM_TAG_GOLD_STARS
	loadspritegfx ANIM_TAG_SPARKLE_2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 0, 10, RGB_BLACK
	waitforvisualfinish
	panse_adjustall SE_M_REFLECT, SOUND_PAN_TARGET, SOUND_PAN_ATTACKER, -3, 0
	createsprite gWishStarSpriteTemplate, ANIM_ATTACKER, 40
	waitforvisualfinish
	delay 60
	loopsewithpan SE_M_HEAL_BELL, SOUND_PAN_ATTACKER, 16, 3
	call GrantingStarsEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 10, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_MIEF:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	delay 1
	fadetobg BG_DARK
	waitbgfadein
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 6
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 8, 1
	waitforvisualfinish
	delay 20
	clearmonbg ANIM_TARGET
	blendoff
	restorebg
	waitbgfadein
	end

Move_PSYCHO_CUT:
	loadspritegfx ANIM_TAG_CUT
	monbg ANIM_TARGET
	call SetPsychicBackground
	setalpha 8, 8
	playsewithpan SE_M_CUT, SOUND_PAN_TARGET
	createsprite gCuttingSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0
	delay 5
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 10, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	delay 1
	call UnsetPsychicBackground
	waitforvisualfinish
	end

Move_AQUA_CUTTER:
	loadspritegfx ANIM_TAG_CUT
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_BLUE_RING_2
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 0, 7, RGB(0, 25, 28)
	delay 10
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 100, 100, 8, 1, 20, 40, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 20, 100, 16, 2, 10, 35, 1
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 200, 80, 8, 1, 40, 20, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 80, 60, 10, 3, 20, 50, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 140, 100, 16, 1, 20, 30, 1
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	waitforvisualfinish
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	setalpha 12, 8
	playsewithpan SE_M_CUT, SOUND_PAN_TARGET
	createsprite gCuttingSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0
	delay 5
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 10, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 7, 0, RGB(0, 25, 28)
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end


Move_QUIVER_DANCE:
	loadspritegfx ANIM_TAG_HOLLOW_ORB
	monbg ANIM_ATTACKER
	splitbgprio ANIM_ATTACKER
	delay 1
	createvisualtask AnimTask_DragonDanceWaver, 5
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	delay 8
	createvisualtask AnimTask_BlendPalInAndOutByTag, 5, ANIM_TAG_HOLLOW_ORB, RGB(0, 0, 19), 14, 0, 3
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 0
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 43
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 85
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 128
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 170
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 213
	delay 30
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	delay 30
	playsewithpan SE_M_TELEPORT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	delay 1
	end

Move_U_TURN:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_AttackerPunchWithTrace, 2, RGB(8, 9, 28), 10
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	createvisualtask AnimTask_SlideOffScreen, 5, ANIM_ATTACKER, -4
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	delay 1
	end

Move_FIRST_IMPRESSION:
	loadspritegfx ANIM_TAG_TAG_HAND
	loadspritegfx ANIM_TAG_SMELLINGSALT_EFFECT
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gSmellingSaltsHandSpriteTemplate, ANIM_TARGET, 2, ANIM_TARGET, 0, 2
	createsprite gSmellingSaltsHandSpriteTemplate, ANIM_TARGET, 2, ANIM_TARGET, 1, 2
	delay 32
	createvisualtask AnimTask_SmellingSaltsSquish, 3, ANIM_TARGET, 2
	loopsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET, 12, 2
	waitforvisualfinish
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 16, 1
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 6, 5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, -16, -15, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 16, -5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, -12, 18, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 0, 5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	waitforvisualfinish
	end

Move_SAVAGE_SPIN_OUT:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_SINGLE_WINGBEAT:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	loopsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET, 5, 2
	call WingbeatHitEffect
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_CONFUSION_PSYDUCK:
	monbg ANIM_DEF_PARTNER
	call SetPsychicBackground
	setalpha 8, 8
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 10, 1
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 0, 2, 0, 8, RGB_WHITE
	waitforvisualfinish
	playsewithpan SE_M_SUPERSONIC, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, ANIM_TARGET, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 1
	call UnsetPsychicBackground
	end


Move_DYNAMIC_CRUNCH:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_SHARP_TEETH
	loadspritegfx ANIM_TAG_EXPLOSION
	loadspritegfx ANIM_TAG_EXPLOSION_6
	delay 1
	monbg ANIM_TARGET
	fadetobg BG_DARK
	waitbgfadein
	setalpha 12, 8
	playsewithpan SE_M_BITE, SOUND_PAN_TARGET
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, -32, -32, 1, 819, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 32, 32, 5, -819, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 7, 5, 2
	waitforvisualfinish
	playsewithpan SE_M_BITE, SOUND_PAN_TARGET
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 32, -32, 7, -819, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, -32, 32, 3, 819, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 8, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 8, 4, 2
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 5, 0, 28, 1
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 1, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 1
	restorebg
	waitbgfadein
	end


Move_MUD_SPOUT:
	loadspritegfx ANIM_TAG_MUD_SAND
	createvisualtask AnimTask_Splash, 2, 0, 6
	delay 24
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, -4, -16
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, 4, -12
	playsewithpan SE_M_DIG, SOUND_PAN_ATTACKER
	delay 32
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, -3, -12
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, 5, -14
	playsewithpan SE_M_DIG, SOUND_PAN_ATTACKER
	delay 32
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, -5, -18
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, 3, -14
	playsewithpan SE_M_DIG, SOUND_PAN_ATTACKER
	delay 16
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 220, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 60, 100
	waitplaysewithpan SE_M_BUBBLE2, 0, 25
	delay 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 10, 0, 18, 1
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 140, 55
	waitplaysewithpan SE_M_BUBBLE2, 0, 14
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 180, 50
	waitplaysewithpan SE_M_BUBBLE2, 0, 10
	delay 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 10, 0, 18, 1
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 20, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 90, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 10, 0, 18, 1
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 160, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 30, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 120, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 200, 40
	waitplaysewithpan SE_M_BUBBLE2, 0, 10
	end


Move_FOURSIGHT:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end


Move_STEEL_WANG:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_WONDER_SEED:
	loadspritegfx ANIM_TAG_WONDER_SEED
	loadspritegfx ANIM_TAG_SMALL_CLOUD
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	createsprite gWonderSeedSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 32, -32
	waitforvisualfinish
	playsewithpan SE_M_PSYBEAM2, SOUND_PAN_TARGET
	createsprite gSmallCloudTemplate, ANIM_ATTACKER, 3, -2, -1, 0, -1, -1
	createsprite gSmallCloudTemplate, ANIM_ATTACKER, 3,  3,  1, 1, 2, -1
	createsprite gSmallCloudTemplate, ANIM_ATTACKER, 3, -2,  1, 2, 1, -2
	createsprite gSmallCloudTemplate, ANIM_ATTACKER, 3,  3, -2, 1, -1, -2
	waitforvisualfinish
	end

Move_COPYCAT:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_BLOOD_MOON:
	loadspritegfx ANIM_TAG_MOON
	loadspritegfx ANIM_TAG_GREEN_SPARKLE
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	setalpha 0, 16
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 0, 16, RGB_BLACK
	waitforvisualfinish
	createsprite gMoonSpriteTemplate, ANIM_ATTACKER, 2, 120, 56
	createvisualtask AnimTask_AlphaFadeIn, 3, 0, 16, 16, 0, 1
	playsewithpan SE_M_MOONLIGHT, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, -12, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, -24, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, 21, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, 0, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, 10, 0
	
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 2, 0, 10, 1
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_DEF_PARTNER, 2, 0, 10, 1
	call BleedTarget
	delay 10
	clearmonbg ANIM_DEF_PARTNER
	delay 20
	createvisualtask AnimTask_MoonlightEndFade, 2
	delay 20

	end


Move_EVIL_METRONOME:
	loadspritegfx ANIM_TAG_MIDDLE_FINGER
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	delay 1
	fadetobg BG_THUNDER
	waitbgfadein
	setalpha 12, 8
	createsprite gThoughtBubbleSpriteTemplate, ANIM_ATTACKER, 11, 0, 100
	playsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER
	delay 6
	createsprite gEvilMetronomeMiddleFingerSpriteTemplate, ANIM_ATTACKER, 12, 0
	delay 24
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 22, 3
	waitforvisualfinish
	delay 20
	clearmonbg ANIM_TARGET
	blendoff
	restorebg
	waitbgfadein
	end


Move_SHADOW_FORCE:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end


Move_DARK_PULSE:loadspritegfx ANIM_TAG_PURPLE_RING
	monbg ANIM_TARGET
	fadetobg BG_DARK
	waitbgfadein
	loopsewithpan SE_M_PSYBEAM, SOUND_PAN_TARGET, 20, 3
	createvisualtask AnimTask_SwayMon, ANIM_TARGET, 0, 6, 0x0800, 8, ANIM_TARGET
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 4, 0, 12, RGB(30, 10, 13)
	call DarkPulseParticle
	call DarkPulseParticle
	call DarkPulseParticle
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_TARGET
	restorebg
	waitbgfadein
	end
DarkPulseParticle:
	createsprite gDarkPulseSpriteTemplate, ANIM_TARGET, 2, 0, 0, 16
	delay 2
	createsprite gDarkPulseSpriteTemplate, ANIM_TARGET, 2, 0, 0, 16
	delay 2
	createsprite gDarkPulseSpriteTemplate, ANIM_TARGET, 2, 0, 0, 16
	delay 2
	createsprite gDarkPulseSpriteTemplate, ANIM_TARGET, 2, 0, 0, 16
	delay 2
	createsprite gDarkPulseSpriteTemplate, ANIM_TARGET, 2, 0, 0, 16
	delay 2
	createsprite gDarkPulseSpriteTemplate, ANIM_TARGET, 2, 0, 0, 16
	delay 2
	createsprite gDarkPulseSpriteTemplate, ANIM_TARGET, 2, 0, 0, 16
	delay 2
	createsprite gDarkPulseSpriteTemplate, ANIM_TARGET, 2, 0, 0, 16
	return


Move_TRUMP_CARD:
	loadspritegfx ANIM_TAG_EXODIA
	loadspritegfx ANIM_TAG_SUMMONING_CIRCLE
	monbg ANIM_ATTACKER
	fadetobg BG_GHOST
	waitbgfadein
	waitplaysewithpan SE_M_SAND_ATTACK, 0, 2
	createsprite gExodiaSpriteTemplate, 3, 0, 0, 584   @ top-left
	delay 45
	waitplaysewithpan SE_M_SAND_ATTACK, 0, 2
	createsprite gExodiaSpriteTemplate, 3, 0, 1, 539  @ top-right
	delay 45
	waitplaysewithpan SE_M_SAND_ATTACK, 0, 2
	createsprite gExodiaSpriteTemplate, 3, 0, 2, 494  @ bottom-left
	delay 45
	waitplaysewithpan SE_M_SAND_ATTACK, 0, 2
	createsprite gExodiaSpriteTemplate, 3, 0, 3, 449  @ bottom-right
	delay 75
	waitplaysewithpan SE_M_SAND_ATTACK, 0, 2
	createsprite gExodiaSpriteTemplate, 3, 0, 4, 374  @ top-middle
	delay 60
	createvisualtask AnimTask_SummonCircle, 5, 40, 17, 120, 40
	playsewithpan SE_M_EARTHQUAKE, 0
	@createvisualtask AnimTask_HorizontalShake, 5, (MAX_BATTLERS_COUNT + 1), 5, 10
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 5, 10
	delay 97
	playsewithpan SE_M_EARTHQUAKE, 0
	@createvisualtask AnimTask_HorizontalShake, 5, (MAX_BATTLERS_COUNT + 1), 10, 20
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 10, 20
	delay 97
	playsewithpan SE_M_EARTHQUAKE, 0
	@createvisualtask AnimTask_HorizontalShake, 5, (MAX_BATTLERS_COUNT + 1), 20, 10
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 20, 10
	createvisualtask AnimTask_BlendEveryBattleAnimPal, 5, 5, 2, 0, 16, RGB_WHITEALPHA
	waitforvisualfinish
	restorebg
	delay 15
	createvisualtask AnimTask_BlendEveryBattleAnimPal, 5, 5, 2, 16, 0, RGB_WHITEALPHA
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	end

	
	createvisualtask AnimTask_HorizontalShake, 5, (MAX_BATTLERS_COUNT + 1), 10, 50
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 10, 50
	playsewithpan SE_M_EARTHQUAKE, 0
	delay 10
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	delay 16
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	end

	
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 0, 0, 16, RGB_WHITE
	delay 4
	createvisualtask AnimTask_AttackerFadeToInvisible, 5, 0
	waitforvisualfinish
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_SKY_UPPERCUT, SOUND_PAN_ATTACKER
	createsprite gSkyAttackBirdSpriteTemplate, ANIM_TARGET, 2
	delay 14
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 10, 0, 18, 1
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	delay 20


Move_DRAGON_PULSE:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end


Move_HEAL_PULSE:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_BLUE_RING_2
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 5
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 5
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 13
	waitforvisualfinish
	playsewithpan SE_M_ABSORB_2, SOUND_PAN_TARGET
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, 0, -5, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, -15, 10, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, -15, -15, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, 10, -5, 1, 0
	delay 7
	clearmonbg ANIM_DEF_PARTNER
	end


Move_ORIGIN_PULSE:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_BLUE_RING_2
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_ATTACKER
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 0, 7, RGB(0, 25, 28)
	delay 10
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 100, 100, 8, 1, 20, 40, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 20, 100, 16, 2, 10, 35, 1
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 200, 80, 8, 1, 40, 20, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 80, 60, 10, 3, 20, 50, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 140, 100, 16, 1, 20, 30, 1
	playsewithpan SE_M_BUBBLE3, SOUND_PAN_TARGET
	waitforvisualfinish
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 5
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 5
	playsewithpan SE_M_GIGA_DRAIN, SOUND_PAN_ATTACKER
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 13
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 8, 18, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 7, 0, RGB(0, 25, 28)
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_SPARKLY_SWIRL:
	loadspritegfx ANIM_TAG_GUST
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_FLOWER
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_PETAL_DANCE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 12, 6, 3, 3
	createsprite gPetalDanceBigFlowerSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 8, 140
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, 16, -24, 8, 100
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, -16, -24, 8, 100
	delay 15
	createsprite gPetalDanceBigFlowerSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 8, 140
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, 32, -24, 8, 100
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, -32, -24, 8, 100
	delay 15
	createsprite gPetalDanceBigFlowerSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 8, 140
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, 24, -24, 8, 100
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, -24, -24, 8, 100
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 5
	delay 3
	playsewithpan SE_M_GUST, SOUND_PAN_TARGET
	createsprite gEllipticalGustSpriteTemplate, ANIM_ATTACKER, 2, 0, -16
	createvisualtask AnimTask_AnimateGustTornadoPalette, 5, 1, 70
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 1, 0, 7, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	playsewithpan SE_M_GUST2, SOUND_PAN_TARGET
	waitforvisualfinish
	delay 8
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 7
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	waitforvisualfinish
	blendoff
	end


Move_SYRUP_BOMB:
	loadspritegfx ANIM_TAG_RED_BALL
	loadspritegfx ANIM_TAG_EXPLOSION
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	createvisualtask AnimTask_BarrageBall, 3
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	delay 24
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, 40, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_TARGET, 0, 4, 20, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_DEF_PARTNER, 0, 4, 20, 1
	loopsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET, 8, 2
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 16, 1
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 6, 5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, -16, -15, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 16, -5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, -12, 18, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 0, 5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	waitforvisualfinish
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(18, 8, 2)
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 0, 55, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 0, 55, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 0, 50, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 0, 45, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 0, 50, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	waitforvisualfinish
	end


Move_MAKE_IT_RAIN:
	loadspritegfx ANIM_TAG_COIN_SMALL
	createvisualtask AnimTask_Splash, 2, 0, 6
	delay 24
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 0, -4, -16
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 0, 4, -12
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	delay 32
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 0, -3, -12
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 0, 5, -14
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	delay 32
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 0, -5, -18
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 0, 3, -14
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	delay 16
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 1, 220, 60
	waitplaysewithpan SE_MAKE_IT_RAIN, 0, 15
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 6, 0, 18, 1
	delay 2
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 1, 60, 100
	delay 2
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 1, 140, 55
	delay 2
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 1, 180, 50
	delay 2
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 1, 20, 90
	delay 2
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 1, 90, 90
	delay 2
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 1, 160, 60
	delay 2
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 1, 30, 90
	delay 2
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 1, 120, 60
	delay 2
	createsprite gMakeItRainSpriteTemplate, ANIM_TARGET, 2, 1, 200, 40
	end


Move_FLASH_CANNON:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end


Move_BROCK_TOMB:
	loadspritegfx ANIM_TAG_BROCK_X_SIGN
	loadspritegfx ANIM_TAG_BROCKS
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 2, 0, 10, 1
	waitforvisualfinish
	createsprite gBrockTombRockSpriteTemplate, ANIM_TARGET, 2, 20, 12, 64, 114, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET
	delay 8
	createsprite gBrockTombRockSpriteTemplate, ANIM_TARGET, 2, -20, 12, 64, 98, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET
	delay 8
	createsprite gBrockTombRockSpriteTemplate, ANIM_TARGET, 66, 3, 6, 64, 82, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET
	delay 8
	createsprite gBrockTombRockSpriteTemplate, ANIM_TARGET, 2, -3, 13, 64, 66, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET
	delay 24
	playsewithpan SE_M_HYPER_BEAM, SOUND_PAN_TARGET
	createsprite gBrockXSpriteTemplate, ANIM_TARGET, 5, ANIM_TARGET, 50
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 20, 1
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 2, 0, 10, 1
	waitforvisualfinish
	end


Move_BROCK_BLAST:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end


Move_BROCK_WRECKER:
	monbg ANIM_DEF_PARTNER
	call SetPsychicBackground
	setalpha 8, 8
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 10, 1
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 0, 2, 0, 8, RGB_WHITE
	waitforvisualfinish
	playsewithpan SE_M_SUPERSONIC, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, ANIM_TARGET, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 1
	call UnsetPsychicBackground
	end


Move_UPPER_HAND:
	loadspritegfx ANIM_TAG_TAG_HAND
	createvisualtask AnimTask_HelpingHandAttackerMovement, 5
	createsprite gHelpingHandClapSpriteTemplate, ANIM_ATTACKER, 40, 0
	createsprite gHelpingHandClapSpriteTemplate, ANIM_ATTACKER, 40, 1
	delay 19
	playsewithpan SE_M_ENCORE, 0
	delay 14
	playsewithpan SE_M_ENCORE, 0
	delay 20
	playsewithpan SE_M_ENCORE, 0
	end


Move_HORN_LEECH:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end


Move_FISH_US_REND:
Move_FISHIOUS_REND:
	loadspritegfx ANIM_TAG_SHARP_TEETH
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_BITE, SOUND_PAN_TARGET
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, -32, -32, 1, 819, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 32, 32, 5, -819, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 7, 5, 2
	waitforvisualfinish
	playsewithpan SE_M_BITE, SOUND_PAN_TARGET
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 32, -32, 7, -819, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, -32, 32, 3, 819, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 8, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 8, 4, 2
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	delay 1
	loopsewithpan SE_M_CRABHAMMER, SOUND_PAN_TARGET, 20, 3
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 4, 8, 1
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 20, -20, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -15, 15, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -10, -20, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 16, -8, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 5, 8, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -16, 0, 20, ANIM_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end


Move_BRAVE_BIRD:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_BIRD
	call SetSkyBg
	monbg ANIM_ATTACKER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 0, 0, 16, RGB_WHITE
	delay 4
	createvisualtask AnimTask_AttackerFadeToInvisible, 5, 0
	waitforvisualfinish
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_SKY_UPPERCUT, SOUND_PAN_ATTACKER
	createsprite gSkyAttackBirdSpriteTemplate, ANIM_TARGET, 2
	delay 14
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 10, 0, 18, 1
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	delay 20
	createvisualtask AnimTask_AttackerFadeFromInvisible, 5, 1
	delay 2
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 0, 15, 0, RGB_WHITE
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	call UnsetSkyBg
	end


Move_MAX_AIRSTREAM:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end


Move_STEAMROLLER:
	loadspritegfx ANIM_TAG_STEAMROLLER
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gSteamrollerLandSpriteTemplate, ANIM_TARGET, 2, 110
	delay 7
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	createvisualtask AnimTask_HorizontalShake, 5, (MAX_BATTLERS_COUNT + 1), 0, 10
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 0, 10
	delay 2
	loopsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET, 8, 2
	delay 101
	playsewithpan SE_M_EARTHQUAKE, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end



Move_SLASH_TCG:
	loadspritegfx ANIM_TAG_SLASH
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, -8, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, 8, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 18, 1
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	end


Move_SWORDSDANCE_TCG:
	loadspritegfx ANIM_TAG_SWORD
	monbg ANIM_ATTACKER
	setalpha 12, 8
	playsewithpan SE_M_SWORDS_DANCE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 16, 6, 1, 4
	createsprite gSwordsDanceBladeSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	delay 22
	createvisualtask AnimTask_FlashAnimTagWithColor, 2, ANIM_TAG_SWORD, 2, 2, RGB(18, 31, 31), 16, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	delay 1
	end

Move_SUBSTITUTE_2:
	playsewithpan SE_M_ATTRACT, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_MonToSubstitute, 2
	end

Move_GUILLOTINE_2:
	loadspritegfx ANIM_TAG_CUT
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	fadetobgfromset BG_GUILLOTINE_OPPONENT, BG_GUILLOTINE_PLAYER, BG_GUILLOTINE_CONTESTS
	waitbgfadein
	playsewithpan SE_M_VICEGRIP, SOUND_PAN_TARGET
	createsprite gGuillotineSpriteTemplate, ANIM_ATTACKER, 2, 0
	createsprite gGuillotineSpriteTemplate, ANIM_ATTACKER, 2, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 2, 0, 16, RGB_BLACK
	delay 9
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 2, 0, 23, 1
	delay 46
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 4, 0, 8, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 0
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 3, 1, RGB_BLACK, 8, RGB_BLACK, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	restorebg
	waitbgfadein
	end


Move_LICK_DOUBLE_SLAP:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	choosetwoturnanim DoubleSlapLeft, DoubleSlapRight


Move_LICK_TICKLE:
	loadspritegfx ANIM_TAG_EYE_SPARKLE
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_ATTACKER, 0, 0, 16, RGB_BLACK
	waitforvisualfinish
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, -16, -8
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, 16, -8
	playsewithpan SE_M_DETECT, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_ATTACKER, 0, 16, 0, RGB_BLACK
	waitforvisualfinish
	delay 20
	createvisualtask AnimTask_SwayMon, 3, 0, 6, 1280, 3, ANIM_ATTACKER
	delay 12
	createvisualtask AnimTask_RockMonBackAndForth, 3, ANIM_TARGET, 6, 2
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_TARGET, 8, 8
	waitforvisualfinish
	end


Move_LICK_DISARMING_VOICE:
	loadspritegfx ANIM_TAG_NOISE_LINE
	createvisualtask SoundTask_PlayDoubleCry, 2, ANIM_ATTACKER, DOUBLE_CRY_GROWL
	call RoarEffect
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 9, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 1, 0, 9, 1
	waitforvisualfinish
	createvisualtask SoundTask_WaitForCry, 5
	waitforvisualfinish
	end


Move_LICK_WATER_GUN:
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_RAZOR_LEAF
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 1
	loopsewithpan SE_M_POISON_POWDER, SOUND_PAN_ATTACKER, 10, 5
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -2, 10
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -1, 15
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -4, -4, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 3, -3, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -6, 8
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -1, 12
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -4, 13
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 4, -5, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -6, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -5, 8
	delay 60
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, 20, 1
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, -20, 1
	delay 20
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 2, 0, 8, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end


Move_LICK_STRING_SHOT:
	loadspritegfx ANIM_TAG_STRING
	loadspritegfx ANIM_TAG_WEB_THREAD
	monbg ANIM_DEF_PARTNER
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 5, F_PAL_BG, 2, 0, 9, RGB_BLACK
	waitforvisualfinish
	loopsewithpan SE_M_STRING_SHOT, SOUND_PAN_ATTACKER, 9, 6
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	waitforvisualfinish
	playsewithpan SE_M_STRING_SHOT2, SOUND_PAN_TARGET
	createsprite gStringWrapSpriteTemplate, ANIM_TARGET, 2, 0, 10
	delay 4
	createsprite gStringWrapSpriteTemplate, ANIM_TARGET, 2, 0, -2
	delay 4
	createsprite gStringWrapSpriteTemplate, ANIM_TARGET, 2, 0, 22
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	delay 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 5, F_PAL_BG, 2, 9, 0, RGB_BLACK
	end


Move_LICK_WRAP:
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 6, 4, 2, 4
	goto BindWrap


Move_LICK_HYPNOSIS:
	loadspritegfx ANIM_TAG_GOLD_RING
	call SetPsychicBackground
	call HypnosisRings
	call HypnosisRings
	call HypnosisRings
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(31, 18, 31)
	waitforvisualfinish
	delay 1
	call UnsetPsychicBackground
	end


Move_LICK_BODY_SLAM:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_TAKE_DOWN, SOUND_PAN_ATTACKER
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, ANIM_ATTACKER
	waitforvisualfinish
	delay 11
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 26, 0, 0, 5
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 4, -10, 0, ANIM_TARGET, 0
	loopsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET, 10, 2
	delay 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -28, 0, 0, 3
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 4, 0, 12, 1
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 6
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_LICK_THRASH:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	createvisualtask AnimTask_ThrashMoveMonHorizontal, 2
	createvisualtask AnimTask_ThrashMoveMonVertical, 2
	createsprite gFistFootRandomPosSpriteTemplate, ANIM_TARGET, 3, 1, 10, 0
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 4, 0, 7, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	delay 28
	createsprite gFistFootRandomPosSpriteTemplate, ANIM_TARGET, 3, 1, 10, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 4, 0, 7, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 28
	createsprite gFistFootRandomPosSpriteTemplate, ANIM_TARGET, 3, 1, 10, 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 8, 0, 16, 1
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	end


Move_LICK_HYDRO_PUMP:
	loadspritegfx ANIM_TAG_WATER_ORB
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 40, 1
	delay 6
	panse SE_M_HYDRO_PUMP, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpBeams
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 37, 1
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	delay 1
	delay 1
	call HydroPumpHitSplats
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end


Move_LICK_RELIC_SONG:
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_MusicNotesRainbowBlend, 2
	waitforvisualfinish
	panse SE_M_SING, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 7, 0, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 6, 1, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 1, 2, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 3, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 3, 0, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 5, 2, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 6, 3, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 0, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 1, 2, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 5, 3, 12
	delay 4
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_MusicNotesClearRainbowBlend, 2
	waitforvisualfinish
	end


Move_DIVE_CANCEL:
	loadspritegfx ANIM_TAG_SPLASH
	loadspritegfx ANIM_TAG_SWEAT_BEAD
	choosetwoturnanim DiveSetUp, DiveAttack


Move_DIG_CANCEL:
	choosetwoturnanim DigSetUp, DigUnleash
	end


Move_SHADOW_FORCE_CANCEL:
	
	choosetwoturnanim ShadowForceSetUp, ShadowForceSetUp
	end
	
ShadowForceSetUp:
	monbg ANIM_ATTACKER
	fadetobg BG_DARK
	waitbgfadein
	delay 0
	playsewithpan SE_M_FAINT_ATTACK, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 18, 6, 1, 3
	createvisualtask AnimTask_AttackerFadeToInvisible, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	invisible ANIM_ATTACKER
	delay 1
	createvisualtask AnimTask_SetAttackerInvisibleWaitForSignal, 2
	monbg ANIM_TARGET
	setalpha 12, 8
	delay 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	delay 1
	setarg 7, 0x1000
	delay 10
	clearmonbg ANIM_ATTACKER
	delay 1
	restorebg
	waitbgfadein
	end


Move_RAZOR_WIND_CANCEL:
	choosetwoturnanim RazorWindSetUp, RazorWindUnleash


Move_CLANGAROUS_SOUL_CANCEL:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end




Move_LIQUIDATEON:
	loadspritegfx ANIM_TAG_WATER_IMPACT
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 23, 1
	delay 5
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -15, 0, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 20, 10, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -10, 15, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 25, 20, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -20, 20, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 12, 0, 25, ANIM_ATTACKER
	waitforvisualfinish
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 5
	delay 6
	call RisingWaterHitEffect
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end


Move_EON_DELUGE:
	loadspritegfx ANIM_TAG_ELECTRIC_ORBS
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_ELECTRICITY
	monbg ANIM_ATTACKER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 4, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_ElectricChargingParticles, 2, ANIM_ATTACKER, 60, 2, 12
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 30
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 30
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	createsprite gGrowingChargeOrbSpriteTemplate, ANIM_ATTACKER, 2, 0
	delay 25
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 20
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 15
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 10
	delay 6
	loopsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER, 6, 5
	waitforvisualfinish
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 16
	delay 2
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, -16, -16
	playsewithpan SE_M_THUNDERBOLT2, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 4, 0, RGB_BLACK
	clearmonbg ANIM_ATTACKER
	blendoff
	end


Move_RUINATEON:
	monbg ANIM_ATK_PARTNER
	splitbgprio ANIM_ATTACKER
	setalpha 16, 0
	createvisualtask AnimTask_SetCamouflageBlend, 5, F_PAL_ATTACKER, 3, 0, 14
	delay 16
	createvisualtask AnimTask_AttackerFadeToInvisible, 2, 4
	playsewithpan SE_M_FAINT_ATTACK, SOUND_PAN_ATTACKER
	waitforvisualfinish
	delay 8
	createvisualtask AnimTask_SetCamouflageBlend, 5, F_PAL_ATTACKER, 0, 0, 0
	waitforvisualfinish
	createvisualtask AnimTask_AttackerFadeFromInvisible, 2, 1
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_ATK_PARTNER
	end


Move_ERUPTEON:
	loadspritegfx ANIM_TAG_WARM_ROCK
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_BATTLERS, 2, 0, 4, RGB_RED
	waitforvisualfinish
	createvisualtask AnimTask_EruptionLaunchRocks, 2
	waitplaysewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER, 60
	waitforvisualfinish
	createvisualtask AnimTask_EruptionLaunchRocks, 2
	waitplaysewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER, 60
	waitforvisualfinish
	delay 30
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 200, -32, 0, 100, 0
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 30, -32, 16, 90, 1
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 150, -32, 32, 60, 2
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 90, -32, 48, 80, 3
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 110, -32, 64, 50, 0
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 60, -32, 80, 70, 1
	delay 22
	createvisualtask AnimTask_HorizontalShake, 5, (MAX_BATTLERS_COUNT + 1), 8, 60
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 8, 60
	loopsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET, 16, 12
	delay 80
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 40, F_PAL_BG | F_PAL_BATTLERS, 4, 4, 0, RGB_RED
	end


Move_EXPLOSEON:
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 8, 9, RGB(26, 8, 8), 8, RGB_BLACK, 8
	createvisualtask AnimTask_ShakeMon2, 5, 4, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 5, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 6, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 7, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 8, 8, 0, 40, 1
	call Explosion1
	call Explosion1
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 1, 16, 16, RGB_WHITE
	delay 50
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 3, 16, 0, RGB_WHITE
	end


Move_BADDY_BAD:
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 0, 16, RGB_WHITE
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_DoomDesireLightBeam, 5
	delay 5
	playsewithpan SE_M_CONFUSE_RAY, SOUND_PAN_ATTACKER
	delay 10
	playsewithpan SE_M_CONFUSE_RAY, 0
	delay 10
	playsewithpan SE_M_CONFUSE_RAY, SOUND_PAN_TARGET
	delay 23
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 10, 0, 20, 1
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 1, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 16, 0, RGB_WHITE
	waitforvisualfinish
	end

Move_SAPPY_SEED:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end


Move_GLITZY_GLOSSED:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end



Move_FLYING_PRESS:
	loadspritegfx ANIM_TAG_ROUND_SHADOW
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_M_FLY, SOUND_PAN_ATTACKER
	createsprite gFlyBallUpSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 13, 336
	waitforvisualfinish
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	createsprite gFlyBallAttackSpriteTemplate, ANIM_ATTACKER, 2, 20
	delay 20
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 0
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 6, 0, 8, 1
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end


Move_TAIL_SLAP:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end


Move_ZEKROM_KICK:
	loadspritegfx ANIM_TAG_ZEKROM_KICK
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET

	fadetobg BG_THUNDER
	waitbgfadein

	monbg ANIM_ATTACKER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 0, 0, 16, RGB_WHITE
	delay 4
	createvisualtask AnimTask_AttackerFadeToInvisible, 5, 0
	waitforvisualfinish
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_SKY_UPPERCUT, SOUND_PAN_ATTACKER
	createsprite gZekromKickSpriteTemplate, ANIM_TARGET, 2
	delay 14
	createsprite gFistFootRandomPosSpriteTemplate, ANIM_ATTACKER, 3, 1, 20, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 10, 0, 18, 1
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	delay 20
	createvisualtask AnimTask_AttackerFadeFromInvisible, 5, 1
	delay 2
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 0, 15, 0, RGB_WHITE
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	restorebg
	waitbgfadein
	
	end


Move_RAIN_DANCE_2:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end


Move_AQUA:
	loadspritegfx ANIM_TAG_WATER_IMPACT
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 23, 1
	delay 5
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -15, 0, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 20, 10, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -10, 15, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 25, 20, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -20, 20, 25, ANIM_ATTACKER
	delay 4
	playsewithpan SE_M_CRABHAMMER, SOUND_PAN_ATTACKER
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 12, 0, 25, ANIM_ATTACKER
	waitforvisualfinish
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 5
	delay 6
	call RisingWaterHitEffect
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end


Move_WHIP:
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 24, 3
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 12, 4, 2, 3
	waitforvisualfinish
	end

Move_SLAP:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	choosetwoturnanim DoubleSlapLeft, DoubleSlapRight


Move_POISON:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	loopsewithpan SE_M_HARDEN, SOUND_PAN_ATTACKER, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 1, 1, RGB(24, 6, 23)
	waitforvisualfinish
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, ANIM_ATTACKER, 1
	clearmonbg ANIM_TARGET
	blendoff
	call PoisonBubblesEffect
	waitforvisualfinish
	end

Move_IRON:
	loadspritegfx ANIM_TAG_IMPACT
	loopsewithpan SE_M_HARDEN, SOUND_PAN_ATTACKER, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 1, 0, 0
	waitforvisualfinish
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, ANIM_ATTACKER, 1
	clearmonbg ANIM_TARGET
	blendoff
	waitforvisualfinish
	end

Move_SHED:
	createvisualtask AnimTask_Splash, 2, 0, 3
	delay 8
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 38, 3
	waitforvisualfinish
	end

Move_WIND:
	loadspritegfx ANIM_TAG_WHIRLWIND_LINES
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, -8, ANIM_TARGET, 60, 0
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 60, 1
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 8, ANIM_TARGET, 60, 2
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, ANIM_TARGET, 60, 3
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, ANIM_TARGET, 60, 4
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, ANIM_TARGET, 60, 0
	delay 5
	loopsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_TARGET, 10, 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 15, 1
	delay 29
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_TARGET, 12, 6, 1, 5
	delay 7
	waitforvisualfinish
	end

Move_GLOW:
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	monbg ANIM_ATTACKER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 4, RGB_BLACK
	waitforvisualfinish
	createsprite gTailGlowOrbSpriteTemplate, ANIM_ATTACKER, 66, ANIM_ATTACKER
	delay 18
	loopsewithpan SE_M_MORNING_SUN, SOUND_PAN_ATTACKER, 16, 6
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 4, 0, RGB_BLACK
	clearmonbg ANIM_ATTACKER
	blendoff
	delay 1
	end

Move_QWICK_ATTACK:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 24, 6, 1, 5
	createvisualtask AnimTask_TraceMonBlended, 2, 0, 4, 7, 3
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	delay 4
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 6, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, 0, 0, ANIM_TARGET, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	waitforvisualfinish
	end
Move_WHISH:

	loadspritegfx ANIM_TAG_GOLD_STARS
	loadspritegfx ANIM_TAG_SPARKLE_2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 0, 10, RGB_BLACK
	waitforvisualfinish
	panse_adjustall SE_M_REFLECT, SOUND_PAN_TARGET, SOUND_PAN_ATTACKER, -3, 0
	createsprite gWishStarSpriteTemplate, ANIM_ATTACKER, 40
	waitforvisualfinish
	delay 60
	loopsewithpan SE_M_HEAL_BELL, SOUND_PAN_ATTACKER, 16, 3
	call GrantingStarsEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 10, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_AURA_SPHERE_2:
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	monbg ANIM_ATK_PARTNER
	splitbgprio ANIM_ATTACKER
	setalpha 12, 8
	createsprite gSuperpowerOrbSpriteTemplate, ANIM_TARGET, 2, ANIM_ATTACKER
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_ATTACKER
	delay 20
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 4, 1, 180, 1
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_EARTHQUAKE, 0
	delay 40
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	delay 16
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 8, 0, 16, 1
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	delay 1
	end


Move_GYRO_BALL:
	loadspritegfx ANIM_TAG_IMPACT
	loopsewithpan SE_M_HARDEN, SOUND_PAN_ATTACKER, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 1, 0, 0
	waitforvisualfinish
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, ANIM_ATTACKER, 1
	clearmonbg ANIM_TARGET
	blendoff
	waitforvisualfinish
	end

Move_SYHNCRHONOZHE:
	loadspritegfx ANIM_TAG_BLUE_RING
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	call SetPsychicBackground
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_TELEPORT, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, 2, 9, 0, 10
	call PsywaveRings
	call PsywaveRings
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 1, 4, 0, 12, RGB(31, 18, 31)
	call PsywaveRings
	call PsywaveRings
	call PsywaveRings
	call PsywaveRings
	waitforvisualfinish
	delay 1
	call UnsetPsychicBackground
	end

Move_CURSE_GRENINJA:
	loadspritegfx ANIM_TAG_NAIL
	loadspritegfx ANIM_TAG_GHOSTLY_SPIRIT
	monbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_CurseStretchingBlackBg, 5
	waitforvisualfinish
	delay 20
	createsprite gCurseNailSpriteTemplate, ANIM_ATTACKER, 2
	delay 60
	call CurseGhostShakeFromNail
	delay 41
	call CurseGhostShakeFromNail
	delay 41
	call CurseGhostShakeFromNail
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	delay 1
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_NIGHTMARE, SOUND_PAN_TARGET
	createsprite gCurseGhostSpriteTemplate, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 14, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 16, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_LION_LADDER:
	loadspritegfx ANIM_TAG_BLUE_LIGHT_WALL
	loadspritegfx ANIM_TAG_CLAW_SLASH
	loadspritegfx ANIM_TAG_TORN_METAL
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 18, 1
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, -10, 0
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, 10, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	delay 12
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, -10, 1
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, 10, 1
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	waitforvisualfinish  @ Redundant
	blendoff
	clearmonbg ANIM_TARGET
	end

Move_STRANGE_STEAM:
	loadspritegfx ANIM_TAG_PURPLE_GAS_CLOUD
	monbg ANIM_DEF_PARTNER
	splitbgprio_all
	setalpha 12, 8
	loopsewithpan SE_M_MIST, SOUND_PAN_TARGET, 17, 10
	call SmogCloud
	call SmogCloud
	call SmogCloud
	call SmogCloud
	call SmogCloud
	call SmogCloud
	call SmogCloud
	delay 120
	loopsewithpan SE_M_TOXIC, SOUND_PAN_TARGET, 18, 2
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(26, 0, 26)
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 15, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
Move_REFLECT_2:
	loadspritegfx ANIM_TAG_SPARKLE_4
	loadspritegfx ANIM_TAG_BLUE_LIGHT_WALL
	setalpha 0, 16
	waitplaysewithpan SE_M_REFLECT, SOUND_PAN_ATTACKER, 15
	createsprite gReflectWallSpriteTemplate, ANIM_ATTACKER, 1, 40, 0, ANIM_TAG_BLUE_LIGHT_WALL
	delay 20
	createsprite gReflectSparkleSpriteTemplate, ANIM_ATTACKER, 2, 30, 0, ANIM_ATTACKER, TRUE
	delay 7
	createsprite gReflectSparkleSpriteTemplate, ANIM_ATTACKER, 2, 19, -12, ANIM_ATTACKER, TRUE
	delay 7
	createsprite gReflectSparkleSpriteTemplate, ANIM_ATTACKER, 2, 10, 20, ANIM_ATTACKER, TRUE
	waitforvisualfinish
	delay 1
	blendoff
	end
Move_FLARE_BLITZ:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg ANIM_DEF_PARTNER
	splitbgprio_foes ANIM_TARGET
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 0
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 4
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 8
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 12
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 16
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 20
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 24
	playsewithpan SE_M_FLAME_WHEEL, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 6
	delay 4
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 8, 1
	createvisualtask AnimTask_BlendMonInAndOut, 3, ANIM_TARGET, RGB_RED, 12, 1, 1
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	call FireSpreadEffect
	delay 7
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 9
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end


Move_MAGNET_RISE:
	loadspritegfx ANIM_TAG_ELECTRIC_ORBS
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_ELECTRICITY
	monbg ANIM_ATTACKER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 2, 0, 4, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_ElectricChargingParticles, 2, ANIM_ATTACKER, 60, 2, 12
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 30
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 30
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	createsprite gGrowingChargeOrbSpriteTemplate, ANIM_ATTACKER, 2, 0
	delay 25
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 20
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 15
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 10
	delay 6
	loopsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER, 6, 5
	waitforvisualfinish
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 16
	delay 2
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, -16, -16
	playsewithpan SE_M_THUNDERBOLT2, SOUND_PAN_ATTACKER
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 4, 0, RGB_BLACK
	clearmonbg ANIM_ATTACKER
	blendoff
	end

Move_SHOOT_BIG:
Move_SHOOT:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_LOCK_ON
	loadspritegfx ANIM_TAG_BULLET
	splitbgprio_foes ANIM_TARGET
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gLockOnTargetSpriteTemplate, ANIM_ATTACKER, 40
	createsprite gLockOnMoveTargetSpriteTemplate, ANIM_ATTACKER, 40, 1
	createsprite gLockOnMoveTargetSpriteTemplate, ANIM_ATTACKER, 40, 2
	createsprite gLockOnMoveTargetSpriteTemplate, ANIM_ATTACKER, 40, 3
	createsprite gLockOnMoveTargetSpriteTemplate, ANIM_ATTACKER, 40, 4  @ Also transitions to red target
	delay 120
	setarg 7, 0xFFFF  @ Signal target to flash/disappear
	waitforvisualfinish
	waitsound
	createvisualtask SoundTask_PlayCry, 2, ANIM_ATTACKER
	delay 1
	createsprite gShootBulletSpriteTemplate, ANIM_ATTACKER, 2, -90, 30, 7
	delay 4
	createvisualtask SoundTask_PlayCry, 2, ANIM_ATTACKER
	delay 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	createsprite gShootBulletSpriteTemplate, ANIM_ATTACKER, 2, -90, 30, 7
	delay 4
	createvisualtask SoundTask_PlayCry, 2, ANIM_ATTACKER
	delay 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	createsprite gShootBulletSpriteTemplate, ANIM_ATTACKER, 2, -90, 30, 7
	delay 4
	createvisualtask SoundTask_PlayCry, 2, ANIM_ATTACKER
	delay 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	createsprite gShootBulletSpriteTemplate, ANIM_ATTACKER, 2, -90, 30, 7
	delay 4
	createvisualtask SoundTask_PlayCry, 2, ANIM_ATTACKER
	delay 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	createsprite gShootBulletSpriteTemplate, ANIM_ATTACKER, 2, -90, 30, 7
	delay 4
	createvisualtask SoundTask_PlayCry, 2, ANIM_ATTACKER
	delay 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	createsprite gShootBulletSpriteTemplate, ANIM_ATTACKER, 2, -90, 30, 7
	delay 4
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	delay 20
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end


Move_THORN_WHIP:
	loadspritegfx ANIM_TAG_PUNISHMENT_BLADES
	loadspritegfx ANIM_TAG_LEAF @green color
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 10
	delay 6
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	createsprite gSpinningVineSpriteTemplate, ANIM_ATTACKER, 2, -42, -25, 0, 0, 25
	createvisualtask AnimTask_IsTargetPlayerSide, 2
	jumpretfalse PowerWhipOnOpponent
	goto PowerWhipOnPlayer
PowerWhipOnOpponent:
	fadetobg BG_IMPACT_OPPONENT
	goto PowerWhipContinue
PowerWhipOnPlayer:
	fadetobg BG_IMPACT_PLAYER
	goto PowerWhipContinue
PowerWhipContinue:
	waitbgfadeout
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 5, 1
	playsewithpan SE_BANG, SOUND_PAN_TARGET
	waitforvisualfinish
	delay 20
	restorebg
	waitbgfadein
	waitforvisualfinish
	end


Move_RAINBOW_BEAM:
	loadspritegfx ANIM_TAG_RAINBOW_ORB
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_WATER_IMPACT

	loadspritegfx ANIM_TAG_GREEN_STAR
	loadspritegfx ANIM_TAG_BLUE_STAR
	createvisualtask AnimTask_MorningSunLightBeam, 5
	delay 22
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	waitforvisualfinish

	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 40, 1
	delay 6
	panse SE_M_SOLAR_BEAM, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	call RainbowBeams
	call RainbowBeams
	call RainbowBeams
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 37, 1
	call HydroPumpHitSplats
	call RainbowBeams
	call RainbowBeams
	call HydroPumpHitSplats
	call RainbowBeams
	call RainbowBeams
	call HydroPumpHitSplats
	call RainbowBeams
	call RainbowBeams
	call HydroPumpHitSplats
	call RainbowBeams
	call RainbowBeams
	call HydroPumpHitSplats
	delay 1
	delay 1
	call HydroPumpHitSplats
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
	
	
RainbowBeams:
	createsprite gRainbowBeamSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, 16
	createsprite gRainbowBeamSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, -16
	delay 1
	createsprite gRainbowBeamSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, 16
	createsprite gRainbowBeamSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, -16
	delay 1
	return

Move_TRIPLE_WINGBEAT:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	loopsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET, 5, 2
	call WingbeatHitEffect
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

WingbeatHitEffect:
	createvisualtask AnimTask_ShakeMon2, 5, ANIM_TARGET, 4, 0, 17, 1
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 20, ANIM_TARGET, 1
	delay 1
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 10, ANIM_TARGET, 1
	delay 1
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	delay 1
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, -10, ANIM_TARGET, 1
	delay 1
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, -20, ANIM_TARGET, 1
	return


Move_FREEZE_DRY:
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 7, RGB_BLACK
	createvisualtask AnimTask_BlendBattleAnimPal, 10, 4, 2, 0, 9, RGB(12, 26, 31)
	delay 20
	playsewithpan SE_M_STRING_SHOT, SOUND_PAN_TARGET
	createsprite gIceCrystalSpiralInwardSmall, ANIM_ATTACKER, 2, 0
	createsprite gIceCrystalSpiralInwardSmall, ANIM_ATTACKER, 2, 64
	createsprite gIceCrystalSpiralInwardSmall, ANIM_ATTACKER, 2, 128
	createsprite gIceCrystalSpiralInwardSmall, ANIM_ATTACKER, 2, 192
	delay 5
	createsprite gIceCrystalSpiralInwardLarge, ANIM_ATTACKER, 2, 32
	createsprite gIceCrystalSpiralInwardLarge, ANIM_ATTACKER, 2, 96
	createsprite gIceCrystalSpiralInwardLarge, ANIM_ATTACKER, 2, 160
	createsprite gIceCrystalSpiralInwardLarge, ANIM_ATTACKER, 2, 224
	delay 17
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 3, 1
	waitforvisualfinish
	delay 15
	call IceCrystalEffectShort
	delay 5
	loadspritegfx ANIM_TAG_ICE_CUBE
	createvisualtask AnimTask_FrozenIceCube, 2
	waitplaysewithpan SE_M_HAIL, SOUND_PAN_TARGET, 17
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, 4, 2, 9, 0, RGB(12, 26, 31)
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end


Move_DOUBLE_DIP:
	loadspritegfx ANIM_TAG_BENT_SPOON
	loadspritegfx ANIM_TAG_LICK
	playsewithpan SE_M_PSYBEAM, SOUND_PAN_ATTACKER
	createsprite gBentSpoonSpriteTemplate, ANIM_ATTACKER, 20
	delay 40
	playsewithpan SE_M_LICK, SOUND_PAN_TARGET
	createsprite gLickSpriteTemplate, ANIM_TARGET, 2, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 16, 1
	delay 60
	end


Move_DOUBLE_DAD:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_DoubleDad, 2
	delay 30
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -20, -20, ANIM_TARGET, 2
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, -20, -12, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 8, 0, ANIM_TARGET, 2
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, 8, 8, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	end

Move_LEAFAGE:
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_RAZOR_LEAF
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 1
	loopsewithpan SE_M_POISON_POWDER, SOUND_PAN_ATTACKER, 10, 5
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -2, 10
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -1, 15
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -4, -4, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 3, -3, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -6, 8
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -1, 12
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -4, 13
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 4, -5, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -6, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -5, 8
	delay 60
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, 20, 1
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, -20, 1
	delay 20
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 8, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_DEF_PARTNER, 2, 0, 8, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_RAPID_WIN:
	loadspritegfx ANIM_TAG_RAINBOW
	monbg ANIM_ATK_PARTNER
	setalpha 13, 3
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG | F_PAL_BATTLERS_2, 1, 0, 6, RGB_WHITE
	waitforvisualfinish
	panse_adjustnone SE_M_PETAL_DANCE, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +1, 0

	createsprite gRainbowRaySpriteTemplate, ANIM_ATTACKER, 40, 0
	delay 6
	createsprite gRainbowRaySpriteTemplate, ANIM_ATTACKER, 40, 1
	delay 6
	createsprite gRainbowRaySpriteTemplate, ANIM_ATTACKER, 40, 2
	delay 6
	createsprite gRainbowRaySpriteTemplate, ANIM_ATTACKER, 40, 3
	delay 6
	createsprite gRainbowRaySpriteTemplate, ANIM_ATTACKER, 40, 4
	delay 6
	createsprite gRainbowRaySpriteTemplate, ANIM_ATTACKER, 40, 5
	delay 6
	createsprite gRainbowRaySpriteTemplate, ANIM_ATTACKER, 40, 6
	delay 6

	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG | F_PAL_BATTLERS_2, 1, 6, 0, RGB_WHITE
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

Move_SKETCHUP:
	loadspritegfx ANIM_TAG_KETCHUP
	monbg ANIM_TARGET
	createvisualtask AnimTask_SketchupDrawMon, 2
	createsprite gKetchupSpriteTemplate, ANIM_TARGET, 2
	delay 10
	playsewithpan SE_M_HYDRO_PUMP, SOUND_PAN_ATTACKER
	delay 20
	playsewithpan SE_M_HYDRO_PUMP, SOUND_PAN_ATTACKER
	delay 20
	playsewithpan SE_M_HYDRO_PUMP, SOUND_PAN_ATTACKER
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	waitforvisualfinish
	end

Move_CLICK_HERE:
	loadspritegfx ANIM_TAG_ANGER
	loadspritegfx ANIM_TAG_WINDOW_WARNING
	createvisualtask AnimTask_WindowWarningAttacker, 2
	waitforvisualfinish
	playsewithpan SE_M_LEER, SOUND_PAN_TARGET
	createvisualtask AnimTask_Glitch, 2, 20
	waitforvisualfinish
	end

General_RotomAppears:
    loadspritegfx ANIM_TAG_ROTOM_DESCEND
    createsprite gRotomAppearSpriteTemplate, 2, 0, 0
	playse SE_M_SWIFT
	delay 104
	delay 24
	playse SE_M_SWIFT
    waitforvisualfinish
    end
General_RotomComesDown:
    loadspritegfx ANIM_TAG_ROTOM_DESCEND
	loadspritegfx ANIM_TAG_THIN_RING
    createsprite gRotomEnterSpriteTemplate, 2, 0, 0
	playse SE_M_SWIFT
	delay 104
	playse SE_M_TAKE_DOWN
	delay 60
	playse SE_M_SWIFT
	delay 10
	createsprite gRotomRingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0, 31, 8
	playse SE_M_ABSORB_2
	delay 2
	createsprite gRotomRingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0, 31, 8
    waitforvisualfinish
    end
	

Move_SENTENNIEL_KICK:
    loadspritegfx ANIM_TAG_HANDS_AND_FEET
    monbg ANIM_DEF_PARTNER
    setalpha 12, 8
    createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 4, 0, 100, 1
    createvisualtask AnimTask_CentennialKick, 2, 1, 100, 1, 2, 2, 2, 1, 1
    waitforvisualfinish
    clearmonbg ANIM_DEF_PARTNER
    blendoff
    end

Move_ONEISHMENT:
	loadspritegfx ANIM_TAG_FLYING_DIRT
	createvisualtask AnimTask_BlendParticle, 5, ANIM_TAG_FLYING_DIRT, 0, 6, 6, RGB(15, 0, 21)
	createvisualtask AnimTask_LoadSandstormBackground, 5, TRUE
	createvisualtask AnimTask_BlendBackground, 6, 6, RGB(15, 0, 21)
	panse SE_M_HEAT_WAVE, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	delay 4
	createvisualtask AnimTask_MoveHeatWaveTargets, 5
	delay 12
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 10, 2304, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 90, 2048, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 50, 2560, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 20, 2304, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 70, 1984, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 0, 2816, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 60, 2560, 96, 1
	end
Move_ME_FIRST:
	loadspritegfx ANIM_TAG_H
	monbg ANIM_DEF_PARTNER
	setalpha 8, 8
	splitbgprio ANIM_TARGET
	playsewithpan SE_M_ENCORE2, SOUND_PAN_TARGET
	call CreateH
	call CreateH
	call CreateH
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
CreateH:
	createsprite gHParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -20, 85, 80, 0
	delay 12
	createsprite gHParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 170, 80, 0
	delay 12
	createsprite gHParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -15, 0, 80, 0
	delay 12
	return
Move_WEEDLE_ARM:
	loadspritegfx ANIM_TAG_WEEDLE_SPIKE
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_EXPLOSION
	loopsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET, 2, 16
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 0, -32, 16
	delay 2
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 22, -22, 16
	delay 2
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 30, 0, 16
	delay 2
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 20, 20, 16
	delay 2
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 0, 28, 16
	delay 2
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, -19, 19, 16
	delay 2
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, -27, 0, 16
	delay 2
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, -18, -18, 16
	delay 2
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 0, -25, 16
	delay 2
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 17, -17, 16
	delay 2
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 23, 0, 16
	delay 2
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 16, 16, 16
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 18, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 8, 1, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 0, -24, 10
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 17, -17, 10
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 24, 0, 10
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 17, 17, 10
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 0, 24, 10
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, -17, 17, 10
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, -24, 0, 10
	createsprite gWeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, -17, -17, 10
	waitforvisualfinish
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 16, 1
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 6, 5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, -16, -15, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 16, -5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, -12, 18, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 0, 5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	waitforvisualfinish
	end
Move_HYPER_BEE:
	goto Move_THE_BEE_MOVE
	
Move_ROAR_OF_PRIME:
	goto Move_TACKLE
	
Move_SONIC_BOOM_2:
	goto Move_TACKLE
	
Move_MEAN_LOOK_LOOK:
	goto Move_TACKLE
	
Move_CHIP_AWAY:
	goto Move_TACKLE
	
Move_DRAINING_KISS:
	loadspritegfx ANIM_TAG_PINK_HEART
	loadspritegfx ANIM_TAG_DEVIL
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	splitbgprio_foes ANIM_TARGET
	createsprite gDevilSpriteTemplate, ANIM_TARGET, 2, 0, -24
	playsewithpan SE_M_PSYBEAM2, SOUND_PAN_TARGET
	waitforvisualfinish
	playsewithpan SE_M_ATTRACT, SOUND_PAN_TARGET
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, -256, -42
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, 128, -14
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, 416, -38
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, -128, -22
	waitforvisualfinish
	delay 3
	call GigaDrainAbsorbEffect
	waitforvisualfinish
	delay 15
	call HealingEffect
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end
Move_PLAY_ROUGH:
	goto Move_TACKLE
	
Move_LIGHT_SNEAK:
	goto Move_TACKLE
	
Move_LIGHT_PUNCH:
	goto Move_TACKLE
	
Move_LIGHT_BALL:
	goto Move_TACKLE
	
Move_LIGHT_OF_RUIN:
	goto Move_TACKLE
	
Move_PLAY_NICE:
	goto Move_TACKLE
	
Move_SHADOW_SCREEN:
	goto Move_TACKLE
	
Move_SHADOW_OF_RUIN:
	goto Move_TACKLE
	
Move_TRIPLE_PSYCLE:
	goto Move_TACKLE
	
Move_INCINERATE:
	loadspritegfx ANIM_TAG_FIRE_PLUME
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_ATTACKER
	setalpha 12, 8
	playsewithpan SE_M_SACRED_FIRE, SOUND_PAN_TARGET
	createsprite gFirePlumeUnanchoredSpriteTemplate, ANIM_ATTACKER, 2, -16, 16, 24, 0, 0, 0, 0, 0
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 6, 0, 8, 1
	delay 10
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	createsprite gFirePlumeUnanchoredSpriteTemplate, ANIM_ATTACKER, 2,  16, 16, 24, 0, 0, 0, 0, 0
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 10, 0, 12, 1
	delay 10
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	createsprite gFirePlumeUnanchoredSpriteTemplate, ANIM_ATTACKER, 2,   0, 16, 24, 0, 0, 0, 0, 0
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 12, 0, 20, 1

	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	end
Move_QUICK_BALL:
	goto Move_TACKLE
	
Move_ENERGY_BALL:
	goto Move_TACKLE
	
Move_DIVE_BALL:
	goto Move_TACKLE
	
Move_REPEAT_BALL:
	goto Move_TACKLE
	
Move_LURE_BALL:
	goto Move_TACKLE
	
Move_HEAL_BALL:
	goto Move_TACKLE
	
Move_DREAM_BALL:
	goto Move_TACKLE
	
Move_TIMER_BALL:
	goto Move_TACKLE
	
Move_SKILL_ISSUE:
	goto Move_TACKLE
	
Move_FALCON_PUNCH:
	goto Move_TACKLE
	
Move_SLURF:
	goto Move_TACKLE
	
Move_BADGEBOOST:
	goto Move_TACKLE
	
Move_RHYDON:
	goto Move_TACKLE
	
Move_CANCEL:
	goto Move_TACKLE
	
Move_COOLTRAINERM:
	goto Move_TACKLE
	
Move_TMTRAINER:
	goto Move_TACKLE
	
Move_KINICES:
	goto Move_TACKLE
	
Move_AL_LURING_VOICE:
	goto Move_TACKLE
	
Move_HYPNOSICE:
	goto Move_TACKLE
	
Move_CREAM_EATER:
	goto Move_TACKLE
	
Move_CEREAL_PULSE:
	goto Move_TACKLE
	
Move_SPOONGEIST_BEAM:
	goto Move_TACKLE
	
Move_SPOON_STEEL_STRIKE:
	goto Move_TACKLE
	
Move_SOUPERPOWER:
	goto Move_TACKLE
	
Move_PSYCHO_SCOOP:
	goto Move_TACKLE
	
Move_AL_OUT_PUMMELING:
	goto Move_TACKLE
	
Move_SNOWGRAVY:
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 0, 16, RGB_BLACK
	waitforvisualfinish
	playsewithpan SE_M_ICY_WIND, 0
	loadspritegfx ANIM_TAG_ICE_CUBE
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_FrozenIceCube, 2
	waitplaysewithpan SE_M_HAIL, SOUND_PAN_TARGET, 17
	delay 90
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(16, 12, 2)
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 0, 55, 10, RGB(16, 12, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 0, 55, 10, RGB(16, 12, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 0, 50, 10, RGB(16, 12, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 0, 45, 10, RGB(16, 12, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 0, 50, 10, RGB(16, 12, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 4, 16, 0, RGB_BLACK
	waitforvisualfinish
	end
Move_LANDS_WRATH:
	goto Move_TACKLE
	
Move_FLING:
	goto Move_TACKLE
	
Move_DUO_ATTACK:
	goto Move_TACKLE
	
Move_LITTHBRNTHEYES:
	goto Move_TACKLE
	
Move_SYSTEM32:
	fadetobg BG_BSOD
	waitbgfadein
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_ATTACKER, RGB(27, 27, 0), 12, 1, 1
	createvisualtask AnimTask_ExtrasensoryDistortion, 5, 0
	playsewithpan SE_M_BIND, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_ATTACKER, RGB(27, 27, 0), 12, 1, 1
	createvisualtask AnimTask_ExtrasensoryDistortion, 5, 1
	playsewithpan SE_M_BIND, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_TransparentCloneGrowAndShrink, 5, ANIM_ATTACKER
	createvisualtask AnimTask_ExtrasensoryDistortion, 5, 2
	playsewithpan SE_M_LEER, SOUND_PAN_ATTACKER
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_DEF_PARTNER
	restorebg
	waitbgfadein
	end
Move_MOVIES_FREE:
	goto Move_TACKLE
	
Move_GAMING_TOOLBARS:
	goto Move_TACKLE
	
Move_ZIPBOMB:
	goto Move_TACKLE
	
Move_FIREREDCHEATS:
	goto Move_TACKLE
	
Move_ANTI_VIRUS:
	goto Move_TACKLE
	
Move_SHE_LL_SMASH:
	goto Move_TACKLE
	
Move_SHE_HER_COLD:
	goto Move_TACKLE
	
Move_MISTY_EXPLOSION:
	goto Move_TACKLE
	
Move_BRAVE_BIRTH:
	goto Move_TACKLE
	
Move_ACCELEBROCK:
	goto Move_TACKLE
	
Move_LICKLE_BEAM:
	goto Move_TACKLE
	
Move_NICE_SHARD:
	goto Move_TACKLE
	
Move_CHERRY_FACE:
	goto Move_TACKLE
	
Move_NICICLE_CRASH:
	goto Move_TACKLE
	
Move_TWIN_BEAM:
	goto Move_TACKLE
	
Move_NICE_HAMMER:
	goto Move_TACKLE
	
Move_NICE_SPINNER:
	goto Move_TACKLE
	
Move_NICE_BEAM:
	goto Move_TACKLE
	
Move_DANKEST_LARIAT:
	goto Move_TACKLE
	
Move_CLANGSOULBLAZE:
	goto Move_TACKLE
	
Move_AZUBATICS:
	goto Move_TACKLE
	
Move_AGOLBATICS:
	goto Move_TACKLE
	
Move_ACROBATICS:
	goto Move_TACKLE
	
Move_W_TURN:
	goto Move_TACKLE
	
Move_AWOOBATICS:
	goto Move_TACKLE
	
Move_WOMP:
	goto Move_TACKLE
	
Move_WOOST:
	goto Move_TACKLE
	
Move_WAGON_ASCENT:
	goto Move_TACKLE
	
Move_MING_ATTACK:
	goto Move_TACKLE
	
Move_NOGGIN_FLOGGIN:
	goto Move_TACKLE
	
Move_STAMPETE:
	goto Move_TACKLE
	
Move_TOUCH_FUZZY:
	loadspritegfx ANIM_TAG_FUZZY
	monbg ANIM_DEF_PARTNER
	call SetPsychicBackground
	setalpha 8, 8
	splitbgprio ANIM_TARGET
	playsewithpan SE_M_ATTRACT2, SOUND_PAN_TARGET
	call CreateFuzzy
	call CreateFuzzy
	call CreateFuzzy
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 1
	call UnsetPsychicBackground
	end

CreateFuzzy:
	createsprite gFuzzyParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -20, 85, 80, 0
	delay 12
	createsprite gFuzzyParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 170, 80, 0
	delay 12
	createsprite gFuzzyParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -15, 0, 80, 0
	delay 12
	return
Move_DISCHARGE:
	goto Move_TACKLE
	
Move_CRY_ATTACK:
	goto Move_TACKLE
	
Move_DENIAL:
	goto Move_TACKLE
	
Move_ANGER:
	goto Move_TACKLE
	
Move_BARGAINING:
	goto Move_TACKLE
	
Move_DEPRESSION:
	goto Move_TACKLE
	
Move_ACCEPTANCE:
	goto Move_TACKLE
	
Move_TASTY_PLOT:
	goto Move_TACKLE
	
Move_DARKEST_LARIAT:
	goto Move_TACKLE
	
Move_CHOC_WAVE:
	panse SE_M_WHIRLPOOL, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	createvisualtask AnimTask_CreateSurfWave, 2, TRUE
	waitforvisualfinish
	end
Move_DAZZLING_CREAM:
	goto Move_TACKLE
	
Move_TACHYONIONCTTR:
	goto Move_TACKLE
	
Move_EXTREMESPEENUT:
	goto Move_TACKLE
	
Move_DOUBLE_CHOCK:
	goto Move_TACKLE
	
Move_HYPER_CREAM:
	goto Move_TACKLE
	
Move_SESAMESEEDBOMB:
	loadspritegfx ANIM_TAG_EXPLOSION
	loadspritegfx ANIM_TAG_SESAME
	playsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	createsprite gSesameSeedSpriteTemplate, ANIM_TARGET, 2, 10, 0, 0, 0, 25, -32
	delay 3
	playsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	createsprite gSesameSeedSpriteTemplate, ANIM_TARGET, 2, 10, 0, 0, 0, 25, -32
	delay 3
	playsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER
	createsprite gSesameSeedSpriteTemplate, ANIM_TARGET, 2, 10, 0, 0, 0, 25, -32
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 16, 1
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 6, 5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, -16, -15, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 16, -5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, -12, 18, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 0, 5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	delay 3
	waitforvisualfinish
	end
Move_DYNAMICLUNCH:
	goto Move_TACKLE
	
Move_CLAM_MIND:
	goto Move_TACKLE
	
Move_EXTREMESLOTH:
	goto Move_TACKLE
	
Move_SHELLSIDEASS:
	goto Move_TACKLE
	
Move_SLOWTH:
	goto Move_TACKLE
	
Move_BROWTH:
	goto Move_TACKLE
	
Move_SUNNY_DAYCARE:
	goto Move_TACKLE
	
Move_MART_STRIKE:
	goto Move_TACKLE
	
Move_SWEET_CENTER:
	goto Move_TACKLE
	
Move_ASSURANCH:
	goto Move_TACKLE
	
Move_CEFEINT_ATTACK:
	goto Move_TACKLE
	
Move_HIDDEN_TOWER:
	goto Move_TACKLE
	
Move_ANCIENT_TOWER:
	goto Move_TACKLE
	
Move_LIGHT_OF_RUINS:
	goto Move_TACKLE
	
Move_GRASSYTERRAIN:
	goto Move_TACKLE
	
Move_ASTRAL_BARRAGE:
	goto Move_TACKLE
	
Move_NOT_CUT:
	goto Move_TACKLE
	
Move_ICEBLADE:
	loadspritegfx ANIM_TAG_RAINBOW_RINGS
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	loadspritegfx ANIM_TAG_SLASH
	fadetobg BG_AURORA
	waitbgfadein
	loadspritegfx ANIM_TAG_SLASH
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, -8, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, 8, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 18, 1
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	call IceCrystalEffectShort
	delay 3
	restorebg
	waitbgfadein
	end

Move_NIGHT_SLASH:
Move_KOWTOW_CLEAVE:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_SLASH
	fadetobg BG_GHOST
	waitbgfadein
	monbg ANIM_ATK_PARTNER
	setalpha 9, 8
	createvisualtask AnimTask_AttackerPunchWithTrace, 2, RGB_BLACK, 13
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	delay 6
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, -8, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, 8, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 18, 1
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	restorebg
	waitbgfadein
	end
	
Move_BITTER_BLADE:
	loadspritegfx ANIM_TAG_SLASH
	loadspritegfx ANIM_TAG_WISP_FIRE
	monbg ANIM_DEF_PARTNER
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, -8, 0
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	delay 4
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, 8, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 18, 1
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	splitbgprio_all
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 13, 1
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 0
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 42
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 84
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 126
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 168
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 210
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end
Move_ARMOR_CANNON:
Move_DEFOG:
Move_LUNAR_BLESSING:
Move_LUNAR_DANCE:
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	loadspritegfx ANIM_TAG_DUCK
	loadspritegfx ANIM_TAG_MOON
	loadspritegfx ANIM_TAG_GREEN_SPARKLE
	loadspritegfx ANIM_TAG_BLUE_STAR
	setalpha 0, 16
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 1, 0, 16, RGB_BLACK
	waitforvisualfinish
	createsprite gMoonSpriteTemplate, ANIM_ATTACKER, 2, 120, 56
	createvisualtask AnimTask_AlphaFadeIn, 3, 0, 16, 16, 0, 1
	playsewithpan SE_M_MOONLIGHT, 0
	createvisualtask AnimTask_TeeterDanceMovement, 5
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, -2
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, -12, 0
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -2
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, -24, 0
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, -16, -2
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, 21, 0
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 1, -8, -2
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, 0, 0
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 2, 8, -2
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, 10, 0
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_MoonlightEndFade, 2
	end
Move_ROAR_OF_GRIME:
Move_BELCH:
Move_MUSTARD_SLAP:
	loadspritegfx ANIM_TAG_TAG_HAND
	loadspritegfx ANIM_TAG_SMELLINGSALT_EFFECT
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	createsprite gSmellingSaltsHandSpriteTemplate, ANIM_TARGET, 2, ANIM_TARGET, 0, 2
	createsprite gSmellingSaltsHandSpriteTemplate, ANIM_TARGET, 2, ANIM_TARGET, 1, 2
	delay 32
	createvisualtask AnimTask_SmellingSaltsSquish, 3, ANIM_TARGET, 2
	loopsewithpan SE_M_DOUBLE_SLAP, SOUND_PAN_TARGET, 12, 2
	waitforvisualfinish
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(30, 30, 0)
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 0, 55, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 0, 55, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 0, 50, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 0, 45, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 0, 50, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	waitforvisualfinish
	end
Move_BONEMERANCH:
	loadspritegfx ANIM_TAG_BONE
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_BONEMERANG, SOUND_PAN_TARGET
	createsprite gSpinningBoneSpriteTemplate, ANIM_ATTACKER, 2, -42, -25, 0, 0, 15
	delay 12
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 5, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG | F_PAL_ATTACKER | F_PAL_TARGET, 5, 1, RGB_BLACK, 10, RGB_BLACK, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(30, 30, 0)
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 0, 55, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 0, 55, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 0, 50, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 0, 45, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 0, 50, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
Move_BARBEQUAKE:
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	createvisualtask AnimTask_HorizontalShake, 5, (MAX_BATTLERS_COUNT + 1), 10, 50
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 10, 50
	playsewithpan SE_M_EARTHQUAKE, 0
	delay 10
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	delay 16
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	delay 16
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(18, 8, 2)
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 0, 55, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 0, 55, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 0, 50, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 0, 45, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 0, 50, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	waitforvisualfinish
	end
Move_TARTARBOLT:
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_SHOCK_3
	loadspritegfx ANIM_TAG_SPARK_2
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 0, 6, RGB_BLACK
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_ElectricBolt, 5, 24, -52, 0
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_TARGET
	delay 7
	createvisualtask AnimTask_ElectricBolt, 5, -24, -52, 0
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_TARGET
	delay 7
	createvisualtask AnimTask_ElectricBolt, 5, 0, -60, 1
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_TARGET
	delay 9
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 0, 0, 13, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 0, 13, 0, RGB_BLACK
	waitforvisualfinish
	delay 20
	createsprite gThunderboltOrbSpriteTemplate, ANIM_TARGET, 3, 44, 0, 0, 3
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 0, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 64, 40, 1, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 128, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 192, 40, 2, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 32, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 96, 40, 1, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 160, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 224, 40, 2, -32765
	playsewithpan SE_M_HYPER_BEAM, SOUND_PAN_TARGET
	delay 0
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 2, 2, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 6, 6, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 2, 2, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 6, 6, RGB_BLACK
	waitforvisualfinish
	delay 20
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(30, 30, 0)
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 0, 55, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 0, 55, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 0, 50, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 0, 45, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 0, 50, 10, RGB(30, 30, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 6, 0, RGB_BLACK
	waitforvisualfinish
	end
Move_ALIOLI_ACE:
	loadspritegfx ANIM_TAG_BUTTER_BLADE
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 24, 6, 1, 5
	createvisualtask AnimTask_TraceMonBlended, 2, 0, 4, 7, 3
	createsprite gButterSliceSpriteTemplate, ANIM_TARGET, 2, 1, 0, 0
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 18, 1
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_DEF_SIDE, 2, 2, 0, 12, RGB(30, 30, 0)
	playsewithpan SE_M_RAZOR_WIND, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end

Move_CHILI_RECEPTION:
	loadspritegfx ANIM_TAG_KETCHUP
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	createvisualtask AnimTask_ChiliReception, 3
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	delay 24
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, 40, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_TARGET, 0, 4, 20, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_DEF_PARTNER, 0, 4, 20, 1
	loopsewithpan SE_M_STRENGTH, SOUND_PAN_TARGET, 8, 2
	waitforvisualfinish
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(20, 0, 0)
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 0, 55, 10, RGB(20, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 0, 55, 10, RGB(20, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 0, 50, 10, RGB(20, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 0, 45, 10, RGB(20, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 0, 50, 10, RGB(20, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	waitforvisualfinish
	playsewithpan SE_M_BLIZZARD2, SOUND_PAN_TARGET
	call IceCrystalEffectLong
	waitforvisualfinish
	end
Move_SRIRACHA_GOTCHA:
	loadspritegfx ANIM_TAG_KETCHUP
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_BONEMERANG, SOUND_PAN_ATTACKER
	createsprite gSrirachaGotchaSpriteTemplate, ANIM_ATTACKER, 2
	delay 20
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 5, 0, 5, 1
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(30, 15, 0)
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 0, 55, 10, RGB(30, 15, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 0, 55, 10, RGB(30, 15, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 0, 50, 10, RGB(30, 15, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 0, 45, 10, RGB(30, 15, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 0, 50, 10, RGB(30, 15, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	waitforvisualfinish
	end
Move_HAPPY_HOUR:
	goto Move_TACKLE
	
Move_HAIR_BLITZ:
	goto Move_TACKLE
	
Move_COTTON_GUARD:
	loadspritegfx ANIM_TAG_SPORE
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	loopsewithpan SE_M_POISON_POWDER, SOUND_PAN_TARGET, 18, 10
	call CreateCottonSporesSelf
	call CreateCottonSporesSelf
	call CreateCottonSporesSelf
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	loopsewithpan SE_SHINY, SOUND_PAN_ATTACKER, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 8, 2, RGB_WHITEALPHA, 14, RGB_WHITEALPHA, 0
	waitforvisualfinish
	end

CreateCottonSporesSelf:
	createsprite gSporeSelfParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -20, 85, 80, 0
	delay 12
	createsprite gSporeSelfParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 170, 80, 0
	delay 12
	createsprite gSporeSelfParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -15, 0, 80, 0
	delay 12
	return
Move_COTTON_GONE:
	loadspritegfx ANIM_TAG_AMNESIA
	loopsewithpan SE_M_POISON_POWDER, SOUND_PAN_TARGET, 18, 10
	delay 96
	createsprite gQuestionMarkSpriteTemplate, ANIM_ATTACKER, 20
	playsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER
	delay 54
	loopsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER, 16, 3
	waitforvisualfinish
	end
Move_HAIR_CUTTER:
	goto Move_TACKLE
	
Move_ELECTRO_BALD:
	goto Move_TACKLE
	
Move_MAGNINUDE:
	goto Move_TACKLE
	
Move_NAKE_IT_RAIN:
	goto Move_TACKLE
	
Move_BOLT_STREAK:
	goto Move_TACKLE
	
Move_FLASH_AMPHAROS:
	goto Move_TACKLE
	
Move_ITS_NOT_OAK:
	goto Move_TACKLE
	
Move_BURNING_JEALOUSY:
	goto Move_TACKLE
	
Move_DISARMINGCHOICE:
	goto Move_TACKLE
	
Move_LOWER_HAND:
	goto Move_TACKLE
	
Move_TOO_SLOWER_HAND:
	goto Move_TACKLE
	
Move_CLAMPUTATE:
	loadspritegfx ANIM_TAG_CLAMP
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_VICEGRIP, SOUND_PAN_TARGET
	createsprite gClampJawSpriteTemplate, ANIM_ATTACKER, 2, -32, 0, 2, 819, 0, 10
	createsprite gClampJawSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 6, -819, 0, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 5, 1
	waitforvisualfinish
	call BleedTarget
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	waitforvisualfinish
	end
BleedAttacker:
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_ATTACKER, 2, 2, 0, 12, RGB(30, 0, 0)
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_ATTACKER, 2, 0, -22, 0, 1, 55, 10, RGB(30, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_ATTACKER, 2, -26, -24, 0, 1, 55, 10, RGB(30, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_ATTACKER, 2, 15, -27, 0, 1, 50, 10, RGB(30, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_ATTACKER, 2, -15, -17, 0, 1, 45, 10, RGB(30, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_ATTACKER, 2, 27, -22, 0, 1, 50, 10, RGB(30, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	return
BleedTarget:
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(30, 0, 0)
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 0, 55, 10, RGB(30, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 0, 55, 10, RGB(30, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 0, 50, 10, RGB(30, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 0, 45, 10, RGB(30, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 0, 50, 10, RGB(30, 0, 0), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	return
Move_DISARMED_VOICE:
	goto Move_TACKLE
	
Move_BLEEDLE_ARM:
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 18, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 8, 1, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	call BleedAttacker
	waitforvisualfinish
	end
Move_PAIN_DANCE:
	goto Move_TACKLE
	
Move_PHANTOM_PUNCH:
	loadspritegfx ANIM_TAG_AMNESIA
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	fadetobg BG_GHOST
	waitbgfadein
	monbg ANIM_ATK_PARTNER
	setalpha 9, 8
	createvisualtask AnimTask_AttackerPunchWithTrace, 2, RGB_BLACK, 13
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	delay 90
	createsprite gQuestionMarkSpriteTemplate, ANIM_ATTACKER, 20
	playsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER
	delay 54
	loopsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER, 16, 3
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	restorebg
	waitbgfadein
	end
Move_ROCK_KICK:
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 8, 2, 0
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 5, 1
	waitforvisualfinish
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 20, 24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 5, 0, -20, 24, 14, 1
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 5, 20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, -5, 0, -20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 30, 18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 30, -18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -30, 18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -30, -18, 8, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 7, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
Move_BLAST_OFF:
	goto Move_TACKLE
	
Move_FLOWER_TRICK:
	goto Move_TACKLE
	
Move_PARTING_SHOT:
	goto Move_TACKLE
	
Move_SPARKLING_ARIA:
	goto Move_TACKLE
	
Move_CUTE:
	@Tackle
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
Move_SHADOW_SHIELD:
	loadspritegfx ANIM_TAG_SHADOW_SHIELD
	monbg ANIM_ATK_PARTNER
	splitbgprio ANIM_ATTACKER
	waitplaysewithpan SE_M_REFLECT, SOUND_PAN_ATTACKER, 16
	createsprite gShadowShieldSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 90
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	end

General_DoubleDipHit:
	goto Move_KARATE_CHOP
	
General_ChargeTurn:
	goto Move_CHARGE


Move_BOLT_STRIKE:
	goto Move_TACKLE
	
Move_BLUE_FLARE:
	goto Move_TACKLE
	
Move_GOLD_WIND:
	goto Move_TACKLE
	
Move_CRYSTAL_WIND:
	goto Move_TACKLE
	
Move_RIGHT_SCREEN:
	goto Move_TACKLE
	
Move_THUNDER_ARMOR:
	goto Move_TACKLE
	
Move_INFESTATION:
	goto Move_TACKLE
	
Move_TOXIC_TREAD:
	goto Move_TACKLE
	
Move_GRASS_KNOT:
	goto Move_TACKLE
	
Move_AERIAL_LACE:
	goto Move_TACKLE
	
Move_NIKE_CANNON:
	goto Move_TACKLE
	
Move_CLANGOROUS_SOLE:
	goto Move_TACKLE
	
Move_REFLECT_TYPE:
	goto Move_TACKLE
	
Move_SKULL_ISSUE:
	goto Move_TACKLE
	
Move_NOTHING:
	delay 120
	end
Move_COOLTRAINER_M:
	goto Move_TACKLE
	
Move_MAIL_SLAP:
	goto Move_TACKLE
	
Move_STRAP_ON:
	goto Move_TACKLE
	
Move_FLARE_CLITZ:
	goto Move_TACKLE
	
Move_LUSTER_PUBE:
	goto Move_TACKLE
	
Move_RISING_VULVAGE:
	goto Move_TACKLE
	
Move_PANTY_SHOT:
	goto Move_TACKLE
	
Move_MOONLIGHT_YEAR:
	goto Move_TACKLE
	
Move_CHERRY_BOMB:
	goto Move_TACKLE
	
Move_TRAILBLAZE:
	goto Move_TACKLE
	
Move_POWER_TRIP:
	goto Move_TACKLE
	
Move_CLANGOROUS_SOULBLAZE:
	goto Move_TACKLE
	
Move_ABSORB_ZUBAT:
	goto Move_TACKLE
	
Move_CEASELESS_BREADGE:
	goto Move_TACKLE
	
Move_BREADLONG_RUSH:
	goto Move_TACKLE
	
Move_SLOW_KICK:
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 80
	createsprite gSlidingKickSpriteTemplate, ANIM_TARGET, 2, -24, 28, 40, 8, 160, 0
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -8, 8, ANIM_TARGET, 2
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 6, 384, ANIM_TARGET, 2
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 4
	end
Move_EXTREME_SLOW:
	loadspritegfx ANIM_TAG_SPEED_DUST
	loadspritegfx ANIM_TAG_IMPACT
	fadetobg BG_HIGHSPEED_OPPONENT
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -2304, 0, 1, -1
	waitbgfadein
	createvisualtask AnimTask_AttackerStretchAndDisappear, 2
	loopsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER, 8, 3
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_SetAttackerInvisibleWaitForSignal, 2
	monbg ANIM_TARGET
	setalpha 12, 8
	delay 180
	@createvisualtask AnimTask_ExtremeSpeedImpact, 2
	delay 100
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gMonEdgeHitSplatSpriteTemplate, ANIM_TARGET, 2, ANIM_TARGET, 0, -12, 3
	delay 100
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gMonEdgeHitSplatSpriteTemplate, ANIM_TARGET, 2, ANIM_TARGET, 0, 12, 3
	delay 100
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	createsprite gMonEdgeHitSplatSpriteTemplate, ANIM_TARGET, 2, ANIM_TARGET, 0, 0, 3
	waitforvisualfinish
	delay 90
	createvisualtask AnimTask_SpeedDust, 2
	delay 10
	createvisualtask AnimTask_ExtremeSpeedMonReappear, 2
	loopsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_ATTACKER, 8, 4
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, 0xFFFF
	waitbgfadein
	clearmonbg ANIM_TARGET
	blendoff
	delay 1
	setarg 7, 0x1000
	delay 1
	end
Move_SHELL_SIDE_ASS:
	goto Move_TACKLE
	
Move_MAGNET_BOMB:
	goto Move_TACKLE
	
Move_CAFEINT_ATTACK:
	goto Move_TACKLE
	
Move_GRASSY_TERRAIN:
	goto Move_TACKLE
	
Move_CUTRAGE:
	goto Move_TACKLE
	
Move_FLYING_ASCENT:
	goto Move_TACKLE
	
Move_DOODLE:
	goto Move_TACKLE
	
Move_DARK_VOID_SMEARGLE:
	goto Move_TACKLE
	
Move_AFTER_YU:
	goto Move_TACKLE
	
Move_HAPPY_OUR:
	goto Move_TACKLE
	
Move_FOUL_THEY:
	goto Move_TACKLE
	
Move_BLUE_HAIR:
	goto Move_TACKLE
	
Move_HONE_CLAWS:
	goto Move_TACKLE
	
Move_BABY_DOLL_EYES:
	goto Move_TACKLE
	
Move_RELIC_SONG:
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_MusicNotesRainbowBlend, 2
	waitforvisualfinish
	panse SE_M_SING, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 7, 0, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 6, 1, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 1, 2, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 3, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 3, 0, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 5, 2, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 6, 3, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 0, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 1, 2, 12
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 14, 1
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 5, 3, 12
	delay 4
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_MusicNotesClearRainbowBlend, 2
	waitforvisualfinish
	end
Move_DAZZLING_GLEAM:
	goto Move_TACKLE
	
Move_VACUUM_WAVE:
	goto Move_TACKLE
	
Move_CRUSH_GRIP:
	goto Move_TACKLE
	
Move_CLEAR_SMOG:
	goto Move_TACKLE
	
Move_HIGH_HORSEPOWER:
	goto Move_TACKLE
	
Move_FIRE_PLAST:
	goto Move_TACKLE
	
Move_IRAN_TAIL:
	fadetobg BG_IRAN_FLAG
	waitbgfadein
	loadspritegfx ANIM_TAG_IMPACT
	loopsewithpan SE_M_HARDEN, SOUND_PAN_ATTACKER, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 1, 0, 0
	waitforvisualfinish
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	waitforvisualfinish
	createvisualtask AnimTask_SetGrayscaleOrOriginalPal, 5, ANIM_ATTACKER, 1
	clearmonbg ANIM_TARGET
	blendoff
	waitforvisualfinish
	restorebg
	waitbgfadein
	end
Move_MIRAQLE_EYE:
	fadetobg BG_IRAN_FLAG
	waitbgfadein
	loadspritegfx ANIM_TAG_TEAL_ALERT
	loadspritegfx ANIM_TAG_OPENING_EYE
	loadspritegfx ANIM_TAG_ROUND_WHITE_HALO
	monbg 4
	playsewithpan SE_M_CONFUSE_RAY, SOUND_PAN_TARGET
	createsprite gOpeningEyeSpriteTemplate, ANIM_ATTACKER, 5, 0, 0, 1, 0
	createsprite gWhiteHaloSpriteTemplate, ANIM_ATTACKER, 5
	delay 40
	playsewithpan SE_M_LEER, SOUND_PAN_TARGET
	call MindReaderEyeSpikeEffect
	waitforvisualfinish
	clearmonbg 4
	restorebg
	waitbgfadein
	end
Move_ARABOLIC_CHARGE:
	loadspritegfx ANIM_TAG_ELECTRIC_ORBS
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_ELECTRICITY
	monbg ANIM_ATTACKER
	setalpha 12, 8
	fadetobg BG_IRAN_FLAG
	waitbgfadein
	createvisualtask AnimTask_ElectricChargingParticles, 2, ANIM_ATTACKER, 60, 2, 12
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 30
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 30
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	createsprite gGrowingChargeOrbSpriteTemplate, ANIM_ATTACKER, 2, 0
	delay 25
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 20
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 15
	playsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER
	delay 10
	delay 6
	loopsewithpan SE_M_CHARGE, SOUND_PAN_ATTACKER, 6, 5
	waitforvisualfinish
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 16
	delay 2
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, -16, -16
	playsewithpan SE_M_THUNDERBOLT2, SOUND_PAN_ATTACKER
	waitforvisualfinish
	restorebg
	waitbgfadein
	clearmonbg ANIM_ATTACKER
	blendoff
	end
Move_TRIPLE_DIVE:
	goto Move_TACKLE
	
Move_TRIPLE_DIVE_2:
	goto Move_TACKLE
	
Move_TRIPLE_DIVE_3:
	goto Move_TACKLE
	
Move_TEHRANDERBOLT:
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_SHOCK_3
	loadspritegfx ANIM_TAG_SPARK_2
	fadetobg BG_IRAN_FLAG
	waitbgfadein
	delay 10
	createvisualtask AnimTask_ElectricBolt, 5, 24, -52, 0
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_TARGET
	delay 7
	createvisualtask AnimTask_ElectricBolt, 5, -24, -52, 0
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_TARGET
	delay 7
	createvisualtask AnimTask_ElectricBolt, 5, 0, -60, 1
	playsewithpan SE_M_THUNDERBOLT, SOUND_PAN_TARGET
	delay 9
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 0, 0, 13, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 0, 13, 0, RGB_BLACK
	waitforvisualfinish
	delay 20
	createsprite gThunderboltOrbSpriteTemplate, ANIM_TARGET, 3, 44, 0, 0, 3
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 0, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 64, 40, 1, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 128, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 192, 40, 2, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 32, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 96, 40, 1, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 160, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 224, 40, 2, -32765
	playsewithpan SE_M_HYPER_BEAM, SOUND_PAN_TARGET
	delay 0
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 2, 2, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 6, 6, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 2, 2, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 6, 6, RGB_BLACK
	waitforvisualfinish
	delay 20
	waitplaysewithpan SE_M_THUNDERBOLT2, SOUND_PAN_TARGET, 19
	call ElectricityEffect
	waitforvisualfinish
	delay 20
	waitforvisualfinish
	restorebg
	waitbgfadein
	end
Move_RAGING_FURRY:
	goto Move_TACKLE
	
Move_HARDBOILED:
	goto Move_TACKLE
	
Move_YESPER_WING:
	goto Move_TACKLE
	
Move_PSYCH_YUP:
	goto Move_TACKLE
	
Move_AQUA_YEP:
	goto Move_TACKLE
	
Move_SURE_UP:
	goto Move_TACKLE
	
Move_MIRACLE_AYE:
	goto Move_TACKLE
	
Move_FILLET_OKAY:
	goto Move_TACKLE
	
Move_YESIPICE_BLADES:
	goto Move_TACKLE
	
Move_OBLIVION_OUING:
	goto Move_TACKLE
	
Move_MISTER:
	goto Move_TACKLE
	
Move_CHILLY_RECEPTION:
	goto Move_TACKLE
	
Move_MISTER_TERRAIN:
	goto Move_TACKLE
	
Move_MISTER_EXPLOSION:
	goto Move_TACKLE
	
Move_DADDY_DAD:
	goto Move_TACKLE
	
Move_ITCHY_POLLEN:
	goto Move_TACKLE
	
Move_DO_THE_WAVE:
	goto Move_TACKLE
	
Move_MIND_GAMES:
	goto Move_TACKLE
	
Move_GARBOTOXIN:
	goto Move_TACKLE
	
Move_EEEEEEEK:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	createvisualtask AnimTask_BlendParticle, 5, ANIM_TAG_SMALL_BUBBLES, 0, 4, 4, RGB(12, 11, 31)
	waitforvisualfinish
	createvisualtask AnimTask_RockMonBackAndForth, 5, ANIM_ATTACKER, 2, 1
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 12, 4
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	waitforvisualfinish
	end
Move_EEEEEEEEK:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	createvisualtask AnimTask_BlendParticle, 5, ANIM_TAG_SMALL_BUBBLES, 0, 4, 4, RGB(12, 11, 31)
	waitforvisualfinish
	createvisualtask AnimTask_RockMonBackAndForth, 5, ANIM_ATTACKER, 4, 1
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 12, 8
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	waitforvisualfinish
	end
Move_EEEEEEEEEK:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	createvisualtask AnimTask_BlendParticle, 5, ANIM_TAG_SMALL_BUBBLES, 0, 4, 4, RGB(12, 11, 31)
	waitforvisualfinish
	createvisualtask AnimTask_RockMonBackAndForth, 5, ANIM_ATTACKER, 8, 1
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 12, 16
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	waitforvisualfinish
	end
Move_EK:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	createvisualtask AnimTask_BlendParticle, 5, ANIM_TAG_SMALL_BUBBLES, 0, 4, 4, RGB(12, 11, 31)
	waitforvisualfinish
	createvisualtask AnimTask_RockMonBackAndForth, 5, ANIM_ATTACKER, 1, 10
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 12, 1
	delay 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	waitforvisualfinish
	end
Move_CALL_FOR_GOONS:
	goto Move_TACKLE
	
Move_EVERYBODY_EXPLODE_NOW:
	loadspritegfx ANIM_TAG_THROWN_FORRETRESS
	loadspritegfx ANIM_TAG_EXPLOSION

	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 220, 60
	waitplaysewithpan SE_M_ROCK_THROW, 0, 15
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 60, 100
	waitplaysewithpan SE_M_ROCK_THROW, 0, 25
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 140, 55
	waitplaysewithpan SE_M_ROCK_THROW, 0, 14
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 180, 50
	waitplaysewithpan SE_M_ROCK_THROW, 0, 10
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 20, 90
	waitplaysewithpan SE_M_ROCK_THROW, 0, 22
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 90, 90
	waitplaysewithpan SE_M_ROCK_THROW, 0, 22
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 160, 60
	waitplaysewithpan SE_M_ROCK_THROW, 0, 15
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 30, 90
	waitplaysewithpan SE_M_ROCK_THROW, 0, 22
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 120, 60
	waitplaysewithpan SE_M_ROCK_THROW, 0, 15
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 200, 40
	waitplaysewithpan SE_M_ROCK_THROW, 0, 10
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 220, 60
	waitplaysewithpan SE_M_ROCK_THROW, 0, 15
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 60, 100
	waitplaysewithpan SE_M_ROCK_THROW, 0, 25
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 140, 55
	waitplaysewithpan SE_M_ROCK_THROW, 0, 14
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 180, 50
	waitplaysewithpan SE_M_ROCK_THROW, 0, 10
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 20, 90
	waitplaysewithpan SE_M_ROCK_THROW, 0, 22
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 90, 90
	waitplaysewithpan SE_M_ROCK_THROW, 0, 22
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 160, 60
	waitplaysewithpan SE_M_ROCK_THROW, 0, 15
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 30, 90
	waitplaysewithpan SE_M_ROCK_THROW, 0, 22
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 120, 60
	waitplaysewithpan SE_M_ROCK_THROW, 0, 15
	delay 2
	createsprite gThrownForretressSpriteTemplate, ANIM_TARGET, 2, 1, 200, 40
	waitplaysewithpan SE_M_ROCK_THROW, 0, 10

	waitforvisualfinish
	delay 30
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 8, 9, RGB(26, 8, 8), 8, RGB_BLACK, 8
	createvisualtask AnimTask_ShakeMon2, 5, 4, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 5, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 6, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 7, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 8, 8, 0, 40, 1
	call ExplosionBoth
	call ExplosionBoth
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 1, 16, 16, RGB_WHITE
	delay 50
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 3, 16, 0, RGB_WHITE
	end


ExplosionBoth:
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, 4, 3, 0, 0, 0, 1
	createsprite gExplosionSpriteTemplate, 6, 3, 0, 0, 1, 0
	delay 6
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, 4, 3, 24, -24, 0, 1
	createsprite gExplosionSpriteTemplate, 7, 3, 24, -24, 1, 0
	delay 6
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, 4, 3, -16, 16, 0, 1
	createsprite gExplosionSpriteTemplate, 5, 3, -16, 16, 1, 0
	delay 6
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, 4, 3, -24, -12, 0, 1
	createsprite gExplosionSpriteTemplate, 6, 3, -24, -12, 1, 0
	delay 6
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_ATTACKER
	createsprite gExplosionSpriteTemplate, 4, 3, 16, 16, 0, 1
	createsprite gExplosionSpriteTemplate, 7, 3, 16, 16, 1, 0
	delay 6
	return

Move_VISUAL_SNOW:
	goto Move_TACKLE
	
Move_PSYCHIC_SPINNER:
	goto Move_TACKLE
	
Move_SNOW_FORECAST:
	goto Move_TACKLE
	
Move_ICE_TERRAIN:
	goto Move_TACKLE
	
Move_EXPANDING_FROST:
	goto Move_TACKLE
	
Move_ICESTRIKE:
	goto Move_TACKLE
	
Move_F_STINGER:
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loadspritegfx ANIM_TAG_NEEDLE
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER
	createsprite gLinearStingerSpriteTemplate, ANIM_TARGET, 2, 20, 0, -8, 0, 20
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 5, 1
	playsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET
	waitforvisualfinish
	delay 10
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 5, 0, 20, 1
	call FShape
	delay 3
	call FShape
	delay 3
	call FShape
	delay 3
	call FShape
	delay 3
	call FShape
	delay 3
	call FShape
	delay 3
	call FShape
	delay 3
	call FShape
	delay 3
	call FShape
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
	
FShape:
    createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, -10, -44, 24, 0, 3
    createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, -10, -44, 12, 3, 0
    createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, -10, -12, 12, 3, 0
    return

Move_F_BOMB:
	goto Move_TACKLE
	
Move_O_POWER:
	goto Move_TACKLE
	
Move_G_M_B_FUDDLE:
	goto Move_TACKLE
	
Move_C_STINGER:
	goto Move_TACKLE
	
Move_H_ORDER:
	goto Move_TACKLE
	
Move_A_ORDER:
	goto Move_TACKLE
	
Move_P_MISSILE:
	goto Move_TACKLE
	
Move_T_GLOW:
	goto Move_TACKLE
	
Move_E_EXIT:
	goto Move_TACKLE
	
Move_R_POWDER:
	goto Move_TACKLE
	
Move_3_KICK:
	goto Move_TACKLE
	
Move_ROCK_GUN:
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_WATER_IMPACT
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createsprite gWaterGunProjectileSpriteTemplate, ANIM_ATTACKER, 2, 20, 0, 0, 0, 40, -25
	playsewithpan SE_M_BUBBLE, SOUND_PAN_ATTACKER
	waitforvisualfinish
	setalpha 12, 8
	delay 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 20, 24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 5, 0, -20, 24, 14, 1
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 5, 20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, -5, 0, -20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 30, 18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 30, -18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -30, 18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -30, -18, 8, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 7, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
Move_BREAKING_BIND:
	loadspritegfx ANIM_TAG_SLASH_2
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gFalseSwipeSliceSpriteTemplate, ANIM_TARGET, 2
	playsewithpan SE_M_VITAL_THROW, SOUND_PAN_TARGET
	delay 16
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 0
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_TARGET
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 16
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 32
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_TARGET
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 48
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 64
	playsewithpan SE_M_DOUBLE_TEAM, SOUND_PAN_TARGET
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 80
	delay 2
	waitforvisualfinish
	createvisualtask AnimTask_SwayMon, 5, 0, 6, 3328, 4, ANIM_ATTACKER
	goto BindWrap
	end
Move_ANCIENT_BITE:
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_SHARP_TEETH
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 4, 1, 10, 1
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 20, 32, -48, 50, 2
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, -38, 25, 5
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 32, 32, -28, 40, 3
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, -20, 32, -48, 50, 2
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 20, 32, -28, 60, 1
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, -28, 30, 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 30, 1
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	delay 10
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 15, 32, -48, 25, 5
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, -10, 32, -42, 30, 4
	delay 10
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, -42, 25, 5
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, -25, 32, -48, 30, 4
	waitforvisualfinish
	setalpha 12, 8
	playsewithpan SE_M_BITE, SOUND_PAN_TARGET
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 0, -32, 0, 0, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 4, 0, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 4, 7, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 1
	end
Move_CONSTRACKLE:
	loadspritegfx ANIM_TAG_TENDRILS
	loadspritegfx ANIM_TAG_IMPACT
	loopsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET, 6, 4
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 4, 0, 16, 0, 2
	delay 7
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 3, 0, 0, 0, 2
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 2, 0, 8, 1, 2
	delay 7
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 3, 0, -8, 1, 2
	delay 8
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 6, 1
	delay 20
	setarg 7, 0xFFFF
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
Move_GIGA_BRINE:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_GLOWY_BLUE_ORB
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_TARGET
	delay 2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 0, 16, RGB_BLACK
	setalpha 12, 8
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_TARGET

	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_ATTACKER, 18, 6, 3, 4
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 0, 16, 16, RGB_WHITE
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	waitforvisualfinish

	call SetImpactBackground

	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 3
	waitforvisualfinish

	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET

	createvisualtask AnimTask_WaterSpoutRain, 5
	playsewithpan SE_M_SURF, SOUND_PAN_TARGET
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_ATTACKER, 0
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 4, 0, 12, 1
	waitforvisualfinish

	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, ANIM_ATTACKER, 1
	waitforvisualfinish

	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7
	waitforvisualfinish

	clearmonbg ANIM_TARGET
	blendoff
	delay 2
	restorebg
	waitbgfadein
	end
Move_EARTHPUMP:
	loadspritegfx ANIM_TAG_WATER_ORB
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_HorizontalShake, 5, (MAX_BATTLERS_COUNT + 1), 10, 50
	createvisualtask AnimTask_HorizontalShake, 5, MAX_BATTLERS_COUNT, 10, 50
	playsewithpan SE_M_EARTHQUAKE, 0
	
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 40, 1
	delay 6
	panse SE_M_HYDRO_PUMP, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, +2, 0
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpBeams
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 3, 0, 37, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 1, RGB_BLACK, 14, RGB_WHITE, 14
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	delay 1
	delay 1
	call HydroPumpHitSplats
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
Move_DRAGON_CANNON:
	loadspritegfx ANIM_TAG_NEEDLE
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loadspritegfx ANIM_TAG_CLAW_SLASH
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_SACRED_FIRE2, SOUND_PAN_ATTACKER
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 4, 0, 8, RGB(31, 19, 0)
	createvisualtask AnimTask_ShakeMon, 5, ANIM_ATTACKER, 0, 2, 15, 1
	call DragonClawFireSpiral
	call DragonClawFireSpiral
	createvisualtask AnimTask_WindUpLunge, 5, ANIM_ATTACKER, -4, 0, 4, 6, 8, 4
	delay 6
	loopsewithpan SE_M_RAZOR_WIND2, SOUND_PAN_ATTACKER, 5, 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	createsprite gLinearStingerSpriteTemplate, ANIM_ATTACKER, 2, 10, -8, -8, -8, 20
	createsprite gLinearStingerSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 0, 0, 20
	createsprite gLinearStingerSpriteTemplate, ANIM_ATTACKER, 2, 26, 8, 8, 8, 20
	waitforvisualfinish
	createsprite gHandleInvertHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -8, -8, 1, 2
	createsprite gHandleInvertHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createsprite gHandleInvertHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 8, 8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 7, 1
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_ATTACKER, 4, 8, 0, RGB(31, 19, 0)
	loopsewithpan SE_M_HORN_ATTACK, SOUND_PAN_TARGET, 5, 3
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
Move_CHARM_SMASH:
	loadspritegfx ANIM_TAG_MAGENTA_HEART
	loadspritegfx ANIM_TAG_PINK_HEART
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_RockMonBackAndForth, 5, ANIM_ATTACKER, 2, 0
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 0, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, -20, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 20, 20
	playsewithpan SE_M_CHARM, SOUND_PAN_ATTACKER
	waitforvisualfinish
	
	createvisualtask AnimTask_ThrashMoveMonHorizontal, 2
	createvisualtask AnimTask_ThrashMoveMonVertical, 2
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 4, 0, 7, 1
	
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, -256, -42
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, 128, -14
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, 416, -38
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, -128, -22
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	delay 28
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 4, 0, 7, 1
	
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, -256, -42
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, 128, -14
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, 416, -38
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, -128, -22
	playsewithpan SE_M_VITAL_THROW2, SOUND_PAN_TARGET
	delay 28
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 8, 0, 16, 1
	
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, -256, -42
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, 128, -14
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, 416, -38
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, -128, -22
	playsewithpan SE_M_ATTRACT, SOUND_PAN_TARGET
	end

Move_FUSION_FLARE:
Move_BITE_POWER:
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_SHARP_TEETH
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 4, 1, 10, 1
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 20, 32, -48, 50, 2
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, -38, 25, 5
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 32, 32, -28, 40, 3
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, -20, 32, -48, 50, 2
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 20, 32, -28, 60, 1
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, -28, 30, 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_ATTACKER, 1, 0, 30, 1
	playsewithpan SE_M_DRAGON_RAGE, SOUND_PAN_ATTACKER
	delay 10
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 15, 32, -48, 25, 5
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, -10, 32, -42, 30, 4
	delay 10
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, -42, 25, 5
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, -25, 32, -48, 30, 4
	waitforvisualfinish
	setalpha 12, 8
	playsewithpan SE_M_BITE, SOUND_PAN_TARGET
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 0, -32, 0, 0, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 4, 0, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 4, 7, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 1
	end
Move_CAMBRIAN_EXPLOSION:
	loadspritegfx ANIM_TAG_THROWN_KRABBY
	loadspritegfx ANIM_TAG_EXPLOSION


	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 8, 9, RGB(26, 8, 8), 8, RGB_BLACK, 8
	createvisualtask AnimTask_ShakeMon2, 5, 4, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 5, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 6, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 7, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 8, 8, 0, 40, 1
	call Explosion1
	call Explosion1
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 1, 16, 16, RGB_WHITE
	delay 50
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 3, 16, 0, RGB_WHITE
	waitforvisualfinish

	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 220, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 60, 100
	waitplaysewithpan SE_M_BUBBLE2, 0, 25
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 140, 55
	waitplaysewithpan SE_M_BUBBLE2, 0, 14
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 180, 50
	waitplaysewithpan SE_M_BUBBLE2, 0, 10
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 20, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 90, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 160, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 30, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 120, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 200, 40
	waitplaysewithpan SE_M_BUBBLE2, 0, 10
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 220, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 60, 100
	waitplaysewithpan SE_M_BUBBLE2, 0, 25
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 140, 55
	waitplaysewithpan SE_M_BUBBLE2, 0, 14
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 180, 50
	waitplaysewithpan SE_M_BUBBLE2, 0, 10
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 20, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 90, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 160, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 30, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 120, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gThrownKrabbySpriteTemplate, ANIM_TARGET, 2, 1, 200, 40
	waitplaysewithpan SE_M_BUBBLE2, 0, 10

	waitforvisualfinish
	end
Move_FAKE_TREERS:
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	createvisualtask AnimTask_RockMonBackAndForth, 5, ANIM_ATTACKER, 2, 1
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 12, 4
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -2, 10
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -1, 15
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -4, -4, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 3, -3, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -6, 8
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -1, 12
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -4, 13
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 4, -5, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -6, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -5, 8
	waitforvisualfinish
	end
	
Move_REAL_TREERS:
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	createvisualtask AnimTask_RockMonBackAndForth, 5, ANIM_ATTACKER, 2, 1
	loopsewithpan SE_M_TAIL_WHIP, SOUND_PAN_ATTACKER, 12, 4
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -2, 10
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -1, 15
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -4, -4, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 3, -3, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -6, 8
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -1, 12
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -4, 13
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 4, -5, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -6, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -5, 8
	waitforvisualfinish
	end
Move_VEIN_WHIP:
	loadspritegfx ANIM_TAG_WHIP_HIT
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_JUMP_KICK, SOUND_PAN_ATTACKER
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 6
	playsewithpan SE_M_SCRATCH, SOUND_PAN_TARGET
	createsprite gVineWhipSpriteTemplate, ANIM_TARGET, 2, 0, 0
	delay 6
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 20, 24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 5, 0, -20, 24, 14, 1
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 5, 20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, -5, 0, -20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 30, 18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 30, -18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -30, 18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -30, -18, 8, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 3, 7, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
Move_BRANCH_POKE:
	loadspritegfx ANIM_TAG_NEEDLE
	delay 1
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	splitbgprio_foes ANIM_TARGET
	setalpha 12, 8
	delay 1
	createsprite gLeechLifeNeedleSpriteTemplate, ANIM_ATTACKER, 2, -20, 15, 12
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	playsewithpan SE_M_ABSORB, SOUND_PAN_TARGET
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 5, 5, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
Move_BARK_SLIDE:
	goto Move_TACKLE
	
Move_GRAVEL_APPLE:
	goto Move_TACKLE
	
Move_SHOWER_GEM:
	loadspritegfx ANIM_TAG_GLOWY_BLUE_ORB
	loadspritegfx ANIM_TAG_WATER_IMPACT
	loadspritegfx ANIM_TAG_ROCKS
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_WaterSpoutRain, 5
	playsewithpan SE_M_SURF, SOUND_PAN_TARGET
	delay 45
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 7, 1, 11, 1
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -5, 1, -5, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 5, 0, 6, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 19, 1, 10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -23, 2, -10, 1
	playsewithpan SE_M_ROCK_THROW, SOUND_PAN_TARGET
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 0, 5, 50, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_DEF_PARTNER, 0, 5, 50, 1
	delay 2
	call RockSlideRocks
	call RockSlideRocks
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
Move_REAL_AXE:
	goto Move_TACKLE
	
Move_FLIP_TURN:
	goto Move_TACKLE
	
Move_HEART_BEAT:
	goto Move_TACKLE
	
Move_BITTER_SPADE:
	goto Move_TACKLE
	
Move_DIAMOND_STORM:
	goto Move_TACKLE
	
Move_BRANCH_POKER:
	goto Move_TACKLE
	
Move_HEARTING_SHOT:
	goto Move_TACKLE
	
Move_PSYSICLE_CRASH:
	goto Move_TACKLE
	
Move_DOUBLE_IRON_BASH:
	goto Move_TACKLE
	
Move_PLAY_NPSYCHIC:
	goto Move_TACKLE
	
Move_IRON_TAILS:
	goto Move_TACKLE
	
Move_CONFUSING_GLARE:
	goto Move_TACKLE
	
Move_SECRET_LIFE_DEW:
	goto Move_TACKLE
	
Move_G_MAX_CHILDFIRE:
	goto Move_TACKLE
	
Move_DEMOND_STORM:
	goto Move_TACKLE
	
Move_TAIL_BLOW:
	goto Move_TACKLE
	
Move_FAIL_GLOW:
	goto Move_TACKLE
	
Move_P_CREATE:
	goto Move_TACKLE
	
Move_SCARED_FIRE:
	goto Move_TACKLE
	
Move_AEROBLASS:
	goto Move_TACKLE
	
Move_SHYSTRIKE:
	goto Move_TACKLE
	
Move_SPACIAL_FRIEND:
	goto Move_TACKLE
	
Move_ROAR_OF_THYME:
	goto Move_TACKLE
	
Move_DARK_LLOYD:
	goto Move_TACKLE
	
Move_BORE_ENFORCER:
	goto Move_TACKLE
	
Move_LANDS_BATH:
	goto Move_TACKLE
	
Move_PSYCHO_BOOTS:
	goto Move_TACKLE
	
Move_FUDGEMENT:
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 0, 16, RGB_WHITE
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_DoomDesireLightBeam, 5
	delay 5
	playsewithpan SE_M_CONFUSE_RAY, SOUND_PAN_ATTACKER
	delay 10
	playsewithpan SE_M_CONFUSE_RAY, 0
	delay 10
	playsewithpan SE_M_CONFUSE_RAY, SOUND_PAN_TARGET
	delay 23
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 10, 0, 20, 1
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, SOUND_PAN_TARGET
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 1, 1
	waitforvisualfinish
	createvisualtask AnimTask_BlendColorCycle, 2, F_PAL_TARGET, 2, 2, 0, 12, RGB(18, 8, 2)
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 0, 55, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 0, 55, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 0, 50, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 0, 45, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	delay 5
	createsprite gAcidPoisonDropletTintedSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 0, 50, 10, RGB(18, 8, 2), 1
	playsewithpan SE_M_BUBBLE, SOUND_PAN_TARGET
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, F_PAL_BG, 3, 16, 0, RGB_WHITE
	waitforvisualfinish
	end
Move_PHIOMANCY:
	goto Move_TACKLE
	
Move_SKYRIM_WING:
	goto Move_TACKLE
	
Move_ETERNABEAM:
	goto Move_TACKLE
	
Move_FORCE_PALM:
	goto Move_TACKLE
	
Move_MONSTER_MASH:
	goto Move_TACKLE
	
Move_NIHIL_LIGHT:
	goto Move_TACKLE
	
Move_OBLIVION_ZING:
	goto Move_TACKLE
	
Move_ZEOMANCY:
	goto Move_TACKLE
	
Move_NONUPLE_WINGBEAT:
	goto Move_TACKLE
	
Move_POWER_UP_PUP:
	goto Move_TACKLE
	
Move_BARK_BARRAGE:
	goto Move_TACKLE
	
Move_ROLLOVER:
	goto Move_TACKLE
	
Move_VACUUM_FEAR:
	goto Move_TACKLE
	
Move_WOOF_HAMMER:
	goto Move_TACKLE
	
Move_NINE_WHIP:
	goto Move_TACKLE
	
Move_BEHEMOTH_BLAST:
	goto Move_TACKLE
	
Move_PSYSTRIKE:
	goto Move_TACKLE
	
Move_GENESIS_SUPERNOVA:
	goto Move_TACKLE

Move_LAST_RESORT:
	goto Move_TACKLE

Move_DOUBLE_FURY_SWIPE:
	goto Move_TACKLE

Move_NEUTRAL_METRONOME:
	loadspritegfx ANIM_TAG_FINGER
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	createsprite gThoughtBubbleSpriteTemplate, ANIM_ATTACKER, 11, 0, 100
	playsewithpan SE_M_ACID_ARMOR, SOUND_PAN_ATTACKER
	delay 6
	createsprite gMetronomeFingerSpriteTemplate, ANIM_ATTACKER, 12, 0
	delay 24
	loopsewithpan SE_M_GRASSWHISTLE, SOUND_PAN_ATTACKER, 22, 3
	waitforvisualfinish
	end
Move_PLAY_DAY:
	loadspritegfx ANIM_TAG_COIN
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	splitbgprio ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_NIGHTMARE, SOUND_PAN_ATTACKER
	createsprite gCoinThrowSpriteTemplate, ANIM_ATTACKER, 2, 20, 0, 0, 0, 1152
	waitforvisualfinish
	playsewithpan SE_M_STAT_INCREASE, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, ANIM_TARGET, 2
	createsprite gFallingCoinSpriteTemplate, ANIM_ATTACKER, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 1, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
Move_PAY_ROUGH:
	goto Move_TACKLE
Move_VINE_SLAP:
	loadspritegfx ANIM_TAG_WHIP_HIT
	playsewithpan SE_M_HARDEN, SOUND_PAN_ATTACKER
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 6
	playsewithpan SE_M_EXPLOSION, SOUND_PAN_TARGET
	createsprite gVineWhipSpriteTemplate, ANIM_TARGET, 2, 0, 0
	delay 6
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 2, 0, 6, 1
	end
Move_PUNCTURE:
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_M_MILK_DRINK, SOUND_PAN_TARGET
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 3, -768, ANIM_TARGET, 2
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, -12, 0, ANIM_TARGET, 3
	waitforvisualfinish
	end
Move_BLUNDERBOLT:
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_SHOCK_3
	loadspritegfx ANIM_TAG_SPARK_2
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 0, 6, RGB_BLACK
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_ElectricBolt, 5, 24, -52, 0
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_TARGET
	delay 7
	createvisualtask AnimTask_ElectricBolt, 5, -24, -52, 0
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_TARGET
	delay 7
	createvisualtask AnimTask_ElectricBolt, 5, 0, -60, 1
	playsewithpan SE_M_BELLY_DRUM, SOUND_PAN_TARGET
	delay 9
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 0, 0, 13, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_TARGET, 0, 13, 0, RGB_BLACK
	waitforvisualfinish
	delay 20
	createsprite gThunderboltOrbSpriteTemplate, ANIM_TARGET, 3, 44, 0, 0, 3
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 0, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 64, 40, 1, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 128, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 192, 40, 2, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 32, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 96, 40, 1, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 160, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 224, 40, 2, -32765
	playsewithpan SE_M_SAND_TOMB, SOUND_PAN_TARGET
	delay 0
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 2, 2, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 6, 6, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 2, 2, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 6, 6, RGB_BLACK
	waitforvisualfinish
	delay 20
	waitplaysewithpan SE_M_SUPERSONIC, SOUND_PAN_TARGET, 19
	call ElectricityEffect
	waitforvisualfinish
	delay 20
	createvisualtask AnimTask_BlendBattleAnimPal, 10, F_PAL_BG, 0, 6, 0, RGB_BLACK
	waitforvisualfinish
	end
Move_FAULTERGEIST:
	goto Move_TACKLE
Move_PHISHIOUS_REND:
	loadspritegfx ANIM_TAG_SHARP_TEETH
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	playsewithpan SE_M_FLATTER, SOUND_PAN_TARGET
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, -32, -32, 1, 819, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 32, 32, 5, -819, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 7, 5, 2
	waitforvisualfinish
	playsewithpan SE_M_DETECT, SOUND_PAN_TARGET
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 32, -32, 7, -819, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, -32, 32, 3, 819, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 8, 0, ANIM_TARGET, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 8, 4, 2
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	delay 1
	loopsewithpan SE_M_REVERSAL, SOUND_PAN_TARGET, 20, 3
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 0, 4, 8, 1
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 20, -20, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -15, 15, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -10, -20, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 16, -8, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 5, 8, 20, ANIM_TARGET
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -16, 0, 20, ANIM_TARGET
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
Move_ANGRY_SLICE:
	loadspritegfx ANIM_TAG_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 5, 5
	delay 4
	playsewithpan SE_M_SWAGGER, SOUND_PAN_TARGET
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, 16, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 5, 1
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, ANIM_TARGET, 2, 5, 5
	delay 4
	playsewithpan SE_M_SWAGGER2, SOUND_PAN_TARGET
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, -16, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 7, 1
	end
Move_ANGRY_SLICE_2:
	loadspritegfx ANIM_TAG_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 5, 5
	delay 4
	playsewithpan SE_M_TRI_ATTACK, SOUND_PAN_TARGET
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, 16, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 5, 1
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, ANIM_TARGET, 2, 5, 5
	delay 4
	playsewithpan SE_M_TRI_ATTACK2, SOUND_PAN_TARGET
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, -16, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 7, 1
	end
Move_ANGRY_SLICE_3:
	loadspritegfx ANIM_TAG_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 5, 5
	delay 4
	playsewithpan SE_M_ENCORE, SOUND_PAN_TARGET
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, 16, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 3, 0, 5, 1
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, ANIM_TARGET, 2, 5, 5
	delay 4
	playsewithpan SE_M_ENCORE2, SOUND_PAN_TARGET
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, -16, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 4, 0, 7, 1
	end
Move_BOMBARDMENT:
	loadspritegfx ANIM_TAG_RED_BALL
	createvisualtask AnimTask_BarrageBall, 3
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	delay 24
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, 40, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_TARGET, 0, 4, 20, 1
	createvisualtask AnimTask_ShakeMon, 3, ANIM_DEF_PARTNER, 0, 4, 20, 1
	loopsewithpan SE_MAKE_IT_RAIN, SOUND_PAN_TARGET, 8, 2
	end
Move_LETS_STRUGGLE_FOREVER:
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_MOVEMENT_WAVES
	fadetobg BG_GHOST
	waitbgfadein
	monbg ANIM_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_ATTACKER, 3, 0, 240, 4
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 2
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 2
	loopsewithpan SE_M_HEADBUTT, SOUND_PAN_ATTACKER, 12, 89
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	restorebg
	waitbgfadein
	end
Move_CLOSE_MOMBAT:
	goto Move_TACKLE
	
Move_TEACH_LIFE:
	goto Move_TACKLE
	
Move_HEADBUS:
	loadspritegfx ANIM_TAG_BUS_LEFT
	loadspritegfx ANIM_TAG_BUS_RIGHT
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	@createsprite gBulldozerSpriteTemplate, ANIM_TARGET, 2, 1, 4, 160
	@createsprite gBulldozerSpriteTemplate, ANIM_TARGET, 2, 2
	createsprite gBusLeftDriveSpriteTemplate, 3, 2, 0, 0  @ half 0 (left)
	createsprite gBusRightDriveSpriteTemplate, 3, 2, 0, 1 @ half 1 (right)
	loopsewithpan SE_M_EARTHQUAKE, SOUND_PAN_TARGET, 7, 10
	delay 90
	delay 90
	delay 60
	@createvisualtask AnimTask_PushTargetOffscreen, 2, ANIM_TARGET, 0, 2, 80, 150, 1

	@createvisualtask AnimTask_Flattened, 2, 6, 300
    @// 0: battler selector (0 = attacker, 1 = target)
    @// 1: number of hits
    @// 2: STARTING frames between hits
    @// 3: anim index (0-4) or -1 for random
    @// 4: visible frames per hit
    @// 5: play SFX every N hits
	@// 6: number of impacts per accel step

	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 8, 0, 48, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	delay 10
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	delay 10
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	delay 10
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	delay 10
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	delay 10
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	delay 10
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	delay 10
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	delay 10

	@// Task to facilitate simple shaking of a pokemon's picture in battle.
	@// The shaking alternates between the original position and the target position.
	@// arg 0: anim battler
	@// arg 1: x pixel offset
	@// arg 2: y pixel offset
	@// arg 3: num times to shake
	@// arg 4: frame delay
	waitforvisualfinish
	@setarg 7, 0xFFFF
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end
Move_LANDS_MATH:
	goto Move_TACKLE
	
Move_SPELLING_SALTS:
	goto Move_TACKLE
	
Move_ART_STRIKE:
	goto Move_TACKLE
	
Move_CHILLY_RECESSION:
	goto Move_TACKLE
	
Move_POWER_GYM:
	goto Move_TACKLE
	
Move_X_SCIENCER:
	goto Move_TACKLE
	
Move_HISTORY_EXPLOSION:
	goto Move_TACKLE
	
Move_BUS_BUZZ:
	goto Move_TACKLE
	
Move_BLAST_LEARN:
	goto Move_TACKLE
	
Move_HEART_STAMP:
	goto Move_TACKLE

Move_DRAGON:
	goto Move_TACKLE

Move_MOLTRES_KICK:
	goto Move_TACKLE

Move_WHITE_LIGHTNING:
	loadspritegfx ANIM_TAG_LIGHTNING
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	monbg ANIM_ATK_PARTNER
	fadetobg BG_THUNDER
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -256, 0, 1, -1
	waitbgfadein
	delay 6
	splitbgprio ANIM_ATTACKER
	setalpha 8, 8
	delay 10
	createvisualtask AnimTask_ShakeMon, 2, ANIM_ATTACKER, 3, 0, 240, 0
	loopsewithpan SE_M_PSYBEAM2, SOUND_PAN_ATTACKER, 14, 10
	createsprite gPsychoBoostOrbSpriteTemplate, ANIM_ATTACKER, 2
	delay 110
	loopsewithpan SE_M_PSYBEAM2, SOUND_PAN_ATTACKER, 7, 10
	waitforvisualfinish

	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, -32
	playsewithpan SE_M_TRI_ATTACK2, SOUND_PAN_TARGET
	delay 1
	createvisualtask AnimTask_BlendEveryBattleAnimPal, 5, 5, 2, 0, 16, RGB_WHITEALPHA
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, -16
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, 16
	waitforvisualfinish
	createvisualtask AnimTask_BlendEveryBattleAnimPal, 5, 5, 2, 16, 0, RGB_WHITEALPHA
	createvisualtask AnimTask_ShakeTargetInPattern, 2, 30, 3, TRUE, 0
	delay 2
	delay 1
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, 0xFFFF
	waitbgfadein
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end
	

Move_GASTER_BLASTER:
	goto Move_TACKLE

Move_TEATIME:
	goto Move_TACKLE

Move_COLONIZE:
	goto Move_TACKLE

Move_STUPORPOWER:
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_METEOR
	loadspritegfx ANIM_TAG_FLAT_ROCK
	loadspritegfx ANIM_TAG_AMNESIA
	monbg ANIM_ATK_PARTNER
	splitbgprio ANIM_ATTACKER
	setalpha 12, 8
	createsprite gSuperpowerOrbSpriteTemplate, ANIM_TARGET, 2, ANIM_ATTACKER
	playsewithpan SE_M_MEGA_KICK, SOUND_PAN_ATTACKER
	delay 20
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 4, 1, 180, 1
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_EARTHQUAKE, 0
	delay 40
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 200, 96, 1, 120
	delay 8
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 20, 248, 4, 112
	delay 8
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 130, 160, 2, 104
	delay 8
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 160, 192, 0, 96
	delay 8
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 60, 288, 3, 88
	delay 74
	
	createsprite gQuestionMarkSpriteTemplate, ANIM_ATTACKER, 20
	playsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER
	delay 54
	loopsewithpan SE_M_METRONOME, SOUND_PAN_ATTACKER, 16, 3
	delay 120
	createsprite gSuperpowerFireballSpriteTemplate, ANIM_TARGET, 3, ANIM_ATTACKER
	playsewithpan SE_M_SWAGGER, SOUND_PAN_ATTACKER
	delay 16
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_TARGET, 8, 0, 16, 1
	playsewithpan SE_M_MEGA_KICK2, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	delay 1
	end

	
Move_YEST:
	playsewithpan SE_M_SNORE, SOUND_PAN_ATTACKER
	loadspritegfx ANIM_TAG_THUMBS_UP
	createsprite gSleepThumbsUpSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	delay 20
	createsprite gSleepThumbsUpSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	delay 20
	createsprite gSleepThumbsUpSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	waitforvisualfinish
	end
Move_PLEDGE_OF_ALLEGIANCE:
	loadspritegfx ANIM_TAG_ALLEGIANCE
	loadspritegfx ANIM_TAG_EAGLE
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	fadetobg BG_AMERICAN_FLAG
	waitbgfadein
	
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_SKY_UPPERCUT, SOUND_PAN_ATTACKER
	createsprite gEagleSpriteTemplate, ANIM_TARGET, 2
	delay 14
	playsewithpan SE_M_SACRED_FIRE, SOUND_PAN_TARGET
	createsprite gAllegianceSpriteTemplate, ANIM_TARGET, 2, -16, 16, 24, 0, 0, 0, 0, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 6, 0, 8, 1
	delay 10
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	createsprite gAllegianceSpriteTemplate, ANIM_TARGET, 2,  16, 16, 24, 0, 0, 0, 0, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 10, 0, 12, 1
	delay 10
	playsewithpan SE_M_FLAME_WHEEL2, SOUND_PAN_TARGET
	createsprite gAllegianceSpriteTemplate, ANIM_TARGET, 2,   0, 16, 24, 0, 0, 0, 0, 1
	createvisualtask AnimTask_ShakeMon, 5, ANIM_TARGET, 12, 0, 20, 1

	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	restorebg
	waitbgfadein
	blendoff
	end
Move_PERISH_TONGUE:
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_TELEPORT, SOUND_PAN_ATTACKER, SOUND_PAN_TARGET, 2, 9, 0, 10
	call SetPsychicBackground
	createvisualtask AnimTask_PushDownAndShake, 2, ANIM_ATTACKER, 16, 8, 3, 10, 2
	createvisualtask AnimTask_PushDownAndShake, 2, ANIM_TARGET,   16, 8, 3, 10, 2
	createvisualtask AnimTask_PushDownAndShake, 2, ANIM_ATK_PARTNER, 16, 8, 3, 10, 2
	createvisualtask AnimTask_PushDownAndShake, 2, ANIM_DEF_PARTNER, 16, 8, 3, 10, 2

	waitforvisualfinish
	call UnsetPsychicBackground
	waitforvisualfinish
	end

Move_MULTISHINE:
	loadspritegfx ANIM_TAG_SHINE
	monbg ANIM_ATTACKER
	setalpha 12, 8
	loopsewithpan SE_M_SWIFT, SOUND_PAN_ATTACKER, 16, 3
	createsprite gShineSpriteTemplate, ANIM_ATTACKER, 2, 0, 6, 60
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	end
Move_REVELATION_DANCE:
	loadspritegfx ANIM_TAG_BIBLE_STUFF
	call SetSkyBg
	createvisualtask AnimTask_TeeterDanceMovement, 5
	createsprite gFlyingBibleStuffSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, -2
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	delay 24
	createsprite gFlyingBibleStuffSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -2
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	delay 24
	createsprite gFlyingBibleStuffSpriteTemplate, ANIM_ATTACKER, 2, 0, -16, -2
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	delay 24
	createsprite gFlyingBibleStuffSpriteTemplate, ANIM_ATTACKER, 2, 1, -8, -2
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	delay 24
	createsprite gFlyingBibleStuffSpriteTemplate, ANIM_ATTACKER, 2, 2, 8, -2
	playsewithpan SE_M_TEETER_DANCE, SOUND_PAN_ATTACKER
	waitforvisualfinish
	call UnsetSkyBg
	end
Move_TRICK_OR_TREAT:
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_TARGET, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, SOUND_PAN_TARGET
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	end
Move_AURORA_VEIL:
	loadspritegfx ANIM_TAG_SPARKLE_3
	loadspritegfx ANIM_TAG_GREEN_LIGHT_WALL
	setalpha 0, 16
	fadetobg BG_AURORA
	waitbgfadein
	waitplaysewithpan SE_M_REFLECT, SOUND_PAN_ATTACKER, 15
	createsprite gLightScreenWallSpriteTemplate, ANIM_ATTACKER, 1, 40, 0, ANIM_TAG_GREEN_LIGHT_WALL
	delay 10
	call SpecialScreenSparkle
	waitforvisualfinish
	restorebg
	waitbgfadein
	blendoff
	end
	

