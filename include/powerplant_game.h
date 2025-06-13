#ifndef GUARD_POWERPLANT_GAME_H
#define GUARD_POWERPLANT_GAME_H

#include "global.h"

#define TAG_POWERPLANT_BAR 0x1000
#define TAG_SCORE_METER    0x1001
#define TAG_SCORE_BACKING  0x1002

static const u8 sText_WantToQuit[] = _("Do you want to give up?");
static const u8 sText_PowerUp[] = _("Press A and B to power up\nthe engine!");


// Game state bit flags
#define FG_PAUSED       (1 << 0)
#define FG_GAME_ENDED   (1 << 1)

// Score constants
#define STARTING_SCORE                  56   // The number of points you already have when the game starts.
#define SCORE_INCREASE                  5    // The score increases by this many point everytime a correct button press occurs
#define SCORE_DECREASE                  -10  // The score decreases by this many point everytime an incorrect button press occurs
#define SCORE_MAX                       128  // The number of points required to win. Must be divisible by SCORE_AREA_WIDTH.

// Score Meter Constants
#define SCORE_AREA_WIDTH                128  // The width of the total score meter area in number of pixels.
#define SCORE_AREA_OFFSET               56   // Position of the left edge of the score area.
#define SCORE_BAR_OFFSET                ((SCORE_SECTION_WIDTH / 2) - SCORE_AREA_OFFSET) // Sets the score position in relation to SCORE_AREA_OFFSET.
#define SCORE_INTERVAL                  (SCORE_MAX / SCORE_AREA_WIDTH)
#define SCORE_SECTION_INIT_X            ((taskData.tScore / SCORE_INTERVAL) - SCORE_BAR_OFFSET)
#define SCORE_SECTION_LAST_X            ((SCORE_MAX / SCORE_INTERVAL) - SCORE_BAR_OFFSET)
#define SCORE_SECTION_Y                 132
#define SCORE_SECTION_WIDTH             8   // The width of one score meter section sprite in number of pixels.
#define NUM_SCORE_SECTIONS              (SCORE_AREA_WIDTH / SCORE_SECTION_WIDTH)
#define NUM_COLOR_INTERVALS             64
#define SCORE_CURRENT_SECTION           (taskData.tScore / SCORE_SECTION_WIDTH)
#define SCORE_COLOR_INTERVAL            (SCORE_AREA_WIDTH / NUM_COLOR_INTERVALS)
#define SCORE_THIRD_SIZE                (SCORE_AREA_WIDTH / 3)
#define SCORE_COLOR_NUM                 12   // The color position in the palette that the score meter uses.
#define SCORE_INPUT_FRAME_OFFSET        12   // button Input is accepted every x frames

// Others
#define OW_PAUSE_BEFORE_START   20 // Number of frames before the minigame starts in the overworld.
#define CHARGE_UP_COLOR_BLUE_A  0
#define CHARGE_UP_COLOR_GREEN_B 1


// Sprite sheet numbers.
enum {
    SCORE_METER,
    SCORE_METER_BACKING,
};

void Task_InitPowerplantGame(u8 taskId);

#endif // GUARD_POWERPLANT_GAME_H
