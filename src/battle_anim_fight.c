#include "global.h"
#include "gflib.h"
#include "battle_anim.h"
#include "random.h"
#include "task.h"
#include "trig.h"
#include "constants/songs.h"

static void AnimUnusedHumanoidFoot(struct Sprite *sprite);
static void AnimSlideHandOrFootToTarget(struct Sprite *sprite);
static void AnimJumpKick(struct Sprite *sprite);
static void AnimBasicFistOrFoot(struct Sprite *sprite);
static void AnimFistOrFootRandomPos(struct Sprite *sprite);
static void AnimCrossChopHand(struct Sprite *sprite);
static void AnimSlidingKick(struct Sprite *sprite);
static void AnimSlidingHand(struct Sprite *sprite);
static void AnimSpinningKickOrPunch(struct Sprite *sprite);
static void AnimStompFoot(struct Sprite *sprite);
static void AnimDizzyPunchDuck(struct Sprite *sprite);
static void AnimBrickBreakWall(struct Sprite *sprite);
static void AnimBrickBreakWallShard(struct Sprite *sprite);
static void AnimSuperpowerOrb(struct Sprite *sprite);
static void AnimSuperpowerRock(struct Sprite *sprite);
static void AnimFloatingRock(struct Sprite *sprite);
static void AnimSuperpowerFireball(struct Sprite *sprite);
static void AnimArmThrustHit(struct Sprite *sprite);
static void AnimRevengeScratch(struct Sprite *sprite);
static void AnimFocusPunchFist(struct Sprite *sprite);
static void AnimFistOrFootRandomPos_Step(struct Sprite *sprite);
static void AnimCrossChopHand_Step(struct Sprite *sprite);
static void AnimSlidingKick_Step(struct Sprite *sprite);
static void AnimSpinningKickOrPunchFinish(struct Sprite *sprite);
static void AnimStompFootStep(struct Sprite *sprite);
static void AnimStompFootEnd(struct Sprite *sprite);
static void AnimBrickBreakWall_Step(struct Sprite *sprite);
static void AnimBrickBreakWallShard_Step(struct Sprite *sprite);
static void AnimSuperpowerOrb_Step(struct Sprite *sprite);
static void AnimSuperpowerRock_Step1(struct Sprite *sprite);
static void AnimSuperpowerRock_Step2(struct Sprite *sprite);
static void AnimFloatingRock_Step1(struct Sprite *sprite);
static void AnimFloatingRock_Step2(struct Sprite *sprite);
static void AnimTask_CentennialKick_Step(u8 taskId);
static void AnimUselessCard(struct Sprite *sprite);

static const struct SpriteTemplate sUnusedHumanoidFootSpriteTemplate =
{
    .tileTag = ANIM_TAG_HUMANOID_FOOT,
    .paletteTag = ANIM_TAG_HUMANOID_FOOT,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimUnusedHumanoidFoot,
};

