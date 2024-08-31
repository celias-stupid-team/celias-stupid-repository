#ifndef GUARD_FIELD_SPECIAL_SCENE_H
#define GUARD_FIELD_SPECIAL_SCENE_H

void ExecuteTruckSequence(void);
void EndTruckSequence(u8 taskId);
void FieldCB_ShowPortholeView(void);
void SetObjectEventSpritePosByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y);


#endif // GUARD_FIELD_SPECIAL_SCENE_H
