#include "global.h"
#include "battle_setup.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "event_scripts.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "quest_log.h"
#include "script.h"
#include "task.h"
#include "trainer_see.h"
#include "util.h"
#include "config/overworld.h"
#include "constants/battle_setup.h"
#include "constants/event_object_movement.h"
#include "constants/event_objects.h"
#include "constants/trainer_types.h"

typedef u8 (*TrainerApproachFunc)(struct ObjectEvent *, s16, s16, s16);
typedef bool8 (*TrainerSeeFunc)(u8, struct Task *, struct ObjectEvent *);

static u8 CheckTrainer(u8 trainerObjId);
static u8 GetTrainerApproachDistance(struct ObjectEvent * trainerObj);
static u8 GetTrainerApproachDistanceSouth(struct ObjectEvent * trainerObj, s16 range, s16 x, s16 y);
static u8 GetTrainerApproachDistanceNorth(struct ObjectEvent * trainerObj, s16 range, s16 x, s16 y);
static u8 GetTrainerApproachDistanceWest(struct ObjectEvent * trainerObj, s16 range, s16 x, s16 y);
static u8 GetTrainerApproachDistanceEast(struct ObjectEvent * trainerObj, s16 range, s16 x, s16 y);
static u8 CheckPathBetweenTrainerAndPlayer(struct ObjectEvent * trainerObj, u8 approachDistance, u8 facingDirection);
static void TrainerApproachPlayer(struct ObjectEvent * trainerObj, u8 approachDistance);
static void Task_RunTrainerSeeFuncList(u8 taskId);
static bool8 TrainerSeeFunc_Dummy(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static bool8 TrainerSeeFunc_StartExclMark(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static bool8 TrainerSeeFunc_WaitExclMark(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static bool8 TrainerSeeFunc_TrainerApproach(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static bool8 TrainerSeeFunc_PrepareToEngage(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static bool8 TrainerSeeFunc_End(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static bool8 TrainerSeeFunc_BeginRemoveDisguise(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static bool8 TrainerSeeFunc_WaitRemoveDisguise(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static bool8 TrainerSeeFunc_TrainerInAshFacesPlayer(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static bool8 TrainerSeeFunc_BeginJumpOutOfAsh(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static bool8 TrainerSeeFunc_WaitJumpOutOfAsh(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static bool8 TrainerSeeFunc_EndJumpOutOfAsh(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static bool8 TrainerSeeFunc_OffscreenAboveTrainerCreateCameraObj(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static bool8 TrainerSeeFunc_OffscreenAboveTrainerCameraObjMoveUp(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static bool8 TrainerSeeFunc_OffscreenAboveTrainerCameraObjMoveDown(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj);
static void Task_DestroyTrainerApproachTask(u8 taskId);
static void SpriteCB_TrainerIcons(struct Sprite *sprite);
static void SetIconSpriteData(struct Sprite *sprite, u16 fldEffId, u8 spriteAnimNum);

// IWRAM common
COMMON_DATA struct ApproachingTrainer gApproachingTrainers[2] = {0};
COMMON_DATA u8 gNoOfApproachingTrainers = 0;
COMMON_DATA bool8 gTrainerApproachedPlayer = 0;

// EWRAM
EWRAM_DATA u8 gApproachingTrainerId = 0;

static const u16 sGfx_Emoticons[] = INCBIN_U16("graphics/misc/emoticons.4bpp");

// u8 func(struct ObjectEvent * trainerObj, s16 range, s16 x, s16 y)
// range is the maximum distance the trainer can see
// x and y are the player's coordinates
// Returns distance to walk if trainer has unobstructed view of player
// Returns 0 if trainer can't see player
static const TrainerApproachFunc sDirectionalApproachDistanceFuncs[] = {
    GetTrainerApproachDistanceSouth,
    GetTrainerApproachDistanceNorth,
    GetTrainerApproachDistanceWest,
    GetTrainerApproachDistanceEast
};

// bool8 func(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj)
// Returns TRUE to run the next func immediately
// Returns FALSE to delay the next func to the next frame
static const TrainerSeeFunc sTrainerSeeFuncList[] = {
    TrainerSeeFunc_Dummy,
    TrainerSeeFunc_StartExclMark,
    TrainerSeeFunc_WaitExclMark,
    TrainerSeeFunc_TrainerApproach,
    TrainerSeeFunc_PrepareToEngage,
    TrainerSeeFunc_End,
    TrainerSeeFunc_BeginRemoveDisguise,
    TrainerSeeFunc_WaitRemoveDisguise,
    TrainerSeeFunc_TrainerInAshFacesPlayer,
    TrainerSeeFunc_BeginJumpOutOfAsh,
    TrainerSeeFunc_WaitJumpOutOfAsh,
    TrainerSeeFunc_EndJumpOutOfAsh,
    TrainerSeeFunc_OffscreenAboveTrainerCreateCameraObj,
    TrainerSeeFunc_OffscreenAboveTrainerCameraObjMoveUp,
    TrainerSeeFunc_OffscreenAboveTrainerCameraObjMoveDown
};

static const TrainerSeeFunc sTrainerSeeFuncList2[] = {
    TrainerSeeFunc_TrainerInAshFacesPlayer,
    TrainerSeeFunc_BeginJumpOutOfAsh,
    TrainerSeeFunc_WaitJumpOutOfAsh,
    TrainerSeeFunc_EndJumpOutOfAsh
};

bool8 CheckForTrainersWantingBattle(void)
{
    u8 i;
    u8 numTrainers = 0;

    gNoOfApproachingTrainers = 0;
    gApproachingTrainerId = 0;

#if OW_FLAG_NO_TRAINER_SEE != 0
    if (FlagGet(OW_FLAG_NO_TRAINER_SEE))
        return FALSE;
#endif

    if (QL_IsTrainerSightDisabled() == TRUE)
        return FALSE;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (!gObjectEvents[i].active)
            continue;
        if (gObjectEvents[i].trainerType != TRAINER_TYPE_NORMAL && gObjectEvents[i].trainerType != TRAINER_TYPE_BURIED && !(gObjectEvents[i].trainerType >= TRAINER_TYPE_RUN_SCRIPT))
            continue;

        numTrainers = CheckTrainer(i);

        if (numTrainers == 0xFF)    //run script
            break;

        if (numTrainers == 2)
            break;

        if (numTrainers == 0)
            continue;

        if (gNoOfApproachingTrainers > 1)
            break;
    }
        
    if (numTrainers == 0xFF)
    {
        u8 objectEventId = gApproachingTrainers[gNoOfApproachingTrainers - 1].objectEventId;
        
        gSelectedObjectEvent = objectEventId;
        gSpecialVar_LastTalked = gObjectEvents[objectEventId].localId;
        ScriptContext_SetupScript(EventScript_ObjectApproachPlayer);
        LockPlayerFieldControls();
        return TRUE;
    }

    if (gNoOfApproachingTrainers == 1)
    {
        ResetTrainerOpponentIds();
        ConfigureAndSetUpOneTrainerBattle(gApproachingTrainers[gNoOfApproachingTrainers - 1].objectEventId,
                                          gApproachingTrainers[gNoOfApproachingTrainers - 1].trainerScriptPtr);
        gTrainerApproachedPlayer = TRUE;
        return TRUE;
    }
    else if (gNoOfApproachingTrainers == 2)
    {
        ResetTrainerOpponentIds();
        for (i = 0; i < gNoOfApproachingTrainers; i++, gApproachingTrainerId++)
        {
            ConfigureTwoTrainersBattle(gApproachingTrainers[i].objectEventId,
                                       gApproachingTrainers[i].trainerScriptPtr);
        }
        SetUpTwoTrainersBattle();
        gApproachingTrainerId = 0;
        gTrainerApproachedPlayer = TRUE;
        return TRUE;
    }
    else
    {
        gTrainerApproachedPlayer = FALSE;
        return FALSE;
    }
}

static u8 CheckTrainer(u8 trainerObjId)
{
    const u8 *script = GetObjectEventScriptPointerByObjectEventId(trainerObjId);
    u8 double_trainerObjId = trainerObjId + 1;
    const u8 *double_script = GetObjectEventScriptPointerByObjectEventIdAndCondition(double_trainerObjId);
    u8 approachDistance;
    u8 numTrainers = 1;
    u16 scriptFlag = GetObjectEventTrainerSightFlagByObjectEventId(trainerObjId);

    if (scriptFlag < TRAINER_TYPE_RUN_SCRIPT)
    {
        if (GetTrainerFlagFromScriptPointer(script))
            return FALSE;
    }

    approachDistance = GetTrainerApproachDistance(&gObjectEvents[trainerObjId]);
    
    if (approachDistance != 0)
    {
        if (scriptFlag >= TRAINER_TYPE_RUN_SCRIPT)
        {
            if (!FlagGet(scriptFlag) && script != NULL)
            {
                // TRAINER_TYPE_RUN_SCRIPT
                FlagSet(scriptFlag);
                numTrainers = 0xFF;
            }
            else
            {
                return FALSE;
            }
        }
        else
        {
            // no battle if regular double battle and only a single available mon in party
            if (script[1] == TRAINER_BATTLE_DOUBLE)
            {
                if (GetMonsStateToDoubles())
                    return FALSE;

                numTrainers = 2;
            }

            // no battle if double single battle and only a single available mon in party
            if (script[1] == TRAINER_BATTLE_SINGLE && gNoOfApproachingTrainers > 0)
            {
                if (GetMonsStateToDoubles())
                    return FALSE;
            }
        }

        if (gNoOfApproachingTrainers > 0)
        {
            // in case of a double single battle the double script is used
            if (double_script != NULL)
            {
                gApproachingTrainers[gNoOfApproachingTrainers].trainerScriptPtr = double_script;
                gApproachingTrainers[gNoOfApproachingTrainers].objectEventId = double_trainerObjId;
            }
            else
            {
                gApproachingTrainers[gNoOfApproachingTrainers].trainerScriptPtr = script;
                gApproachingTrainers[gNoOfApproachingTrainers].objectEventId = trainerObjId;
            }
        }
        else
        {
            gApproachingTrainers[gNoOfApproachingTrainers].objectEventId = trainerObjId;
            gApproachingTrainers[gNoOfApproachingTrainers].trainerScriptPtr = script;
        }
        gApproachingTrainers[gNoOfApproachingTrainers].approachDistance = approachDistance;
        TrainerApproachPlayer(&gObjectEvents[trainerObjId], approachDistance - 1);
        gNoOfApproachingTrainers++;

        return numTrainers;
    }

    return FALSE;
}

static u8 GetTrainerApproachDistance(struct ObjectEvent *trainerObj)
{
    s16 x, y;
    u8 i;
    u8 approachDistance;

    PlayerGetDestCoords(&x, &y);
    if (trainerObj->trainerType == TRAINER_TYPE_NORMAL || trainerObj->trainerType >= TRAINER_TYPE_RUN_SCRIPT)  // can only see in one direction
    {
        approachDistance = sDirectionalApproachDistanceFuncs[trainerObj->facingDirection - 1](trainerObj, trainerObj->trainerRange_berryTreeId, x, y);
        return CheckPathBetweenTrainerAndPlayer(trainerObj, approachDistance, trainerObj->facingDirection);
    }
    else // TRAINER_TYPE_SEE_ALL_DIRECTIONS, TRAINER_TYPE_BURIED
    {
        for (i = 0; i < 4; i++)
        {
            approachDistance = sDirectionalApproachDistanceFuncs[i](trainerObj, trainerObj->trainerRange_berryTreeId, x, y);
            if (CheckPathBetweenTrainerAndPlayer(trainerObj, approachDistance, i + 1)) // directions are 1-4 instead of 0-3. south north west east
                return approachDistance;
        }
    }

    return 0;
}

// Returns how far south the player is from trainer. 0 if out of trainer's sight.
static u8 GetTrainerApproachDistanceSouth(struct ObjectEvent *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->currentCoords.x == x
        && y > trainerObj->currentCoords.y
        && y <= trainerObj->currentCoords.y + range)
    {
        if (range > 3 && GetFirstInactiveObjectEventId() == OBJECT_EVENTS_COUNT)
            return 0;
        return (y - trainerObj->currentCoords.y);
    }
    else
        return 0;
}

// Returns how far north the player is from trainer. 0 if out of trainer's sight.
static u8 GetTrainerApproachDistanceNorth(struct ObjectEvent *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->currentCoords.x == x
        && y < trainerObj->currentCoords.y
        && y >= trainerObj->currentCoords.y - range)
        return (trainerObj->currentCoords.y - y);
    else
        return 0;
}

// Returns how far west the player is from trainer. 0 if out of trainer's sight.
static u8 GetTrainerApproachDistanceWest(struct ObjectEvent *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->currentCoords.y == y
        && x < trainerObj->currentCoords.x
        && x >= trainerObj->currentCoords.x - range)
        return (trainerObj->currentCoords.x - x);
    else
        return 0;
}

// Returns how far east the player is from trainer. 0 if out of trainer's sight.
static u8 GetTrainerApproachDistanceEast(struct ObjectEvent *trainerObj, s16 range, s16 x, s16 y)
{
    if (trainerObj->currentCoords.y == y
        && x > trainerObj->currentCoords.x
        && x <= trainerObj->currentCoords.x + range)
        return (x - trainerObj->currentCoords.x);
    else
        return 0;
}

#define COLLISION_MASK (~1)

static u8 CheckPathBetweenTrainerAndPlayer(struct ObjectEvent *trainerObj, u8 approachDistance, u8 direction)
{
    s16 x, y;
    u8 unk19_temp;
    u8 unk19b_temp;
    u8 i;
    u8 collision;

    if (approachDistance == 0)
        return 0;

    x = trainerObj->currentCoords.x;
    y = trainerObj->currentCoords.y;

    for (i = 0; i <= approachDistance - 1; i++, MoveCoords(direction, &x, &y))
    {
        collision = GetCollisionFlagsAtCoords(trainerObj, x, y, direction);
        if (collision != 0 && (collision & COLLISION_MASK))
            return 0;
    }

    // preserve mapobj_unk_19 before clearing.
    unk19_temp = trainerObj->rangeX;
    unk19b_temp = trainerObj->rangeY;
    trainerObj->rangeX = 0;
    trainerObj->rangeY = 0;

    collision = GetCollisionAtCoords(trainerObj, x, y, direction);

    trainerObj->rangeX = unk19_temp;
    trainerObj->rangeY = unk19b_temp;
    if (collision == 4)
        return approachDistance;

    return 0;
}

#define tFuncId               data[0]
#define tTrainerObjHi         data[1]
#define tTrainerObjLo         data[2]
#define tTrainerRange         data[3]
#define tOutOfAshSpriteId     data[4]
#define tData5                data[5]
#define tTrainerObjectEventId data[7]

#define TaskGetTrainerObj(dest, task) do { \
    (dest) = (struct ObjectEvent *)(((task)->tTrainerObjHi << 16) | ((u16)(task)->tTrainerObjLo)); \
} while (0)

static void TrainerApproachPlayer(struct ObjectEvent * trainerObj, u8 approachDistance)
{
    struct Task *task;// = &gTasks[gApproachingTrainers[gNoOfApproachingTrainers].taskId];

    gApproachingTrainers[gNoOfApproachingTrainers].taskId = CreateTask(Task_RunTrainerSeeFuncList, 80);
    task = &gTasks[gApproachingTrainers[gNoOfApproachingTrainers].taskId];

    task->tTrainerObjHi = ((uintptr_t)trainerObj) >> 16;
    task->tTrainerObjLo = (uintptr_t)trainerObj;
    task->tTrainerRange = approachDistance;
    task->tTrainerObjectEventId = gApproachingTrainers[gNoOfApproachingTrainers].objectEventId;
}

static void StartTrainerApproachWithFollowupTask(TaskFunc taskFunc)
{
    u8 taskId;

    if (gApproachingTrainerId == 0)
        taskId = gApproachingTrainers[0].taskId;
    else
        taskId = gApproachingTrainers[1].taskId;

    // u8 taskId = FindTaskIdByFunc(Task_RunTrainerSeeFuncList);
    SetTaskFuncWithFollowupFunc(taskId, Task_RunTrainerSeeFuncList, taskFunc);
    gTasks[taskId].tFuncId = 1;
    Task_RunTrainerSeeFuncList(taskId);
}

static void Task_RunTrainerSeeFuncList(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    struct ObjectEvent * trainerObj;// = &gObjectEvents[task->tTrainerObjectEventId];
    TaskGetTrainerObj(trainerObj, task);

    if (!trainerObj->active)
    {
        SwitchTaskToFollowupFunc(taskId);
    }
    else
    {
        while (sTrainerSeeFuncList[task->tFuncId](taskId, task, trainerObj))
            ;
    }
}

// TrainerSeeFuncs

static bool8 TrainerSeeFunc_Dummy(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj)
{
    return FALSE;
}

static bool8 TrainerSeeFunc_StartExclMark(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj)
{
    u8 direction;
    // FRLG introduces trainers who can see the player from offscreen above.
    // Handle this case here.
    if (trainerObj->facingDirection == DIR_SOUTH && task->tTrainerRange > 2)
    {
        task->tFuncId = 12;
    }
    else
    {
        ObjectEventGetLocalIdAndMap(trainerObj, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
        FieldEffectStart(FLDEFF_EXCLAMATION_MARK_ICON);
        direction = GetFaceDirectionMovementAction(trainerObj->facingDirection);
        ObjectEventSetHeldMovement(trainerObj, direction);
        task->tFuncId++;
    }
    return TRUE;
}

static bool8 TrainerSeeFunc_WaitExclMark(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj)
{
    if (FieldEffectActiveListContains(FLDEFF_EXCLAMATION_MARK_ICON))
    {
        return FALSE;
    }
    else
    {
        task->tFuncId++;
        if (trainerObj->movementType == MOVEMENT_TYPE_TREE_DISGUISE || trainerObj->movementType == MOVEMENT_TYPE_MOUNTAIN_DISGUISE)
            task->tFuncId = 6;
        if (trainerObj->movementType == MOVEMENT_TYPE_BURIED)
            task->tFuncId = 8;
        return TRUE;
    }
}

static bool8 TrainerSeeFunc_TrainerApproach(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj)
{
    if (!ObjectEventIsMovementOverridden(trainerObj) || ObjectEventClearHeldMovementIfFinished(trainerObj))
    {
        if (task->tTrainerRange)
        {
            ObjectEventSetHeldMovement(trainerObj, GetWalkNormalMovementAction(trainerObj->facingDirection));
            task->tTrainerRange--;
        }
        else
        {
            ObjectEventSetHeldMovement(trainerObj, MOVEMENT_ACTION_FACE_PLAYER);
            task->tFuncId++;
        }
    }
    return FALSE;
}

static bool8 TrainerSeeFunc_PrepareToEngage(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj)
{
    struct ObjectEvent *playerObj;

    if (ObjectEventIsMovementOverridden(trainerObj) && !ObjectEventClearHeldMovementIfFinished(trainerObj))
        return FALSE;

    SetTrainerMovementType(trainerObj, GetTrainerFacingDirectionMovementType(trainerObj->facingDirection));
    OverrideMovementTypeForObjectEvent(trainerObj, GetTrainerFacingDirectionMovementType(trainerObj->facingDirection));
    OverrideTemplateCoordsForObjectEvent(trainerObj);

    playerObj = &gObjectEvents[gPlayerAvatar.objectEventId];
    if (ObjectEventIsMovementOverridden(playerObj) && !ObjectEventClearHeldMovementIfFinished(playerObj))
        return FALSE;

    CancelPlayerForcedMovement();
    // Uncomment to have player turn to face their opponent
    ObjectEventSetHeldMovement(&gObjectEvents[gPlayerAvatar.objectEventId], GetFaceDirectionMovementAction(GetOppositeDirection(trainerObj->facingDirection)));
    task->tFuncId++;
    return FALSE;
}

static bool8 TrainerSeeFunc_End(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj)
{
    struct ObjectEvent *playerObj = &gObjectEvents[gPlayerAvatar.objectEventId];

    if (!ObjectEventIsMovementOverridden(playerObj)
        || ObjectEventClearHeldMovementIfFinished(playerObj))
        SwitchTaskToFollowupFunc(taskId); // This ends the trainer walk routine.
    return FALSE;
}

// Jumps here if disguised. Not used in FRLG.
static bool8 TrainerSeeFunc_BeginRemoveDisguise(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj)
{
    if (!ObjectEventIsMovementOverridden(trainerObj)
     || ObjectEventClearHeldMovementIfFinished(trainerObj))
    {
        ObjectEventSetHeldMovement(trainerObj, MOVEMENT_ACTION_REVEAL_TRAINER);
        task->tFuncId++;
    }
    return FALSE;
}

static bool8 TrainerSeeFunc_WaitRemoveDisguise(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj)
{
    if (ObjectEventClearHeldMovementIfFinished(trainerObj))
        task->tFuncId = 3;

    return FALSE;
}

// Jump here if buried in ash. Not used in FRLG.
static bool8 TrainerSeeFunc_TrainerInAshFacesPlayer(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj)
{
    if (!ObjectEventIsMovementOverridden(trainerObj)
        || ObjectEventClearHeldMovementIfFinished(trainerObj))
    {
        ObjectEventSetHeldMovement(trainerObj, MOVEMENT_ACTION_FACE_PLAYER);
        task->tFuncId++;
    }
    return FALSE;
}

static bool8 TrainerSeeFunc_BeginJumpOutOfAsh(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj)
{
    if (ObjectEventCheckHeldMovementStatus(trainerObj))
    {
        gFieldEffectArguments[0] = trainerObj->currentCoords.x;
        gFieldEffectArguments[1] = trainerObj->currentCoords.y;
        gFieldEffectArguments[2] = gSprites[trainerObj->spriteId].subpriority - 1;
        gFieldEffectArguments[3] = 2;
        task->tOutOfAshSpriteId = FieldEffectStart(FLDEFF_POP_OUT_OF_ASH);
        task->tFuncId++;
    }
    return FALSE;
}

static bool8 TrainerSeeFunc_WaitJumpOutOfAsh(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj)
{
    struct Sprite *sprite;

    if (gSprites[task->tOutOfAshSpriteId].animCmdIndex == 2)
    {
        trainerObj->fixedPriority = FALSE;
        trainerObj->triggerGroundEffectsOnMove = TRUE;

        sprite = &gSprites[trainerObj->spriteId];
        sprite->oam.priority = 2;
        ObjectEventClearHeldMovementIfFinished(trainerObj);
        ObjectEventSetHeldMovement(trainerObj, GetJumpInPlaceMovementAction(trainerObj->facingDirection));
        task->tFuncId++;
    }

    return FALSE;
}

static bool8 TrainerSeeFunc_EndJumpOutOfAsh(u8 taskId, struct Task *task, struct ObjectEvent *trainerObj)
{
    if (!FieldEffectActiveListContains(FLDEFF_POP_OUT_OF_ASH))
        task->tFuncId = 3;

    return FALSE;
}

// FRLG exclusive: Scroll the camera up to reveal an offscreen above trainer
static bool8 TrainerSeeFunc_OffscreenAboveTrainerCreateCameraObj(u8 taskId, struct Task *task, struct ObjectEvent *trainerObj)
{
    int specialObjectId;
    task->tData5 = 0;
    specialObjectId = SpawnSpecialObjectEventParameterized(OBJ_EVENT_GFX_YOUNGSTER, 7, LOCALID_CAMERA, gSaveBlock1Ptr->pos.x + 7, gSaveBlock1Ptr->pos.y + 7, 3);
    gObjectEvents[specialObjectId].invisible = TRUE;
    CameraObjectSetFollowedObjectId(gObjectEvents[specialObjectId].spriteId);
    task->tFuncId++;
    return FALSE;
}

static bool8 TrainerSeeFunc_OffscreenAboveTrainerCameraObjMoveUp(u8 taskId, struct Task *task, struct ObjectEvent *trainerObj)
{
    u8 specialObjectId;
    TryGetObjectEventIdByLocalIdAndMap(LOCALID_CAMERA, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &specialObjectId);

    if (ObjectEventIsMovementOverridden(&gObjectEvents[specialObjectId]) && !ObjectEventClearHeldMovementIfFinished(&gObjectEvents[specialObjectId]))
        return FALSE;

    if (task->tData5 != task->tTrainerRange - 1)
    {
        ObjectEventSetHeldMovement(&gObjectEvents[specialObjectId], GetWalkFastMovementAction(DIR_NORTH));
        task->tData5++;
    }
    else
    {
        ObjectEventGetLocalIdAndMap(trainerObj, (u8 *)&gFieldEffectArguments[0], (u8 *)&gFieldEffectArguments[1], (u8 *)&gFieldEffectArguments[2]);
        FieldEffectStart(FLDEFF_EXCLAMATION_MARK_ICON);
        task->tData5 = 0;
        task->tFuncId++;
    }
    return FALSE;
}

static bool8 TrainerSeeFunc_OffscreenAboveTrainerCameraObjMoveDown(u8 taskId, struct Task *task, struct ObjectEvent * trainerObj)
{
    u8 specialObjectId;
    TryGetObjectEventIdByLocalIdAndMap(LOCALID_CAMERA, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &specialObjectId);

    if (FieldEffectActiveListContains(FLDEFF_EXCLAMATION_MARK_ICON))
        return FALSE;

    if (ObjectEventIsMovementOverridden(&gObjectEvents[specialObjectId]) && !ObjectEventClearHeldMovementIfFinished(&gObjectEvents[specialObjectId]))
        return FALSE;

    if (task->tData5 != task->tTrainerRange - 1)
    {
        ObjectEventSetHeldMovement(&gObjectEvents[specialObjectId], GetWalkFastMovementAction(DIR_SOUTH));
        task->tData5++;
    }
    else
    {
        CameraObjectSetFollowedObjectId(GetPlayerAvatarObjectId());
        RemoveObjectEventByLocalIdAndMap(LOCALID_CAMERA, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
        task->tData5 = 0;
        task->tFuncId = 2;
    }
    return FALSE;
}

#undef tData5
#undef tOutOfAshSpriteId
#undef tTrainerRange
#undef tTrainerObjLo
#undef tTrainerObjHi
#undef tFuncId

static void Task_RevealTrainer_RunTrainerSeeFuncList(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    struct ObjectEvent * trainerObj;

    // another objEvent loaded into by loadword?
    LoadWordFromTwoHalfwords((u16 *)&task->data[1], (u32 *)&trainerObj);
    if (!task->data[7])
    {
        ObjectEventClearHeldMovement(trainerObj);
        task->data[7]++;
    }
    sTrainerSeeFuncList2[task->data[0]](taskId, task, trainerObj);
    if (task->data[0] == 3 && !FieldEffectActiveListContains(FLDEFF_POP_OUT_OF_ASH))
    {
        SetTrainerMovementType(trainerObj, GetTrainerFacingDirectionMovementType(trainerObj->facingDirection));
        OverrideMovementTypeForObjectEvent(trainerObj, GetTrainerFacingDirectionMovementType(trainerObj->facingDirection));
        DestroyTask(taskId);
    }
    else
    {
        trainerObj->heldMovementFinished = FALSE;
    }
}

void MovementAction_RevealTrainer_RunTrainerSeeFuncList(struct ObjectEvent *var)
{
    StoreWordInTwoHalfwords((u16 *)&gTasks[CreateTask(Task_RevealTrainer_RunTrainerSeeFuncList, 0)].data[1], (u32)var);
}

void DoTrainerApproach(void)
{
    StartTrainerApproachWithFollowupTask(Task_DestroyTrainerApproachTask);
}

static void Task_DestroyTrainerApproachTask(u8 taskId)
{
    DestroyTask(taskId);
    ScriptContext_Enable();
}

void TryPrepareSecondApproachingTrainer(void)
{
    if (gNoOfApproachingTrainers == 2)
    {
        if (gApproachingTrainerId == 0)
        {
            gApproachingTrainerId++;
            gSpecialVar_Result = TRUE;
            UnfreezeObjectEvents();
            FreezeObjectEventsExceptOne(gApproachingTrainers[1].objectEventId);
        }
        else
        {
            gApproachingTrainerId = 0;
            gSpecialVar_Result = FALSE;
        }
    }
    else
    {
        gSpecialVar_Result = FALSE;
    }
}

// Trainer See Excl Mark Field Effect

#define sLocalId    data[0]
#define sMapNum     data[1]
#define sMapGroup   data[2]
#define sData3      data[3]
#define sData4      data[4]
#define sFldEffId   data[7]

static const struct OamData sOamData_Emoticons = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const struct SpriteFrameImage sSpriteImages_Emoticons[] = {
    {sGfx_Emoticons + 0x000, 0x80},
    {sGfx_Emoticons + 0x040, 0x80},
    {sGfx_Emoticons + 0x080, 0x80},

    {sGfx_Emoticons + 0x180, 0x80},
    {sGfx_Emoticons + 0x1C0, 0x80},
    {sGfx_Emoticons + 0x200, 0x80},

    {sGfx_Emoticons + 0x0C0, 0x80},
    {sGfx_Emoticons + 0x100, 0x80},
    {sGfx_Emoticons + 0x140, 0x80},

    {sGfx_Emoticons + 0x240, 0x80},
    {sGfx_Emoticons + 0x280, 0x80},
    {sGfx_Emoticons + 0x2C0, 0x80},

    {sGfx_Emoticons + 0x300, 0x80},
    {sGfx_Emoticons + 0x340, 0x80},
    {sGfx_Emoticons + 0x380, 0x80},

    {sGfx_Emoticons + 0x3C0, 0x80},
    {sGfx_Emoticons + 0x400, 0x80},
    {sGfx_Emoticons + 0x440, 0x80},
};

static const union AnimCmd sAnimCmd_ExclamationMark1[] = {
    ANIMCMD_FRAME( 0,  4),
    ANIMCMD_FRAME( 1,  4),
    ANIMCMD_FRAME( 2, 52),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_DoubleExclMark[] = {
    ANIMCMD_FRAME( 6,  4),
    ANIMCMD_FRAME( 7,  4),
    ANIMCMD_FRAME( 8, 52),
    ANIMCMD_END
};


static const union AnimCmd sAnimCmd_X[] = {
    ANIMCMD_FRAME( 3,  4),
    ANIMCMD_FRAME( 4,  4),
    ANIMCMD_FRAME( 5, 52),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_SmileyFace[] = {
    ANIMCMD_FRAME( 9,  4),
    ANIMCMD_FRAME(10,  4),
    ANIMCMD_FRAME(11, 52),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_QuestionMark[] = {
    ANIMCMD_FRAME(12,  4),
    ANIMCMD_FRAME(13,  4),
    ANIMCMD_FRAME(14, 52),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_Loss[] = {
    ANIMCMD_FRAME( 15,  4),
    ANIMCMD_FRAME( 16,  4),
    ANIMCMD_FRAME( 17, 52),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_Emoticons[] = {
    sAnimCmd_ExclamationMark1,
    sAnimCmd_DoubleExclMark,
    sAnimCmd_X,
    sAnimCmd_SmileyFace,
    sAnimCmd_QuestionMark,
    sAnimCmd_Loss,
};

#define OBJ_EVENT_PAL_TAG_PLAYER_RED_NPC 0x111C

static const struct SpriteTemplate sSpriteTemplate_Emoticons = {
    .tileTag = 0xFFFF,
    .paletteTag = OBJ_EVENT_PAL_TAG_PLAYER_RED_NPC,
    .oam = &sOamData_Emoticons,
    .anims = sSpriteAnimTable_Emoticons,
    .images = sSpriteImages_Emoticons,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_TrainerIcons
};

u8 FldEff_ExclamationMarkIcon1(void)
{
    u8 spriteId = CreateSpriteAtEnd(&sSpriteTemplate_Emoticons, 0, 0, 0x53);

    if (spriteId != MAX_SPRITES)
    {
        SetIconSpriteData(&gSprites[spriteId], FLDEFF_EXCLAMATION_MARK_ICON, 0);
        UpdateSpritePaletteByTemplate(&sSpriteTemplate_Emoticons, &gSprites[spriteId]);
    }

    return 0;
}

u8 FldEff_DoubleExclMarkIcon(void)
{
    u8 spriteId = CreateSpriteAtEnd(&sSpriteTemplate_Emoticons, 0, 0, 0x52);

    if (spriteId != MAX_SPRITES)
    {
        SetIconSpriteData(&gSprites[spriteId], FLDEFF_DOUBLE_EXCL_MARK_ICON, 1);
        UpdateSpritePaletteByTemplate(&sSpriteTemplate_Emoticons, &gSprites[spriteId]);
    }

    return 0;
}

u8 FldEff_Loss(void)
{
    u8 spriteId = CreateSpriteAtEnd(&sSpriteTemplate_Emoticons, 0, 0, 0x52);

    if (spriteId != MAX_SPRITES)
    {
        SetIconSpriteData(&gSprites[spriteId], FLDEFF_LOSS, 5);
        UpdateSpritePaletteByTemplate(&sSpriteTemplate_Emoticons, &gSprites[spriteId]);
    }

    return 0;
}

u8 FldEff_XIcon(void)
{
    u8 spriteId = CreateSpriteAtEnd(&sSpriteTemplate_Emoticons, 0, 0, 0x52);

    if (spriteId != MAX_SPRITES)
    {
        SetIconSpriteData(&gSprites[spriteId], FLDEFF_X_ICON, 2);
        UpdateSpritePaletteByTemplate(&sSpriteTemplate_Emoticons, &gSprites[spriteId]);
    }

    return 0;
}

u8 FldEff_SmileyFaceIcon(void)
{
    u8 spriteId = CreateSpriteAtEnd(&sSpriteTemplate_Emoticons, 0, 0, 0x52);

    if (spriteId != MAX_SPRITES)
    {
        SetIconSpriteData(&gSprites[spriteId], FLDEFF_SMILEY_FACE_ICON, 3);
        UpdateSpritePaletteByTemplate(&sSpriteTemplate_Emoticons, &gSprites[spriteId]);
    }

    return 0;
}

u8 FldEff_QuestionMarkIcon(void)
{
    u8 spriteId = CreateSpriteAtEnd(&sSpriteTemplate_Emoticons, 0, 0, 0x52);

    if (spriteId != MAX_SPRITES)
    {
        SetIconSpriteData(&gSprites[spriteId], FLDEFF_QUESTION_MARK_ICON, 4);
        UpdateSpritePaletteByTemplate(&sSpriteTemplate_Emoticons, &gSprites[spriteId]);
    }

    return 0;
}

static void SetIconSpriteData(struct Sprite *sprite, u16 fldEffId, u8 spriteAnimNum)
{
    sprite->oam.priority = 1;
    sprite->coordOffsetEnabled = 1;

    sprite->sLocalId = gFieldEffectArguments[0];
    sprite->sMapNum = gFieldEffectArguments[1];
    sprite->sMapGroup = gFieldEffectArguments[2];
    sprite->sData3 = -5;
    sprite->sFldEffId = fldEffId;

    StartSpriteAnim(sprite, spriteAnimNum);
}

static void SpriteCB_TrainerIcons(struct Sprite *sprite)
{
    u8 objEventId;

    if (TryGetObjectEventIdByLocalIdAndMap(sprite->sLocalId, sprite->sMapNum, sprite->sMapGroup, &objEventId)
        || sprite->animEnded)
    {
        FieldEffectStop(sprite, sprite->sFldEffId);
    }
    else
    {
        struct Sprite *objEventSprite = &gSprites[gObjectEvents[objEventId].spriteId];
        sprite->sData4 += sprite->sData3;
        sprite->x = objEventSprite->x;
        sprite->y = objEventSprite->y - 16;
        sprite->x2 = objEventSprite->x2;
        sprite->y2 = objEventSprite->y2 + sprite->sData4;
        if (sprite->sData4)
            sprite->sData3++;
        else
            sprite->sData3 = 0;
    }
}

#undef sLocalId
#undef sMapNum
#undef sMapGroup
#undef sData3
#undef sData4
#undef sFldEffId

u8 GetCurrentApproachingTrainerObjectEventId(void)
{
    if (gApproachingTrainerId == 0)
        return gApproachingTrainers[0].objectEventId;
    else
        return gApproachingTrainers[1].objectEventId;
}

u8 GetChosenApproachingTrainerObjectEventId(u8 arrayId)
{
    if (arrayId >= ARRAY_COUNT(gApproachingTrainers))
        return 0;
    else if (arrayId == 0)
        return gApproachingTrainers[0].objectEventId;
    else
        return gApproachingTrainers[1].objectEventId;
}
