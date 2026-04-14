#include "global.h"
#include "gflib.h"
#include "scanline_effect.h"
#include "task.h"
#include "intro.h"
#include "main.h"
#include "sound.h"
#include "emulator_check.h"
#include "constants/songs.h"

// The GBA has an undocumented Internal Memory Control register at 0x04000800.
// On real hardware and accurate emulators (e.g. mGBA) its reset value is 0x0D000020.
// Inaccurate emulators such as MyBoy or old VBA return 0x00000000 here.
#define REG_IMC             (*(vu32 *)0x04000800)
#define REG_IMC_RESET_VALUE 0x0D000020u

static EWRAM_DATA u8 sEmulatorCheckScreenState = 0;

static const u8  sErrorScreen_Gfx[] = INCBIN_U8( "graphics/intro/error_screen.4bpp.lz");
static const u8  sErrorScreen_Map[] = INCBIN_U8( "graphics/intro/error_screen.bin.lz");
static const u16 sErrorScreen_Pal[] = INCBIN_U16("graphics/intro/error_screen.gbapal");

static void VBlankCB_EmulatorCheck(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

bool32 IsInaccurateEmulator(void)
{
    return FALSE;
    //return REG_IMC != REG_IMC_RESET_VALUE;
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
        // load GFX data
        LZ77UnCompVram(sErrorScreen_Gfx, (void *)BG_CHAR_ADDR(0));
        LZ77UnCompVram(sErrorScreen_Map, (void *)BG_SCREEN_ADDR(7));
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
