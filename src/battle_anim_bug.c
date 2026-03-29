#include "global.h"
#include "battle_anim.h"
#include "gpu_regs.h"
#include "trig.h"
#include "constants/songs.h"

#include "gflib.h"

static void AnimMegahornHorn(struct Sprite *sprite);
static void AnimLeechLifeNeedle(struct Sprite *sprite);
static void AnimTranslateWebThread(struct Sprite *sprite);
static void AnimTranslateWebThread_Step(struct Sprite *sprite);
static void AnimStringWrap(struct Sprite *sprite);
static void AnimStringWrap_Step(struct Sprite *sprite);
static void AnimSpiderWeb(struct Sprite *sprite);
static void AnimSpiderWeb_Step(struct Sprite *sprite);
static void AnimSpiderWeb_End(struct Sprite *sprite);
static void AnimTranslateStinger(struct Sprite *sprite);
static void AnimMissileArc(struct Sprite *sprite);
static void AnimMissileArc_Step(struct Sprite *sprite);
static void AnimTailGlowOrb(struct Sprite *sprite);
static void AnimLookLook(struct Sprite *sprite);
static void AnimCapture(struct Sprite *sprite);
static void AnimTask_CaptureTargetBounce_Step(u8 taskId);
static void AnimCaptureOverlay(struct Sprite *sprite);

static const union AffineAnimCmd sAffineAnim_MegahornHorn_0[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 30, 0),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sAffineAnim_MegahornHorn_1[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, -99, 0),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sAffineAnim_MegahornHorn_2[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 94, 0),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_MegahornHorn[] =
{
    sAffineAnim_MegahornHorn_0,
    sAffineAnim_MegahornHorn_1,
    sAffineAnim_MegahornHorn_2,
};

const struct SpriteTemplate gMegahornHornSpriteTemplate =
{
    .tileTag = ANIM_TAG_HORN_HIT_2,
    .paletteTag = ANIM_TAG_HORN_HIT_2,
    .oam = &gOamData_AffineDouble_ObjNormal_32x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_MegahornHorn,
    .callback = AnimMegahornHorn,
};

static const union AffineAnimCmd sAffineAnim_LeechLifeNeedle_0[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -33, 1),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sAffineAnim_LeechLifeNeedle_1[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 96, 1),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sAffineAnim_LeechLifeNeedle_2[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -96, 1),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_LeechLifeNeedle[] =
{
    sAffineAnim_LeechLifeNeedle_0,
    sAffineAnim_LeechLifeNeedle_1,
    sAffineAnim_LeechLifeNeedle_2,
};

const struct SpriteTemplate gLeechLifeNeedleSpriteTemplate =
{
    .tileTag = ANIM_TAG_NEEDLE,
    .paletteTag = ANIM_TAG_NEEDLE,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_LeechLifeNeedle,
    .callback = AnimLeechLifeNeedle,
};
static const union AffineAnimCmd sAffineAnim_ShootBullet_0[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -50, 1),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sAffineAnim_ShootBullet_1[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 96, 1),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sAffineAnim_ShootBullet_2[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -96, 1),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_ShootBullet[] =
{
    sAffineAnim_ShootBullet_0,
    sAffineAnim_ShootBullet_1,
    sAffineAnim_ShootBullet_2,
};

const struct SpriteTemplate gShootBulletSpriteTemplate =
{
    .tileTag = ANIM_TAG_BULLET,
    .paletteTag = ANIM_TAG_BULLET,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_ShootBullet,
    .callback = AnimLeechLifeNeedle,
};

const struct SpriteTemplate gWebThreadSpriteTemplate =
{
    .tileTag = ANIM_TAG_WEB_THREAD,
    .paletteTag = ANIM_TAG_WEB_THREAD,
    .oam = &gOamData_AffineOff_ObjNormal_8x8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimTranslateWebThread,
};

const struct SpriteTemplate gGrassKnotThreadSpriteTemplate =
{
    .tileTag = ANIM_TAG_WEB_THREAD,
    .paletteTag = ANIM_TAG_WEED_SMALL,
    .oam = &gOamData_AffineOff_ObjNormal_8x8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimTranslateWebThread,
};

