#include "global.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "field_camera.h"
#include "field_screen_effect.h"
#include "field_specials.h"
#include "fieldmap.h"
#include "main.h"
#include "overworld.h"
#include "palette.h"
#include "script.h"
#include "script_movement.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "constants/event_objects.h"
#include "constants/event_object_movement.h"
#include "constants/event_objects.h"
#include "field_special_scene.h"

#include "constants/songs.h"
#include "constants/metatile_labels.h"

// Most of the boxes in the moving truck are map tiles, with the
// exception of three boxes that are map events that jostle around
// while the truck is driving. In addition, their sprite's placement
// is slightly offset to make them look less perfectly stacked.
// Box 1 (LOCALID_TRUCK_BOX_TOP)
#define BOX1_X_OFFSET  3
#define BOX1_Y_OFFSET  3
// Box 2 (LOCALID_TRUCK_BOX_BOTTOM_L)
#define BOX2_X_OFFSET  0
#define BOX2_Y_OFFSET -3
// Box 3 (LOCALID_TRUCK_BOX_BOTTOM_R)
#define BOX3_X_OFFSET -3
#define BOX3_Y_OFFSET  0

static const s8 sTruckCamera_HorizontalTable[] = {0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, -1, -1, -1, 0};

static void Task_Truck3(u8);

static s16 GetTruckCameraBobbingY(int time)
{
    if (!(time % 120))
        return -1;
    else if ((time % 10) <= 4)
        return 1;

    return 0;
}

// Determines the frequency that the truck boxes bounce at.
// The return value of this function is multiplied and added
// to the boxes resting y offset, the result of which is that
// when it returns 0 they remain vertically still and when it
// returns -1 they jump upward.
// Box 1 has 30 added to the time so it jumps earlier, and
// box 2 has the return value multiplied by less, so it doesn't
// jump as high.
static s16 GetTruckBoxYMovement(int time)
{
    if (!((time + 120) % 180))
        return -1;

    return 0;
}

#define tTimer data[0]

static void Task_Truck1(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s16 cameraXpan = 0, cameraYpan = 0;
    s16 yBox1, yBox2, yBox3;

    yBox1 = GetTruckBoxYMovement(tTimer + 30) * 4;
    SetObjectEventSpritePosByLocalIdAndMap(LOCALID_TRUCK_BOX_TOP,      gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, BOX1_X_OFFSET - cameraXpan, BOX1_Y_OFFSET + yBox1);
    yBox2 = GetTruckBoxYMovement(tTimer) * 2;
    SetObjectEventSpritePosByLocalIdAndMap(LOCALID_TRUCK_BOX_BOTTOM_L, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, BOX2_X_OFFSET - cameraXpan, BOX2_Y_OFFSET + yBox2);
    yBox3 = GetTruckBoxYMovement(tTimer) * 4;
    SetObjectEventSpritePosByLocalIdAndMap(LOCALID_TRUCK_BOX_BOTTOM_R, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, BOX3_X_OFFSET - cameraXpan, BOX3_Y_OFFSET + yBox3);

    // Arbitrary timer limit that won't be reached
    if (++tTimer == 30000)
        tTimer = 0;

    cameraYpan = GetTruckCameraBobbingY(tTimer);
    SetCameraPanning(cameraXpan, cameraYpan);
}

#undef tTimer

#define tTimerHorizontal data[0]
#define tMoveStep        data[1]
#define tTimerVertical   data[2]

static void Task_Truck2(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s16 cameraYpan, cameraXpan;
    s16 yBox1, yBox2, yBox3;

    tTimerHorizontal++;
    tTimerVertical++;

    if (tTimerHorizontal > 5)
    {
        tTimerHorizontal = 0;
        tMoveStep++;
    }
    if ((u16)tMoveStep == ARRAY_COUNT(sTruckCamera_HorizontalTable))
    {
        // Never reached, the task function is changed below before finishing the table
        DestroyTask(taskId);
    }
    else
    {
        if (sTruckCamera_HorizontalTable[tMoveStep] == 2)
            gTasks[taskId].func = Task_Truck3;

        cameraXpan = sTruckCamera_HorizontalTable[tMoveStep];
        cameraYpan = GetTruckCameraBobbingY(tTimerVertical);
        SetCameraPanning(cameraXpan, cameraYpan);
        yBox1 = GetTruckBoxYMovement(tTimerVertical + 30) * 4;
        SetObjectEventSpritePosByLocalIdAndMap(LOCALID_TRUCK_BOX_TOP,      gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, BOX1_X_OFFSET - cameraXpan, BOX1_Y_OFFSET + yBox1);
        yBox2 = GetTruckBoxYMovement(tTimerVertical) * 2;
        SetObjectEventSpritePosByLocalIdAndMap(LOCALID_TRUCK_BOX_BOTTOM_L, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, BOX2_X_OFFSET - cameraXpan, BOX2_Y_OFFSET + yBox2);
        yBox3 = GetTruckBoxYMovement(tTimerVertical) * 4;
        SetObjectEventSpritePosByLocalIdAndMap(LOCALID_TRUCK_BOX_BOTTOM_R, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, BOX3_X_OFFSET - cameraXpan, BOX3_Y_OFFSET + yBox3);
    }
}