static const union AnimCmd sAnim_Fist[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_FootWide[] =
{
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_FootTall[] =
{
    ANIMCMD_FRAME(32, 1),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_HandLeft[] =
{
    ANIMCMD_FRAME(48, 1),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_HandRight[] =
{
    ANIMCMD_FRAME(48, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_HandsAndFeet[] =
{
    sAnim_Fist,
    sAnim_FootWide,
    sAnim_FootTall,
    sAnim_HandLeft,
    sAnim_HandRight,
};

const struct SpriteTemplate gKarateChopSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAnims_HandsAndFeet,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSlideHandOrFootToTarget,
};


static const union AnimCmd sAnim_UselessCard1[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_UselessCard2[] =
{
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_UselessCard3[] =
{
    ANIMCMD_FRAME(32, 1),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_UselessCard4[] =
{
    ANIMCMD_FRAME(48, 1),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_UselessCard5[] =
{
    ANIMCMD_FRAME(64, 1),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_UselessCards[] =
{
    sAnim_UselessCard1,
    sAnim_UselessCard2,
    sAnim_UselessCard3,
    sAnim_UselessCard4,
    sAnim_UselessCard5,
};

const struct SpriteTemplate gUselessCardSpriteTemplate =
{
    .tileTag = ANIM_TAG_USELESS_CARD,
    .paletteTag = ANIM_TAG_USELESS_CARD,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAnims_UselessCards,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimUselessCard,
};

const struct SpriteTemplate gJumpKickSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAnims_HandsAndFeet,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimJumpKick,
};

const struct SpriteTemplate gFistFootSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAnims_HandsAndFeet,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBasicFistOrFoot,
};

const struct SpriteTemplate gAccelebrockSpriteTemplate =
{
    .tileTag = ANIM_TAG_BROCKS,
    .paletteTag = ANIM_TAG_BROCKS,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAnims_HandsAndFeet,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBasicFistOrFoot,
};

const struct SpriteTemplate gFistFootRandomPosSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAnims_HandsAndFeet,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimFistOrFootRandomPos,
};

const struct SpriteTemplate gLossHandRandomPosSpriteTemplate =
{
    .tileTag = ANIM_TAG_LOSS_HANDS,
    .paletteTag = ANIM_TAG_LOSS_HANDS,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAnims_HandsAndFeet,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimFistOrFootRandomPos,
};

const struct SpriteTemplate gFistFootStaticSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAnims_HandsAndFeet,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

const struct SpriteTemplate gCrossChopHandSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sAnims_HandsAndFeet[3],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimCrossChopHand,
};

const struct SpriteTemplate gSlidingKickSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sAnims_HandsAndFeet[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSlidingKick,
};

const struct SpriteTemplate gSlidingHandSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sAnims_HandsAndFeet[3],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSlidingHand,
};

static const union AffineAnimCmd sAffineAnim_SpinningHandOrFoot[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(-0x8, -0x8, 20, 1),
    AFFINEANIMCMD_JUMP(1),
};

static const union AffineAnimCmd *const sAffineAnims_SpinningHandOrFoot[] =
{
    sAffineAnim_SpinningHandOrFoot,
};

// Blaze Kick / Meteor Mash
const struct SpriteTemplate gSpinningHandOrFootSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = sAnims_HandsAndFeet,
    .images = NULL,
    .affineAnims = sAffineAnims_SpinningHandOrFoot,
    .callback = AnimSpinningKickOrPunch,
};

static const union AffineAnimCmd sAffineAnim_MegaPunchKick[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(-0x4, -0x4, 20, 1),
    AFFINEANIMCMD_JUMP(1),
};

static const union AffineAnimCmd *const sAffineAnims_MegaPunchKick[] =
{
    sAffineAnim_MegaPunchKick,
};

const struct SpriteTemplate gMegaPunchKickSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = sAnims_HandsAndFeet,
    .images = NULL,
    .affineAnims = sAffineAnims_MegaPunchKick,
    .callback = AnimSpinningKickOrPunch,
};

const struct SpriteTemplate gShoeKickSpriteTemplate =
{
    .tileTag = ANIM_TAG_SHOEPRINT,
    .paletteTag = ANIM_TAG_SHOEPRINT,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_MegaPunchKick,
    .callback = AnimSpinningKickOrPunch,
};

const struct SpriteTemplate gRageSnoutSpriteTemplate =
{
    .tileTag = ANIM_TAG_RAGE_SNOUT,
    .paletteTag = ANIM_TAG_RAGE_SNOUT,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_MegaPunchKick,
    .callback = AnimSpinningKickOrPunch,
};

const struct SpriteTemplate gMartStrikeSpriteTemplate =
{
    .tileTag = ANIM_TAG_MART,
    .paletteTag = ANIM_TAG_MART,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_MegaPunchKick,
    .callback = AnimSpinningKickOrPunch,
};

const struct SpriteTemplate gStompFootSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sAnims_HandsAndFeet[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimStompFoot,
};

const struct SpriteTemplate gStompShoeSpriteTemplate =
{
    .tileTag = ANIM_TAG_SHOEPRINT,
    .paletteTag = ANIM_TAG_SHOEPRINT,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimStompFoot,
};

const struct SpriteTemplate gDizzyPunchDuckSpriteTemplate =
{
    .tileTag = ANIM_TAG_DUCK,
    .paletteTag = ANIM_TAG_DUCK,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimDizzyPunchDuck,
};

const struct SpriteTemplate gBrickBreakWallSpriteTemplate =
{
    .tileTag = ANIM_TAG_BLUE_LIGHT_WALL,
    .paletteTag = ANIM_TAG_BLUE_LIGHT_WALL,
    .oam = &gOamData_AffineOff_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBrickBreakWall,
};

const struct SpriteTemplate gBrickBreakWallShardSpriteTemplate =
{
    .tileTag = ANIM_TAG_TORN_METAL,
    .paletteTag = ANIM_TAG_TORN_METAL,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBrickBreakWallShard,
};

const struct SpriteTemplate gVaseShardSpriteTemplate =
{
    .tileTag = ANIM_TAG_SHATTERED_VASE,
    .paletteTag = ANIM_TAG_SHATTERED_VASE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBrickBreakWallShard,
};

static const union AffineAnimCmd sAffineAnim_SuperpowerOrb[] =
{
    AFFINEANIMCMD_FRAME(0x20, 0x20, 0, 0),
    AFFINEANIMCMD_FRAME(0x4, 0x4, 0, 64),
    AFFINEANIMCMD_FRAME(-0x6, -0x6, 0, 8),
    AFFINEANIMCMD_FRAME(0x6, 0x6, 0, 8),
    AFFINEANIMCMD_JUMP(2),
};

static const union AffineAnimCmd *const sAffineAnims_SuperpowerOrb[] =
{
    sAffineAnim_SuperpowerOrb,
};

const struct SpriteTemplate gSuperpowerOrbSpriteTemplate =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_AffineDouble_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_SuperpowerOrb,
    .callback = AnimSuperpowerOrb,
};

const struct SpriteTemplate gSouperpowerSpoonSpriteTemplate =
{
    .tileTag = ANIM_TAG_SPOON,
    .paletteTag = ANIM_TAG_SPOON,
    .oam = &gOamData_AffineDouble_ObjBlend_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAffineAnims_SuperpowerOrb,
    .callback = AnimSuperpowerOrb,
};

const struct SpriteTemplate gSuperpowerRockSpriteTemplate =
{
    .tileTag = ANIM_TAG_FLAT_ROCK,
    .paletteTag = ANIM_TAG_FLAT_ROCK,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSuperpowerRock,
};

const struct SpriteTemplate gFloatingRockSpriteTemplate =
{
    .tileTag = ANIM_TAG_FLAT_ROCK,
    .paletteTag = ANIM_TAG_FLAT_ROCK,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimFloatingRock,
};

static const union AnimCmd sAnim_SoupProjectile[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_SoupProjectile[] =
{
    sAnim_SoupProjectile,
};

static const union AffineAnimCmd sAffineAnim_SoupProjectile[] =
{
    AFFINEANIMCMD_FRAME(0x160, 0x160, 0, 0),
    AFFINEANIMCMD_FRAME(-0xA, -0xA, 0, 10),
    AFFINEANIMCMD_FRAME(0xA, 0xA, 0, 10),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd *const sAffineAnims_SoupProjectile[] =
{
    sAffineAnim_SoupProjectile,
};

const struct SpriteTemplate gSoupBubbleSpriteTemplate =
{
    .tileTag = ANIM_TAG_POISON_BUBBLE,
    .paletteTag = ANIM_TAG_ROCKS,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = sAnims_SoupProjectile,
    .images = NULL,
    .affineAnims = sAffineAnims_SoupProjectile,
    .callback = AnimSuperpowerRock,
};

const struct SpriteTemplate gSuperpowerFireballSpriteTemplate =
{
    .tileTag = ANIM_TAG_METEOR,
    .paletteTag = ANIM_TAG_METEOR,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSuperpowerFireball,
};

const struct SpriteTemplate gSouperpowerFireballSpriteTemplate =
{
    .tileTag = ANIM_TAG_SPOON,
    .paletteTag = ANIM_TAG_SPOON,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSuperpowerFireball,
};

const struct SpriteTemplate gArmThrustHandSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAnims_HandsAndFeet,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimArmThrustHit,
};

static const union AnimCmd sAnim_RevengeSmallScratch_0[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_RevengeSmallScratch_1[] =
{
    ANIMCMD_FRAME(0, 4, .vFlip = TRUE),
    ANIMCMD_FRAME(16, 4, .vFlip = TRUE),
    ANIMCMD_FRAME(32, 4, .vFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_RevengeSmallScratch_2[] =
{
    ANIMCMD_FRAME(0, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 4, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_RevengeSmallScratch[] =
{
    sAnim_RevengeSmallScratch_0,
    sAnim_RevengeSmallScratch_1,
    sAnim_RevengeSmallScratch_2,
};

const struct SpriteTemplate gRevengeSmallScratchSpriteTemplate =
{
    .tileTag = ANIM_TAG_PURPLE_SCRATCH,
    .paletteTag = ANIM_TAG_PURPLE_SCRATCH,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAnims_RevengeSmallScratch,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimRevengeScratch,
};

static const union AnimCmd sAnim_RevengeBigScratch_0[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(64, 6),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_RevengeBigScratch_1[] =
{
    ANIMCMD_FRAME(0, 6, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(64, 6, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_RevengeBigScratch_2[] =
{
    ANIMCMD_FRAME(0, 6, .hFlip = TRUE),
    ANIMCMD_FRAME(64, 6, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_RevengeBigScratch[] =
{
    sAnim_RevengeBigScratch_0,
    sAnim_RevengeBigScratch_1,
    sAnim_RevengeBigScratch_2,
};

const struct SpriteTemplate gRevengeBigScratchSpriteTemplate =
{
    .tileTag = ANIM_TAG_PURPLE_SWIPE,
    .paletteTag = ANIM_TAG_PURPLE_SWIPE,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sAnims_RevengeBigScratch,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimRevengeScratch,
};

static const union AffineAnimCmd sAffineAnim_FocusPunchFist[] =
{
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_FRAME(-0x20, -0x20, 0, 8),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_FocusPunchFist[] =
{
    sAffineAnim_FocusPunchFist,
};

const struct SpriteTemplate gFocusPunchFistSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = sAnims_HandsAndFeet,
    .images = NULL,
    .affineAnims = sAffineAnims_FocusPunchFist,
    .callback = AnimFocusPunchFist,
};

//quick guard
const struct SpriteTemplate gQuickGuardArmImpactTemplate =
{
    .tileTag = ANIM_TAG_QUICK_GUARD_HAND,
    .paletteTag = ANIM_TAG_QUICK_GUARD_HAND,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAnims_HandsAndFeet,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBasicFistOrFoot
};

static void AnimUnusedHumanoidFoot(struct Sprite *sprite)
{
    SetAnimSpriteInitialXOffset(sprite, gBattleAnimArgs[0]);
    sprite->y += gBattleAnimArgs[1];
    sprite->data[0] = 15;
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

static void AnimSlideHandOrFootToTarget(struct Sprite *sprite)
{
    if (gBattleAnimArgs[7] == 1 && GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }
    StartSpriteAnim(sprite, gBattleAnimArgs[6]);
    gBattleAnimArgs[6] = 0;
    AnimTravelDiagonally(sprite);
}

static void AnimJumpKick(struct Sprite *sprite)
{
    if (IsContest())
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }
    AnimSlideHandOrFootToTarget(sprite);
}

// Displays a basic fist or foot sprite for a given duration.
// Used by many fighting moves (and elemental "punch" moves).
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: duration
// arg 3: ? (todo: related to initial pixel offsets)
// arg 4: anim num
static void AnimBasicFistOrFoot(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);
    if (gBattleAnimArgs[3] == 0)
        InitSpritePosToAnimAttacker(sprite, 1);
    else
        InitSpritePosToAnimTarget(sprite, TRUE);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

static void AnimFistOrFootRandomPos(struct Sprite *sprite)
{
    u8 battler;
    s16 xMod, yMod;
    s16 x, y;

    if (gBattleAnimArgs[0] == 0)
        battler = gBattleAnimAttacker;
    else
        battler = gBattleAnimTarget;

    if (gBattleAnimArgs[2] < 0)
        gBattleAnimArgs[2] = Random() % 5;
    StartSpriteAnim(sprite, gBattleAnimArgs[2]);
    sprite->x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2);
    sprite->y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y_PIC_OFFSET);
    xMod = GetBattlerSpriteCoordAttr(battler, BATTLER_COORD_ATTR_WIDTH) / 2;
    yMod = GetBattlerSpriteCoordAttr(battler, BATTLER_COORD_ATTR_HEIGHT) / 4;
    x = Random() % xMod;
    y = Random() % yMod;
    if (Random() & 1)
        x *= -1;
    if (Random() & 1)
        y *= -1;
    if ((gBattlerPositions[battler] & BIT_SIDE) == B_SIDE_PLAYER)
        y += 0xFFF0;
    sprite->x += x;
    sprite->y += y;
    sprite->data[0] = gBattleAnimArgs[1];
    sprite->data[7] = CreateSprite(&gBasicHitSplatSpriteTemplate, sprite->x, sprite->y, sprite->subpriority + 1);
    if (sprite->data[7] != MAX_SPRITES)
    {
        StartSpriteAffineAnim(&gSprites[sprite->data[7]], 0);
        gSprites[sprite->data[7]].callback = SpriteCallbackDummy;
    }
    sprite->callback = AnimFistOrFootRandomPos_Step;
}

static void AnimFistOrFootRandomPos_Step(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        if (sprite->data[7] != MAX_SPRITES)
        {
            FreeOamMatrix(gSprites[sprite->data[7]].oam.matrixNum);
            DestroySprite(&gSprites[sprite->data[7]]);
        }
        DestroyAnimSprite(sprite);
    }
    else
    {
        --sprite->data[0];
    }
}

//=====DISCLAIMER: The following code is written by generative AI, modified from the original AnimFistOrFoot code===========
void AnimTask_CentennialKick(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u8 battler;
    u8 spriteId;
    s16 x, y;

    // Args:
    // 0: battler selector (0 = attacker, 1 = target)
    // 1: number of hits
    // 2: STARTING frames between hits
    // 3: anim index (0-4) or -1 for random
    // 4: visible frames per hit
    // 5: play SFX every N hits

    battler = (gBattleAnimArgs[0] == 0) ? gBattleAnimAttacker : gBattleAnimTarget;

    x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2);
    y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y_PIC_OFFSET);

    if(gBattleAnimArgs[3] == 6)
        spriteId = CreateSprite(&gBasicHitSplatSpriteTemplate, x, y, 3);
    else
        spriteId = CreateSprite(&gFistFootStaticSpriteTemplate, x, y, 3);
    if (spriteId == MAX_SPRITES)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    gSprites[spriteId].invisible = TRUE;
    gSprites[spriteId].callback = SpriteCallbackDummy;

    task->data[0]  = spriteId;           // sprite id
    task->data[1]  = gBattleAnimArgs[1]; // hits remaining
    task->data[2]  = gBattleAnimArgs[2]; // starting delay (slow)
    task->data[3]  = 0;                  // frame counter
    task->data[4]  = gBattleAnimArgs[3]; // anim index or -1
    task->data[5]  = gBattleAnimArgs[4]; // visible frames per hit
    task->data[6]  = 0;                  // visible countdown
    task->data[7]  = battler;            // battler
    task->data[8]  = 0;                  // total hits done
    task->data[9]  = gBattleAnimArgs[5]; // sfx every N hits

    task->data[10] = 1;

    if (task->data[2] < task->data[10])
        task->data[2] = task->data[10];

    task->func = AnimTask_CentennialKick_Step;
}

static void AnimTask_CentennialKick_Step(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u8 spriteId = (u8)task->data[0];
    u8 battler = (u8)task->data[7];
    struct Sprite *spr;
    s16 xMod, yMod, x, y;

    u16 startDelay = (u16)task->data[2];
    u16 minDelay   = (u16)task->data[10];
    u16 delay;
    u16 hitsDone = (u16)task->data[8];

    if (spriteId >= MAX_SPRITES)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    spr = &gSprites[spriteId];

    if (task->data[6] > 0)
    {
        task->data[6]--;
        if (task->data[6] == 0)
            spr->invisible = TRUE;
    }

    if (task->data[1] <= 0 && task->data[6] == 0)
    {
        DestroySprite(spr);
        DestroyAnimVisualTask(taskId);
        return;
    }

    if (task->data[1] <= 0)
        return;

    if (hitsDone >= 10 || startDelay <= minDelay)
    {
        delay = minDelay;
    }
    else
    {
        u16 span = startDelay - minDelay;
        delay = startDelay - (hitsDone * span) / 10;
        if (delay < minDelay)
            delay = minDelay;
    }

    if (task->data[3]++ < delay)
        return;
    task->data[3] = 0;

    spr->x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2);
    spr->y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y_PIC_OFFSET);

    xMod = GetBattlerSpriteCoordAttr(battler, BATTLER_COORD_ATTR_WIDTH) / 2;
    yMod = GetBattlerSpriteCoordAttr(battler, BATTLER_COORD_ATTR_HEIGHT) / 4;

    x = (xMod > 0) ? (Random() % xMod) : 0;
    y = (yMod > 0) ? (Random() % yMod) : 0;

    if (Random() & 1) x *= -1;
    if (Random() & 1) y *= -1;

    if ((gBattlerPositions[battler] & BIT_SIDE) == B_SIDE_PLAYER)
        y += 0xFFF0;

    spr->x += x;
    spr->y += y;
    spr->x2 = 0;
    spr->y2 = 0;

    if (task->data[4] < 0)
        StartSpriteAnim(spr, Random() % 5);
    else if (task->data[4] < 5)
        StartSpriteAnim(spr, (u8)task->data[4]);
    else
        StartSpriteAnim(spr, 0);
    spr->invisible = FALSE;
    task->data[6] = task->data[5];

    task->data[8] = task->data[8] + 1;

    if (task->data[9] != 0)
    {
        if (((u16)task->data[8] % (u16)task->data[9]) == 0)
            PlaySE12WithPanning(SE_M_VITAL_THROW2, BattleAnimAdjustPanning(SOUND_PAN_TARGET));
    }

    task->data[1]--;
}
//========End of generative AI-written code================


static void AnimCrossChopHand(struct Sprite *sprite)
{
    InitSpritePosToAnimTarget(sprite, TRUE);
    sprite->data[0] = 30;
    if (gBattleAnimArgs[2] == 0)
    {
        sprite->data[2] = sprite->x - 20;
    }
    else
    {
        sprite->data[2] = sprite->x + 20;
        sprite->hFlip = 1;
    }
    sprite->data[4] = sprite->y - 20;
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, AnimCrossChopHand_Step);
}

static void AnimCrossChopHand_Step(struct Sprite *sprite)
{
    if (++sprite->data[5] == 11)
    {
        sprite->data[2] = sprite->x - sprite->x2;
        sprite->data[4] = sprite->y - sprite->y2;
        sprite->data[0] = 8;
        sprite->x += sprite->x2;
        sprite->y += sprite->y2;
        sprite->y2 = 0;
        sprite->x2 = 0;
        sprite->callback = StartAnimLinearTranslation;
        StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
    }
}

// Rolling Kick / Low Kick
static void AnimSlidingKick(struct Sprite *sprite)
{
    if (BATTLE_PARTNER(gBattleAnimAttacker) == gBattleAnimTarget && GetBattlerPosition(gBattleAnimTarget) < B_POSITION_PLAYER_RIGHT)
        gBattleAnimArgs[0] *= -1;
    InitSpritePosToAnimTarget(sprite, TRUE);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->x;
    sprite->data[2] = sprite->x + gBattleAnimArgs[2];
    sprite->data[3] = sprite->y;
    sprite->data[4] = sprite->y;
    InitAnimLinearTranslation(sprite);
    sprite->data[5] = gBattleAnimArgs[5];
    sprite->data[6] = gBattleAnimArgs[4];
    sprite->data[7] = 0;
    sprite->callback = AnimSlidingKick_Step;
}

static void AnimSlidingKick_Step(struct Sprite *sprite)
{
    if (!AnimTranslateLinear(sprite))
    {
        sprite->y2 += Sin(sprite->data[7] >> 8, sprite->data[5]);
        sprite->data[7] += sprite->data[6];
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}

static void AnimSlidingHand(struct Sprite *sprite)
{
    if (BATTLE_PARTNER(gBattleAnimAttacker) == gBattleAnimTarget && GetBattlerPosition(gBattleAnimTarget) < B_POSITION_PLAYER_RIGHT)
        gBattleAnimArgs[0] *= -1;

    InitSpritePosToAnimTarget(sprite, TRUE);

    // ✅ Apply vertical offset HERE (critical)
    sprite->y -= 16;

    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->x;
    sprite->data[2] = sprite->x + gBattleAnimArgs[2];

    // ✅ Now match translation baseline to new Y
    sprite->data[3] = sprite->y;
    sprite->data[4] = sprite->y;

    InitAnimLinearTranslation(sprite);

    sprite->data[5] = gBattleAnimArgs[5];
    sprite->data[6] = gBattleAnimArgs[4];
    sprite->data[7] = 0;

    sprite->callback = AnimSlidingKick_Step;
}

// Animates the spinning, shrinking kick or punch, which then
// reappears at full size. Used by moves such as MOVE_MEGA_PUNCH and MOVE_MEGA_KICK.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: anim num
// arg 3: spin duration
static void AnimSpinningKickOrPunch(struct Sprite *sprite)
{
    InitSpritePosToAnimTarget(sprite, TRUE);
    StartSpriteAnim(sprite, gBattleAnimArgs[2]);
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData6(sprite, AnimSpinningKickOrPunchFinish);
}

static void AnimSpinningKickOrPunchFinish(struct Sprite *sprite)
{
    StartSpriteAffineAnim(sprite, 0);
    sprite->affineAnimPaused = 1;
    sprite->data[0] = 20;
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

// Animates MOVE_STOMP's foot that slides downward.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: initial wait duration
static void AnimStompFoot(struct Sprite *sprite)
{
    InitSpritePosToAnimTarget(sprite, TRUE);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = AnimStompFootStep;
}

static void AnimStompFootStep(struct Sprite *sprite)
{
    if (--sprite->data[0] == -1)
    {
        sprite->data[0] = 6;
        sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
        sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
        sprite->callback = StartAnimLinearTranslation;
        StoreSpriteCallbackInData6(sprite, AnimStompFootEnd);
    }
}

static void AnimStompFootEnd(struct Sprite *sprite)
{
    sprite->data[0] = 15;
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

static void AnimDizzyPunchDuck(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        InitSpritePosToAnimTarget(sprite, TRUE);
        sprite->data[1] = gBattleAnimArgs[2];
        sprite->data[2] = gBattleAnimArgs[3];
        ++sprite->data[0];
    }
    else
    {
        sprite->data[4] += sprite->data[1];
        sprite->x2 = sprite->data[4] >> 8;
        sprite->y2 = Sin(sprite->data[3], sprite->data[2]);
        sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
        if (sprite->data[3] > 100)
            sprite->invisible = sprite->data[3] % 2;
        if (sprite->data[3] > 120)
            DestroyAnimSprite(sprite);
    }
}

// The wall that appears when Brick Break is going to shatter the target's defensive wall
static void AnimBrickBreakWall(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y);
    }
    else
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y);
    }
    sprite->x += gBattleAnimArgs[1];
    sprite->y += gBattleAnimArgs[2];
    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    sprite->data[3] = 0;
    sprite->callback = AnimBrickBreakWall_Step;
}

static void AnimBrickBreakWall_Step(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (--sprite->data[1] == 0)
        {
            if (sprite->data[2] == 0)
                DestroyAnimSprite(sprite);
            else
                ++sprite->data[0];
        }
        break;
    case 1:
        if (++sprite->data[1] > 1)
        {
            sprite->data[1] = 0;
            ++sprite->data[3];
            if (sprite->data[3] & 1)
                sprite->x2 = 2;
            else
                sprite->x2 = -2;
        }

        if (--sprite->data[2] == 0)
            DestroyAnimSprite(sprite);
        break;
    }
}

// Piece of shattered defensive wall flies off. Used by Brick Break when the target has a defensive wall
static void AnimBrickBreakWallShard(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == ANIM_ATTACKER)
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X) + gBattleAnimArgs[2];
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y) + gBattleAnimArgs[3];
    }
    else
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X) + gBattleAnimArgs[2];
        sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y) + gBattleAnimArgs[3];
    }
    sprite->oam.tileNum += gBattleAnimArgs[1] * 16;
    sprite->data[0] = 0;
    switch (gBattleAnimArgs[1])
    {
    case 0:
        sprite->data[6] = -3;
        sprite->data[7] = -3;
        break;
    case 1:
        sprite->data[6] = 3;
        sprite->data[7] = -3;
        break;
    case 2:
        sprite->data[6] = -3;
        sprite->data[7] = 3;
        break;
    case 3:
        sprite->data[6] = 3;
        sprite->data[7] = 3;
        break;
    default:
        DestroyAnimSprite(sprite);
        return;
    }
    sprite->callback = AnimBrickBreakWallShard_Step;
}