const struct SpriteTemplate gStringWrapSpriteTemplate =
{
    .tileTag = ANIM_TAG_STRING,
    .paletteTag = ANIM_TAG_STRING,
    .oam = &gOamData_AffineOff_ObjNormal_64x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimStringWrap,
};

const struct SpriteTemplate gGrassWrapSpriteTemplate =
{
    .tileTag = ANIM_TAG_STRING,
    .paletteTag = ANIM_TAG_GREEN_SPIKE,
    .oam = &gOamData_AffineOff_ObjNormal_64x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimStringWrap,
};

static const union AffineAnimCmd sAffineAnim_SpiderWeb[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x6, 0x6, 0, 1),
    AFFINEANIMCMD_JUMP(1),
};

static const union AffineAnimCmd *const sAffineAnims_SpiderWeb[] =
{
    sAffineAnim_SpiderWeb,
};

const struct SpriteTemplate gSpiderWebSpriteTemplate =
{
    .tileTag = ANIM_TAG_SPIDER_WEB,
    .paletteTag = ANIM_TAG_SPIDER_WEB,
    .oam = &gOamData_AffineDouble_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_SpiderWeb,
    .callback = AnimSpiderWeb,
};

const struct SpriteTemplate gLinearStingerSpriteTemplate =
{
    .tileTag = ANIM_TAG_NEEDLE,
    .paletteTag = ANIM_TAG_NEEDLE,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimTranslateStinger,
};

const struct SpriteTemplate gPinMissileSpriteTemplate =
{
    .tileTag = ANIM_TAG_NEEDLE,
    .paletteTag = ANIM_TAG_NEEDLE,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMissileArc,
};

const struct SpriteTemplate gIcicleSpearSpriteTemplate =
{
    .tileTag = ANIM_TAG_ICICLE_SPEAR,
    .paletteTag = ANIM_TAG_ICICLE_SPEAR,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMissileArc,
};

const struct SpriteTemplate gNikeCannonSpriteTemplate =
{
    .tileTag = ANIM_TAG_SHOEPRINT,
    .paletteTag = ANIM_TAG_SHOEPRINT,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMissileArc,
};

const struct SpriteTemplate gPickleSpearSpriteTemplate =
{
    .tileTag = ANIM_TAG_PICKLE_SPEAR,
    .paletteTag = ANIM_TAG_PICKLE_SPEAR,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMissileArc,
};

static const union AffineAnimCmd sAffineAnim_TailGlowOrb[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 18),
    AFFINEANIMCMD_LOOP(0),
    AFFINEANIMCMD_FRAME(-0x5, -0x5, 0, 8),
    AFFINEANIMCMD_FRAME(0x5, 0x5, 0, 8),
    AFFINEANIMCMD_LOOP(5),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_TailGlowOrb[] =
{
    sAffineAnim_TailGlowOrb,
};


static const union AffineAnimCmd sAffineAnim_FailGlowOrb[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 18),
    AFFINEANIMCMD_LOOP(0),
    AFFINEANIMCMD_FRAME(-0x5, -0x5, 0, 8),
    AFFINEANIMCMD_FRAME(0x5, 0x5, 0, 8),
    AFFINEANIMCMD_LOOP(3),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_FailGlowOrb[] =
{
    sAffineAnim_FailGlowOrb,
};

const struct SpriteTemplate gTailGlowOrbSpriteTemplate =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_AffineNormal_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_TailGlowOrb,
    .callback = AnimTailGlowOrb,
};

const struct SpriteTemplate gFailGlowOrbSpriteTemplate =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_AffineNormal_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_FailGlowOrb,
    .callback = AnimTailGlowOrb,
};

static const union AffineAnimCmd sAffineAnim_FailerGlowOrb[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 18),
    AFFINEANIMCMD_LOOP(0),
    AFFINEANIMCMD_FRAME(-0x5, -0x5, 0, 8),
    AFFINEANIMCMD_FRAME(0x5, 0x5, 0, 8),
    AFFINEANIMCMD_LOOP(1),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_FailerGlowOrb[] =
{
    sAffineAnim_FailerGlowOrb,
};

const struct SpriteTemplate gFailerGlowOrbSpriteTemplate =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_AffineNormal_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_FailerGlowOrb,
    .callback = AnimTailGlowOrb,
};

static const union AnimCmd sLookLookAnimCmd_0[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_END,
};

