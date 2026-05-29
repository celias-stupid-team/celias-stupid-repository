#include "global.h"
#include "battle_anim.h"
#include "gflib.h"
#include "trig.h"
#include "constants/battle_anim.h"
#include "random.h"

static void AnimEllipticalGust(struct Sprite *sprite);
static void AnimGustToTarget(struct Sprite *sprite);
static void AnimAirWaveCrescent(struct Sprite *sprite);
static void AnimFlyBallUp(struct Sprite *sprite);
static void AnimFlyBallAttack(struct Sprite *sprite);
static void AnimFallingFeather(struct Sprite *sprite);
static void AnimUnusedBubbleThrow(struct Sprite *sprite);
static void AnimUnusedFeather(struct Sprite *sprite);
static void AnimWhirlwindLine(struct Sprite *sprite);
static void AnimBounceBallShrink(struct Sprite *sprite);
static void AnimBounceBallLand(struct Sprite *sprite);
static void AnimSteamrollerLand(struct Sprite *sprite);
static void AnimBulldozer(struct Sprite *sprite);
static void AnimSkateboarder(struct Sprite *sprite);
static void AnimBusDrive(struct Sprite *sprite);
static void AnimTask_PushTargetOffscreen_Step(u8 taskId);
static void AnimDiveBall(struct Sprite *sprite);
static void AnimDiveWaterSplash(struct Sprite *sprite);
static void AnimSprayWaterDroplet(struct Sprite *sprite);
static void AnimUnusedFlashingLight(struct Sprite *sprite);
static void AnimSkyAttackBird(struct Sprite *sprite);
static void AnimEllipticalGust_Step(struct Sprite *sprite);
static void AnimEllipticalTornadus_Step(struct Sprite *sprite);
static void AnimTask_AnimateGustTornadoPalette_Step(u8 taskId);
static void AnimGustToTarget_Step(struct Sprite *sprite);
static void AnimFlyBallUp_Step(struct Sprite *sprite);
static void AnimFlyBallAttack_Step(struct Sprite *sprite);
static void AnimFallingFeather_Step(struct Sprite *sprite);
static void AnimUnusedFeather_Step(struct Sprite *sprite);
static void AnimWhirlwindLine_Step(struct Sprite *sprite);
static void AnimDiveBall_Step1(struct Sprite *sprite);
static void AnimDiveBall_Step2(struct Sprite *sprite);
static void AnimSprayWaterDroplet_Step(struct Sprite *sprite);
static void AnimUnusedFlashingLight_Step(struct Sprite *sprite);
static void AnimSkyAttackBird_Step(struct Sprite *sprite);
static void AnimRotomAppear(struct Sprite *sprite);
static void AnimRotomEnter(struct Sprite *sprite);
static void AnimMoltresKick(struct Sprite *sprite);
static void AnimMoltresKick_Step(struct Sprite *sprite);

const struct SpriteTemplate gEllipticalGustSpriteTemplate =
{
    .tileTag = ANIM_TAG_GUST,
    .paletteTag = ANIM_TAG_GUST,
    .oam = &gOamData_AffineOff_ObjNormal_32x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimEllipticalGust,
};

const struct SpriteTemplate gEllipticalTornadusSpriteTemplate =
{
    .tileTag = ANIM_TAG_GUST,
    .paletteTag = ANIM_TAG_GUST,
    .oam = &gOamData_AffineOff_ObjNormal_32x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimEllipticalGust,
};

const struct SpriteTemplate gMrBondingSpriteTemplate =
{
    .tileTag = ANIM_TAG_MR_BONDING,
    .paletteTag = ANIM_TAG_MR_BONDING,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimEllipticalGust,
};

static const union AffineAnimCmd sAffineAnim_GustToTarget[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0xA, 0x0, 0, 24),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_GustToTarget[] =
{
    sAffineAnim_GustToTarget,
};

const struct SpriteTemplate gGustToTargetSpriteTemplate =
{
    .tileTag = ANIM_TAG_GUST,
    .paletteTag = ANIM_TAG_GUST,
    .oam = &gOamData_AffineNormal_ObjNormal_32x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_GustToTarget,
    .callback = AnimGustToTarget,
};

static const union AnimCmd sAffineAnim_AirWaveCrescent[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(0, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sAffineAnims_AirWaveCrescent[] =
{
    sAffineAnim_AirWaveCrescent,
};

const struct SpriteTemplate gAirWaveCrescentSpriteTemplate =
{
    .tileTag = ANIM_TAG_AIR_WAVE_2,
    .paletteTag = ANIM_TAG_AIR_WAVE_2,
    .oam = &gOamData_AffineOff_ObjNormal_32x16,
    .anims = sAffineAnims_AirWaveCrescent,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimAirWaveCrescent,
};

static const union AffineAnimCmd sAffineAnim_FlyBallUp[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, -0x20, 0, 5),
    AFFINEANIMCMD_FRAME(-0x10, 0x20, 0, 10),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_FlyBallUp[] =
{
    sAffineAnim_FlyBallUp,
};

static const union AffineAnimCmd sAffineAnim_FlyBallAttack_0[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 50, 1),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sAffineAnim_FlyBallAttack_1[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -40, 1),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_FlyBallAttack[] =
{
    sAffineAnim_FlyBallAttack_0,
    sAffineAnim_FlyBallAttack_1,
};

const struct SpriteTemplate gFlyBallUpSpriteTemplate =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_FlyBallUp,
    .callback = AnimFlyBallUp,
};

const struct SpriteTemplate gFlyBallAttackSpriteTemplate =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_AffineNormal_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_FlyBallAttack,
    .callback = AnimFlyBallAttack,
};

const struct SpriteTemplate gZekromKickSpriteTemplate =
{
    .tileTag = ANIM_TAG_ZEKROM_KICK,
    .paletteTag = ANIM_TAG_ZEKROM_KICK,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSkyAttackBird,
};