static void AnimBrickBreakWallShard_Step(struct Sprite *sprite)
{
    sprite->x += sprite->data[6];
    sprite->y += sprite->data[7];
    if (++sprite->data[0] > 40)
        DestroyAnimSprite(sprite);
}

static void AnimSuperpowerOrb(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->x = GetBattlerSpriteCoord(gBattlerAttacker, BATTLER_COORD_X_2);
        sprite->y = GetBattlerSpriteCoord(gBattlerAttacker, BATTLER_COORD_Y_PIC_OFFSET);
        sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimAttacker);
        sprite->data[7] = gBattleAnimTarget;
    }
    else
    {
        sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget);
        sprite->data[7] = gBattleAnimAttacker;
    }
    sprite->data[0] = 0;
    sprite->data[1] = 12;
    sprite->data[2] = 8;
    sprite->callback = AnimSuperpowerOrb_Step;
}

static void AnimSuperpowerOrb_Step(struct Sprite *sprite)
{
    if (++sprite->data[0] == 180)
    {
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        sprite->data[0] = 16;
        sprite->data[1] = sprite->x;
        sprite->data[2] = GetBattlerSpriteCoord(sprite->data[7], BATTLER_COORD_X_2);
        sprite->data[3] = sprite->y;
        sprite->data[4] = GetBattlerSpriteCoord(sprite->data[7], BATTLER_COORD_Y_PIC_OFFSET);
        InitAnimLinearTranslation(sprite);
        StoreSpriteCallbackInData6(sprite, DestroySpriteAndMatrix);
        sprite->callback = AnimTranslateLinear_WithFollowup;
    }
}