static const union AnimCmd sLookLookAnimCmd_1[] =
{
    ANIMCMD_FRAME(16, 8),
    ANIMCMD_END,
};

static const union AnimCmd sLookLookAnimCmd_2[] =
{
    ANIMCMD_FRAME(32, 8),
    ANIMCMD_END,
};

static const union AnimCmd *const gLookLookAnimTable[] =
{
    sLookLookAnimCmd_0,
    sLookLookAnimCmd_1,
    sLookLookAnimCmd_2,
};

const struct SpriteTemplate gLookLookSpriteTemplate =
{
    .tileTag = ANIM_TAG_LOOK_LOOK,
    .paletteTag = ANIM_TAG_LOOK_LOOK,
    .oam = &gOamData_AffineOff_ObjNormal_32x32, // adjust if needed
    .anims = gLookLookAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimLookLook,
};


static const union AnimCmd sSoldierAnimCmd_0[] =
{
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_END,
};

static const union AnimCmd sSoldierAnimCmd_1[] =
{
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_END,
};

static const union AnimCmd sSoldierAnimCmd_2[] =
{
    ANIMCMD_FRAME(32, 2),
    ANIMCMD_END,
};

static const union AnimCmd sSoldierAnimCmd_3[] =
{
    ANIMCMD_FRAME(48, 2),
    ANIMCMD_END,
};

static const union AnimCmd sSoldierAnimCmd_4[] =
{
    ANIMCMD_FRAME(64, 2),
    ANIMCMD_END,
};

static const union AnimCmd *const gSoldierAnimTable[] =
{
    sSoldierAnimCmd_0,
    sSoldierAnimCmd_1,
    sSoldierAnimCmd_2,
    sSoldierAnimCmd_3,
    sSoldierAnimCmd_4,
};

const struct SpriteTemplate gSoldierSpriteTemplate =
{
    .tileTag = ANIM_TAG_SOLDIER,
    .paletteTag = ANIM_TAG_SOLDIER,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gSoldierAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimCapture,
};

static const union AffineAnimCmd sCaptureAffineAnimCmd[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x1E, 0x1E, 0, 8),
    AFFINEANIMCMD_END,
};
static const union AffineAnimCmd *const sAffineAnims_Capture[] =
{
    sCaptureAffineAnimCmd,
};
const struct SpriteTemplate gCaptSpriteTemplate =
{
    .tileTag = ANIM_TAG_CAPT,
    .paletteTag = ANIM_TAG_CAPT,
    .oam = &gOamData_AffineOff_ObjBlend_64x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_Capture,
    .callback = AnimCaptureOverlay,
};



