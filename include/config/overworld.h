#ifndef GUARD_CONFIG_OVERWORLD_H
#define GUARD_CONFIG_OVERWORLD_H

// Overworld flags
// To use the following features in scripting, replace the 0s with the flag ID you're assigning it to.
// Eg: Replace with FLAG_UNUSED_0x264 so you can use that flag to toggle the feature.
#define OW_FLAG_NO_ENCOUNTER            FLAG_CSR_DEBUG_NO_ENCOUNTER     // If this flag is set, wild encounters will be disabled.
#define OW_FLAG_NO_TRAINER_SEE          FLAG_CSR_DEBUG_NO_TRAINER_SEE   // If this flag is set, trainers will not battle the player unless they're talked to.
#define OW_FLAG_NO_COLLISION            FLAG_CSR_DEBUG_NO_COLLISION     // If this flag is set, the player will be able to walk over tiles with collision. Mainly intended for debugging purposes.
#define OW_FLAG_DISABLE_QUEST_LOG       FLAG_CSR_DEBUG_NO_QUEST_LOG     // If this flag is set, the quest log will never appear

#endif // GUARD_CONFIG_OVERWORLD_H
