#include "global.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "fldeff.h"
#include "party_menu.h"
#include "overworld.h"

static void StartRetreatFieldEffect(void);

bool8 SetUpFieldMove_Retreat(void)
{
    return TRUE; //Allow retreat in all types of maps
}

void FieldCallback_Retreat(void)
{
    Overworld_ResetStateAfterTeleport();
    FieldEffectStart(FLDEFF_USE_RETREAT);
    gFieldEffectArguments[0] = (u32)GetCursorSelectionMonId();
}

bool8 FldEff_UseRetreat(void)
{
    u8 taskId;
    
    taskId = CreateFieldEffectShowMon();
    FLDEFF_SET_FUNC_TO_DATA(StartRetreatFieldEffect);
    SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);
    return FALSE;
}

static void StartRetreatFieldEffect(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_RETREAT);
    CreateRetreatFieldEffectTask();
}