// Floating rock that flies off to hit the target. Used by Superpower
static void AnimSuperpowerRock(struct Sprite *sprite)
{
    sprite->x = gBattleAnimArgs[0];
    sprite->y = 120;
    sprite->data[0] = gBattleAnimArgs[3];
    StorePointerInVars(&sprite->data[4], &sprite->data[5], (void *)(sprite->y << 8));
    sprite->data[6] = gBattleAnimArgs[1];
    sprite->oam.tileNum += gBattleAnimArgs[2] * 4;
    sprite->callback = AnimSuperpowerRock_Step1;
}

static void AnimSuperpowerRock_Step1(struct Sprite *sprite)
{
    void *var0;

    if (sprite->data[0] != 0)
    {
        var0 = LoadPointerFromVars(sprite->data[4], sprite->data[5]);
        var0 -= sprite->data[6];
        StorePointerInVars(&sprite->data[4], &sprite->data[5], var0);
        var0 = (void *)(((intptr_t)var0) >> 8);
        sprite->y = (intptr_t)var0;
        if (sprite->y < -8)
            DestroyAnimSprite(sprite);
        else
            --sprite->data[0];
    }
    else
    {
        s16 pos0 = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
        s16 pos1 = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
        s16 pos2 = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
        s16 pos3 = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);

        sprite->data[0] = pos2 - pos0;
        sprite->data[1] = pos3 - pos1;
        sprite->data[2] = sprite->x << 4;
        sprite->data[3] = sprite->y << 4;
        sprite->callback = AnimSuperpowerRock_Step2;
    }
}

