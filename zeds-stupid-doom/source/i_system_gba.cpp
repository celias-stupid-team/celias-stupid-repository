#include <stdarg.h>
#include <stdio.h>
#include <cstring>

#ifdef GBA

// ********************************************************************
// GBA save type
// ********************************************************************
// This is needed for emulators to know which save type the ROM is using.

static volatile const char save_type[10] = "SRAM_V110";

extern "C"
{
    #include "doomdef.h"
    #include "doomtype.h"
    #include "d_main.h"
    #include "d_event.h"

    #include "global_data.h"

    #include "tables.h"

    #include "gba/gba.h"
    #include "constants/rgb.h"
}

#include "i_system_e32.h"

#include "lprintf.h"

#define DISPCNT_PAGE 0x0010
#define DISPCNT_UNLOCK_HBLANK 0x0020

#define VID_PAGE1 VRAM
#define VID_PAGE2 0x600A000

#define TM_FREQ_1024 0x0003
#define TM_ENABLE 0x0080
#define TM_CASCADE 0x0004
#define TM_FREQ_1024 0x0003
#define TM_FREQ_256 0x0002


//**************************************************************************************

void I_InitScreen_e32()
{
    // TODO: Add back VBlank interrupt handler

    //Set gamepak wait states and prefetch.
    REG_WAITCNT = 0x46DA;

    REG_TM2CNT_L= 65535-1872;     // 1872 ticks = 1/35 secs
    REG_TM2CNT_H = TM_FREQ_256 | TM_ENABLE;       // we're using the 256 cycle timer

    // cascade into tm3
    REG_TM3CNT_H = TM_CASCADE | TM_ENABLE;
}

//**************************************************************************************

void I_BlitScreenBmp_e32()
{

}

//**************************************************************************************

void I_StartWServEvents_e32()
{

}

//**************************************************************************************

void I_PollWServEvents_e32()
{
    u16 down = REG_KEYINPUT ^ KEYS_MASK;
    u16 pressed = down & (_g->gbakeys ^ KEYS_MASK);
    u16 released = (down ^ KEYS_MASK) & _g->gbakeys;

    event_t ev;

    if(pressed)
    {
        ev.type = ev_keydown;

        if(pressed & DPAD_UP)
        {
            ev.data1 = KEYD_UP;
            D_PostEvent(&ev);
        }
        else if(pressed & DPAD_DOWN)
        {
            ev.data1 = KEYD_DOWN;
            D_PostEvent(&ev);
        }

        if(pressed & DPAD_LEFT)
        {
            ev.data1 = KEYD_LEFT;
            D_PostEvent(&ev);
        }
        else if(pressed & DPAD_RIGHT)
        {
            ev.data1 = KEYD_RIGHT;
            D_PostEvent(&ev);
        }

        if(pressed & SELECT_BUTTON)
        {
            ev.data1 = KEYD_SELECT;
            D_PostEvent(&ev);
        }

        if(pressed & START_BUTTON)
        {
            ev.data1 = KEYD_START;
            D_PostEvent(&ev);
        }

        if(pressed & A_BUTTON)
        {
            ev.data1 = KEYD_A;
            D_PostEvent(&ev);
        }

        if(pressed & B_BUTTON)
        {
            ev.data1 = KEYD_B;
            D_PostEvent(&ev);
        }

        if(pressed & L_BUTTON)
        {
            ev.data1 = KEYD_L;
            D_PostEvent(&ev);
        }

        if(pressed & R_BUTTON)
        {
            ev.data1 = KEYD_R;
            D_PostEvent(&ev);
        }
    }

    if(released)
    {
        ev.type = ev_keyup;

        if(released & DPAD_UP)
        {
            ev.data1 = KEYD_UP;
            D_PostEvent(&ev);
        }
        else if(released & DPAD_DOWN)
        {
            ev.data1 = KEYD_DOWN;
            D_PostEvent(&ev);
        }

        if(released & DPAD_LEFT)
        {
            ev.data1 = KEYD_LEFT;
            D_PostEvent(&ev);
        }
        else if(released & DPAD_RIGHT)
        {
            ev.data1 = KEYD_RIGHT;
            D_PostEvent(&ev);
        }

        if(released & SELECT_BUTTON)
        {
            ev.data1 = KEYD_SELECT;
            D_PostEvent(&ev);
        }

        if(released & START_BUTTON)
        {
            ev.data1 = KEYD_START;
            D_PostEvent(&ev);
        }

        if(released & A_BUTTON)
        {
            ev.data1 = KEYD_A;
            D_PostEvent(&ev);
        }

        if(released & B_BUTTON)
        {
            ev.data1 = KEYD_B;
            D_PostEvent(&ev);
        }

        if(released & L_BUTTON)
        {
            ev.data1 = KEYD_L;
            D_PostEvent(&ev);
        }

        if(released & R_BUTTON)
        {
            ev.data1 = KEYD_R;
            D_PostEvent(&ev);
        }
    }

    _g->gbakeys = down;
}