static void AnimMegahornHorn(struct Sprite *sprite)
{
    if (IsContest())
    {
        StartSpriteAffineAnim(sprite, 2);
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    }
    else if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
    {
        StartSpriteAffineAnim(sprite, 1);
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    }
    sprite->x = GetBattlerSpriteCoord2(gBattleAnimTarget, BATTLER_COORD_X_2) + gBattleAnimArgs[0];
    sprite->y = GetBattlerSpriteCoord2(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[3];
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

static void AnimLeechLifeNeedle(struct Sprite *sprite)
{
    if (IsContest())
    {
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        StartSpriteAffineAnim(sprite, 2);
    }
    else if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    }
    sprite->x = GetBattlerSpriteCoord2(gBattleAnimTarget, BATTLER_COORD_X_2) + gBattleAnimArgs[0];
    sprite->y = GetBattlerSpriteCoord2(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

// Creates a single web thread that travels from attacker to target.
// Used by MOVE_STRING_SHOT and MOVE_SPIDER_WEB in their first move phase.
// arg 0: x
// arg 1: y
// arg 2: controls the left-to-right movement
// arg 3: amplitude
// arg 4: if targets both opponents
static void AnimTranslateWebThread(struct Sprite *sprite)
{
    if (IsContest())
        gBattleAnimArgs[2] /= 2;
    InitSpritePosToAnimAttacker(sprite, TRUE);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = sprite->x;
    sprite->data[3] = sprite->y;
    if (!gBattleAnimArgs[4])
    {
        sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
        sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    }
    else
    {
        SetAverageBattlerPositions(gBattleAnimTarget, 1, &sprite->data[2], &sprite->data[4]);
    }
    InitAnimLinearTranslationWithSpeed(sprite);
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = AnimTranslateWebThread_Step;
}

static void AnimTranslateWebThread_Step(struct Sprite *sprite)
{
    if (AnimTranslateLinear(sprite))
    {
        DestroyAnimSprite(sprite);
        return;
    }
    sprite->x2 += Sin(sprite->data[6], sprite->data[5]);
    sprite->data[6] = (sprite->data[6] + 13) & 0xFF;
}

static void AnimStringWrap(struct Sprite *sprite)
{
    SetAverageBattlerPositions(gBattleAnimTarget, 0, &sprite->x, &sprite->y);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        sprite->x -= gBattleAnimArgs[0];
    else
        sprite->x += gBattleAnimArgs[0];
    sprite->y += gBattleAnimArgs[1];
    if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
        sprite->y += 8;
    sprite->callback = AnimStringWrap_Step;
}

static void AnimStringWrap_Step(struct Sprite *sprite)
{
    if (++sprite->data[0] == 3)
    {
        sprite->data[0] = 0;
        sprite->invisible ^= 1;
    }
    if (++sprite->data[1] == 51)
    {
        DestroyAnimSprite(sprite);
    }
}

static void AnimSpiderWeb(struct Sprite *sprite)
{
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT2_ALL | BLDCNT_EFFECT_BLEND);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(16, 0));
    sprite->data[0] = 16;
    sprite->callback = AnimSpiderWeb_Step;
}

static void AnimSpiderWeb_Step(struct Sprite *sprite)
{
    if (sprite->data[2] < 20)
    {
        ++sprite->data[2];
    }
    else if (sprite->data[1]++ & 1)
    {
        --sprite->data[0];
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(sprite->data[0], 16 - sprite->data[0]));

        if (sprite->data[0] == 0)
        {
            sprite->invisible = TRUE;
            sprite->callback = AnimSpiderWeb_End;
        }
    }
}

static void AnimSpiderWeb_End(struct Sprite *sprite)
{
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    DestroyAnimSprite(sprite);
}

// Translates a stinger sprite linearly to a destination location. The sprite is
// initially rotated so that it appears to be traveling in a straight line.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: target x pixel offset
// arg 3: target y pixel offset
// arg 4: duration
static void AnimTranslateStinger(struct Sprite *sprite)
{
    s16 lVarX, lVarY;
    u16 rot;

    if (IsContest())
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    else if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }
    if (!IsContest() && GetBattlerSide(gBattleAnimAttacker) == GetBattlerSide(gBattleAnimTarget))
    {
        if (GetBattlerPosition(gBattleAnimTarget) == B_POSITION_PLAYER_LEFT
         || GetBattlerPosition(gBattleAnimTarget) == B_POSITION_OPPONENT_LEFT)
        {
            s16 temp1, temp2;

            temp1 = gBattleAnimArgs[2];
            gBattleAnimArgs[2] = -temp1;

            temp2 = gBattleAnimArgs[0];
            gBattleAnimArgs[0] = -temp2;
        }
    }
    InitSpritePosToAnimAttacker(sprite, 1);
    lVarX = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2) + gBattleAnimArgs[2];
    lVarY = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[3];
    rot = ArcTan2Neg(lVarX - sprite->x, lVarY - sprite->y);
    rot += 0xC000;
    TrySetSpriteRotScale(sprite, FALSE, 0x100, 0x100, rot);
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = lVarX;
    sprite->data[4] = lVarY;
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

// Rotates sprite and moves it in an arc, so that it appears like a missle or arrow traveling.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: target x pixel offset
// arg 3: target y pixel offset
// arg 4: duration
// arg 5: wave amplitude
static void AnimMissileArc(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, 1);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[5];
    InitAnimArcTranslation(sprite);
    sprite->callback = AnimMissileArc_Step;
    sprite->invisible = TRUE;
}