static void AnimSuperpowerRock_Step2(struct Sprite *sprite)
{
    u16 edgeX;

    sprite->data[2] += sprite->data[0];
    sprite->data[3] += sprite->data[1];
    sprite->x = sprite->data[2] >> 4;
    sprite->y = sprite->data[3] >> 4;
    edgeX = sprite->x + 8;
    if (edgeX > 256 || sprite->y < -8 || sprite->y > 120)
        DestroyAnimSprite(sprite);
}

static void AnimSuperpowerFireball(struct Sprite *sprite)
{
    u8 battler;

    if (gBattleAnimArgs[0] == ANIM_ATTACKER)
    {
        sprite->x = GetBattlerSpriteCoord(gBattlerAttacker, BATTLER_COORD_X_2);
        sprite->y = GetBattlerSpriteCoord(gBattlerAttacker, BATTLER_COORD_Y_PIC_OFFSET);
        battler = gBattleAnimTarget;
        sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimAttacker);
    }
    else
    {
        battler = gBattleAnimAttacker;
        sprite->oam.priority = GetBattlerSpriteBGPriority(gBattleAnimTarget);
    }
    if (IsContest())
        sprite->oam.matrixNum |= ST_OAM_HFLIP;
    else if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        sprite->oam.matrixNum |= (ST_OAM_HFLIP | ST_OAM_VFLIP);
    sprite->data[0] = 16;
    sprite->data[1] = sprite->x;
    sprite->data[2] = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2);
    sprite->data[3] = sprite->y;
    sprite->data[4] = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y_PIC_OFFSET);
    InitAnimLinearTranslation(sprite);
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
    sprite->callback = AnimTranslateLinear_WithFollowup;
}

