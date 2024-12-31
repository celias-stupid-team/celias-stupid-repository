#include "doom_desire.h"
#include "gba/gba.h"


// Define magic values to chainload doom
// We don't want these to randomly be in RAM on initial reset
#define DOOM_MAGIC_0  0x6D303064    // 'd00m'
#define DOOM_MAGIC_1  0x4430304d    // 'M00D'

// Magic values in RAM are initially zeroized
static EWRAM_DATA int doom_magic[2] = { 0, 0 };
extern int doom_main();


/**
 * Run DOOM if requested.
 */
void grant_desire(void)
{
    if ((doom_magic[0] == DOOM_MAGIC_0) && (doom_magic[1] == DOOM_MAGIC_1)) {
        doom_main();
        while (1);
    }
}


/**
 * Reset into DOOM, as desired.
 */
void indicate_desire(void)
{
    // we wants it
    doom_magic[0] = DOOM_MAGIC_0;
    doom_magic[1] = DOOM_MAGIC_1;

    // we must has it
    SoftReset(RESET_ALL & ~RESET_EWRAM);
}