static void AnimMissileArc_Step(struct Sprite *sprite)
{
    sprite->invisible = FALSE;

    if (TranslateAnimHorizontalArc(sprite))
    {
        DestroyAnimSprite(sprite);
    }
    else
    {
        s16 tempData[8];
        u16 *data = sprite->data;
        u16 x1 = sprite->x;
        s16 x2 = sprite->x2;
        u16 y1 = sprite->y;
        s16 y2 = sprite->y2;
        s32 i;

        for (i = 0; i < 8; ++i)
            tempData[i] = data[i];
        x2 += x1;
        y2 += y1;
        if (!TranslateAnimHorizontalArc(sprite))
        {
            u16 rotation = ArcTan2Neg(sprite->x + sprite->x2 - x2,
                                      sprite->y + sprite->y2 - y2);

            rotation += 0xC000;
            TrySetSpriteRotScale(sprite, FALSE, 0x100, 0x100, rotation);
            for (i = 0; i < 8; ++i)
                data[i] = tempData[i];
        }
    }
}

static void AnimTailGlowOrb(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == ANIM_ATTACKER)
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET) + 18;
    }
    else
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + 18;
    }
    StoreSpriteCallbackInData6(sprite, DestroySpriteAndMatrix);
    sprite->callback = RunStoredCallbackWhenAffineAnimEnds;
}