static const union AnimCmd sAnim_FallingFeather_0[] =
{
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_FallingFeather_1[] =
{
    ANIMCMD_FRAME(16, 0, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_FallingFeather[] =
{
    sAnim_FallingFeather_0,
    sAnim_FallingFeather_1,
};

const struct SpriteTemplate gFallingFeatherSpriteTemplate =
{
    .tileTag = ANIM_TAG_WHITE_FEATHER,
    .paletteTag = ANIM_TAG_WHITE_FEATHER,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sAnims_FallingFeather,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimFallingFeather,
};

static const u16 sUnusedPal[] = INCBIN_U16("graphics/battle_anims/unused/flying.gbapal");

static const struct SpriteTemplate sUnusedBubbleThrowSpriteTemplate =
{
    .tileTag = ANIM_TAG_SMALL_BUBBLES,
    .paletteTag = ANIM_TAG_SMALL_BUBBLES,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimUnusedBubbleThrow,
};

static const struct SpriteTemplate sUnusedFeatherSpriteTemplate =
{
    .tileTag = ANIM_TAG_WHITE_FEATHER,
    .paletteTag = ANIM_TAG_WHITE_FEATHER,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sAnims_FallingFeather,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimUnusedFeather,
};

static const union AnimCmd sAnim_WhirlwindLines[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_FRAME(8, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_WhirlwindLines[] =
{
    sAnim_WhirlwindLines,
};

const struct SpriteTemplate gWhirlwindLineSpriteTemplate =
{
    .tileTag = ANIM_TAG_WHIRLWIND_LINES,
    .paletteTag = ANIM_TAG_WHIRLWIND_LINES,
    .oam = &gOamData_AffineOff_ObjNormal_32x16,
    .anims = sAnims_WhirlwindLines,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimWhirlwindLine,
};

static const union AffineAnimCmd sAffineAnim_BounceBallShrink[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, -0x20, 0, 5),
    AFFINEANIMCMD_FRAME(-0x14, 0x0, 0, 7),
    AFFINEANIMCMD_FRAME(-0x14, -0x14, 0, 5),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_BounceBallShrink[] =
{
    sAffineAnim_BounceBallShrink,
};

const struct SpriteTemplate gBounceBallShrinkSpriteTemplate =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_BounceBallShrink,
    .callback = AnimBounceBallShrink,
};

static const union AffineAnimCmd sAffineAnim_BounceBallLand[] =
{
    AFFINEANIMCMD_FRAME(0xA0, 0x100, 0, 0),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_BounceBallLand[] =
{
    sAffineAnim_BounceBallLand,
};

const struct SpriteTemplate gBounceBallLandSpriteTemplate =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_BounceBallLand,
    .callback = AnimBounceBallLand,
};

static const union AnimCmd sAnim_SteamrollerDrive[] =
{
    ANIMCMD_FRAME(0,   4),
    ANIMCMD_FRAME(64,  4),
    ANIMCMD_FRAME(128, 4),
    ANIMCMD_FRAME(192, 4),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sAnims_Steamroller[] =
{
    sAnim_SteamrollerDrive,
};


static const union AnimCmd sAnim_PlastoStrut[] =
{
    ANIMCMD_FRAME(0,   24),
    ANIMCMD_FRAME(64,  6),
    ANIMCMD_FRAME(128, 6),
    ANIMCMD_FRAME(192, 12),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sAnims_PlastoStrut[] =
{
    sAnim_PlastoStrut,
};

const struct SpriteTemplate gSteamrollerLandSpriteTemplate =
{
    .tileTag = ANIM_TAG_STEAMROLLER,
    .paletteTag = ANIM_TAG_STEAMROLLER,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = sAnims_Steamroller,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSteamrollerLand,
};

static const union AnimCmd sAnim_BusDrive[] =
{
    ANIMCMD_FRAME(0,   4),
    ANIMCMD_FRAME(32,   4),
    ANIMCMD_FRAME(64,   4),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sAnims_BusDrive[] =
{
    sAnim_BusDrive,
};

const struct SpriteTemplate gBusLeftDriveSpriteTemplate =
{
    .tileTag = ANIM_TAG_BUS_LEFT,
    .paletteTag = ANIM_TAG_BUS_LEFT,
    .oam = &gOamData_AffineDouble_ObjNormal_64x32,
    .anims = sAnims_BusDrive,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBusDrive,
};

const struct SpriteTemplate gBusRightDriveSpriteTemplate =
{
    .tileTag = ANIM_TAG_BUS_RIGHT,
    .paletteTag = ANIM_TAG_BUS_RIGHT,
    .oam = &gOamData_AffineDouble_ObjNormal_64x32,
    .anims = sAnims_BusDrive,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBusDrive,
};

static const union AnimCmd sAnim_Rotom[] =
{
    ANIMCMD_FRAME(0,   8),
    ANIMCMD_FRAME(64,  16),
    ANIMCMD_FRAME(128,   8),
    ANIMCMD_FRAME(192, 16),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sAnims_Rotom[] =
{
    sAnim_Rotom,
};


const struct SpriteTemplate gBulldozerSpriteTemplate =
{
    .tileTag = ANIM_TAG_BULLDOZER,
    .paletteTag = ANIM_TAG_BULLDOZER,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = sAnims_Steamroller,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBulldozer,
};

const struct SpriteTemplate gSkateboarderSpriteTemplate =
{
    .tileTag = ANIM_TAG_EXTREME_SLOTH,
    .paletteTag = ANIM_TAG_EXTREME_SLOTH,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSkateboarder,
};

const struct SpriteTemplate gPlastoSpriteTemplate =
{
    .tileTag = ANIM_TAG_PLASTO,
    .paletteTag = ANIM_TAG_PLASTO,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = sAnims_PlastoStrut,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBulldozer,
};

const struct SpriteTemplate gRotomAppearSpriteTemplate =
{
    .tileTag = ANIM_TAG_ROTOM_DESCEND,
    .paletteTag = ANIM_TAG_ROTOM_DESCEND,
    .oam = &gOamData_AffineNormal_ObjNormal_64x64,
    .anims = sAnims_Rotom,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimRotomAppear,
};

const struct SpriteTemplate gRotomEnterSpriteTemplate =
{
    .tileTag = ANIM_TAG_ROTOM_DESCEND,
    .paletteTag = ANIM_TAG_ROTOM_DESCEND,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = sAnims_Rotom,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimRotomEnter,
};

static void AnimRotomAppear(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    // INIT
    case 0:
        sprite->x = DISPLAY_WIDTH + 32;   // start off right
        sprite->y = -32;                  // slightly above screen

        sprite->data[1] = 0;              // angle (0-128)
        sprite->data[2] = DISPLAY_WIDTH / 2;   // arc center X
        sprite->data[3] = -32;//DISPLAY_HEIGHT / 2;  // arc center Y
        sprite->data[4] = 96;             // arc radius
        sprite->data[5] = 2;              // angular speed
        
        sprite->data[0] = 1;
        break;

    // FIRST SEMICIRCLE (right -> center)
    case 1:
        sprite->data[1] += sprite->data[5];

        sprite->x = sprite->data[2] + Cos(sprite->data[1], sprite->data[4]);
        sprite->y = sprite->data[3] + Sin(sprite->data[1], sprite->data[4]);

        // slow near middle
        if (sprite->data[1] > 48)
            sprite->data[5] = 1;

        if (sprite->data[1] >= 64)
        {
            sprite->data[6] = 0; // pause timer
            sprite->data[0] = 2;
        }
        break;

    // PAUSE IN CENTER
    case 2:
        if (++sprite->data[6] > 90)
        {
            sprite->data[5] = 1;
            sprite->data[0] = 3;
        }
        break;

    // SECOND HALF (center -> left)
    case 3:
        sprite->data[1] += sprite->data[5];

        sprite->x = sprite->data[2] + Cos(sprite->data[1], sprite->data[4]);
        sprite->y = sprite->data[3] + Sin(sprite->data[1], sprite->data[4]);

        if (sprite->data[1] >= 128)
        {
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

static void AnimRotomEnter(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    // INIT
    case 0:
        sprite->x = -32;
        sprite->y = -32;
        StartSpriteAffineAnim(sprite, 0);
        SetSpriteRotScale(sprite - gSprites, -256, 256, 0);
        CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, ST_OAM_AFFINE_DOUBLE);

        sprite->data[1] = 0;
        sprite->data[2] = 32 + DISPLAY_WIDTH / 2;
        sprite->data[3] = -32;
        sprite->data[4] = 96;
        sprite->data[5] = 2;

        sprite->data[0] = 1;
        break;

    // SEMICIRCLE TO CENTER
    case 1:
        sprite->data[1] += sprite->data[5];

        sprite->x = sprite->data[2] - Cos(sprite->data[1], sprite->data[4]);
        sprite->y = sprite->data[3] + Sin(sprite->data[1], sprite->data[4]);

        if (sprite->data[1] > 48)
            sprite->data[5] = 1;

        if (sprite->data[1] >= 64)
        {
            sprite->data[6] = 0;
            sprite->data[0] = 2;
        }
        break;

    // PAUSE IN CENTER
    case 2:
        if (++sprite->data[6] > 60)
        {
            sprite->data[7] = 0;
            sprite->data[0] = 3;
        }
        break;

    // WIND UP DIAGONAL UP-LEFT
    case 3:
        sprite->x -= 2;
        sprite->y -= 2;

        if (++sprite->data[7] > 20)
        {
            sprite->data[6] = 0;
            sprite->data[0] = 4;
        }
        break;

    // HOLD
    case 4:
        if (++sprite->data[6] > 40)
        {
            sprite->data[1] = 0;  // velocity X (fixed)
            sprite->data[2] = 0;  // velocity Y (fixed)
            sprite->data[0] = 5;
        }
        break;

    // ACCELERATE DOWN-RIGHT FAST
    case 5:
        sprite->data[1] += 6;
        sprite->data[2] += 8;

        sprite->x += sprite->data[1] >> 4;
        sprite->y += sprite->data[2] >> 4;

        if (sprite->x > DISPLAY_WIDTH + 32 ||
            sprite->y > DISPLAY_HEIGHT + 32)
        {
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

static const union AffineAnimCmd sAffineAnim_DiveBall[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, -0x20, 0, 5),
    AFFINEANIMCMD_FRAME(-0x10, 0x20, 0, 10),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_DiveBall[] =
{
    sAffineAnim_DiveBall,
};

const struct SpriteTemplate gDiveBallSpriteTemplate =
{
    .tileTag = ANIM_TAG_ROUND_SHADOW,
    .paletteTag = ANIM_TAG_ROUND_SHADOW,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_DiveBall,
    .callback = AnimDiveBall,
};

static const union AffineAnimCmd sAnim_Unused[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x0, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x20, 0, 12),
    AFFINEANIMCMD_FRAME(0x0, -0x20, 0, 11),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAnims_Unused[] =
{
    sAnim_Unused,
};

const struct SpriteTemplate gDiveWaterSplashSpriteTemplate =
{
    .tileTag = ANIM_TAG_SPLASH,
    .paletteTag = ANIM_TAG_SPLASH,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimDiveWaterSplash,
};

const struct SpriteTemplate gSprayWaterDropletSpriteTemplate =
{
    .tileTag = ANIM_TAG_SWEAT_BEAD,
    .paletteTag = ANIM_TAG_SWEAT_BEAD,
    .oam = &gOamData_AffineOff_ObjNormal_8x8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprayWaterDroplet,
};

const struct SpriteTemplate gBlukJuiceSpriteTemplate =
{
    .tileTag = ANIM_TAG_BLUK_JUICE,
    .paletteTag = ANIM_TAG_BLUK_JUICE,
    .oam = &gOamData_AffineOff_ObjNormal_8x8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprayWaterDroplet,
};

static const struct SpriteTemplate sUnusedFlashingLightSpriteTemplate =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_AffineOff_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimUnusedFlashingLight,
};

const struct SpriteTemplate gSkyAttackBirdSpriteTemplate =
{
    .tileTag = ANIM_TAG_BIRD,
    .paletteTag = ANIM_TAG_BIRD,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSkyAttackBird,
};

const struct SpriteTemplate gSkyAttackCrabSpriteTemplate =
{
    .tileTag = ANIM_TAG_CSR_CRAB,
    .paletteTag = ANIM_TAG_CSR_CRAB,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSkyAttackBird,
};

static const union AnimCmd sAnim_Shorts[] =
{
    ANIMCMD_FRAME(192, 16),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_Shorts[] =
{
    sAnim_Shorts,
};

const struct SpriteTemplate gSkyAttackShortsSpriteTemplate =
{
    .tileTag = ANIM_TAG_KNIT_SHORTS,
    .paletteTag = ANIM_TAG_KNIT_SHORTS,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = sAnims_Shorts,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSkyAttackBird,
};

const struct SpriteTemplate gSkyAttackMoltresSpriteTemplate =
{
    .tileTag = ANIM_TAG_MOLTRES_KICK,
    .paletteTag = ANIM_TAG_MOLTRES_KICK,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSkyAttackBird,
};

const struct SpriteTemplate gSkyrimSpriteTemplate =
{
    .tileTag = ANIM_TAG_SKYRIM,
    .paletteTag = ANIM_TAG_SKYRIM,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSkyAttackBird,
};

const struct SpriteTemplate gEagleSpriteTemplate =
{
    .tileTag = ANIM_TAG_EAGLE,
    .paletteTag = ANIM_TAG_EAGLE,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSkyAttackBird,
};

const struct SpriteTemplate gTaxesSpriteTemplate =
{
    .tileTag = ANIM_TAG_TAXES,
    .paletteTag = ANIM_TAG_TAXES,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSkyAttackBird,
};

const struct SpriteTemplate gMoltresKickSpriteTemplate =
{
    .tileTag = ANIM_TAG_MOLTRES_KICK,
    .paletteTag = ANIM_TAG_MOLTRES_KICK,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMoltresKick,
};

const struct SpriteTemplate gHyperBreamSpriteTemplate =
{
    .tileTag = ANIM_TAG_BREAM,
    .paletteTag = ANIM_TAG_BREAM,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMoltresKick,
};

/*static const union AnimCmd sAnim_MoltresFire[] =
{
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gAnims_MoltresFire[] =
{
    sAnim_MoltresFire,
};

const struct SpriteTemplate gMoltresFlameSpriteTemplate =
{
    .tileTag = ANIM_TAG_SMALL_EMBER,
    .paletteTag = ANIM_TAG_SMALL_EMBER,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gAnims_MoltresFire,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMoltresFlame,
};*/

static void AnimEllipticalGust(struct Sprite *sprite)
{
    InitSpritePosToAnimTarget(sprite, FALSE);
    sprite->y += 20;
    sprite->data[1] = 191;
    sprite->callback = AnimEllipticalGust_Step;
    sprite->callback(sprite);
}

static void AnimEllipticalGust_Step(struct Sprite *sprite)
{
    sprite->x2 = Sin(sprite->data[1], 32);
    sprite->y2 = Cos(sprite->data[1], 8);
    sprite->data[1] += 5;
    sprite->data[1] &= 0xFF;
    if (++sprite->data[0] == 71)
        DestroyAnimSprite(sprite);
}

// Animates the palette on the gust tornado to make it look like its spinning
void AnimTask_AnimateGustTornadoPalette(u8 taskId)
{
    gTasks[taskId].data[0] = gBattleAnimArgs[1];
    gTasks[taskId].data[1] = gBattleAnimArgs[0];
    gTasks[taskId].data[2] = IndexOfSpritePaletteTag(ANIM_TAG_GUST);
    gTasks[taskId].func = AnimTask_AnimateGustTornadoPalette_Step;
}



static void AnimTask_AnimateGustTornadoPalette_Step(u8 taskId)
{
    u8 data2;
    u16 temp;
    s32 i, base;

    if (gTasks[taskId].data[10]++ == gTasks[taskId].data[1])
    {
        gTasks[taskId].data[10] = 0;
        data2 = gTasks[taskId].data[2];
        temp = gPlttBufferFaded[OBJ_PLTT_ID(data2) + 8];
        i = 7;
        base = PLTT_ID(data2);
        do
        {
            gPlttBufferFaded[base + OBJ_PLTT_OFFSET + 1 + i] = gPlttBufferFaded[base + OBJ_PLTT_OFFSET + i];
        } while (--i > 0);

        gPlttBufferFaded[base + OBJ_PLTT_OFFSET + 1] = temp;
    }
    if (--gTasks[taskId].data[0] == 0)
        DestroyAnimVisualTask(taskId);
}

static void AnimGustToTarget(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, TRUE);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = sprite->x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2) + gBattleAnimArgs[2];
    sprite->data[3] = sprite->y;
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[3];
    InitAnimLinearTranslation(sprite);
    sprite->callback = RunStoredCallbackWhenAffineAnimEnds;
    StoreSpriteCallbackInData6(sprite, AnimGustToTarget_Step);
}

static void AnimGustToTarget_Step(struct Sprite *sprite)
{
    if (AnimTranslateLinear(sprite))
        DestroyAnimSprite(sprite);
}

static void AnimAirWaveCrescent(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }
    if (IsContest())
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->x += gBattleAnimArgs[0];
    sprite->y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[4];
    if (gBattleAnimArgs[6] == 0)
    {
        sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
        sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    }
    else
    {
        SetAverageBattlerPositions(gBattleAnimTarget, 1, &sprite->data[2], &sprite->data[4]);
    }
    sprite->data[2] = sprite->data[2] + gBattleAnimArgs[2];
    sprite->data[4] = sprite->data[4] + gBattleAnimArgs[3];
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
    SeekSpriteAnim(sprite, gBattleAnimArgs[5]);
}

static void AnimFlyBallUp(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, TRUE);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->callback = AnimFlyBallUp_Step;
    gSprites[GetAnimBattlerSpriteId(ANIM_ATTACKER)].invisible = TRUE;
}

static void AnimFlyBallUp_Step(struct Sprite *sprite)
{
    if (sprite->data[0] > 0)
    {
        --sprite->data[0];
    }
    else
    {
        sprite->data[2] += sprite->data[1];
        sprite->y2 -= (sprite->data[2] >> 8);
    }
    if (sprite->y + sprite->y2 < -32)
        DestroyAnimSprite(sprite);
}

static void AnimFlyBallAttack(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        sprite->x = DISPLAY_WIDTH + 32;
        sprite->y = -32;
        StartSpriteAffineAnim(sprite, 1);
    }
    else
    {
        sprite->x = -32;
        sprite->y = -32;
    }
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = sprite->x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
    sprite->data[3] = sprite->y;
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    InitAnimLinearTranslation(sprite);
    sprite->callback = AnimFlyBallAttack_Step;
}

static void AnimFlyBallAttack_Step(struct Sprite *sprite)
{
    sprite->data[0] = 1;
    AnimTranslateLinear(sprite);
    if (((u16)sprite->data[3] >> 8) > 200)
    {
        sprite->x += sprite->x2;
        sprite->x2 = 0;
        sprite->data[3] &= 0xFF;
    }
    if (sprite->x + sprite->x2 < -32
     || sprite->x + sprite->x2 > DISPLAY_WIDTH + 32
     || sprite->y + sprite->y2 > DISPLAY_HEIGHT)
    {
        gSprites[GetAnimBattlerSpriteId(ANIM_ATTACKER)].invisible = FALSE;
        DestroyAnimSprite(sprite);
    }
}

void DestroyAnimSpriteAfterTimer(struct Sprite *sprite)
{
    if (sprite->data[0]-- <= 0)
    {
        if (sprite->oam.affineMode & ST_OAM_AFFINE_ON_MASK)
        {
            FreeOamMatrix(sprite->oam.matrixNum);
            sprite->oam.affineMode = ST_OAM_AFFINE_OFF;
        }
        DestroySprite(sprite);
        --gAnimVisualTaskCount;
    }
}

struct FeatherDanceData
{
    u16 unk0_0a:1;
    u16 unk0_0b:1;
    u16 unk0_0c:1;
    u16 unk0_0d:1;
    u16 unk0_1:4;
    u16 unk1:8;
    u16 unk2;
    s16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u8 unkC[2];
    u16 unkE_0:1;
    u16 unkE_1:15;
};

static void AnimFallingFeather(struct Sprite *sprite)
{
    u8 battler, matrixNum, sinIndex;
    s16 spriteCoord, sinVal;
    struct FeatherDanceData *data = (struct FeatherDanceData *)sprite->data;

    if (gBattleAnimArgs[7] & 0x100)
        battler = gBattleAnimAttacker;
    else
        battler = gBattleAnimTarget;
    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    sprite->x = GetBattlerSpriteCoord(battler, BATTLER_COORD_ATTR_HEIGHT) + gBattleAnimArgs[0];
    spriteCoord = GetBattlerSpriteCoord(battler, BATTLER_COORD_ATTR_WIDTH);
    sprite->y = spriteCoord + gBattleAnimArgs[1];
    data->unk8 = sprite->y << 8;
    data->unkE_1 = spriteCoord + gBattleAnimArgs[6];
    data->unk0_0c = 1;
    data->unk2 = gBattleAnimArgs[2] & 0xFF;
    data->unkA = (gBattleAnimArgs[2] >> 8) & 0xFF;
    data->unk4 = gBattleAnimArgs[3];
    data->unk6 = gBattleAnimArgs[4];
    *(u16 *)(data->unkC) = gBattleAnimArgs[5];
    if (data->unk2 >= 64 && data->unk2 <= 191)
    {
        if (!IsContest())
            sprite->oam.priority = GetBattlerSpriteBGPriority(battler) + 1;
        else
            sprite->oam.priority = GetBattlerSpriteBGPriority(battler);
        data->unkE_0 = 0;
        if (!(data->unk4 & 0x8000))
        {
            sprite->hFlip ^= 1;
            sprite->animNum = sprite->hFlip;
            sprite->animBeginning = TRUE;
            sprite->animEnded = FALSE;
        }
    }
    else
    {
        sprite->oam.priority = GetBattlerSpriteBGPriority(battler);
        data->unkE_0 = 1;
        if (data->unk4 & 0x8000)
        {
            sprite->hFlip ^= 1;
            sprite->animNum = sprite->hFlip;

            sprite->animBeginning = TRUE;
            sprite->animEnded = FALSE;
        }
    }
    data->unk0_1 = data->unk2 >> 6;
    sprite->x2 = (gSineTable[data->unk2] * data->unkC[0]) >> 8;
    matrixNum = sprite->oam.matrixNum;
    sinIndex = (-sprite->x2 >> 1) + data->unkA;
    sinVal = gSineTable[sinIndex];
    gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d = gSineTable[sinIndex + 64];
    if (sprite)
    {
        gOamMatrices[matrixNum].b = sinVal;
        gOamMatrices[matrixNum].c = -sinVal;
    }
    else // pointless, exactly the same
    {
        gOamMatrices[matrixNum].b = sinVal;
        gOamMatrices[matrixNum].c = -sinVal;
    }
    sprite->callback = AnimFallingFeather_Step;
}

static void AnimFallingFeather_Step(struct Sprite *sprite)
{
    u8 matrixNum, sinIndex;
    s16 sinVal = 0;
    struct FeatherDanceData *data = (struct FeatherDanceData *)sprite->data;
    if (data->unk0_0a)
    {
        if (data->unk1-- % 256 == 0)
        {
            data->unk0_0a = 0;
            data->unk1 = 0;
        }
    }
    else
    {
        switch (data->unk2 / 64)
        {
        case 0: 
            if ((u8)data->unk0_1 == 1) //casts to u8 here are necessary for matching
            {
                data->unk0_0d = 1;
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if ((u8)data->unk0_1 == 3)
            {
                data->unk0_0b ^= 1;
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if (data->unk0_0d)
            {
                sprite->hFlip ^= 1;
                sprite->animNum = sprite->hFlip;
                sprite->animBeginning = TRUE;
                sprite->animEnded = FALSE;
                if (data->unk0_0c)
                {
                    if (!IsContest())
                    {
                        if (!data->unkE_0)
                        {
                            --sprite->oam.priority;
                            data->unkE_0 ^= 1;
                        }
                        else
                        {
                            ++sprite->oam.priority;
                            data->unkE_0 ^= 1;
                        }
                    }
                    else
                    {
                        if (!data->unkE_0)
                        {
                            sprite->subpriority -= 12;
                            data->unkE_0 ^= 1;
                        }
                        else
                        {
                            sprite->subpriority += 12;
                            data->unkE_0 ^= 1;
                        }
                    }
                }
                data->unk0_0d = 0;
                data->unk2;
            }
            data->unk0_1 = 0;
            break;
        case 1:
            if ((u8)data->unk0_1 == 0)
            {
                data->unk0_0d = 1;
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if ((u8)data->unk0_1 == 2)
            {
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if (data->unk0_0d)
            {
                sprite->hFlip ^= 1;
                sprite->animNum = sprite->hFlip;
                sprite->animBeginning = TRUE;
                sprite->animEnded = FALSE;
                if (data->unk0_0c)
                {
                    if (!IsContest())
                    {
                        if (!data->unkE_0)
                        {
                            --sprite->oam.priority;
                            data->unkE_0 ^= 1;
                        }
                        else
                        {
                            ++sprite->oam.priority;
                            data->unkE_0 ^= 1;
                        }
                    }
                    else
                    {
                        if (!data->unkE_0)
                        {
                            sprite->subpriority -= 12;
                            data->unkE_0 ^= 1;
                        }
                        else
                        {
                            sprite->subpriority += 12;
                            data->unkE_0 ^= 1;
                        }
                    }
                }
                data->unk0_0d = 0;
            }
            data->unk0_1 = 1;
            break;
        case 2:
            if ((u8)data->unk0_1 == 3)
            {
                data->unk0_0d = 1;
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if ((u8)data->unk0_1 == 1)
            {
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if (data->unk0_0d)
            {
                sprite->hFlip ^= 1;
                sprite->animNum = sprite->hFlip;
                sprite->animBeginning = TRUE;
                sprite->animEnded = FALSE;
                if (data->unk0_0c)
                {
                    if (!IsContest())
                    {
                        if (!data->unkE_0)
                        {
                            --sprite->oam.priority;
                            data->unkE_0 ^= 1;
                        }
                        else
                        {
                            ++sprite->oam.priority;
                            data->unkE_0 ^= 1;
                        }
                    }
                    else
                    {
                        if (!data->unkE_0)
                        {
                            sprite->subpriority -= 12;
                            data->unkE_0 ^= 1;
                        }
                        else
                        {
                            sprite->subpriority += 12;
                            data->unkE_0 ^= 1;
                        }
                    }
                }
                data->unk0_0d = 0;
            }
            data->unk0_1 = 2;
            break;
        case 3:
            if ((u8)data->unk0_1 == 2)
            {
                data->unk0_0d = 1;
            }
            else if ((u8)data->unk0_1 == 0)
            {
                data->unk0_0b ^= 1;
                data->unk0_0a = 1;
                data->unk1 = 0;
            }
            else if (data->unk0_0d)
            {
                sprite->hFlip ^= 1;
                sprite->animNum = sprite->hFlip;
                sprite->animBeginning = TRUE;
                sprite->animEnded = FALSE;
                if (data->unk0_0c)
                {
                    if (!IsContest())
                    {
                        if (!data->unkE_0)
                        {
                            --sprite->oam.priority;
                            data->unkE_0 ^= 1;
                        }
                        else
                        {
                            ++sprite->oam.priority;
                            data->unkE_0 ^= 1;
                        }
                    }
                    else
                    {
                        if (!data->unkE_0)
                        {
                            sprite->subpriority -= 12;
                            data->unkE_0 ^= 1;
                        }
                        else
                        {
                            sprite->subpriority += 12;
                            data->unkE_0 ^= 1;
                        }
                    }
                }
                data->unk0_0d = 0;
            }
            data->unk0_1 = 3;
            break;
        }

        sprite->x2 = ((s32)data->unkC[data->unk0_0b] * gSineTable[data->unk2]) >> 8;
        matrixNum = sprite->oam.matrixNum;

        sinIndex = (-sprite->x2 >> 1) + data->unkA;
        sinVal = gSineTable[sinIndex];

        gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d = gSineTable[sinIndex + 64];
        gOamMatrices[matrixNum].b = sinVal;
        gOamMatrices[matrixNum].c = -sinVal;

        data->unk8 += data->unk6;
        sprite->y = data->unk8 >> 8;
        if (data->unk4 & 0x8000)
            data->unk2 = (data->unk2 - (data->unk4 & 0x7FFF)) & 0xFF;
        else
            data->unk2 = (data->unk2 + (data->unk4 & 0x7FFF)) & 0xFF;

        if (sprite->y + sprite->y2 >= data->unkE_1)
        {
            sprite->data[0] = 0;
            sprite->callback = DestroyAnimSpriteAfterTimer;
        }
    }
}

static void AnimUnusedBubbleThrow(struct Sprite *sprite)
{
    sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget);
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->callback = TranslateAnimSpriteToTargetMonLocation;
}

static void AnimUnusedFeather(struct Sprite *sprite)
{
    u8 matrixNum;
    s16 rn, sinVal;

    sprite->data[1] = gBattleAnimArgs[0];
    sprite->data[2] = gBattleAnimArgs[1];
    sprite->data[3] = gBattleAnimArgs[2];
    if (!IsContest())
    {
        if (gBattlerPositions[gBattleAnimTarget] & B_POSITION_OPPONENT_LEFT)
            sprite->data[7] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_ATTR_WIDTH) + gBattleAnimArgs[3];
        else
            sprite->data[7] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_ATTR_WIDTH) + 40;
        if (gBattleAnimArgs[4])
            sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget) + 1;
        else
            sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget);
    }
    else
    {
        sprite->data[7] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_ATTR_WIDTH) + gBattleAnimArgs[3];
    }
    sprite->data[4] = gSineTable[sprite->data[1] & 0xFF];
    sprite->data[5] = -gSineTable[(sprite->data[1] & 0xFF) + 64];
    sprite->data[6] = 0;
    sprite->y2 = 0;
    sprite->x2 = 0;
    matrixNum = sprite->oam.matrixNum;
    sprite->data[1] = (u16)sprite->data[1] >> 8;
    rn = Random();
    if (rn & 0x8000)
        sprite->data[1] = 0xFF - sprite->data[1];
    sinVal = gSineTable[sprite->data[1]];
    gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d = gSineTable[sprite->data[1] + 64];
    gOamMatrices[matrixNum].b = sinVal;
    gOamMatrices[matrixNum].c = -sinVal;
    sprite->animBeginning = TRUE;
    sprite->animEnded = FALSE;
    if (rn & 1)
    {
        sprite->animNum = 1;
        sprite->hFlip = TRUE;
    }
    sprite->callback = AnimUnusedFeather_Step;
}

static void AnimUnusedFeather_Step(struct Sprite *sprite)
{
    struct FeatherDanceData fData;
    struct FeatherDanceData *tData = (struct FeatherDanceData *)sprite->data;
    u8 item;
    u32 x, y;

    ++sprite->data[0];
    if (sprite->data[0] <= 4)
        return;
    sprite->x2 = (sprite->data[4] * sprite->data[6]) >> 8;
    sprite->y2 = (sprite->data[5] * sprite->data[6]) >> 8;
    sprite->data[6] += sprite->data[3] & 0xFF;
    if (sprite->data[6] < (sprite->data[2] & 0xFF))
        return;
    sprite->x += sprite->x2;
    sprite->y += sprite->y2;
    sprite->x2 = 0;
    sprite->y2 = 0;
    memcpy(&fData, tData, sizeof(struct FeatherDanceData));
    memset(tData, 0, sizeof(struct FeatherDanceData));
    tData->unk8 = sprite->y << 8;
    tData->unk6 = fData.unk6 >> 8;
    tData->unk2 = 0;
    tData->unkA = fData.unk2;
    if (sprite->animNum != 0)
    {
        if (tData->unk6 & 8)
            tData->unk4 = 0x8001;
        else
            tData->unk4 = 0x8002;
    }
    else if (tData->unk6 & 8)
    {
        tData->unk4 = 1;
    }
    else
    {
        tData->unk4 = 2;
    }
    item = fData.unk4 >> 8;
    tData->unkC[0] = item;
    tData->unkC[1] = item - 2;
    x = (((u16 *)&fData)[7] << 1);
    y = (((u16 *)tData)[7] & 1);
    ((u16 *)tData)[7] = y | x;
    sprite->callback = AnimFallingFeather_Step;
}

static void AnimWhirlwindLine(struct Sprite *sprite)
{
    u16 arg;
    u8 mult;

    if (gBattleAnimArgs[2] == ANIM_ATTACKER)
        InitSpritePosToAnimAttacker(sprite, 0);
    else
        InitSpritePosToAnimTarget(sprite, FALSE);
    if ((gBattleAnimArgs[2] == ANIM_ATTACKER && GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
     || (gBattleAnimArgs[2] == ANIM_TARGET && GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER))
        sprite->x += 8;
    SeekSpriteAnim(sprite, gBattleAnimArgs[4]);
    sprite->x -= 32;
    sprite->data[1] = 0x0ccc;
    arg = gBattleAnimArgs[4];
    mult = 12;
    sprite->x2 += mult * arg;
    sprite->data[0] = arg;
    sprite->data[7] = gBattleAnimArgs[3];
    sprite->callback = AnimWhirlwindLine_Step;
}

static void AnimWhirlwindLine_Step(struct Sprite *sprite)
{
    sprite->x2 += sprite->data[1] >> 8;
    if (++sprite->data[0] == 6)
    {
        sprite->data[0] = 0;
        sprite->x2 = 0;
        StartSpriteAnim(sprite, 0);
    }

    if (--sprite->data[7] == -1)
        DestroyAnimSprite(sprite);
}

void AnimTask_DrillPeckHitSplats(u8 taskId)
{
    if (!(gTasks[taskId].data[0] % 32))
    {
        ++gAnimVisualTaskCount;
        gBattleAnimArgs[0] = Sin(gTasks[taskId].data[0], -13);
        gBattleAnimArgs[1] = Cos(gTasks[taskId].data[0], -13);
        gBattleAnimArgs[2] = 1;
        gBattleAnimArgs[3] = 3;
        CreateSpriteAndAnimate(&gFlashingHitSplatSpriteTemplate,
                               GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2),
                               GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET),
                               3);
    }
    gTasks[taskId].data[0] += 8;
    if (gTasks[taskId].data[0] > 255)
        DestroyAnimVisualTask(taskId);
}

static void AnimBounceBallShrink(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        InitSpritePosToAnimAttacker(sprite, 1);
        gSprites[GetAnimBattlerSpriteId(ANIM_ATTACKER)].invisible = TRUE;
        ++sprite->data[0];
        break;
    case 1:
        if (sprite->affineAnimEnded)
            DestroyAnimSprite(sprite);
        break;
    }
}

static void AnimBounceBallLand(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y);
        sprite->y2 = -sprite->y - 32;
        ++sprite->data[0];
        break;
    case 1:
        sprite->y2 += 10;
        if (sprite->y2 >= 0)
            ++sprite->data[0];
        break;
    case 2:
        sprite->y2 -= 10;
        if (sprite->y + sprite->y2 < -32)
        {
            gSprites[GetAnimBattlerSpriteId(ANIM_ATTACKER)].invisible = FALSE;
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

static void AnimSteamrollerLand(struct Sprite *sprite)
{
    u8 targetSpriteId = GetAnimBattlerSpriteId(ANIM_TARGET);

    s16 shakeX2 = 0;
    if (targetSpriteId != SPRITE_NONE)
        shakeX2 = gSprites[targetSpriteId].x2;

    switch (sprite->data[0])
    {
        case 0:
        sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y);
        sprite->y2 = -sprite->y - 64;

        sprite->data[1] = gBattleAnimArgs[0];
        sprite->data[2] = 0;

        sprite->animPaused = TRUE;
        sprite->data[0]++;
        break;

    case 1:
        sprite->x2 = shakeX2 + sprite->data[2];

        sprite->y2 += 10;
        if (sprite->y2 >= 0)
        {
            sprite->y2 = 0;
            sprite->data[0]++;
        }
        break;

    case 2:
        sprite->x2 = shakeX2;
        sprite->y2 = 0;

        if (sprite->data[1] != 0)
            sprite->data[1]--;
        else
        {
            sprite->animPaused = FALSE; 
            StartSpriteAnim(sprite, 0);
            sprite->data[0]++;
        }
        break;

    case 3: 
        sprite->y2 = 0;

        sprite->data[2] += 1;
        sprite->x2 = sprite->data[2];

        if (sprite->x + sprite->x2 > DISPLAY_WIDTH + 64)
            DestroyAnimSprite(sprite);
        break;
    }
}

static void SetHealthboxGroupInvisible(u8 battlerId, bool8 invisible)
{
    u8 hbId;
    u8 i;

    if (battlerId >= MAX_BATTLERS_COUNT)
        return;

    hbId = gHealthboxSpriteIds[battlerId];
    if (hbId == SPRITE_NONE)
        return;

    // Hide the main healthbox sprite.
    gSprites[hbId].invisible = invisible;

    // FRLG healthbox uses extra sprites stored in the healthbox sprite's data[].
    // Some entries may be 0xFF / SPRITE_NONE depending on context.
    for (i = 0; i < ARRAY_COUNT(gSprites[hbId].data); i++)
    {
        u8 linkedId = (u8)gSprites[hbId].data[i];
        if (linkedId != SPRITE_NONE && linkedId < MAX_SPRITES)
            gSprites[linkedId].invisible = invisible;
    }
}

void AnimTask_SetHealthboxesInvisible(u8 taskId)
{
    u8 i;
    bool8 visible = (gBattleAnimArgs[0] != 0);

    for (i = 0; i < gBattlersCount; i++)
        SetHealthboxGroupInvisible(i, !visible);

    DestroyAnimVisualTask(taskId);
}

static void AnimBusDrive(struct Sprite *sprite)
{
    s16 speed;
    s16 spawnY;

    speed = (s16)gBattleAnimArgs[0];
    if (speed <= 0)
        speed = 1;

    switch (sprite->data[0])
    {
    // -----------------------------------
    // INIT
    // -----------------------------------
    case 0:
        // Determine Y position based on new argument
        switch (gBattleAnimArgs[2])
        {
        case 0: // attacker
            spawnY = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y) + 4;
            break;
        case 1: // target
            spawnY = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y) + 4;
            break;
        case 2: // fixed
        default:
            spawnY = 70;
            break;
        }

        sprite->y = spawnY;
        sprite->y2 = 0;

        sprite->data[1] = speed;
        sprite->data[2] = 0;

        // Determine which half this is
        if (gBattleAnimArgs[1] == 0)
        {
            // LEFT HALF
            sprite->x = -128;
        }
        else
        {
            // RIGHT HALF
            sprite->x = -64;
        }

        sprite->x2 = 0;

        StartSpriteAnim(sprite, 0);

        sprite->data[0] = 1;
        break;

    // -----------------------------------
    // MOVE
    // -----------------------------------
    case 1:
        sprite->data[2] += sprite->data[1];
        sprite->x2 = sprite->data[2];

        // Destroy once fully off right side
        if (sprite->x + sprite->x2 > DISPLAY_WIDTH + 64)
            DestroyAnimSprite(sprite);

        break;
    }
}

static void AnimBulldozer(struct Sprite *sprite)
{
    u8 targetBattler;
    s16 targetY;
    s16 speed;
    bool8 targetIsPlayerSide;

    targetBattler = gBattleAnimTarget;
    targetY = GetBattlerSpriteCoord(targetBattler, BATTLER_COORD_Y);

    speed = (s16)gBattleAnimArgs[0];
    if (speed <= 0)
        speed = 4;

    switch (sprite->data[0])
    {
    case 0:
        targetIsPlayerSide = (GetBattlerSide(targetBattler) == B_SIDE_PLAYER);

        sprite->y = targetY + 4;
        sprite->y2 = 0;

        // +1 = move right, -1 = move left
        sprite->data[7] = targetIsPlayerSide ? -1 : 1;

        if (sprite->data[7] > 0)
        {
            // Enter from left, drive right
            sprite->x = -32;
            sprite->x2 = 0;
            
            sprite->oam.matrixNum &= ~ST_OAM_HFLIP;
        }
        else
        {
            // Enter from right, drive left
            sprite->x = DISPLAY_WIDTH + 32;
            sprite->x2 = 0;
            sprite->oam.matrixNum |= ST_OAM_HFLIP;
        }

        // Start the 4-frame loop immediately (remove if you want static)
        StartSpriteAnim(sprite, 0);

        sprite->data[1] = speed; // speed
        sprite->data[2] = 0;     // travel accumulator
        sprite->data[0] = 1;
        break;

    case 1:
        sprite->data[2] += sprite->data[7] * sprite->data[1];
        sprite->x2 = sprite->data[2];

        if (sprite->data[7] > 0)
        {
            if (sprite->x + sprite->x2 > DISPLAY_WIDTH + 32)
                DestroyAnimSprite(sprite);
        }
        else
        {
            if (sprite->x + sprite->x2 < -32)
                DestroyAnimSprite(sprite);
        }
        break;
    }
}

static void AnimSkateboarder(struct Sprite *sprite)
{
    u8 targetBattler;
    s16 targetY;
    s16 speed;
    bool8 targetIsPlayerSide;
    u8 spriteId = sprite - gSprites;

    targetBattler = gBattleAnimTarget;
    targetY = GetBattlerSpriteCoord(targetBattler, BATTLER_COORD_Y);

    speed = (s16)gBattleAnimArgs[0];
    if (speed <= 0)
        speed = 4;

    switch (sprite->data[0])
    {
    // INITIALISE
    case 0:
        targetIsPlayerSide = (GetBattlerSide(targetBattler) == B_SIDE_PLAYER);

        sprite->y = targetY + 4;
        sprite->data[6] = sprite->y; // store starting Y

        sprite->y2 = 0;

        sprite->data[7] = targetIsPlayerSide ? -1 : 1;

        if (sprite->data[7] > 0)
        {
            sprite->x = -32;
            sprite->oam.matrixNum &= ~ST_OAM_HFLIP;
        }
        else
        {
            sprite->x = DISPLAY_WIDTH + 32;
            sprite->oam.matrixNum |= ST_OAM_HFLIP;
        }

        StartSpriteAnim(sprite, 0);

        sprite->data[1] = speed;
        sprite->data[2] = 0;

        sprite->data[3] = 0;                         // frame counter
        sprite->data[4] = gBattleAnimArgs[1];        // jump trigger frame
        sprite->data[5] = gBattleAnimArgs[2];        // vertical velocity

        sprite->data[0] = 1;
        break;

    // MOVEMENT
    case 1:
        // horizontal movement
        sprite->data[2] += sprite->data[7] * sprite->data[1];
        sprite->x2 = sprite->data[2];

        // wait until jump frame
        sprite->data[3]++;
        if (sprite->data[3] >= sprite->data[4])
            sprite->data[0] = 2;

        break;

    // JUMP PHYSICS
    case 2:
        sprite->data[2] += sprite->data[7] * sprite->data[1];
        sprite->x2 = sprite->data[2];

        // apply vertical velocity
        sprite->y2 -= sprite->data[5];

        // gravity
        sprite->data[4]++;
        if (sprite->data[4] % 2 == 0)
            sprite->data[5]--;

        // flip sprite (360° during jump)
        sprite->data[3] += 2300;   // rotation speed

        TrySetSpriteRotScale(sprite, 1, 0x100, 0x100, sprite->data[3]);

        // landing condition
        if (sprite->y + sprite->y2 >= sprite->data[6])
        {
            sprite->y2 = 0;
            ResetSpriteRotScale(spriteId);
            sprite->data[0] = 3;
        }

        break;

    // CONTINUE DRIVING
    case 3:
        sprite->data[2] += sprite->data[7] * sprite->data[1];
        sprite->x2 = sprite->data[2];

        if (sprite->data[7] > 0)
        {
            if (sprite->x + sprite->x2 > DISPLAY_WIDTH + 32)
                DestroyAnimSprite(sprite);
        }
        else
        {
            if (sprite->x + sprite->x2 < -32)
                DestroyAnimSprite(sprite);
        }

        break;
    }
}


void AnimTask_PushTargetOffscreen(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u8 battler;

    // Which battler?
    if (gBattleAnimArgs[0] == ANIM_ATTACKER)
        battler = gBattleAnimAttacker;
    else if (gBattleAnimArgs[0] == ANIM_TARGET)
        battler = gBattleAnimTarget;
    else if (gBattleAnimArgs[0] == ANIM_ATK_PARTNER)
        battler = BATTLE_PARTNER(gBattleAnimAttacker);
    else // ANIM_DEF_PARTNER
        battler = BATTLE_PARTNER(gBattleAnimTarget);

    task->data[0] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]); // spriteId (SPRITE_NONE if not visible)
    task->data[1] = battler;                                    // battler id

    // Direction:
    // 0 => auto: if target is player side, push left; else push right
    // 1 => force right
    // -1 => force left
    task->data[2] = (s16)gBattleAnimArgs[1];
    if (task->data[2] == 0)
        task->data[2] = (GetBattlerSide(battler) == B_SIDE_PLAYER) ? -1 : 1;
    else if (task->data[2] > 0)
        task->data[2] = 1;
    else
        task->data[2] = -1;

    // Speed
    task->data[3] = (s16)gBattleAnimArgs[2];
    if (task->data[3] <= 0)
        task->data[3] = 4;

    // Timers
    task->data[4] = (s16)gBattleAnimArgs[3]; // pushTime
    if (task->data[4] < 0) task->data[4] = 0;

    task->data[5] = (s16)gBattleAnimArgs[4]; // duration (0 => until offscreen)
    if (task->data[5] < 0) task->data[5] = 0;

    task->data[6] = (s16)gBattleAnimArgs[5]; // restore flag (0/1)
    task->data[7] = 0;                       // phase: 0 waiting, 1 pushing

    task->data[8]  = 0; // wait counter
    task->data[9]  = 0; // push counter
    task->data[10] = 0; // accumulated x2 we apply

    // If target sprite isn't visible, end immediately (prevents waitforvisualfinish hangs)
    if (task->data[0] == SPRITE_NONE)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    task->func = AnimTask_PushTargetOffscreen_Step;
}

