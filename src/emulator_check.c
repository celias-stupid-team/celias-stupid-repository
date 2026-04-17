#include "global.h"
#include "gflib.h"
#include "scanline_effect.h"
#include "task.h"
#include "intro.h"
#include "main.h"
#include "sound.h"
#include "emulator_check.h"
#include "constants/songs.h"

// ================================================================ //
//  Emulator accuracy detection                                     //
//                                                                  //
//  Set ACTIVE_EMU_CHECKS to any combination of the flags below.    //
//  IsInaccurateEmulator() returns TRUE if ANY enabled check fires. //
//  Set ACTIVE_EMU_CHECKS to FALSE to disable all checks.           //
// ================================================================ //

#define EMU_CHECK_REG_IMC       (1 << 0)
#define EMU_CHECK_TIMER_CASCADE (1 << 1)
#define EMU_CHECK_SOUNDCNT_H    (1 << 2)

#define ACTIVE_EMU_CHECKS       (EMU_CHECK_SOUNDCNT_H)

// Below are explanations for each check and their known results on popular emulators as of April 2026.

// === EMU_CHECK_REG_IMC ============================================== //
//                                                                      //
// Undocumented I/O mirror register 0x04000800                          //
// expected return value:           0x0D000020                          //
//                                                                      //
// works on:                                                            //
//   - real hardware                                                    //
//   - mGBA (desktop and RetroArch iOS)                                 //
//   - Lemuroid                                                         //
//                                                                      //
// fails on:                                                            //
//   - mGBA (RetroArch Android)                                         //
//   - VBA                                                              //
//   - Pizzaboy                                                         //
//   - JohnGBA                                                          //
//   - MyBoy                                                            //
//                                                                      //
// Source: GBATEK – "GBA Undocumented Hardware"                         //
//             https://problemkaputt.de/gbatek.htm#gbasystemcontrol     //
//             under 4000800h                                           //
// ==================================================================== //

// === EMU_CHECK_TIMER_CASCADE ======================================== //
//                                                                      //
// Load TM2 with 0xFFFF (one tick to overflow at F/1 prescaler) and TM3 //
// in cascade mode. On accurate emulators TM2 overflows within the      //
// first few cycles after being started, incrementing TM3 to >= 1.      //
// Inaccurate emulators with lazy batch timer updates leave TM3 at 0.   //
// TM2/TM3 are used intentionally: the m4a sound engine uses TM0/TM1    //
// for mixing, so touching TM0/TM1 here corrupts audio init on JohnGBA  //
// or MyBoy.                                                            //
//                                                                      //
// works on:                                                            //
//   - real hardware                                                    //
//   - mGBA (desktop, RetroArch iOS and Android)                        //
//   - Lemuroid                                                         //
//                                                                      //
// fails on:                                                            //
//   - VBA                                                              //
//   - Pizzaboy                                                         //
//   - JohnGBA                                                          //
//   - MyBoy                                                            //
//                                                                      //
// Source: GBATEK – "GBA Timers"                                        //
//             https://problemkaputt.de/gbatek.htm#gbatimers            //
// ==================================================================== //

// === EMU_CHECK_SOUNDCNT_H =========================================== //
//                                                                      //
// Write 0xFFFF to SOUNDCNT_H (DMA sound control register), then read   //
// back.                                                                //
// On real HW / mGBA: bits 4-7 are unused (read 0) and bits 11 and      // 
// 15 (FIFO A/B reset) are write-only (read 0), so result is 0x770F.    //
// Inaccurate emulators may return 0xFFFF (no masking) or 0x0000.       //
//                                                                      //
// works on:                                                            //
//   - real hardware                                                    //
//   - mGBA (desktop, RetroArch iOS and Android)                        //
//   - Lemuroid                                                         //
//   - VBA                                                              //
//   - Pizzaboy                                                         //
//   - JohnGBA                                                          //
//                                                                      //
// fails on:                                                            //
//   - MyBoy                                                            //
//                                                                      //
// Source: GBATEK – "GBA Sound Control Registers"                       //
//         https://problemkaputt.de/gbatek.htm#gbasoundcontrolregisters //
// ==================================================================== //