static void Task_Truck3(u8 taskId)
{
   s16 *data = gTasks[taskId].data;
   s16 cameraXpan, cameraYpan;

   tTimerHorizontal++;

   if (tTimerHorizontal > 5)
   {
       tTimerHorizontal = 0;
       tMoveStep++;
   }

   if ((u16)tMoveStep == ARRAY_COUNT(sTruckCamera_HorizontalTable))
   {
       DestroyTask(taskId);
   }
   else
   {
       cameraXpan = sTruckCamera_HorizontalTable[tMoveStep];
       cameraYpan = 0;
       SetCameraPanning(cameraXpan, cameraYpan);
       SetObjectEventSpritePosByLocalIdAndMap(LOCALID_TRUCK_BOX_TOP,      gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, BOX1_X_OFFSET - cameraXpan, BOX1_Y_OFFSET + cameraYpan);
       SetObjectEventSpritePosByLocalIdAndMap(LOCALID_TRUCK_BOX_BOTTOM_L, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, BOX2_X_OFFSET - cameraXpan, BOX2_Y_OFFSET + cameraYpan);
       SetObjectEventSpritePosByLocalIdAndMap(LOCALID_TRUCK_BOX_BOTTOM_R, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, BOX3_X_OFFSET - cameraXpan, BOX3_Y_OFFSET + cameraYpan);
   }
}

#undef tTimerHorizontal
#undef tMoveStep
#undef tTimerVertical

#define tState   data[0]
#define tTimer   data[1]
#define tTaskId1 data[2]
#define tTaskId2 data[3]

static void Task_HandleTruckSequence(u8 taskId)
{
   s16 *data = gTasks[taskId].data;

    switch (tState)
    {
    case 0:
        tTimer++;
        if (tTimer == 90)
        {
            SetCameraPanningCallback(NULL);
            tTimer = 0;
            tTaskId1 = CreateTask(Task_Truck1, 0xA);
            tState = 1;
            PlaySE(SE_TRUCK_MOVE);
        }
        break;
    case 1:
        tTimer++;
        if (tTimer == 150)
        {
            FadeInFromBlack();
            tTimer = 0;
            tState = 2;
        }
        break;
    case 2:
        tTimer++;
        if (!gPaletteFade.active && tTimer > 300)
        {
            tTimer = 0;
            DestroyTask(tTaskId1);
            tTaskId2 = CreateTask(Task_Truck2, 0xA);
            tState = 3;
            PlaySE(SE_TRUCK_STOP);
        }
        break;
    case 3:
        if (!gTasks[tTaskId2].isActive)
        {
            // Task_Truck2 / Task_Truck3 has finished
            InstallCameraPanAheadCallback();
            tTimer = 0;
            tState = 4;
        }
        break;
    case 4:
        tTimer++;
        if (tTimer == 90)
        {
            PlaySE(SE_TRUCK_UNLOAD);
            tTimer = 0;
            tState = 5;
        }
        break;
    case 5:
        tTimer++;
        if (tTimer == 120)
        {
            MapGridSetMetatileIdAt(4 + MAP_OFFSET, 1 + MAP_OFFSET, METATILE_InsideOfTruck_ExitLight_Top);
            MapGridSetMetatileIdAt(4 + MAP_OFFSET, 2 + MAP_OFFSET, METATILE_InsideOfTruck_ExitLight_Mid);
            MapGridSetMetatileIdAt(4 + MAP_OFFSET, 3 + MAP_OFFSET, METATILE_InsideOfTruck_ExitLight_Bottom);
            DrawWholeMapView();
            PlaySE(SE_TRUCK_DOOR);
            DestroyTask(taskId);
            UnlockPlayerFieldControls();
        }
        break;
    }
}

void ExecuteTruckSequence(void)
{
    MapGridSetMetatileIdAt(4 + MAP_OFFSET, 1 + MAP_OFFSET, METATILE_InsideOfTruck_DoorClosedFloor_Top);
    MapGridSetMetatileIdAt(4 + MAP_OFFSET, 2 + MAP_OFFSET, METATILE_InsideOfTruck_DoorClosedFloor_Mid);
    MapGridSetMetatileIdAt(4 + MAP_OFFSET, 3 + MAP_OFFSET, METATILE_InsideOfTruck_DoorClosedFloor_Bottom);
    DrawWholeMapView();
    LockPlayerFieldControls();
    CpuFastFill(0, gPlttBufferFaded, PLTT_SIZE);
    CreateTask(Task_HandleTruckSequence, 0xA);
}

void EndTruckSequence(u8 taskId)
{
    if (!FuncIsActiveTask(Task_HandleTruckSequence))
    {
        SetObjectEventSpritePosByLocalIdAndMap(LOCALID_TRUCK_BOX_TOP,      gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, BOX1_X_OFFSET, BOX1_Y_OFFSET);
        SetObjectEventSpritePosByLocalIdAndMap(LOCALID_TRUCK_BOX_BOTTOM_L, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, BOX2_X_OFFSET, BOX2_Y_OFFSET);
        SetObjectEventSpritePosByLocalIdAndMap(LOCALID_TRUCK_BOX_BOTTOM_R, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, BOX3_X_OFFSET, BOX3_Y_OFFSET);
    }
}

static u32 FieldSpecialScene_Dummy0(void)
{
    return 0;
}

static void FieldSpecialScene_Dummy1(void)
{
}

static void FieldSpecialScene_Dummy2(void)
{
}

static void FieldSpecialScene_Dummy3(void)
{
}

void FieldCB_ShowPortholeView(void)
{
}

// From Hoenn's SS Tidal
void LookThroughPorthole(void)
{
}
