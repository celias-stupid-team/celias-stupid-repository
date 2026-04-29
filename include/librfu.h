#ifndef GUARD_LIBRFU_H
#define GUARD_LIBRFU_H

#include "global.h"
#include "main.h"

#define LIBRFU_VERSION 1024

struct STWIStatus
{
    vs32 state;
    u8 reqLength;
    u8 reqNext;
    u8 reqActiveCommand;
    u8 ackLength;
    u8 ackNext;
    u8 ackActiveCommand;
    u8 timerSelect;
    u8 unk_b;
#if LIBRFU_VERSION >= 1026
    s32 timerState;
#else
    u32 timerState;
#endif
    vu8 timerActive;
    u8 unk_11;
    vu16 error;
    vu8 msMode;
    u8 recoveryCount;
    u8 unk_16;
    u8 unk_17;
#if __STDC_VERSION__ < 202311L
    void (*callbackM)();
#else
    void (*callbackM)(...);
#endif
    void (*callbackS)(u16);
    void (*callbackID)(void);
    union RfuPacket *txPacket;
    union RfuPacket *rxPacket;
    vu8 sending;
};

extern struct STWIStatus *gSTWIStatus;

#endif // GUARD_LIBRFU_H
