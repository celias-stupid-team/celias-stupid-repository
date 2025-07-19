#ifndef GUARD_TRAINER_SEE_H
#define GUARD_TRAINER_SEE_H

#include "global.h"

struct ApproachingTrainer
{
    u8 objectEventId;
    u8 approachDistance; // plus 1
    const u8 *trainerScriptPtr;
    u8 taskId;
};

extern struct ApproachingTrainer gApproachingTrainers[2];
extern u8 gNoOfApproachingTrainers;
extern bool8 gTrainerApproachedPlayer;
extern u8 gApproachingTrainerId;

bool8 CheckForTrainersWantingBattle(void);
void TryPrepareSecondApproachingTrainer(void);
void MovementAction_RevealTrainer_RunTrainerSeeFuncList(struct ObjectEvent *var);
u8 FldEff_ExclamationMarkIcon1(void);
u8 FldEff_DoubleExclMarkIcon(void);
u8 FldEff_Loss(void);
u8 FldEff_XIcon(void);
u8 FldEff_SmileyFaceIcon(void);
u8 FldEff_QuestionMarkIcon(void);
u8 GetCurrentApproachingTrainerObjectEventId(void);
u8 GetChosenApproachingTrainerObjectEventId(u8 arrayId);

#endif //GUARD_TRAINER_SEE_H
