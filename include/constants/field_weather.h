#ifndef GUARD_CONSTANTS_FIELD_WEATHER_H
#define GUARD_CONSTANTS_FIELD_WEATHER_H

#define MAX_RAIN_SPRITES             24
#define NUM_CLOUD_SPRITES            3
#define NUM_FOG_HORIZONTAL_SPRITES   20
#define NUM_ASH_SPRITES              20
#define NUM_FOG_DIAGONAL_SPRITES     20
#define NUM_SANDSTORM_SPRITES        20
#define NUM_SWIRL_SANDSTORM_SPRITES  5

// Controls how the weather should be changing the screen palettes.
#define WEATHER_PAL_STATE_CHANGING_WEATHER   0
#define WEATHER_PAL_STATE_SCREEN_FADING_IN   1
#define WEATHER_PAL_STATE_SCREEN_FADING_OUT  2
#define WEATHER_PAL_STATE_IDLE               3

// Modes for FadeScreen
#define FADE_FROM_BLACK  0
#define FADE_TO_BLACK    1
#define FADE_FROM_WHITE  2
#define FADE_TO_WHITE    3

// Masks for FadeDarken
#define FADE_ALL                0xFFFFFFFF
#define FADE_SPRITES_ONLY       0xFFFF0000
#define FADE_BGS_ONLY           0x0000FFFF
#define FADE_ALL_EXC_TEXT       0xFFFFFFFE
#define FADE_ALL_EXC_UI         0xFFFFFF7E
#define FADE_UI_ONLY            0x00000081
#define FADE_DIR_DARKEN         0
#define FADE_DIR_BRIGHTEN       1

#define NUM_PSYDUCK_PAIL_STEPS 40

#endif // GUARD_CONSTANTS_FIELD_WEATHER_H
