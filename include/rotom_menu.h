#ifndef GUARD_ROTOM_MENU_H
#define GUARD_ROTOM_MENU_H

#include "global.h"

extern bool8 gUsingRotomMenuMove;
extern u16 gRotomMoveSlotOrBoxPos;

#define ROTOM_SLOT_POS_NONE 0xFFFF

#define SET_HIGH_BIT(num) (num | (1 << 15))

// this indicates that gRotomMoveSlotOrBoxPos is using a pair of PC box and slot indices
#define IS_HIGH_BIT_SET(num) (num & (1 << 15))

// The box is the top 8 bits (except for the high bit that indicates it's using a slot)
#define GET_ROTOM_MON_BOX(num) ((num & ~(1 << 15 | 0x00FF)) >> 8)
// The pos is the bottom 8 bits
#define GET_ROTOM_MON_POS(num) (num & 0x00FF)

void RotomStartMenu_Init(void);

#endif // GUARD_ROTOM_MENU_H