// Floating rock that rises, hovers, then falls downward offscreen
static void AnimFloatingRock(struct Sprite *sprite)
{
    sprite->x = gBattleAnimArgs[0];   // initial X
    sprite->y = 120;                  // start near bottom like original

    sprite->data[0] = gBattleAnimArgs[3]; // hover duration
    StorePointerInVars(&sprite->data[4], &sprite->data[5], (void *)(sprite->y << 8));

    sprite->data[6] = gBattleAnimArgs[1]; // upward speed

    sprite->oam.tileNum += gBattleAnimArgs[2] * 4;

    sprite->callback = AnimFloatingRock_Step1;
}

static void AnimFloatingRock_Step1(struct Sprite *sprite)
{
    void *var0;

    if (sprite->data[0] != 0)
    {
        var0 = LoadPointerFromVars(sprite->data[4], sprite->data[5]);
        var0 -= sprite->data[6]; // move upward
        StorePointerInVars(&sprite->data[4], &sprite->data[5], var0);

        sprite->y = (s16)((intptr_t)var0 >> 8);

        // If somehow goes too high, clean up
        if (sprite->y < -8)
        {
            DestroyAnimSprite(sprite);
            return;
        }

        sprite->data[0]--;
    }
    else
    {
        // Transition to falling phase
        sprite->data[0] = 0;      // fall velocity (fixed-point)
        sprite->data[1] = 0x20;   // gravity acceleration
        sprite->data[2] = sprite->y << 4; // fixed-point Y

        sprite->callback = AnimFloatingRock_Step2;
    }
}