static void AnimLookLook(struct Sprite *sprite)
{
    sprite->data[5] = gBattleAnimArgs[0];
    sprite->data[6] = gBattleAnimArgs[1];
    sprite->data[7] = gBattleAnimArgs[2];

    switch (sprite->data[0]) // state
    {
    // -----------------------------------
    // INITIALISE
    // -----------------------------------
    case 0:
        // Position relative to battler
        if (sprite->data[7] == 0)
            InitSpritePosToAnimAttacker(sprite, FALSE);
        else
            InitSpritePosToAnimTarget(sprite, FALSE);

        sprite->x += sprite->data[5]; // initial X offset
        sprite->y += sprite->data[6]; // initial Y offset

        StartSpriteAnim(sprite, 0);

        sprite->data[1] = 0; // frame counter
        sprite->data[0] = 1;
        break;

    // -----------------------------------
    // STATE 0 movement (upwards)
    // -----------------------------------
    case 1:
        switch (sprite->data[1]++)
        {
        case 0: sprite->y -= 8; break;
        case 1: sprite->y -= 4; break;
        case 2: sprite->y -= 4; break;
        default:
            StartSpriteAnim(sprite, 1);
            sprite->data[1] = 0;
            sprite->data[0] = 2;
            break;
        }
        break;

    // -----------------------------------
    // STATE 1 movement (downwards + pause)
    // -----------------------------------
    case 2:
        switch (sprite->data[1]++)
        {
        case 0: sprite->y += 8; break;
        case 1: /* stay */ break;
        case 2: sprite->y += 2; break;
        case 3: sprite->y += 4; break;
        default:
            StartSpriteAnim(sprite, 2);
            sprite->data[1] = 0;
            sprite->data[0] = 3;
            break;
        }
        break;

    // -----------------------------------
    // STATE 2 movement (final drop)
    // -----------------------------------
    case 3:
        switch (sprite->data[1]++)
        {
        case 0: /* stay */ break;
        case 1: sprite->y += 8; break;
        case 2: sprite->y += 12; break;
        default:
            sprite->data[1] = 0;
            sprite->data[0] = 4;
            break;
        }
        break;

    // -----------------------------------
    // FINAL HOLD (50 frames)
    // -----------------------------------
    case 4:
        if (++sprite->data[1] >= 50)
        {
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

static void AnimCapture(struct Sprite *sprite)
{
    // -----------------------------------
    // INITIALISE ARGUMENTS ON FIRST CALL
    // -----------------------------------
    if (sprite->data[0] == 0 && sprite->data[1] == 0)
    {
        sprite->data[5] = gBattleAnimArgs[0]; // x offset
        sprite->data[6] = gBattleAnimArgs[1]; // y offset
        sprite->data[7] = gBattleAnimArgs[2]; // 0 attacker, 1 target
    }

    switch (sprite->data[0])
    {
    // -----------------------------------
    // 0. INITIAL SETUP + 30 FRAME WAIT
    // -----------------------------------
    case 0:
        if (sprite->data[1] == 0)
        {
            if (sprite->data[7] == 0)
                InitSpritePosToAnimAttacker(sprite, FALSE);
            else
                InitSpritePosToAnimTarget(sprite, FALSE);

            sprite->x += sprite->data[5];
            sprite->y += sprite->data[6];
            StartSpriteAnim(sprite, 0);
        }

        if (++sprite->data[1] >= 30)
        {
            sprite->data[1] = 0;
            sprite->data[2] = 0; // jump loop counter
            sprite->data[0] = 1;
        }
        break;

    // -----------------------------------
    // 1. JUMP LOOP x3 (⅓ speed)
    // -----------------------------------
    case 1:
        switch (sprite->data[1]++)
        {
        // anim 1, move 1 up
        case 0:
            StartSpriteAnim(sprite, 1);
            sprite->y -= 1;
            break;

        // first 6 up = 2+2+2
        case 1:
            sprite->y -= 2;
            break;
        case 2:
            StartSpriteAnim(sprite, 2);
            sprite->y -= 2;
            break;
        case 3:
            sprite->y -= 2;
            break;

        // second 6 up = 2+2+2
        case 4:
            sprite->y -= 2;
            break;
        case 5:
            sprite->y -= 2;
            break;
        case 6:
            sprite->y -= 2;
            break;

        // 8 down = 3+3+2
        case 7:
            sprite->y += 3;
            break;
        case 8:
            sprite->y += 3;
            break;
        case 9:
            sprite->y += 2;
            break;

        // 5 down = 2+2+1
        case 10:
            sprite->y += 2;
            break;
        case 11:
            sprite->y += 2;
            break;
        case 12:
            StartSpriteAnim(sprite, 0);
            sprite->y += 1;
            break;

        // 12 frame pause
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
            break;

        default:
            sprite->data[1] = 0;
            sprite->data[2]++;

            if (sprite->data[2] >= 3)
                sprite->data[0] = 2;
            break;
        }
        break;

    // -----------------------------------
    // 2. DROP DOWN (⅓ speed)
    // -----------------------------------
    case 2:
        switch (sprite->data[1]++)
        {
        case 0: break; // pause first frame
        case 1: break; // pause second frame
        // 4 = 1+1+2
        case 2: sprite->y += 1; break;
        case 3: sprite->y += 1; break;
        case 4: sprite->y += 2; break;

        // 6 = 2+2+2
        case 5: sprite->y += 2; break;
        case 6: sprite->y += 2; break;
        case 7: sprite->y += 2; break;

        // 6 = 2+2+2
        case 8: sprite->y += 2; break;
        case 9: sprite->y += 2; break;
        case 10: sprite->y += 2; break;

        // 4 = 1+1+2
        case 11:  sprite->y += 1; break;
        case 12: sprite->y += 1; break;
        case 13: sprite->y += 2; break;

        default:
            sprite->data[1] = 0;
            sprite->data[0] = 3;
            break;
        }
        break;

    // -----------------------------------
    // 3. WAIT 33 FRAMES
    // -----------------------------------
    case 3:
        if (++sprite->data[1] >= 33)
        {
            sprite->data[1] = 0;
            sprite->data[0] = 4;
        }
        break;

    // -----------------------------------
    // 4. FINAL RISE (⅓ speed)
    // -----------------------------------
    case 4:
        switch (sprite->data[1]++)
        {
        // first 6 = 2+2+2
        case 0: 
            StartSpriteAnim(sprite, 3);
            sprite->y -= 2; 
            break;
        case 1: sprite->y -= 2; break;
        case 2: sprite->y -= 2; break;

        // second 6 = 2+2+2
        case 3: sprite->y -= 2; break;
        case 4: sprite->y -= 2; break;
        case 5: sprite->y -= 2; break;

        // third 6 = 2+2+2
        case 6: sprite->y -= 2; break;
        case 7: sprite->y -= 2; break;
        case 8: sprite->y -= 2; break;

        // final 2 = 1+1
        case 9:
            sprite->y -= 1;
            break;
        case 10:
            sprite->y -= 1;
            break;

        default:
            StartSpriteAnim(sprite, 4);
            sprite->data[1] = 0;
            sprite->data[0] = 5;
            break;
        }
        break;

    // -----------------------------------
    // 5. FINAL HOLD (90 FRAMES)
    // -----------------------------------
    case 5:
        if (++sprite->data[1] >= 90)
            DestroyAnimSprite(sprite);
        break;
    }
}

void AnimTask_CaptureTargetBounce(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(ANIM_TARGET);

    gTasks[taskId].data[0] = 1;        // start at jump loop phase
    gTasks[taskId].data[1] = 0;        // frame counter
    gTasks[taskId].data[2] = 0;        // jump loop counter
    gTasks[taskId].data[3] = spriteId; // target sprite
    gTasks[taskId].data[4] = 0;        // current y offset

    gTasks[taskId].func = AnimTask_CaptureTargetBounce_Step;
}

static void AnimTask_CaptureTargetBounce_Step(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    struct Sprite *monSprite = &gSprites[task->data[3]];

    switch (task->data[0])
    {
    // -----------------------------------
    // 1. JUMP LOOP x3
    // only landing dip: +1 then -1 next frame
    // -----------------------------------
    case 1:
        switch (task->data[1]++)
        {
        // landing frame
        case 10:
            PlaySE12WithPanning(SE_M_COMET_PUNCH, BattleAnimAdjustPanning(SOUND_PAN_TARGET));
            task->data[4] += 1;
            break;

        // rebound frame
        case 11:
            task->data[4] -= 1;
            break;

        // 12 frame loop pause ends at 24
        case 25:
            task->data[1] = 0;
            task->data[2]++;

            if (task->data[2] >= 3)
                task->data[0] = 2;
            break;
        }
        break;

    // -----------------------------------
    // 2. DROP DOWN
    // exactly matches capture sprite
    // -----------------------------------
    case 2:
        switch (task->data[1]++)
        {
        case 0: 
            PlaySE12WithPanning(SE_M_STRENGTH, BattleAnimAdjustPanning(SOUND_PAN_TARGET));
            task->data[4] += 1; 
            break;
        case 1: task->data[4] += 1; break;
        case 2: task->data[4] += 2; break;

        case 3: task->data[4] += 2; break;
        case 4: task->data[4] += 2; break;
        case 5: task->data[4] += 2; break;

        case 6: task->data[4] += 2; break;
        case 7: task->data[4] += 2; break;
        case 8: task->data[4] += 2; break;

        case 9:  task->data[4] += 1; break;
        case 10: task->data[4] += 1; break;
        case 11: task->data[4] += 2; break;

        default:
            task->data[1] = 0;
            task->data[0] = 3;
            break;
        }
        break;

    // -----------------------------------
    // 3. WAIT 33 FRAMES
    // -----------------------------------
    case 3:
        if (++task->data[1] >= 33)
        {
            task->data[1] = 0;
            task->data[0] = 4;
        }
        break;

    // -----------------------------------
    // 4. FINAL RISE
    // exactly matches capture sprite
    // -----------------------------------
    case 4:
        switch (task->data[1]++)
        {
        case 0: 
            PlaySE12WithPanning(SE_M_ATTRACT, BattleAnimAdjustPanning(SOUND_PAN_TARGET));
            task->data[4] -= 2; 
            break;
        case 1: task->data[4] -= 2; break;
        case 2: task->data[4] -= 2; break;

        case 3: task->data[4] -= 2; break;
        case 4: task->data[4] -= 2; break;
        case 5: task->data[4] -= 2; break;

        case 6: task->data[4] -= 2; break;
        case 7: task->data[4] -= 2; break;
        case 8: task->data[4] -= 2; break;

        case 9: task->data[4] -= 1; break;
        case 10: task->data[4] -= 1; break;

        default:
            task->data[4] = 0;
            monSprite->y2 = 0;
            DestroyAnimVisualTask(taskId);
            return;
        }
        break;
    }

    monSprite->y2 = task->data[4];
}

static void AnimCaptureOverlay(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    // -----------------------------------
    // INITIALISE
    // -----------------------------------
    case 0:
        // arg0 = x offset
        // arg1 = y offset
        // arg2 = battler (0 attacker, 1 target)
        // arg3 = lifetime in frames

        if (gBattleAnimArgs[2] == 0)
            InitSpritePosToAnimAttacker(sprite, FALSE);
        else
            InitSpritePosToAnimTarget(sprite, FALSE);

        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];

        StartSpriteAffineAnim(sprite, 0);

        sprite->data[1] = gBattleAnimArgs[3];
        sprite->data[0] = 1;
        break;

    // -----------------------------------
    // WAIT
    // -----------------------------------
    case 1:
        if (--sprite->data[1] <= 0)
            DestroyAnimSprite(sprite);
        break;
    }
}