static void AnimTask_PushTargetOffscreen_Step(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u8 spriteId = (u8)task->data[0];
    s16 dir = task->data[2];
    s16 spd = task->data[3];

    // Safety
    if (spriteId >= MAX_SPRITES)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    // Phase 0: wait pushTime frames
    if (task->data[7] == 0)
    {
        if (++task->data[8] >= task->data[4])
            task->data[7] = 1;
        return;
    }

    // Phase 1: push
    task->data[10] += dir * spd;
    gSprites[spriteId].x2 = task->data[10];

    // If duration is set, push for exactly that many frames
    if (task->data[5] != 0)
    {
        if (++task->data[9] >= task->data[5])
        {
            if (task->data[6] != 0)
                gSprites[spriteId].x2 = 0;
            DestroyAnimVisualTask(taskId);
        }
        return;
    }

    // Duration=0 => push until sprite goes offscreen
    {
        s16 x = gSprites[spriteId].x + gSprites[spriteId].x2;

        // generous bounds: offscreen by 32px
        if (x < -32 || x > DISPLAY_WIDTH + 32)
        {
            if (task->data[6] != 0)
                gSprites[spriteId].x2 = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
}

static void AnimDiveBall(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->callback = AnimDiveBall_Step1;
    gSprites[GetAnimBattlerSpriteId(ANIM_ATTACKER)].invisible = TRUE;
}

static void AnimDiveBall_Step1(struct Sprite *sprite)
{
    if (sprite->data[0] > 0)
    {
        --sprite->data[0];
    }
    else if (sprite->y + sprite->y2 > -32)
    {
        sprite->data[2] += sprite->data[1];
        sprite->y2 -= (sprite->data[2] >> 8);
    }
    else
    {
        sprite->invisible = TRUE;
        if (sprite->data[3]++ > 20)
            sprite->callback = AnimDiveBall_Step2;
    }
}

static void AnimDiveBall_Step2(struct Sprite *sprite)
{
    sprite->y2 += sprite->data[2] >> 8;
    if (sprite->y + sprite->y2 > -32)
        sprite->invisible = FALSE;
    if (sprite->y2 > 0)
        DestroyAnimSprite(sprite);
}

static void AnimDiveWaterSplash(struct Sprite *sprite)
{
    u32 matrixNum;
    s32 t1, t2;

    switch (sprite->data[0])
    {
    case 0:
        if (!gBattleAnimArgs[0])
        {
            sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X);
            sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y);
        }
        else
        {
            sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X);
            sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y);
        }
        sprite->data[1] = 512;
        TrySetSpriteRotScale(sprite, 0, 256, sprite->data[1], 0);
        ++sprite->data[0];
        break;
    case 1:
        if (sprite->data[2] <= 11)
            sprite->data[1] -= 40;
        else
            sprite->data[1] += 40;
        ++sprite->data[2];
        TrySetSpriteRotScale(sprite, 0, 256, sprite->data[1], 0);
        matrixNum = sprite->oam.matrixNum;
        t1 = 15616;
        t2 = t1 / gOamMatrices[matrixNum].d + 1;
        if (t2 > 128)
            t2 = 128;
        t2 = (64 - t2) / 2;
        sprite->y2 = t2;
        if (sprite->data[2] == 24)
        {
            TryResetSpriteAffineState(sprite);
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

// Launches a water droplet away from the specified battler. Used by Astonish and Dive
static void AnimSprayWaterDroplet(struct Sprite *sprite)
{
    s32 v1 = 0x1FF & Random();
    s32 v2 = 0x7F & Random();

    if (v1 % 2)
        sprite->data[0] = 736 + v1;
    else
        sprite->data[0] = 736 - v1;

    if (v2 % 2)
        sprite->data[1] = 896 + v2;
    else
        sprite->data[1] = 896 - v2;
    sprite->data[2] = gBattleAnimArgs[0];
    if (sprite->data[2])
        sprite->oam.matrixNum = ST_OAM_HFLIP;
    if (gBattleAnimArgs[1] == 0)
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y) + 32;
    }
    else
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y) + 32;
    }
    sprite->callback = AnimSprayWaterDroplet_Step;
}