static void AnimFloatingRock_Step2(struct Sprite *sprite)
{
    // Apply gravity
    sprite->data[0] += sprite->data[1];   // velocity += gravity
    sprite->data[2] += sprite->data[0];   // position += velocity

    sprite->y = sprite->data[2] >> 4;

    // Optional: slight horizontal drift (can remove if undesired)
    // sprite->x += 1;

    // Destroy when off bottom of screen
    if (sprite->y > DISPLAY_HEIGHT + 8)
    {
        DestroyAnimSprite(sprite);
    }
}

static void AnimArmThrustHit_Step(struct Sprite *sprite)
{
    if (sprite->data[0] == sprite->data[4])
        DestroyAnimSprite(sprite);
    ++sprite->data[0];
}

static void AnimArmThrustHit(struct Sprite *sprite)
{
    u8 turn;

    sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[0];
    sprite->data[3] = gBattleAnimArgs[1];
    sprite->data[4] = gBattleAnimArgs[2];
    turn = gAnimMoveTurn;
    if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
        ++turn;
    if (turn & 1)
    {
        sprite->data[2] = -sprite->data[2];
        ++sprite->data[1];
    }
    StartSpriteAnim(sprite, sprite->data[1]);
    sprite->x2 = sprite->data[2];
    sprite->y2 = sprite->data[3];
    sprite->callback = AnimArmThrustHit_Step;
}

static void AnimRevengeScratch(struct Sprite *sprite)
{
    if (gBattleAnimArgs[2] == ANIM_ATTACKER)
        InitSpritePosToAnimAttacker(sprite, 0);
    else
        InitSpritePosToAnimTarget(sprite, FALSE);
    if (IsContest())
        StartSpriteAnim(sprite, 2);
    else if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        StartSpriteAnim(sprite, 1);
    sprite->callback = RunStoredCallbackWhenAnimEnds;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

// Fist shrinks toward target and shakes
static void AnimFocusPunchFist(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        sprite->data[1] = (sprite->data[1] + 40) & 0xFF;
        sprite->x2 = Sin(sprite->data[1], 2);
        if (++sprite->data[0] > 40)
            DestroyAnimSprite(sprite);
    }
}