//**************************************************************************************

void I_ClearWindow_e32()
{

}

//**************************************************************************************

unsigned short* I_GetBackBuffer()
{
    if(REG_DISPCNT & DISPCNT_PAGE)
        return (unsigned short*)VID_PAGE1;

    return (unsigned short*)VID_PAGE2;
}

//**************************************************************************************

unsigned short* I_GetFrontBuffer()
{
    if(REG_DISPCNT & DISPCNT_PAGE)
        return (unsigned short*)VID_PAGE2;

    return (unsigned short*)VID_PAGE1;
}

//**************************************************************************************

void I_CreateWindow_e32()
{
    //Bit5 = unlocked vram at h-blank.
    REG_DISPCNT = DISPCNT_MODE_4 | DISPCNT_BG2_ON | DISPCNT_UNLOCK_HBLANK;

    unsigned short* bb = I_GetBackBuffer();

    memset(bb, 0, 240*160);

    I_FinishUpdate_e32(NULL, NULL, 0, 0);

    bb = I_GetBackBuffer();

    memset(bb, 0, 240*160);

    I_FinishUpdate_e32(NULL, NULL, 0, 0);

}

//**************************************************************************************

void I_CreateBackBuffer_e32()
{
    I_CreateWindow_e32();
}

//**************************************************************************************

void I_FinishUpdate_e32(const byte* srcBuffer, const byte* pallete, const unsigned int width, const unsigned int height)
{
    REG_DISPCNT ^= DISPCNT_PAGE;
}

//**************************************************************************************

void I_SetPallete_e32(const byte* pallete)
{
    unsigned short* pal_ram = (unsigned short*)0x5000000;

    for(int i = 0; i< 256; i++)
    {
        unsigned int r = *pallete++;
        unsigned int g = *pallete++;
        unsigned int b = *pallete++;

        pal_ram[i] = RGB(r >> 3, g >> 3, b >> 3);
    }
}

//**************************************************************************************

int I_GetVideoWidth_e32()
{
    return 120;
}

//**************************************************************************************

int I_GetVideoHeight_e32()
{
    return 160;
}



//**************************************************************************************

void I_ProcessKeyEvents()
{
    I_PollWServEvents_e32();
}

//**************************************************************************************

#define MAX_MESSAGE_SIZE 1024

void I_Error (const char *error, ...)
{
    char msg[MAX_MESSAGE_SIZE];

    va_list v;
    va_start(v, error);

    vsprintf(msg, error, v);

    va_end(v);

#ifdef GBA
	DebugPrintf("%s", msg);
#else
    printf("%s", msg);
#endif

    while(true)
    {
        VBlankIntrWait();
    }
}

//**************************************************************************************

void I_Quit_e32()
{

}

//**************************************************************************************

#endif