static void AnimSprayWaterDroplet_Step(struct Sprite *sprite)
{
    if (sprite->data[2] == 0)
    {
        sprite->x2 += sprite->data[0] >> 8;
        sprite->y2 -= sprite->data[1] >> 8;
    }
    else
    {
        sprite->x2 -= sprite->data[0] >> 8;
        sprite->y2 -= sprite->data[1] >> 8;
    }
    sprite->data[0] = sprite->data[0];
    sprite->data[1] -= 32;
    if (sprite->data[0] < 0)
        sprite->data[0] = 0;
    if (++sprite->data[3] == 31)
        DestroyAnimSprite(sprite);
}

static void AnimUnusedFlashingLight(struct Sprite *sprite)
{
    sprite->data[6] = 0;
    sprite->data[7] = 64;
    sprite->callback = AnimUnusedFlashingLight_Step;
}

static void AnimUnusedFlashingLight_Step(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[1] > 8)
        {
            sprite->data[1] = 0;
            sprite->invisible ^= 1;
            if (++sprite->data[2] > 5 && sprite->invisible != FALSE)
                ++sprite->data[0];
        }
        break;
    case 1:
        DestroyAnimSprite(sprite);
        break;
    }
}

static void AnimSkyAttackBird(struct Sprite *sprite)
{
    u16 rotation;
    s16 posx = sprite->x;
    s16 posy = sprite->y;

    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->data[4] = sprite->x << 4;
    sprite->data[5] = sprite->y << 4;
    sprite->data[6] = ((posx - sprite->x) << 4) / 12;
    sprite->data[7] = ((posy - sprite->y) << 4) / 12;
    rotation = ArcTan2Neg(posx - sprite->x, posy - sprite->y);
    rotation += 49152;
    TrySetSpriteRotScale(sprite, 1, 0x100, 0x100, rotation);
    sprite->callback = AnimSkyAttackBird_Step;
}

