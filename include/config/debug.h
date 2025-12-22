#ifndef GUARD_CONFIG_DEBUG_H
#define GUARD_CONFIG_DEBUG_H

// Overworld Debug
#ifdef RELEASE
#define DEBUG_OVERWORLD_MENU            FALSE                // Enables an overworld debug menu to change flags, variables, giving pokemon and more, accessed by holding R and pressing START while in the overworld by default.
#define HELP_KEYS                       0x0100 | 0x0200      // Both L and R buttons for releases. Using direct values bc preproc
#else
#define DEBUG_OVERWORLD_MENU            TRUE                // Enables an overworld debug menu to change flags, variables, giving pokemon and more, accessed by holding R and pressing START while in the overworld by default.
#define HELP_KEYS                       0x0200              // Only L button so the debug menu can be used
#endif

#define DEBUG_OVERWORLD_HELD_KEYS       (R_BUTTON)          // The keys required to be held to open the debug menu.
#define DEBUG_OVERWORLD_TRIGGER_EVENT   pressedStartButton  // The event that opens the menu when holding the key(s) defined in DEBUG_OVERWORLD_HELD_KEYS.
#define DEBUG_OVERWORLD_IN_MENU         FALSE               // Replaces the overworld debug menu button combination with a start menu entry (above Pokédex)

// Memory usage logging
#define DEBUG_PRINT_HEAP_USAGE          FALSE               // activates/deactivates the DebugPrintf logging of Free() and Alloc() functions to monitor heap usage

#endif // GUARD_CONFIG_DEBUG_H