#ifndef GUARD_TRADE_H
#define GUARD_TRADE_H

#include "global.h"
#include "constants/trade.h"

extern struct Mail gLinkPartnerMail[6];
extern u8 gSelectedTradeMonPositions[2];

extern const u8 gText_MaleSymbol4[];
extern const u8 gText_FemaleSymbol4[];
extern const u8 gText_GenderlessSymbol[];

extern const u16 gTradeOrHatchMonShadowTilemap[];
void CB2_StartCreateTradeMenu(void);
s32 GetGameProgressForLinkTrade(void);
void CB2_ReturnToTradeMenuFromSummary(void);

#endif //GUARD_TRADE_H