static void AnimSkyAttackBird_Step(struct Sprite *sprite)
{
    sprite->data[4] += sprite->data[6];
    sprite->data[5] += sprite->data[7];
    sprite->x = sprite->data[4] >> 4;
    sprite->y = sprite->data[5] >> 4;
    if (sprite->x > DISPLAY_WIDTH + 45 || sprite->x < -45
     || sprite->y > 157 || sprite->y < -45)
        DestroySpriteAndMatrix(sprite);
}

// Unused
static void AnimTask_SetAttackerVisibility(u8 taskId)
{
    if (gBattleAnimArgs[0] == 0)
    {
        u8 spriteId = GetAnimBattlerSpriteId(ANIM_ATTACKER);

        gSprites[spriteId].invisible = TRUE;
    }
    else
    {
        u8 spriteId = GetAnimBattlerSpriteId(ANIM_ATTACKER);

        gSprites[spriteId].invisible = FALSE;
    }
    DestroyAnimVisualTask(taskId);
}

static void AnimMoltresKick(struct Sprite *sprite)
{
    s16 startX = gBattleAnimArgs[0];
    s16 startY = gBattleAnimArgs[1];
    s16 endX   = gBattleAnimArgs[2];
    s16 endY   = gBattleAnimArgs[3];
    s16 speed  = gBattleAnimArgs[4];
    u16 rotation;
    s32 dx = endX - startX;
    s32 dy = endY - startY;

    s32 dist = Sqrt(dx * dx + dy * dy);
    if (dist == 0)
        dist = 1;

    // ✅ Compute lifetime (frames)
    sprite->data[7] = dist / speed;
    if (sprite->data[7] == 0)
        sprite->data[7] = 1;

    // Position
    sprite->x = startX;
    sprite->y = startY;

    sprite->data[0] = startX << 4;
    sprite->data[1] = startY << 4;

    // Velocity (fixed-point, correct order)
    sprite->data[2] = ((dx << 4) * speed) / dist;
    sprite->data[3] = ((dy << 4) * speed) / dist;

    // Flame interval
    sprite->data[4] = gBattleAnimArgs[5]; // interval
    sprite->data[5] = 0;                  // frame counter

    // Lifetime counter
    sprite->data[6] = 0;

    // Rotation
    rotation = ArcTan2Neg(dx, dy) + 49152;
    TrySetSpriteRotScale(sprite, 1, 0x100, 0x100, rotation);

    sprite->callback = AnimMoltresKick_Step;
}


static void AnimMoltresKick_Step(struct Sprite *sprite)
{
    // Move
    sprite->data[0] += sprite->data[2];
    sprite->data[1] += sprite->data[3];

    sprite->x = sprite->data[0] >> 4;
    sprite->y = sprite->data[1] >> 4;

    // ✅ Lifetime tracking
    if (++sprite->data[6] >= sprite->data[7])
    {
        DestroySpriteAndMatrix(sprite);
    }
}