static EWRAM_DATA u8 sEmulatorCheckScreenState = 0;

static const u8  sErrorScreen_Gfx[] = INCBIN_U8( "graphics/intro/error_screen.4bpp");
static const u8  sErrorScreen_Map[] = INCBIN_U8( "graphics/intro/error_screen.bin");
static const u16 sErrorScreen_Pal[] = INCBIN_U16("graphics/intro/error_screen.gbapal");

static void VBlankCB_EmulatorCheck(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

bool32 IsInaccurateEmulator(void)
{
#if (ACTIVE_EMU_CHECKS & EMU_CHECK_REG_IMC)
    {
        vu32 *const reg_imc = (vu32 *)0x04000800;
        const u32 reg_imc_reset_value = 0x0D000020u;

        if (*reg_imc != reg_imc_reset_value)
            return TRUE;
    }
#endif
#if (ACTIVE_EMU_CHECKS & EMU_CHECK_TIMER_CASCADE)
    {
        u16 result;
        REG_TM2CNT_H = 0;                            // stop TM2
        REG_TM3CNT_H = 0;                            // stop TM3
        REG_TM2CNT_L = 0xFFFF;                       // one tick to overflow
        REG_TM3CNT_L = 0;                            // TM3 starts at 0
        REG_TM3CNT_H = TIMER_ENABLE | TIMER_COUNTUP; // TM3 counts TM2 overflows
        REG_TM2CNT_H = TIMER_ENABLE;                 // start TM2 (F/1 prescaler)

        // TM2 overflows within a few cycles; TM3 should now be >= 1
        result = REG_TM3CNT_L;

        // clean up and restore sound timers to avoid breaking m4a on some emulators
        REG_TM2CNT_H = 0;
        REG_TM3CNT_H = 0;

        if (result == 0)
            return TRUE;
    }
#endif
#if (ACTIVE_EMU_CHECKS & EMU_CHECK_SOUNDCNT_H)
    {
        u16 result;
        vu16 *const soundcnt_x = (vu16 *)0x04000084;
        vu16 *const soundcnt_h = (vu16 *)0x04000082;
        u16 savedX = *soundcnt_x;
        u16 savedH = *soundcnt_h;
        
        *soundcnt_x = 0x0080;  // enable master sound
        *soundcnt_h = 0xFFFF;
        result = *soundcnt_h;
        *soundcnt_h = savedH;
        *soundcnt_x = savedX;
        if (result != 0x770F)
            return TRUE;
    }
#endif

    return FALSE;
}

void CB2_EmulatorCheckScreen(void)
{
    switch (sEmulatorCheckScreenState)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        DmaFill16(3, 0, VRAM, VRAM_SIZE);
        DmaFill32(3, 0, OAM, OAM_SIZE);
        DmaFill16(3, 0, PLTT, PLTT_SIZE);
        ResetPaletteFade();
        // load GFX data (raw DMA, no BIOS LZ77 call – used for inaccurate emulator compatibility)
        DmaCopy16(3, sErrorScreen_Gfx, (void *)BG_CHAR_ADDR(0), sizeof(sErrorScreen_Gfx));
        DmaCopy16(3, sErrorScreen_Map, (void *)BG_SCREEN_ADDR(7), sizeof(sErrorScreen_Map));
        LoadPalette(sErrorScreen_Pal, BG_PLTT_ID(3), sizeof(sErrorScreen_Pal));
        ScanlineEffect_Stop();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        SetGpuReg(REG_OFFSET_BG0HOFS, 0);
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG0CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_16COLOR | BGCNT_SCREENBASE(7));
        EnableInterrupts(INTR_FLAG_VBLANK);
        SetVBlankCallback(VBlankCB_EmulatorCheck);
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON);
        PlayBGM(MUS_INCOMPATIBLE_EMULATOR);
        sEmulatorCheckScreenState = 1;
        break;
    case 1: // player can't exit the screen
        if (gMain.newKeysRaw != 0)
            PlaySE(SE_BOO);
        break;
    }
}