void AnimTask_MoveSkyUppercutBg(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        ToggleBg3Mode(0);
        task->data[8] = gBattleAnimArgs[0];
        ++task->data[0];
        break;
    case 1:
        if (--task->data[8] == -1)
            ++task->data[0];
        break;
    case 2:
    default:
        task->data[9] += 1280;
        break;
    }
    task->data[10] += 2816;
    if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
        gBattle_BG3_X += task->data[9] >> 8;
    else
        gBattle_BG3_X -= task->data[9] >> 8;
    gBattle_BG3_Y += task->data[10] >> 8;
    task->data[9] &= 0xFF;
    task->data[10] &= 0xFF;
    if (gBattleAnimArgs[7] == -1)
    {
        gBattle_BG3_X = 0;
        gBattle_BG3_Y = 0;
        ToggleBg3Mode(1);
        DestroyAnimVisualTask(taskId);
    }
}

static void AnimUselessCard(struct Sprite *sprite)
{
    s16 battler;

    switch (sprite->data[0])
    {
    // -----------------------------------
    // INITIALIZE
    // -----------------------------------
    case 0:
        battler = (gBattleAnimArgs[7] == 0)
            ? gBattleAnimAttacker
            : gBattleAnimTarget;

        // Base battler position
        sprite->x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2);
        sprite->y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y_PIC_OFFSET);

        // Apply initial offset
        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];

        // -----------------------------------
        // RANDOMLY PICK ONE OF 5 ANIM STATES
        // -----------------------------------
        StartSpriteAnim(sprite, Random() % 5);

        // Movement settings
        sprite->data[1] = gBattleAnimArgs[2]; // x speed
        sprite->data[2] = gBattleAnimArgs[3]; // y speed
        sprite->data[3] = gBattleAnimArgs[4]; // move duration
        sprite->data[4] = gBattleAnimArgs[5]; // wait duration
        sprite->data[5] = gBattleAnimArgs[6]; // shake mode

        sprite->data[6] = 0; // phase timer
        sprite->data[7] = 0; // shake timer
        sprite->data[0] = 1;
        break;

    // -----------------------------------
    // MOVEMENT PHASE
    // -----------------------------------
    case 1:
        sprite->x += sprite->data[1];
        sprite->y += sprite->data[2];

        if (++sprite->data[6] >= sprite->data[3])
        {
            sprite->data[6] = 0;
            sprite->data[7] = 0;
            sprite->data[0] = 2;
        }
        break;

    // -----------------------------------
    // WAIT + SHAKE PHASE
    // -----------------------------------
    case 2:
        sprite->data[7]++;

        if (sprite->data[7] >= 6)
        {
            sprite->data[7] = 0;

            if (sprite->data[5] == 1) // vertical shake
            {
                if (sprite->y2 == 0)
                    sprite->y2 = 2;
                else
                    sprite->y2 = -sprite->y2;
            }
            else if (sprite->data[5] == 2) // horizontal shake
            {
                if (sprite->x2 == 0)
                    sprite->x2 = 2;
                else
                    sprite->x2 = -sprite->x2;
            }
        }

        if (++sprite->data[6] >= sprite->data[4])
        {
            sprite->x2 = 0;
            sprite->y2 = 0;
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

void AnimTask_PitJump(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    struct Sprite *battlerSprite;
    u8 battler;

    // Select battler
    battler = (gBattleAnimArgs[0] == 0) ? gBattleAnimAttacker : gBattleAnimTarget;
    battlerSprite = &gSprites[gBattlerSpriteIds[battler]];

    /*// data[1] = frame toggle (0 = move, 1 = wait)
    if (task->data[1] == 1)
    {
        task->data[1] = 0;
        return; // skip this frame → creates the "rest"
    }

    task->data[1] = 1;*/

    switch (task->data[0])
    {
    case 0: battlerSprite->y2 -= 3; break;
    case 1: battlerSprite->y2 -= 3; break;

    case 2: battlerSprite->y2 -= 2; break;
    case 3: battlerSprite->y2 -= 2; break;

    case 4: battlerSprite->y2 -= 2; break;
    case 5: battlerSprite->y2 -= 2; break;

    case 6: battlerSprite->y2 -= 2; break;
    case 7: battlerSprite->y2 -= 2; break;

    case 8: battlerSprite->y2 -= 1; break;
    case 9: battlerSprite->y2 -= 1; break;

    case 10: battlerSprite->y2 -= 1; break;
    case 11: battlerSprite->y2 -= 1; break;

    case 12: break; // no move
    case 13: break; // no move
    case 14: break; // no move
    case 15: break; // no move

    case 16: battlerSprite->y2 += 1; break;
    case 17: battlerSprite->y2 += 1; break;

    case 18: battlerSprite->y2 += 1; break;
    case 19: battlerSprite->y2 += 1; break;

    case 20: battlerSprite->y2 += 1; break;
    case 21: battlerSprite->y2 += 1; break;

    case 22: battlerSprite->y2 += 2; break;
    case 23: battlerSprite->y2 += 2; break;

    case 24: battlerSprite->y2 += 2; break;
    case 25: battlerSprite->y2 += 2; break;

    case 26: battlerSprite->y2 += 4; break;
    case 27: battlerSprite->y2 += 4; break;

    default:
        battlerSprite->y2 = 0;
        DestroyAnimVisualTask(taskId);
        return;
    }

    task->data[0]++;
}