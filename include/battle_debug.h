#ifndef GUARD_BATTLE_DEBUG_H
#define GUARD_BATTLE_DEBUG_H

void CB2_BattleDebugMenu(void);

#ifdef RELEASE
#define DEBUG_BATTLE_MENU               FALSE    // If set to TRUE, enables a debug menu to use in battles by pressing the Select button.
#else
#define DEBUG_BATTLE_MENU               TRUE    // If set to TRUE, enables a debug menu to use in battles by pressing the Select button.
#endif

#endif // GUARD_BATTLE_DEBUG_H
