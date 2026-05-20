#include "global.h"
#include "gflib.h"
#include "battle_anim.h"
#include "battle_interface.h"
#include "decompress.h"
#include "graphics.h"
#include "math_util.h"
#include "random.h"
#include "scanline_effect.h"
#include "trig.h"
#include "util.h"
#include "constants/songs.h"

static void AnimBouncingMusicNote(struct Sprite *);
static void AnimBouncingMusicNote_Step(struct Sprite *);
static void AnimMovingClamp(struct Sprite *);
static void AnimMovingClamp_Step(struct Sprite *);
static void AnimMovingClamp_End(struct Sprite *);
static void AnimTask_Withdraw_Step(u8);
static void AnimSwordsDanceBlade(struct Sprite *);
static void AnimSwordsDanceBlade_Step(struct Sprite *);
static void AnimVoidLines(struct Sprite *);
static void AnimVoidLines_Step(struct Sprite *);
static void AnimFallingCoin(struct Sprite *);
static void AnimFallingCoin_Step(struct Sprite *);
static void AnimBulletSeed(struct Sprite *);
static void AnimBulletSeed_Step1(struct Sprite *);
static void AnimBulletSeed_Step2(struct Sprite *);
static void AnimBulletPiss(struct Sprite *sprite);
static void AnimBulletPiss_Step1(struct Sprite *sprite);
static void AnimDodgeball(struct Sprite *sprite);
static void AnimDodgeball_Step1(struct Sprite *sprite);
static void AnimViceGripPincer(struct Sprite *);
static void AnimViceGripPincer_Step(struct Sprite *);
static void AnimGuillotinePincer(struct Sprite *);
static void AnimGuillotinePincer_Step1(struct Sprite *);
static void AnimGuillotinePincer_Step2(struct Sprite *);
static void AnimGuillotinePincer_Step3(struct Sprite *);
static void AnimTask_GrowAndGrayscale_Step(u8);
static void AnimTask_Minimize_Step1(u8);
static void CreateMinimizeSprite(struct Task *, u8);
static void ClonedMinizeSprite_Step(struct Sprite *);
static void AnimTask_Splash_Step(u8);
static void AnimTask_GrowAndShrink_Step(u8);
static void AnimTask_ThrashMoveMonHorizontal_Step(u8);
static void AnimTask_ThrashMoveMonVertical_Step(u8);
static void AnimTask_SketchDrawMon_Step(u8);
static void AnimTask_SketchupDrawMon_Step(u8);
static void AnimPencil(struct Sprite *);
static void AnimPencil_Step(struct Sprite *);
static void AnimKetchup(struct Sprite *);
static void AnimKetchup_Step(struct Sprite *);
static void AnimSoftBoiledEgg(struct Sprite *);
static void AnimSoftBoiledEgg_Step1(struct Sprite *);
static void AnimSoftBoiledEgg_Step2(struct Sprite *);
static void AnimSoftBoiledEgg_Step3(struct Sprite *);
static void AnimSoftBoiledEgg_Step3_Callback1(struct Sprite *);
static void AnimSoftBoiledEgg_Step3_Callback2(struct Sprite *);
static void AnimSoftBoiledEgg_Step4(struct Sprite *);
static void AnimSoftBoiledEgg_Step4_Callback(struct Sprite *);
static void AnimTask_AttackerStretchAndDisappear_Step(u8);
static void AnimTask_ExtremeSpeedImpact_Step(u8);
static void AnimTask_ExtremeSpeedMonReappear_Step(u8);
static void AnimTask_SpeedDust_Step(u8);
static void AnimTask_FakeOut_Step1(u8);
static void AnimTask_FakeOut_Step2(u8);
static void AnimRedHeartProjectile(struct Sprite *);
static void AnimRedHeartProjectile_Step(struct Sprite *);
static void AnimRedHeartRising(struct Sprite *);
static void AnimRedHeartRising_Step(struct Sprite *);
static void AnimTask_HeartsBackground_Step(u8);
static void AnimTask_ScaryFace_Step(u8);
static void AnimTask_CherryFace_Step(u8);
static void AnimTask_MissileFace_Step(u8);
static void AnimOrbitFast(struct Sprite *);
static void AnimOrbitFast_Step(struct Sprite *);
static void AnimOrbitShort(struct Sprite *sprite);
static void AnimOrbitShort_Step(struct Sprite *sprite);
static void AnimOrbitScatter(struct Sprite *);
static void AnimOrbitScatter_Step(struct Sprite *);
static void AnimMovementWaves(struct Sprite *);
static void AnimMovementWaves_Step(struct Sprite *);
static void AnimTask_UproarDistortion_Step(u8);
static void AnimJaggedMusicNote(struct Sprite *);
static void AnimJaggedMusicNote_Step(struct Sprite *);
static void AnimPerishSongMusicNote2(struct Sprite *);
static void AnimPerishSongMusicNote(struct Sprite *);
static void AnimPerishSongMusicNote_Step1(struct Sprite *);
static void AnimPerishSongMusicNote_Step2(struct Sprite *);
static void AnimCirclingFinger(struct Sprite *);
static void AnimVibrateBattlerBack(struct Sprite *);
static void AnimKinesisZapEnergy(struct Sprite *);
static void AnimAirWaveProjectile(struct Sprite *);
static void AnimCoinThrow(struct Sprite *);
static void AnimRazorWindTornado(struct Sprite *);
static void AnimBreathPuff(struct Sprite *);
static void AnimAngerMark(struct Sprite *);
static void AnimBlendThinRing(struct Sprite *);
static void AnimHyperVoiceRing(struct Sprite *);
static void AnimRotomRing(struct Sprite *);
static void AnimSpeedDust(struct Sprite *);
static void AnimHealBellMusicNote(struct Sprite *);
static void AnimMagentaHeart(struct Sprite *);
static void AnimSpitUpOrb(struct Sprite *);
static void AnimEyeSparkle(struct Sprite *);
static void AnimAngel(struct Sprite *);
static void AnimPinkHeart(struct Sprite *);
static void AnimDevil(struct Sprite *);
static void AnimFurySwipes(struct Sprite *);
static void AnimGuardRing(struct Sprite *);
static void AnimCardFly(struct Sprite *);
static void AnimBallAttack(struct Sprite *sprite);
static void AnimBallAttack_Arc(struct Sprite *sprite);
static void AnimBallAttack_Bounce(struct Sprite *sprite);
static void AnimQuickBallAttack(struct Sprite *sprite);
static void AnimQuickBallAttack_Arc(struct Sprite *sprite);
static void AnimQuickBallAttack_Bounce(struct Sprite *sprite);
static void AnimTimerBallAttack(struct Sprite *sprite);
static void AnimTimerBallAttack_Arc(struct Sprite *sprite);
static void AnimSprite_MoveThenWait(struct Sprite *sprite);
static void AnimSprite_MoveStaggeredThenWait(struct Sprite *sprite);
static void AnimHammerSwing(struct Sprite *sprite);
static void AnimTask_OnionCutter_Step(u8 taskId);
static void AnimTask_EarthQuaker_Step(u8 taskId);
static void AnimGarbotoxin(struct Sprite *sprite);
static void AnimTask_DynamaxGrowthStep(u8 taskId);
static void AnimSprite_FadeInOut(struct Sprite *sprite);
void AnimThrowProtagonist(struct Sprite *sprite);
void AnimThrowKanga(struct Sprite *sprite);
static void AnimThrowProtagonist_Step(struct Sprite *sprite);
static void PSIRockin_ShiftPalette(u8 paletteNum);
static void AnimPSIRockin(struct Sprite *sprite);
static void AnimPSIRockin_Step(struct Sprite *sprite);
static void AnimHBOMaxFinale(struct Sprite *sprite);
static void AnimHBOMaxFinale_Step(struct Sprite *sprite);
void AnimMegaSymbolSprite(struct Sprite *sprite);
static void AnimMegaSymbolSprite_End(struct Sprite *sprite);
void AnimParticleBurstOnAttacker(struct Sprite *sprite);
void AnimRotateThenWait(struct Sprite *sprite);
static void AnimRotateThenWait_Step(struct Sprite *sprite);


// Unused
static const struct SpriteTemplate sCirclingFingerSpriteTemplate =
{
    .tileTag = ANIM_TAG_FINGER,
    .paletteTag = ANIM_TAG_FINGER,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimCirclingFinger,
};

static const union AnimCmd sAnim_BouncingMusicNote[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END,
};

// Unused (association assumed)
static const union AnimCmd *const sAnims_BouncingMusicNote[] =
{
    sAnim_BouncingMusicNote,
};

// Unused
static const struct SpriteTemplate sBouncingMusicNoteSpriteTemplate =
{
    .tileTag = ANIM_TAG_MUSIC_NOTES,
    .paletteTag = ANIM_TAG_MUSIC_NOTES,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBouncingMusicNote,
};

// Unused
static const struct SpriteTemplate sVibrateBattlerBackSpriteTemplate =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimVibrateBattlerBack,
};

// Unused
static const struct SpriteTemplate sMovingClampSpriteTemplate =
{
    .tileTag = ANIM_TAG_CLAMP,
    .paletteTag = ANIM_TAG_CLAMP,
    .oam = &gOamData_AffineNormal_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gAffineAnims_Bite,
    .callback = AnimMovingClamp,
};

static const union AnimCmd sAnim_SmallExplosion[] =
{
    ANIMCMD_FRAME(0, 9),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_SmallExplosion[] =
{
    sAnim_SmallExplosion,
};

static const union AffineAnimCmd sAffineAnim_SmallExplosion[] =
{
    AFFINEANIMCMD_FRAME(80, 80, 0, 0),
    AFFINEANIMCMD_FRAME(9, 9, 0, 18),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAffineAnims_SmallExplosion[] =
{
    sAffineAnim_SmallExplosion,
};

// Unused
static const struct SpriteTemplate sSmallExplosionSpriteTemplate =
{
    .tileTag = ANIM_TAG_EXPLOSION_6,
    .paletteTag = ANIM_TAG_EXPLOSION_6,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sAnims_SmallExplosion,
    .images = NULL,
    .affineAnims = sAffineAnims_SmallExplosion,
    .callback = AnimSpriteOnMonPos,
};

static const union AnimCmd sKinesisZapEnergyAnimCmds[] =
{
    ANIMCMD_FRAME(0, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(24, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(40, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(48, 3, .hFlip = TRUE),
    ANIMCMD_LOOP(1),
    ANIMCMD_END,
};

static const union AnimCmd *const sKinesisZapEnergyAnimTable[] =
{
    sKinesisZapEnergyAnimCmds,
};

const struct SpriteTemplate gKinesisZapEnergySpriteTemplate =
{
    .tileTag = ANIM_TAG_ALERT,
    .paletteTag = ANIM_TAG_ALERT,
    .oam = &gOamData_AffineOff_ObjNormal_32x16,
    .anims = sKinesisZapEnergyAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimKinesisZapEnergy,
};

static const union AffineAnimCmd sSwordsDanceBladeAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(16, 256, 0, 0),
    AFFINEANIMCMD_FRAME(20, 0, 0, 12),
    AFFINEANIMCMD_FRAME(0, 0, 0, 32),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sSwordsDanceBladeAffineAnimTable[] =
{
    sSwordsDanceBladeAffineAnimCmds,
};

const struct SpriteTemplate gSwordsDanceBladeSpriteTemplate =
{
    .tileTag = ANIM_TAG_SWORD,
    .paletteTag = ANIM_TAG_SWORD,
    .oam = &gOamData_AffineNormal_ObjBlend_32x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sSwordsDanceBladeAffineAnimTable,
    .callback = AnimSwordsDanceBlade,
};

const struct SpriteTemplate gSonicBoomSpriteTemplate =
{
    .tileTag = ANIM_TAG_AIR_WAVE,
    .paletteTag = ANIM_TAG_AIR_WAVE,
    .oam = &gOamData_AffineDouble_ObjBlend_32x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSonicBoomProjectile,
};

const struct SpriteTemplate gAirWaveProjectileSpriteTemplate =
{
    .tileTag = ANIM_TAG_AIR_WAVE,
    .paletteTag = ANIM_TAG_AIR_WAVE,
    .oam = &gOamData_AffineOff_ObjBlend_32x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimAirWaveProjectile,
};

static const union AffineAnimCmd sGrowingRingAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(32, 32, 0, 0),
    AFFINEANIMCMD_FRAME(7, 7, 0, -56),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sWaterPulseRingAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(5, 5, 0, 10),
    AFFINEANIMCMD_FRAME(-10, -10, 0, 10),
    AFFINEANIMCMD_FRAME(10, 10, 0, 10),
    AFFINEANIMCMD_FRAME(-10, -10, 0, 10),
    AFFINEANIMCMD_FRAME(10, 10, 0, 10),
    AFFINEANIMCMD_FRAME(-10, -10, 0, 10),
    AFFINEANIMCMD_FRAME(10, 10, 0, 10),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gGrowingRingAffineAnimTable[] =
{
    sGrowingRingAffineAnimCmds,
};

static const union AffineAnimCmd *const sWaterPulseRingAffineAnimTable[] =    
{
    sWaterPulseRingAffineAnimCmds,
};

const struct SpriteTemplate gSupersonicRingSpriteTemplate =    
{
    .tileTag = ANIM_TAG_GOLD_RING,
    .paletteTag = ANIM_TAG_GOLD_RING,
    .oam = &gOamData_AffineDouble_ObjNormal_16x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gGrowingRingAffineAnimTable,
    .callback = TranslateAnimSpriteToTargetMonLocation,
};

const struct SpriteTemplate gScreechRingSpriteTemplate =    
{
    .tileTag = ANIM_TAG_PURPLE_RING,
    .paletteTag = ANIM_TAG_PURPLE_RING,
    .oam = &gOamData_AffineDouble_ObjNormal_16x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gGrowingRingAffineAnimTable,
    .callback = TranslateAnimSpriteToTargetMonLocation,
};

const struct SpriteTemplate gMetalSoundSpriteTemplate =    
{
    .tileTag = ANIM_TAG_METAL_SOUND_WAVES,
    .paletteTag = ANIM_TAG_METAL_SOUND_WAVES,
    .oam = &gOamData_AffineDouble_ObjNormal_32x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gGrowingRingAffineAnimTable,
    .callback = TranslateAnimSpriteToTargetMonLocation,
};

const struct SpriteTemplate gWaterPulseRingSpriteTemplate =    
{
    .tileTag = ANIM_TAG_BLUE_RING_2,
    .paletteTag = ANIM_TAG_BLUE_RING_2,
    .oam = &gOamData_AffineDouble_ObjNormal_16x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sWaterPulseRingAffineAnimTable,
    .callback = AnimWaterPulseRing,
};

const struct SpriteTemplate gEggThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_LARGE_FRESH_EGG,
    .paletteTag = ANIM_TAG_LARGE_FRESH_EGG,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimThrowProjectile,
};

const struct SpriteTemplate gYoshiEggThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_YOSHI_EGG,
    .paletteTag = ANIM_TAG_YOSHI_EGG,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimThrowProjectile,
};

const struct SpriteTemplate gFireredThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_FIRERED,
    .paletteTag = ANIM_TAG_FIRERED,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimThrowProjectile,
};

static const union AnimCmd sProtagonistThrowAnimCmd_1[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_END,
};
static const union AnimCmd sProtagonistThrowAnimCmd_2[] =
{
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_END,
};
static const union AnimCmd sProtagonistThrowAnimCmd_3[] =
{
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_END,
};
static const union AnimCmd sProtagonistThrowAnimCmd_4[] =
{
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_END,
};

static const union AnimCmd *const sProtagonistThrowAnimTable[] =
{
    sProtagonistThrowAnimCmd_1,
    sProtagonistThrowAnimCmd_2,
    sProtagonistThrowAnimCmd_3,
    sProtagonistThrowAnimCmd_4,
};

const struct SpriteTemplate gProtagonistThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_PROTAGONISTS,
    .paletteTag = ANIM_TAG_PROTAGONISTS,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sProtagonistThrowAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimThrowProtagonist,
};

static const union AnimCmd sKangaThrowAnimCmd_1[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_END,
};
static const union AnimCmd sKangaThrowAnimCmd_2[] =
{
    ANIMCMD_FRAME(64, 3),
    ANIMCMD_END,
};
static const union AnimCmd sKangaThrowAnimCmd_3[] =
{
    ANIMCMD_FRAME(128, 3),
    ANIMCMD_END,
};

static const union AnimCmd *const sKangaThrowAnimTable[] =
{
    sKangaThrowAnimCmd_1,
    sKangaThrowAnimCmd_2,
    sKangaThrowAnimCmd_3,
};

const struct SpriteTemplate gKangaThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_KANGAS,
    .paletteTag = ANIM_TAG_KANGAS,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sKangaThrowAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimThrowKanga,
};

const struct SpriteTemplate gCheriBombThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_CHERI_BOMB,
    .paletteTag = ANIM_TAG_CHERI_BOMB,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimThrowProjectile,
};

const struct SpriteTemplate gScissorsThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_SCISSORS,
    .paletteTag = ANIM_TAG_SCISSORS,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimThrowProjectile,
};

const struct SpriteTemplate gKenyaThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_LIL_KENYA,
    .paletteTag = ANIM_TAG_LIL_KENYA,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimThrowProjectile,
};

const struct SpriteTemplate gCuboneThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_CUBONE,
    .paletteTag = ANIM_TAG_CUBONE,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimThrowProjectile,
};

const struct SpriteTemplate gZygardeCellThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_ZYGARDE_CELL,
    .paletteTag = ANIM_TAG_ZYGARDE_CELL,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimThrowProjectile,
};

const struct SpriteTemplate gKrabbyThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_CSR_CRAB,
    .paletteTag = ANIM_TAG_CSR_CRAB,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimThrowProjectile,
};

const struct SpriteTemplate gSesameSeedSpriteTemplate =    
{
    .tileTag = ANIM_TAG_SESAME,
    .paletteTag = ANIM_TAG_SESAME,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimThrowProjectile,
};

static const struct SpriteTemplate sVoidLinesSpriteTemplate =
{
    .tileTag = ANIM_TAG_VOID_LINES,
    .paletteTag = ANIM_TAG_VOID_LINES,
    .oam = &gOamData_AffineOff_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimVoidLines,
};

static const union AnimCmd sOnionCutterAnimCmds1[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sOnionCutterAnimCmds2[] =    
{
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_JUMP(0),
};


static const union AnimCmd sOnionCutterAnimCmds3[] =    
{
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sOnionCutterAnimTable[] =
{
    sOnionCutterAnimCmds1,
    sOnionCutterAnimCmds2,
    sOnionCutterAnimCmds3,
};

const struct SpriteTemplate gOnionCutterSpriteTemplate =
{
    .tileTag = ANIM_TAG_ONION,
    .paletteTag = ANIM_TAG_ONION,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sOnionCutterAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const union AnimCmd sEarthQuakerAnimCmds1[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sEarthQuakerAnimCmds2[] =    
{
    ANIMCMD_FRAME(64, 3),
    ANIMCMD_JUMP(0),
};


static const union AnimCmd sEarthQuakerAnimCmds3[] =    
{
    ANIMCMD_FRAME(128, 3),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sEarthQuakerAnimTable[] =
{
    sEarthQuakerAnimCmds1,
    sEarthQuakerAnimCmds2,
    sEarthQuakerAnimCmds3,
};

const struct SpriteTemplate gEarthQuakerSpriteTemplate =
{
    .tileTag = ANIM_TAG_EARTH,
    .paletteTag = ANIM_TAG_EARTH,
    .oam = &gOamData_AffineNormal_ObjNormal_64x64,
    .anims = sEarthQuakerAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const union AnimCmd sCoinAnimCmds[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

static const union AnimCmd *const sCoinAnimTable[] =
{
    sCoinAnimCmds,
};

static const union AffineAnimCmd sFallingCoinAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 10, 1),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd *const sFallingCoinAffineAnimTable[] =
{
    sFallingCoinAffineAnimCmds,
};

const struct SpriteTemplate gCoinThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_COIN,
    .paletteTag = ANIM_TAG_COIN,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sCoinAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimCoinThrow,
};

const struct SpriteTemplate gDireHitThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_DIRE_HIT,
    .paletteTag = ANIM_TAG_DIRE_HIT,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sCoinAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimCoinThrow,
};

const struct SpriteTemplate gBoltThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_BOLT,
    .paletteTag = ANIM_TAG_BOLT,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = sCoinAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimCoinThrow,
};

const struct SpriteTemplate gPokedadThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_POKEDAD,
    .paletteTag = ANIM_TAG_POKEDAD,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sCoinAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimCoinThrow,
};

const struct SpriteTemplate gFurbyThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_FURBY,
    .paletteTag = ANIM_TAG_FURBY,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimCoinThrow,
};

const struct SpriteTemplate gWeedThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_WEED_SMALL,
    .paletteTag = ANIM_TAG_WEED_SMALL,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sCoinAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimCoinThrow,
};

const struct SpriteTemplate gVaseLiftSpriteTemplate =
{
    .tileTag = ANIM_TAG_MING_VASE,
    .paletteTag = ANIM_TAG_MING_VASE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sPaperboyAnimCmds[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(16, 8),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sPaperboyAnimTable[] =
{
    sPaperboyAnimCmds,
};

const struct SpriteTemplate gPaperboySpriteTemplate =
{
    .tileTag = ANIM_TAG_PAPERBOY,
    .paletteTag = ANIM_TAG_PAPERBOY,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sPaperboyAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sNewspaperAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sNewspaperAnimTable[] =
{
    sNewspaperAnimCmds,
};

const struct SpriteTemplate gNewspaperSpriteTemplate =
{
    .tileTag = ANIM_TAG_NEWSPAPER,
    .paletteTag = ANIM_TAG_NEWSPAPER,
    .oam = &gOamData_AffineOff_ObjNormal_8x8,
    .anims = sNewspaperAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sWagonFrontAnimCmds[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(32, 8),
    ANIMCMD_FRAME(64, 8),
    ANIMCMD_FRAME(96, 8),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sWagonBackAnimCmds[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(32, 8),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sWagonTopAnimCmds[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(8, 8),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sWagonCornerAnimCmds[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sWagonAnimTable[] =
{
    sWagonFrontAnimCmds,
    sWagonBackAnimCmds,
    sWagonTopAnimCmds,
    sWagonCornerAnimCmds,
};

const struct SpriteTemplate gWagonFrontSpriteTemplate =
{
    .tileTag = ANIM_TAG_WAGON_FRONT,
    .paletteTag = ANIM_TAG_WAGON_FRONT,
    .oam = &gOamData_AffineOff_ObjNormal_64x32,
    .anims = &sWagonAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gWagonBackSpriteTemplate =
{
    .tileTag = ANIM_TAG_WAGON_BACK,
    .paletteTag = ANIM_TAG_WAGON_BACK,
    .oam = &gOamData_AffineOff_ObjNormal_64x32,
    .anims = &sWagonAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gWagonTopLeftSpriteTemplate =
{
    .tileTag = ANIM_TAG_WAGON_TOP_LEFT,
    .paletteTag = ANIM_TAG_WAGON_TOP_LEFT,
    .oam = &gOamData_AffineOff_ObjNormal_32x16,
    .anims = &sWagonAnimTable[2],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gWagonTopRightSpriteTemplate =
{
    .tileTag = ANIM_TAG_WAGON_TOP_RIGHT,
    .paletteTag = ANIM_TAG_WAGON_TOP_RIGHT,
    .oam = &gOamData_AffineOff_ObjNormal_32x16,
    .anims = &sWagonAnimTable[2],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gWagonCornerSpriteTemplate =
{
    .tileTag = ANIM_TAG_WAGON_CORNER,
    .paletteTag = ANIM_TAG_WAGON_CORNER,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = &sWagonAnimTable[3],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sDaisyAnimCmds[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(8, 8),
    ANIMCMD_FRAME(12, 8),
    ANIMCMD_FRAME(16, 8),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sDaisyAnimTable[] =
{
    sDaisyAnimCmds,
};

const struct SpriteTemplate gDaisySpriteTemplate =
{
    .tileTag = ANIM_TAG_DAISY,
    .paletteTag = ANIM_TAG_DAISY,
    .oam = &gOamData_AffineOff_ObjBlend_16x16,
    .anims = sDaisyAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sGBAScreenAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sGBAHelpAnimCmds[] =
{
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sGBAScreenAnimTable[] =
{
    sGBAScreenAnimCmds,
    sGBAHelpAnimCmds,
};

const struct SpriteTemplate gGBALiftSpriteTemplate =
{
    .tileTag = ANIM_TAG_GBA,
    .paletteTag = ANIM_TAG_GBA,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sGBAScreenAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gGBAThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_GBA,
    .paletteTag = ANIM_TAG_GBA,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = &sGBAScreenAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimCoinThrow,
};

const struct SpriteTemplate gFallingGBASpriteTemplate =
{
    .tileTag = ANIM_TAG_GBA,
    .paletteTag = ANIM_TAG_GBA,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = &sGBAScreenAnimTable[1],
    .images = NULL,
    .affineAnims = sFallingCoinAffineAnimTable,
    .callback = AnimFallingCoin,
};

static const union AnimCmd sLossRiseOneAnimCmds[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

static const union AnimCmd sLossRiseTwoAnimCmds[] =
{
    ANIMCMD_FRAME(64, 1),
    ANIMCMD_END,
};

static const union AnimCmd *const sLossRiseAnimTable[] =
{
    sLossRiseOneAnimCmds,
    sLossRiseTwoAnimCmds,
};

const struct SpriteTemplate gLossRiseOneSpriteTemplate =
{
    .tileTag = ANIM_TAG_LOSS,
    .paletteTag = ANIM_TAG_LOSS,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = &sLossRiseAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gLossRiseTwoSpriteTemplate =
{
    .tileTag = ANIM_TAG_LOSS,
    .paletteTag = ANIM_TAG_LOSS,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = &sLossRiseAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sLossChopOneAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(192, 4),
    ANIMCMD_END,
};

static const union AnimCmd sLossChopTwoAnimCmds[] =
{
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_FRAME(128, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sLossChopAnimTable[] =
{
    sLossChopOneAnimCmds,
    sLossChopTwoAnimCmds,
};

const struct SpriteTemplate gLossChopOneSpriteTemplate =
{
    .tileTag = ANIM_TAG_LOSS,
    .paletteTag = ANIM_TAG_LOSS,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = &sLossChopAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gLossChopTwoSpriteTemplate =
{
    .tileTag = ANIM_TAG_LOSS,
    .paletteTag = ANIM_TAG_LOSS,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = &sLossChopAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gLossFaceSpriteTemplate =
{
    .tileTag = ANIM_TAG_LOSS_BUBBLES,
    .paletteTag = ANIM_TAG_LOSS_BUBBLES,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sOnionCutterAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sLatiasRiseAnimCmds[] =    
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sLatiasRiseAnimTable[] =
{
    sLatiasRiseAnimCmds,
};

const struct SpriteTemplate gLatiasRiseSpriteTemplate =
{
    .tileTag = ANIM_TAG_LATIAS,
    .paletteTag = ANIM_TAG_LATIAS,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sLatiasRiseAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gImakuniSpriteTemplate =
{
    .tileTag = ANIM_TAG_IMAKUNI,
    .paletteTag = ANIM_TAG_IMAKUNI,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sStarmieStandAnimCmds[] =    
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_END,
};

static const union AnimCmd sStarmieGrabAnimCmds[] =    
{
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_END,
};

static const union AnimCmd *const sStarmieAnimTable[] =
{
    sStarmieStandAnimCmds,
    sStarmieGrabAnimCmds,
};

const struct SpriteTemplate gStarmieStandSpriteTemplate =
{
    .tileTag = ANIM_TAG_STARMIE,
    .paletteTag = ANIM_TAG_STARMIE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sStarmieAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gStarmieGrabSpriteTemplate =
{
    .tileTag = ANIM_TAG_STARMIE,
    .paletteTag = ANIM_TAG_STARMIE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sStarmieAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sHyperBeamAnimCmds[] =    
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(4, 2),
    ANIMCMD_FRAME(8, 2),
    ANIMCMD_FRAME(12, 2),
    ANIMCMD_JUMP(2),
};

static const union AnimCmd *const sHyperBeamAnimTable[] =
{
    sHyperBeamAnimCmds,
};

const struct SpriteTemplate gHyperBeamSpriteTemplate =
{
    .tileTag = ANIM_TAG_HYPER_BEAM,
    .paletteTag = ANIM_TAG_HYPER_BEAM,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sHyperBeamAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sTcgPoisonAnimCmds[] =    
{
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_FRAME(64, 10),
    ANIMCMD_FRAME(128, 10),
    ANIMCMD_FRAME(192, 10),
    ANIMCMD_END,
};

static const union AnimCmd *const sTcgPoisonAnimTable[] =
{
    sTcgPoisonAnimCmds,
};

const struct SpriteTemplate gTcgPoisonSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_POISON,
    .paletteTag = ANIM_TAG_TCG_POISON,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sTcgPoisonAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gTakedownSpriteTemplate =
{
    .tileTag = ANIM_TAG_TAKEDOWN,
    .paletteTag = ANIM_TAG_TAKEDOWN,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gGnomeSpriteTemplate =
{
    .tileTag = ANIM_TAG_GNOME,
    .paletteTag = ANIM_TAG_GNOME,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sMissileUpAnimCmds[] =    
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_JUMP(0),
};


static const union AnimCmd sMissileDownAnimCmds[] =    
{
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_FRAME(96, 4),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sMissileAnimTable[] =
{
    sMissileUpAnimCmds,
    sMissileDownAnimCmds,
};

const struct SpriteTemplate gMissileUpSpriteTemplate =
{
    .tileTag = ANIM_TAG_MISSILE,
    .paletteTag = ANIM_TAG_MISSILE,
    .oam = &gOamData_AffineOff_ObjNormal_32x64,
    .anims = &sMissileAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};
const struct SpriteTemplate gMissileDownSpriteTemplate =
{
    .tileTag = ANIM_TAG_MISSILE,
    .paletteTag = ANIM_TAG_MISSILE,
    .oam = &gOamData_AffineOff_ObjNormal_32x64,
    .anims = &sMissileAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gFourSpriteTemplate =
{
    .tileTag = ANIM_TAG_FOUR,
    .paletteTag = ANIM_TAG_FOUR,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sKnitShortsAnimCmds[] =
{
    ANIMCMD_FRAME(0, 15),
    ANIMCMD_FRAME(64, 15),
    ANIMCMD_FRAME(128, 15),
    ANIMCMD_FRAME(192, 15),
    ANIMCMD_END,
};

static const union AnimCmd *const sKnitShortsAnimTable[] =
{
    sKnitShortsAnimCmds,
};


static const union AnimCmd sShortsAnimCmds[] =
{
    ANIMCMD_FRAME(192, 15),
    ANIMCMD_END,
};

static const union AnimCmd *const sShortsAnimTable[] =
{
    sShortsAnimCmds,
};

const struct SpriteTemplate gPullUpShortsSpriteTemplate =
{
    .tileTag = ANIM_TAG_KNIT_SHORTS,
    .paletteTag = ANIM_TAG_KNIT_SHORTS,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sShortsAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gKnitShortsSpriteTemplate =
{
    .tileTag = ANIM_TAG_KNIT_SHORTS,
    .paletteTag = ANIM_TAG_KNIT_SHORTS,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sKnitShortsAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sGyroSpinAnimCmds[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(16, 7),
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_JUMP(6),
};

static const union AnimCmd *const sGyroSpinAnimTable[] =
{
    sGyroSpinAnimCmds,
};

const struct SpriteTemplate gGyroSpinSpriteTemplate =
{
    .tileTag = ANIM_TAG_GYRO,
    .paletteTag = ANIM_TAG_GYRO,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sGyroSpinAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sGen2LeerAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sGen2LeerAnimTable[] =
{
    sGen2LeerAnimCmds,
};

const struct SpriteTemplate gLeerLaserSpriteTemplate =
{
    .tileTag = ANIM_TAG_LEER_LASER,
    .paletteTag = ANIM_TAG_LEER_LASER,
    .oam = &gOamData_AffineOff_ObjNormal_Gen2Leer,
    .anims = sGen2LeerAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gLeerBlastRightSpriteTemplate =
{
    .tileTag = ANIM_TAG_LEER_BLAST_RIGHT,
    .paletteTag = ANIM_TAG_LEER_BLAST_RIGHT,
    .oam = &gOamData_AffineOff_ObjNormal_Gen2Leer,
    .anims = sGen2LeerAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gLeerBlastLeftSpriteTemplate =
{
    .tileTag = ANIM_TAG_LEER_BLAST_LEFT,
    .paletteTag = ANIM_TAG_LEER_BLAST_LEFT,
    .oam = &gOamData_AffineOff_ObjNormal_Gen2Leer,
    .anims = sGen2LeerAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gGameGenieSpriteTemplate =
{
    .tileTag = ANIM_TAG_GAME_GENIE,
    .paletteTag = ANIM_TAG_GAME_GENIE,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sAnim_ThePitOne[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_ThePitTwo[] =
{
    ANIMCMD_FRAME(64, 8),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_ThePitThree[] =
{
    ANIMCMD_FRAME(128, 8),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_ThePitFour[] =
{
    ANIMCMD_FRAME(192, 8),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_ThePit[] =
{
    sAnim_ThePitOne,
    sAnim_ThePitTwo,
    sAnim_ThePitThree,
    sAnim_ThePitFour,
};

const struct SpriteTemplate gThePitTopLeftSpriteTemplate =
{
    .tileTag = ANIM_TAG_THE_PIT,
    .paletteTag = ANIM_TAG_THE_PIT,
    .oam = &gOamData_AffineOff_ObjNormal_64x64_LowPriority,
    .anims = &sAnims_ThePit[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gThePitTopRightSpriteTemplate =
{
    .tileTag = ANIM_TAG_THE_PIT,
    .paletteTag = ANIM_TAG_THE_PIT,
    .oam = &gOamData_AffineOff_ObjNormal_64x64_LowPriority,
    .anims = &sAnims_ThePit[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gThePitBottomLeftSpriteTemplate =
{
    .tileTag = ANIM_TAG_THE_PIT,
    .paletteTag = ANIM_TAG_THE_PIT,
    .oam = &gOamData_AffineOff_ObjNormal_64x64_LowPriority,
    .anims = &sAnims_ThePit[2],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gThePitBottomRightSpriteTemplate =
{
    .tileTag = ANIM_TAG_THE_PIT,
    .paletteTag = ANIM_TAG_THE_PIT,
    .oam = &gOamData_AffineOff_ObjNormal_64x64_LowPriority,
    .anims = &sAnims_ThePit[3],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gTheLedgeTopLeftSpriteTemplate =
{
    .tileTag = ANIM_TAG_THE_LEDGE,
    .paletteTag = ANIM_TAG_THE_LEDGE,
    .oam = &gOamData_AffineOff_ObjNormal_64x64_LowPriority,
    .anims = &sAnims_ThePit[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gTheLedgeTopRightSpriteTemplate =
{
    .tileTag = ANIM_TAG_THE_LEDGE,
    .paletteTag = ANIM_TAG_THE_LEDGE,
    .oam = &gOamData_AffineOff_ObjNormal_64x64_LowPriority,
    .anims = &sAnims_ThePit[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gTheLedgeBottomLeftSpriteTemplate =
{
    .tileTag = ANIM_TAG_THE_LEDGE,
    .paletteTag = ANIM_TAG_THE_LEDGE,
    .oam = &gOamData_AffineOff_ObjNormal_64x64_LowPriority,
    .anims = &sAnims_ThePit[2],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gTheLedgeBottomRightSpriteTemplate =
{
    .tileTag = ANIM_TAG_THE_LEDGE,
    .paletteTag = ANIM_TAG_THE_LEDGE,
    .oam = &gOamData_AffineOff_ObjNormal_64x64_LowPriority,
    .anims = &sAnims_ThePit[3],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sAnim_BonkDuck[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(0, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 8),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sAnims_BonkDuck[] =
{
    sAnim_BonkDuck,
};

const struct SpriteTemplate gBonkingDuckSpriteTemplate =
{
    .tileTag = ANIM_TAG_DUCK,
    .paletteTag = ANIM_TAG_DUCK,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sAnims_BonkDuck,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sAnim_BonkDrug[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(12, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sAnims_BonkDrug[] =
{
    sAnim_BonkDrug,
};

const struct SpriteTemplate gBonkingDrugSpriteTemplate =
{
    .tileTag = ANIM_TAG_HONG_KONG_DRUG,
    .paletteTag = ANIM_TAG_HONG_KONG_DRUG,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sAnims_BonkDrug,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gEarthLiftSpriteTemplate =
{
    .tileTag = ANIM_TAG_EARTH,
    .paletteTag = ANIM_TAG_EARTH,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sAnim_Quake[] =
{
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(64, 2),
    ANIMCMD_FRAME(128, 2),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_Quake[] =
{
    sAnim_Quake,
};

const struct SpriteTemplate gQuakeSpriteTemplate =
{
    .tileTag = ANIM_TAG_QUAKE,
    .paletteTag = ANIM_TAG_QUAKE,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sAnims_Quake,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};


const struct SpriteTemplate gMoonLiftSpriteTemplate =
{
    .tileTag = ANIM_TAG_MOON,
    .paletteTag = ANIM_TAG_MOON,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sHumanLegOneAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sHumanLegOneAnimTable[] =
{
    sHumanLegOneAnimCmds,
};

const struct SpriteTemplate gHumanLegOneSpriteTemplate =
{
    .tileTag = ANIM_TAG_HUMAN_LEG_ONE,
    .paletteTag = ANIM_TAG_HUMAN_LEG_ONE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sHumanLegOneAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sMoltresAppearAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sMoltresAppearAnimTable[] =
{
    sMoltresAppearAnimCmds,
};

const struct SpriteTemplate gMoltresAppearSpriteTemplate =
{
    .tileTag = ANIM_TAG_MOLTRES_APPEAR,
    .paletteTag = ANIM_TAG_MOLTRES_APPEAR,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sMoltresAppearAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sMoltresRetractAnimCmds[] =
{
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sMoltresRetractAnimTable[] =
{
    sMoltresRetractAnimCmds,
};

const struct SpriteTemplate gMoltresRetractSpriteTemplate =
{
    .tileTag = ANIM_TAG_MOLTRES_APPEAR,
    .paletteTag = ANIM_TAG_MOLTRES_APPEAR,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sMoltresRetractAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sMoltresFlareAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sMoltresFlareAnimTable[] =
{
    sMoltresFlareAnimCmds,
};

const struct SpriteTemplate gMoltresFlareSpriteTemplate =
{
    .tileTag = ANIM_TAG_MOLTRES_FLARE,
    .paletteTag = ANIM_TAG_MOLTRES_FLARE,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sMoltresFlareAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};


const struct SpriteTemplate gMoltresFlySpriteTemplate =
{
    .tileTag = ANIM_TAG_MOLTRES_KICK,
    .paletteTag = ANIM_TAG_MOLTRES_KICK,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sHumanLegTwoAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_FRAME(128, 4),
    ANIMCMD_FRAME(192, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sHumanLegTwoAnimTable[] =
{
    sHumanLegTwoAnimCmds,
};

const struct SpriteTemplate gHumanLegTwoSpriteTemplate =
{
    .tileTag = ANIM_TAG_HUMAN_LEG_TWO,
    .paletteTag = ANIM_TAG_HUMAN_LEG_TWO,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sHumanLegTwoAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};
static const union AnimCmd sHumanLegThreeAnimCmds[] =
{
    ANIMCMD_FRAME(192, 6),
    ANIMCMD_END,
};

static const union AnimCmd *const sHumanLegThreeAnimTable[] =
{
    sHumanLegThreeAnimCmds,
};

const struct SpriteTemplate gHumanLegThreeSpriteTemplate =
{
    .tileTag = ANIM_TAG_HUMAN_LEG_TWO,
    .paletteTag = ANIM_TAG_HUMAN_LEG_TWO,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sHumanLegThreeAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};

static const union AnimCmd sLloydTopAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};
static const union AnimCmd *const sLloydTopAnimTable[] =
{
    sLloydTopAnimCmds,
};
const struct SpriteTemplate gLloydMoveTopSpriteTemplate =
{
    .tileTag = ANIM_TAG_LLOYD,
    .paletteTag = ANIM_TAG_LLOYD,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sLloydTopAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};
const struct SpriteTemplate gLloydFadeTopSpriteTemplate =
{
    .tileTag = ANIM_TAG_LLOYD,
    .paletteTag = ANIM_TAG_LLOYD,
    .oam = &gOamData_AffineOff_ObjBlend_64x64,
    .anims = sLloydTopAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_FadeInOut,
};
const struct SpriteTemplate gDarkLloydTopSpriteTemplate =
{
    .tileTag = ANIM_TAG_DARK_LLOYD,
    .paletteTag = ANIM_TAG_DARK_LLOYD,
    .oam = &gOamData_AffineOff_ObjBlend_64x64,
    .anims = sLloydTopAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_FadeInOut,
};
const struct SpriteTemplate gDarkLloydMoveTopSpriteTemplate =
{
    .tileTag = ANIM_TAG_DARK_LLOYD,
    .paletteTag = ANIM_TAG_DARK_LLOYD,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sLloydTopAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};
static const union AnimCmd sLloydBottomAnimCmds[] =
{
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_END,
};
static const union AnimCmd *const sLloydBottomAnimTable[] =
{
    sLloydBottomAnimCmds,
};
const struct SpriteTemplate gLloydMoveBottomSpriteTemplate =
{
    .tileTag = ANIM_TAG_LLOYD,
    .paletteTag = ANIM_TAG_LLOYD,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sLloydBottomAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};
const struct SpriteTemplate gLloydFadeBottomSpriteTemplate =
{
    .tileTag = ANIM_TAG_LLOYD,
    .paletteTag = ANIM_TAG_LLOYD,
    .oam = &gOamData_AffineOff_ObjBlend_64x64,
    .anims = sLloydBottomAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_FadeInOut,
};
const struct SpriteTemplate gDarkLloydBottomSpriteTemplate =
{
    .tileTag = ANIM_TAG_DARK_LLOYD,
    .paletteTag = ANIM_TAG_DARK_LLOYD,
    .oam = &gOamData_AffineOff_ObjBlend_64x64,
    .anims = sLloydBottomAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_FadeInOut,
};
const struct SpriteTemplate gDarkLloydMoveBottomSpriteTemplate =
{
    .tileTag = ANIM_TAG_DARK_LLOYD,
    .paletteTag = ANIM_TAG_DARK_LLOYD,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sLloydBottomAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sTCGChargeAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sTCGChargeAnimTable[] =
{
    sTCGChargeAnimCmds,
};

const struct SpriteTemplate gTCGChargeSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_CHARGE,
    .paletteTag = ANIM_TAG_TCG_CHARGE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sTCGChargeAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sTCGPsyAnimCmds[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_FRAME(64, 3),
    ANIMCMD_FRAME(80, 3),
    ANIMCMD_FRAME(96, 3),
    ANIMCMD_FRAME(112, 3),
    ANIMCMD_END,
};

static const union AnimCmd *const sTCGPsyAnimTable[] =
{
    sTCGPsyAnimCmds,
};

const struct SpriteTemplate gTCGPsySpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_PSYCHIC,
    .paletteTag = ANIM_TAG_TCG_PSYCHIC,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sTCGPsyAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};


static const union AnimCmd sTCGImpactAnimCmds[] =
{
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

static const union AnimCmd *const sTCGImpactAnimTable[] =
{
    sTCGImpactAnimCmds,
};

const struct SpriteTemplate gTCGImpactSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_IMPACT,
    .paletteTag = ANIM_TAG_TCG_IMPACT,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sTCGImpactAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gSlurfSpriteTemplate =
{
    .tileTag = ANIM_TAG_SLURF,
    .paletteTag = ANIM_TAG_SLURF,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sMissingnoRhydonAnimCmds[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_FRAME(64, 30),
    ANIMCMD_FRAME(128, 30),
    ANIMCMD_FRAME(192, 39),
    ANIMCMD_FRAME(192, 39),
    ANIMCMD_FRAME(128, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sMissingnoRhydonAnimTable[] =
{
    sMissingnoRhydonAnimCmds,
};

const struct SpriteTemplate gMissingnoRhydonSpriteTemplate =
{
    .tileTag = ANIM_TAG_MISSINGNO_RHYDON,
    .paletteTag = ANIM_TAG_MISSINGNO_RHYDON,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sMissingnoRhydonAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sCooltrainerFullAnimCmds[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_FRAME(7, 4),
    ANIMCMD_FRAME(12, 2),
    ANIMCMD_FRAME(19, 1),
    ANIMCMD_FRAME(2, 3),
    ANIMCMD_FRAME(31, 4),
    ANIMCMD_FRAME(45, 8),
    ANIMCMD_FRAME(23, 1),
    ANIMCMD_END,
};

static const union AnimCmd *const sCooltrainerFullAnimTable[] =
{
    sCooltrainerFullAnimCmds,
};

const struct SpriteTemplate gCooltrainerFullSpriteTemplate =
{
    .tileTag = ANIM_TAG_COOLTRAINER,
    .paletteTag = ANIM_TAG_COOLTRAINER,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sCooltrainerFullAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sCooltrainerSegmentedTL[] =
{
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(1, 2),
    ANIMCMD_FRAME(2, 2),
    ANIMCMD_FRAME(3, 2),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sCooltrainerSegmentedTR[] =
{
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_FRAME(17, 2),
    ANIMCMD_FRAME(18, 2),
    ANIMCMD_FRAME(19, 2),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sCooltrainerSegmentedBL[] =
{
    ANIMCMD_FRAME(32, 2),
    ANIMCMD_FRAME(33, 2),
    ANIMCMD_FRAME(34, 2),
    ANIMCMD_FRAME(35, 2),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sCooltrainerSegmentedBR[] =
{
    ANIMCMD_FRAME(48, 2),
    ANIMCMD_FRAME(49, 2),
    ANIMCMD_FRAME(50, 2),
    ANIMCMD_FRAME(51, 2),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sCooltrainerSegmentedAnimTable[] =
{
    sCooltrainerSegmentedTL,
    sCooltrainerSegmentedTR,
    sCooltrainerSegmentedBL,
    sCooltrainerSegmentedBR,
};

const struct SpriteTemplate gCooltrainerSegmentedTLSpriteTemplate =
{
    .tileTag = ANIM_TAG_COOLTRAINER,
    .paletteTag = ANIM_TAG_COOLTRAINER,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sCooltrainerSegmentedAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gCooltrainerSegmentedTRSpriteTemplate =
{
    .tileTag = ANIM_TAG_COOLTRAINER,
    .paletteTag = ANIM_TAG_COOLTRAINER,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sCooltrainerSegmentedAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gCooltrainerSegmentedBLSpriteTemplate =
{
    .tileTag = ANIM_TAG_COOLTRAINER,
    .paletteTag = ANIM_TAG_COOLTRAINER,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sCooltrainerSegmentedAnimTable[2],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gCooltrainerSegmentedBRSpriteTemplate =
{
    .tileTag = ANIM_TAG_COOLTRAINER,
    .paletteTag = ANIM_TAG_COOLTRAINER,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sCooltrainerSegmentedAnimTable[3],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gFemaleLiftSpriteTemplate =
{
    .tileTag = ANIM_TAG_FEMALE,
    .paletteTag = ANIM_TAG_FEMALE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sNortonAnimCmds[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_FRAME(32, 2),
    ANIMCMD_FRAME(48, 2),
    ANIMCMD_FRAME(64, 2),
    ANIMCMD_FRAME(80, 2),
    ANIMCMD_FRAME(96, 2),
    ANIMCMD_FRAME(112, 2),
    ANIMCMD_END,
};

static const union AnimCmd *const sNortonAnimTable[] =
{
    sNortonAnimCmds,
};

const struct SpriteTemplate gNortonLiftSpriteTemplate =
{
    .tileTag = ANIM_TAG_NORTON,
    .paletteTag = ANIM_TAG_NORTON,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sNortonAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gClamLiftSpriteTemplate =
{
    .tileTag = ANIM_TAG_CLAM,
    .paletteTag = ANIM_TAG_CLAM,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gDaycareFallSpriteTemplate =
{
    .tileTag = ANIM_TAG_DAYCARE,
    .paletteTag = ANIM_TAG_DAYCARE,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gRanchFallSpriteTemplate =
{
    .tileTag = ANIM_TAG_RANCH,
    .paletteTag = ANIM_TAG_RANCH,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gArtStrikeSpriteTemplate =
{
    .tileTag = ANIM_TAG_PENCIL,
    .paletteTag = ANIM_TAG_PENCIL,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sWinFlagAnimCmds[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_FRAME(16, 20),
    ANIMCMD_FRAME(32, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sWinFlagAnimTable[] =
{
    sWinFlagAnimCmds,
};

const struct SpriteTemplate gWinFlagSpriteTemplate =
{
    .tileTag = ANIM_TAG_WIN_FLAG,
    .paletteTag = ANIM_TAG_WIN_FLAG,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sWinFlagAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gAppleLiftSpriteTemplate =
{
    .tileTag = ANIM_TAG_GRAVEL_APPLE,
    .paletteTag = ANIM_TAG_GRAVEL_APPLE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gSurgeLiftSpriteTemplate =
{
    .tileTag = ANIM_TAG_STONESURGE,
    .paletteTag = ANIM_TAG_STONESURGE,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gCensoredBarSpriteTemplate =
{
    .tileTag = ANIM_TAG_CENSORED,
    .paletteTag = ANIM_TAG_CENSORED,
    .oam = &gOamData_CensoredBar,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gShedSpriteTemplate =
{
    .tileTag = ANIM_TAG_SHED,
    .paletteTag = ANIM_TAG_SHED,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gBookSpriteTemplate =
{
    .tileTag = ANIM_TAG_BOOK,
    .paletteTag = ANIM_TAG_BOOK,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gCashRegisterSpriteTemplate =
{
    .tileTag = ANIM_TAG_CASH_REGISTER,
    .paletteTag = ANIM_TAG_CASH_REGISTER,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gHandgunSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDGUN,
    .paletteTag = ANIM_TAG_HANDGUN,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gLetterESpriteTemplate =
{
    .tileTag = ANIM_TAG_LETTER_E,
    .paletteTag = ANIM_TAG_LETTER_E,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gChipAwaySpriteTemplate =
{
    .tileTag = ANIM_TAG_FRIES,
    .paletteTag = ANIM_TAG_FRIES,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sChipAwayHandAnimCmds[] =
{
    ANIMCMD_FRAME(48, 1),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sChipAwayHandAnimTable[] =
{
    sChipAwayHandAnimCmds,
};

const struct SpriteTemplate gChipAwayHandSpriteTemplate =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sChipAwayHandAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sMiniDiglettAnimCmds[] =
{
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_FRAME(4, 10),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sMiniDiglettAnimTable[] =
{
    sMiniDiglettAnimCmds,
};

const struct SpriteTemplate gMiniDiglettSpriteTemplate =
{
    .tileTag = ANIM_TAG_MINI_DIGLETT,
    .paletteTag = ANIM_TAG_MINI_DIGLETT,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sMiniDiglettAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gDiglettThrowSpriteTemplate =    
{
    .tileTag = ANIM_TAG_MINI_DIGLETT,
    .paletteTag = ANIM_TAG_MINI_DIGLETT,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sMiniDiglettAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimThrowProjectile,
};

const struct SpriteTemplate gTowerTopSpriteTemplate =
{
    .tileTag = ANIM_TAG_TOWER_TOP,
    .paletteTag = ANIM_TAG_TOWER_TOP,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gTowerBottomSpriteTemplate =
{
    .tileTag = ANIM_TAG_TOWER_BOTTOM,
    .paletteTag = ANIM_TAG_TOWER_BOTTOM,
    .oam = &gOamData_AffineOff_ObjNormal_64x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sToolbarAnimCmds[] =
{
    ANIMCMD_FRAME(0, 50),
    ANIMCMD_FRAME(16, 40),
    ANIMCMD_FRAME(32, 40),
    ANIMCMD_FRAME(48, 40),
    ANIMCMD_FRAME(64, 40),
    ANIMCMD_FRAME(80, 40),
    ANIMCMD_FRAME(96, 40),
    ANIMCMD_FRAME(112, 40),
    ANIMCMD_END,
};

static const union AnimCmd *const sToolbarAnimTable[] =
{
    sToolbarAnimCmds,
};

const struct SpriteTemplate gToolbarSpriteTemplate =
{
    .tileTag = ANIM_TAG_TOOLBAR,
    .paletteTag = ANIM_TAG_TOOLBAR,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sToolbarAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sOnionLiftAnimCmds[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sOnionLiftAnimTable[] =
{
    sOnionLiftAnimCmds,
};
const struct SpriteTemplate gOnionLiftSpriteTemplate =
{
    .tileTag = ANIM_TAG_ONION,
    .paletteTag = ANIM_TAG_ONION,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sOnionLiftAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gFallingCoinSpriteTemplate =
{
    .tileTag = ANIM_TAG_COIN,
    .paletteTag = ANIM_TAG_COIN,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sCoinAnimTable,
    .images = NULL,
    .affineAnims = sFallingCoinAffineAnimTable,
    .callback = AnimFallingCoin,
};

const struct SpriteTemplate gFallingDireHitSpriteTemplate =
{
    .tileTag = ANIM_TAG_DIRE_HIT,
    .paletteTag = ANIM_TAG_DIRE_HIT,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sCoinAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimFallingCoin,
};

const struct SpriteTemplate gFallingBoltSpriteTemplate =
{
    .tileTag = ANIM_TAG_BOLT,
    .paletteTag = ANIM_TAG_BOLT,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = sCoinAnimTable,
    .images = NULL,
    .affineAnims = sFallingCoinAffineAnimTable,
    .callback = AnimFallingCoin,
};

const struct SpriteTemplate gFallingPokedadSpriteTemplate =
{
    .tileTag = ANIM_TAG_POKEDAD,
    .paletteTag = ANIM_TAG_POKEDAD,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sCoinAnimTable,
    .images = NULL,
    .affineAnims = sFallingCoinAffineAnimTable,
    .callback = AnimFallingCoin,
};

const struct SpriteTemplate gFallingFurbySpriteTemplate =
{
    .tileTag = ANIM_TAG_FURBY,
    .paletteTag = ANIM_TAG_FURBY,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sFallingCoinAffineAnimTable,
    .callback = AnimFallingCoin,
};
const struct SpriteTemplate gFallingDuckSpriteTemplate =
{
    .tileTag = ANIM_TAG_DUCK,
    .paletteTag = ANIM_TAG_DUCK,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sAnims_BonkDuck,
    .images = NULL,
    .affineAnims = sFallingCoinAffineAnimTable,
    .callback = AnimFallingCoin,
};
const struct SpriteTemplate gFallingDrugSpriteTemplate =
{
    .tileTag = ANIM_TAG_HONG_KONG_DRUG,
    .paletteTag = ANIM_TAG_HONG_KONG_DRUG,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sAnims_BonkDrug,
    .images = NULL,
    .affineAnims = sFallingCoinAffineAnimTable,
    .callback = AnimFallingCoin,
};

const struct SpriteTemplate gFallingAppleSpriteTemplate =
{
    .tileTag = ANIM_TAG_GRAVEL_APPLE,
    .paletteTag = ANIM_TAG_GRAVEL_APPLE,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sCoinAnimTable,
    .images = NULL,
    .affineAnims = sFallingCoinAffineAnimTable,
    .callback = AnimFallingCoin,
};

const struct SpriteTemplate gFallingSurgeSpriteTemplate =
{
    .tileTag = ANIM_TAG_STONESURGE,
    .paletteTag = ANIM_TAG_STONESURGE,
    .oam = &gOamData_AffineNormal_ObjNormal_64x64,
    .anims = sCoinAnimTable,
    .images = NULL,
    .affineAnims = sFallingCoinAffineAnimTable,
    .callback = AnimFallingCoin,
};

const struct SpriteTemplate gFallingWeedSpriteTemplate =
{
    .tileTag = ANIM_TAG_WEED_SMALL,
    .paletteTag = ANIM_TAG_WEED_SMALL,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sCoinAnimTable,
    .images = NULL,
    .affineAnims = sFallingCoinAffineAnimTable,
    .callback = AnimFallingCoin,
};

const struct SpriteTemplate gFallingBreadSpriteTemplate =
{
    .tileTag = ANIM_TAG_BREAD,
    .paletteTag = ANIM_TAG_BREAD,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimFallingCoin,
};

const struct SpriteTemplate gFallingCafeSpriteTemplate =
{
    .tileTag = ANIM_TAG_CAFE,
    .paletteTag = ANIM_TAG_CAFE,
    .oam = &gOamData_AffineNormal_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimFallingCoin,
};

static const union AffineAnimCmd sBulletSeedAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 20, 1),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd *const sBulletSeedAffineAnimTable[] =
{
    sBulletSeedAffineAnimCmds,
};

const struct SpriteTemplate gBulletSeedSpriteTemplate =    
{
    .tileTag = ANIM_TAG_SEED,
    .paletteTag = ANIM_TAG_SEED,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sBulletSeedAffineAnimTable,
    .callback = AnimBulletSeed,
};

const struct SpriteTemplate gDodgeballSpriteTemplate =    
{
    .tileTag = ANIM_TAG_DODGEBALL,
    .paletteTag = ANIM_TAG_DODGEBALL,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sBulletSeedAffineAnimTable,
    .callback = AnimDodgeball,
};

const struct SpriteTemplate gTogedemaruSpriteTemplate =    
{
    .tileTag = ANIM_TAG_TOGEDEMARU,
    .paletteTag = ANIM_TAG_TOGEDEMARU,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sBulletSeedAffineAnimTable,
    .callback = AnimDodgeball,
};

const struct SpriteTemplate gBulletPissSpriteTemplate =    
{
    .tileTag = ANIM_TAG_PISS_DROP,
    .paletteTag = ANIM_TAG_PISS_DROP,
    .oam = &gOamData_AffineNormal_ObjNormal_8x8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sBulletSeedAffineAnimTable,
    .callback = AnimBulletPiss,
};

const struct SpriteTemplate gBulletBreadSpriteTemplate =    
{
    .tileTag = ANIM_TAG_BREAD,
    .paletteTag = ANIM_TAG_BREAD,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sBulletSeedAffineAnimTable,
    .callback = AnimBulletSeed,
};

static const union AffineAnimCmd sRazorWindTornadoAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(16, 256, 0, 0),
    AFFINEANIMCMD_FRAME(4, 0, 0, 40),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sRazorWindTornadoAffineAnimTable[] =
{
    sRazorWindTornadoAffineAnimCmds,
};

const struct SpriteTemplate gRazorWindTornadoSpriteTemplate =
{
    .tileTag = ANIM_TAG_GUST,
    .paletteTag = ANIM_TAG_GUST,
    .oam = &gOamData_AffineNormal_ObjNormal_32x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sRazorWindTornadoAffineAnimTable,
    .callback = AnimRazorWindTornado,
};

static const union AnimCmd sViceGripAnimCmds1[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 20),
    ANIMCMD_END,
};

static const union AnimCmd sViceGripAnimCmds2[] =
{
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 3, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 20, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const sViceGripAnimTable[] =
{
    sViceGripAnimCmds1,
    sViceGripAnimCmds2,
};

const struct SpriteTemplate gViceGripSpriteTemplate =
{
    .tileTag = ANIM_TAG_CUT,
    .paletteTag = ANIM_TAG_CUT,
    .oam = &gOamData_AffineOff_ObjBlend_32x32,
    .anims = sViceGripAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimViceGripPincer,
};

const struct SpriteTemplate gHammerSpriteTemplate =
{
    .tileTag = ANIM_TAG_HAMMER,
    .paletteTag = ANIM_TAG_HAMMER,
    .oam = &gOamData_AffineNormal_ObjBlend_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimHammerSwing,
};

const struct SpriteTemplate gKrabbyHammerSpriteTemplate =
{
    .tileTag = ANIM_TAG_KRABBY_CLAW,
    .paletteTag = ANIM_TAG_KRABBY_CLAW,
    .oam = &gOamData_AffineNormal_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimHammerSwing,
};

const struct SpriteTemplate gGliscorHammerSpriteTemplate =
{
    .tileTag = ANIM_TAG_GLISCOR_CLAW,
    .paletteTag = ANIM_TAG_GLISCOR_CLAW,
    .oam = &gOamData_AffineNormal_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimHammerSwing,
};

const struct SpriteTemplate gCrusherSpriteTemplate =
{
    .tileTag = ANIM_TAG_CRUSHER,
    .paletteTag = ANIM_TAG_CRUSHER,
    .oam = &gOamData_AffineNormal_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimHammerSwing,
};

const struct SpriteTemplate gSpoonHammerSpriteTemplate =
{
    .tileTag = ANIM_TAG_SPOON,
    .paletteTag = ANIM_TAG_SPOON,
    .oam = &gOamData_AffineNormal_ObjBlend_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimHammerSwing,
};

static const union AnimCmd sGuillotineAnimCmds1[] =
{
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_FRAME(32, 1),
    ANIMCMD_END,
};

static const union AnimCmd sGuillotineAnimCmds2[] =
{
    ANIMCMD_FRAME(0, 2, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 2, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 1, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const sGuillotineAnimTable[] =
{
    sGuillotineAnimCmds1,
    sGuillotineAnimCmds2,
};

const struct SpriteTemplate gGuillotineSpriteTemplate =
{
    .tileTag = ANIM_TAG_CUT,
    .paletteTag = ANIM_TAG_CUT,
    .oam = &gOamData_AffineOff_ObjBlend_32x32,
    .anims = sGuillotineAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimGuillotinePincer,
};

static const union AffineAnimCmd sSplashEffectAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(-6, 4, 0, 8),
    AFFINEANIMCMD_FRAME(10, -10, 0, 8),
    AFFINEANIMCMD_FRAME(-4, 6, 0, 8),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sGrowAndShrinkAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(-4, -5, 0, 12),
    AFFINEANIMCMD_FRAME(0, 0, 0, 24),
    AFFINEANIMCMD_FRAME(4, 5, 0, 12),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sPuffUpAndShrinkAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(-4, -5, 0, 48),
    AFFINEANIMCMD_FRAME(0, 0, 0, 40),
    AFFINEANIMCMD_FRAME(4, 5, 0, 48),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sGrowWaitAndShrinkAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(-4, -5, 0, 12),
    AFFINEANIMCMD_FRAME(0, 0, 0, 90),
    AFFINEANIMCMD_FRAME(0, 0, 0, 90),
    AFFINEANIMCMD_FRAME(4, 5, 0, 4),
    AFFINEANIMCMD_END,
};

static const union AnimCmd sBreathPuffAnimCmds1[] =
{
    ANIMCMD_FRAME(0, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(4, 40, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(12, 4, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd sBreathPuffAnimCmds2[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(4, 40),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(12, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sBreathPuffAnimTable[] =
{
    sBreathPuffAnimCmds1,
    sBreathPuffAnimCmds2,
};

const struct SpriteTemplate gBreathPuffSpriteTemplate =
{
    .tileTag = ANIM_TAG_BREATH,
    .paletteTag = ANIM_TAG_BREATH,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sBreathPuffAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBreathPuff,
};

static const union AffineAnimCmd sAngerMarkAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(11, 11, 0, 8),
    AFFINEANIMCMD_FRAME(-11, -11, 0, 8),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sAngerMarkAffineAnimTable[] =
{
    sAngerMarkAffineAnimCmds,
};

const struct SpriteTemplate gAngerMarkSpriteTemplate =
{
    .tileTag = ANIM_TAG_ANGER,
    .paletteTag = ANIM_TAG_ANGER,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAngerMarkAffineAnimTable,
    .callback = AnimAngerMark,
};

const struct SpriteTemplate gAngerDewSpriteTemplate =
{
    .tileTag = ANIM_TAG_SOUL_DEW,
    .paletteTag = ANIM_TAG_SOUL_DEW,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAngerMarkAffineAnimTable,
    .callback = AnimAngerMark,
};

static const union AffineAnimCmd sThrashMoveMonAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(-10, 9, 0, 7),
    AFFINEANIMCMD_FRAME(20, -20, 0, 7),
    AFFINEANIMCMD_FRAME(-20, 20, 0, 7),
    AFFINEANIMCMD_FRAME(10, -9, 0, 7),
    AFFINEANIMCMD_LOOP(2),
    AFFINEANIMCMD_END,
};

const struct SpriteTemplate gPencilSpriteTemplate =
{
    .tileTag = ANIM_TAG_PENCIL,
    .paletteTag = ANIM_TAG_PENCIL,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimPencil,
};

const struct SpriteTemplate gKetchupSpriteTemplate =
{
    .tileTag = ANIM_TAG_KETCHUP,
    .paletteTag = ANIM_TAG_KETCHUP,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimKetchup,
};

const struct SpriteTemplate gSnoreZSpriteTemplate =    
{
    .tileTag = ANIM_TAG_SNORE_Z,
    .paletteTag = ANIM_TAG_SNORE_Z,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimTravelDiagonally,
};

static const union AnimCmd sExplosionAnimCmds[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_END,
};

static const union AnimCmd *const sExplosionAnimTable[] =
{
    sExplosionAnimCmds,
};

const struct SpriteTemplate gExplosionSpriteTemplate =    
{
    .tileTag = ANIM_TAG_EXPLOSION,
    .paletteTag = ANIM_TAG_EXPLOSION,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sExplosionAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSpriteOnMonPos,
};

static const union AnimCmd sHistoryExplosionAnimCmds[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_FRAME(64, 5),
    ANIMCMD_END,
};

static const union AnimCmd *const sHistoryExplosionAnimTable[] =
{
    sHistoryExplosionAnimCmds,
};

const struct SpriteTemplate gHistoryExplosionSpriteTemplate =    
{
    .tileTag = ANIM_TAG_HONG_KONG_EXPLOSION,
    .paletteTag = ANIM_TAG_HONG_KONG_EXPLOSION,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sHistoryExplosionAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSpriteOnMonPos,
};

static const union AnimCmd sImplosionAnimCmds[] =
{
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

static const union AnimCmd *const sImplosionAnimTable[] =
{
    sImplosionAnimCmds,
};

const struct SpriteTemplate gImplosionSpriteTemplate =    
{
    .tileTag = ANIM_TAG_EXPLOSION,
    .paletteTag = ANIM_TAG_EXPLOSION,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sImplosionAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSpriteOnMonPos,
};

static const union AffineAnimCmd sSoftBoiledEggAffineAnimCmds1[] =
{
    AFFINEANIMCMD_FRAME(0, 0, -8, 2),
    AFFINEANIMCMD_FRAME(0, 0, 8, 4),
    AFFINEANIMCMD_FRAME(0, 0, -8, 2),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd sSoftBoiledEggAffineAnimCmds2[] =
{
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sSoftBoiledEggAffineAnimCmds3[] =
{
    AFFINEANIMCMD_FRAME(-8, 4, 0, 8),
    AFFINEANIMCMD_LOOP(0),
    AFFINEANIMCMD_FRAME(16, -8, 0, 8),
    AFFINEANIMCMD_FRAME(-16, 8, 0, 8),
    AFFINEANIMCMD_LOOP(1),
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(0, 0, 0, 15),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sSoftBoiledEggAffineAnimTable[] =
{
    sSoftBoiledEggAffineAnimCmds1,
    sSoftBoiledEggAffineAnimCmds2,
    sSoftBoiledEggAffineAnimCmds3,
};

const struct SpriteTemplate gSoftBoiledEggSpriteTemplate =    
{
    .tileTag = ANIM_TAG_BREAKING_EGG,
    .paletteTag = ANIM_TAG_BREAKING_EGG,
    .oam = &gOamData_AffineDouble_ObjBlend_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sSoftBoiledEggAffineAnimTable,
    .callback = AnimSoftBoiledEgg,
};

static const union AffineAnimCmd sThinRingExpandingAffineAnimCmds1[] =
{
    AFFINEANIMCMD_FRAME(16, 16, 0, 0),
    AFFINEANIMCMD_FRAME(16, 16, 0, 30),
    AFFINEANIMCMD_END_ALT(1),
};

static const union AffineAnimCmd sThinRingExpandingAffineAnimCmds2[] =
{
    AFFINEANIMCMD_FRAME(16, 16, 0, 0),
    AFFINEANIMCMD_FRAME(32, 32, 0, 15),
    AFFINEANIMCMD_END_ALT(1),
};

static const union AffineAnimCmd sHyperVoiceRingAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(16, 16, 0, 0),
    AFFINEANIMCMD_FRAME(11, 11, 0, 45),
    AFFINEANIMCMD_END_ALT(1),
};

const union AffineAnimCmd *const gThinRingExpandingAffineAnimTable[] =
{
    sThinRingExpandingAffineAnimCmds1,
    sThinRingExpandingAffineAnimCmds2,
};

static const union AffineAnimCmd *const sHyperVoiceRingAffineAnimTable[] =
{
    sHyperVoiceRingAffineAnimCmds,
};

const struct SpriteTemplate gThinRingExpandingSpriteTemplate =
{
    .tileTag = ANIM_TAG_THIN_RING,
    .paletteTag = ANIM_TAG_THIN_RING,
    .oam = &gOamData_AffineDouble_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gThinRingExpandingAffineAnimTable,
    .callback = AnimSpriteOnMonPos,
};

static const union AffineAnimCmd sThinRingShrinkingAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(512, 512, 0, 0),
    AFFINEANIMCMD_FRAME(-16, -16, 0, 30),
    AFFINEANIMCMD_END_ALT(1),
};

static const union AffineAnimCmd *const sThinRingShrinkingAffineAnimTable[] =
{
    sThinRingShrinkingAffineAnimCmds,
};

const struct SpriteTemplate gThinRingShrinkingSpriteTemplate =
{
    .tileTag = ANIM_TAG_THIN_RING,
    .paletteTag = ANIM_TAG_THIN_RING,
    .oam = &gOamData_AffineDouble_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sThinRingShrinkingAffineAnimTable,
    .callback = AnimSpriteOnMonPos,
};

const struct SpriteTemplate gBlendThinRingExpandingSpriteTemplate =
{
    .tileTag = ANIM_TAG_THIN_RING,
    .paletteTag = ANIM_TAG_THIN_RING,
    .oam = &gOamData_AffineDouble_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gThinRingExpandingAffineAnimTable,
    .callback = AnimBlendThinRing,
};

const struct SpriteTemplate gHyperVoiceRingSpriteTemplate =    
{
    .tileTag = ANIM_TAG_THIN_RING,
    .paletteTag = ANIM_TAG_THIN_RING,
    .oam = &gOamData_AffineDouble_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sHyperVoiceRingAffineAnimTable,
    .callback = AnimHyperVoiceRing,
};

const struct SpriteTemplate gDimeSpriteTemplate =    
{
    .tileTag = ANIM_TAG_DIME,
    .paletteTag = ANIM_TAG_DIME,
    .oam = &gOamData_AffineDouble_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sHyperVoiceRingAffineAnimTable,
    .callback = AnimHyperVoiceRing,
};

const struct SpriteTemplate gHyperVoiceStoreSpriteTemplate =    
{
    .tileTag = ANIM_TAG_STORE,
    .paletteTag = ANIM_TAG_STORE,
    .oam = &gOamData_AffineDouble_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sHyperVoiceRingAffineAnimTable,
    .callback = AnimHyperVoiceRing,
};

static const union AnimCmd sRoarOfPrimeOneAnimCmds[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

static const union AnimCmd sRoarOfPrimeTwoAnimCmds[] =
{
    ANIMCMD_FRAME(64, 5),
    ANIMCMD_END,
};

static const union AnimCmd *const sRoarOfPrimeAnimTable[] =
{
    sRoarOfPrimeOneAnimCmds,
    sRoarOfPrimeTwoAnimCmds,
};

const struct SpriteTemplate gRoarOfPrimeOneSpriteTemplate =    
{
    .tileTag = ANIM_TAG_PRIME_NUMBERS,
    .paletteTag = ANIM_TAG_PRIME_NUMBERS,
    .oam = &gOamData_AffineDouble_ObjBlend_32x32,
    .anims = &sRoarOfPrimeAnimTable[0],
    .images = NULL,
    .affineAnims = sHyperVoiceRingAffineAnimTable,
    .callback = AnimHyperVoiceRing,
};

const struct SpriteTemplate gRoarOfPrimeTwoSpriteTemplate =    
{
    .tileTag = ANIM_TAG_PRIME_NUMBERS,
    .paletteTag = ANIM_TAG_PRIME_NUMBERS,
    .oam = &gOamData_AffineDouble_ObjBlend_32x32,
    .anims = &sRoarOfPrimeAnimTable[1],
    .images = NULL,
    .affineAnims = sHyperVoiceRingAffineAnimTable,
    .callback = AnimHyperVoiceRing,
};

const struct SpriteTemplate gUproarRingSpriteTemplate =    
{
    .tileTag = ANIM_TAG_THIN_RING,
    .paletteTag = ANIM_TAG_THIN_RING,
    .oam = &gOamData_AffineDouble_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gThinRingExpandingAffineAnimTable,
    .callback = AnimUproarRing,
};

const struct SpriteTemplate gRotomRingSpriteTemplate =    
{
    .tileTag = ANIM_TAG_THIN_RING,
    .paletteTag = ANIM_TAG_THIN_RING,
    .oam = &gOamData_AffineDouble_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gThinRingExpandingAffineAnimTable,
    .callback = AnimRotomRing,
};

const struct SpriteTemplate gBallQuickAttackSpriteTemplate =
{
    .tileTag = ANIM_TAG_BALL_QUICK,
    .paletteTag = ANIM_TAG_BALL_QUICK,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimQuickBallAttack,
};

const struct SpriteTemplate gBallDiveAttackSpriteTemplate =
{
    .tileTag = ANIM_TAG_BALL_DIVE,
    .paletteTag = ANIM_TAG_BALL_DIVE,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBallAttack,
};

const struct SpriteTemplate gFlingSpriteTemplate =
{
    .tileTag = ANIM_TAG_ITEM_BAG,
    .paletteTag = ANIM_TAG_ITEM_BAG,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBallAttack,
};

const struct SpriteTemplate gBallRepeatAttackSpriteTemplate =
{
    .tileTag = ANIM_TAG_BALL_REPEAT,
    .paletteTag = ANIM_TAG_BALL_REPEAT,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBallAttack,
};

const struct SpriteTemplate gBallLureAttackSpriteTemplate =
{
    .tileTag = ANIM_TAG_BALL_LURE,
    .paletteTag = ANIM_TAG_BALL_LURE,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBallAttack,
};

const struct SpriteTemplate gBallHealAttackSpriteTemplate =
{
    .tileTag = ANIM_TAG_BALL_HEAL,
    .paletteTag = ANIM_TAG_BALL_HEAL,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBallAttack,
};

const struct SpriteTemplate gBallLoveAttackSpriteTemplate =
{
    .tileTag = ANIM_TAG_BALL_LOVE,
    .paletteTag = ANIM_TAG_BALL_LOVE,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBallAttack,
};

const struct SpriteTemplate gBallDreamAttackSpriteTemplate =
{
    .tileTag = ANIM_TAG_BALL_DREAM,
    .paletteTag = ANIM_TAG_BALL_DREAM,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBallAttack,
};

const struct SpriteTemplate gBallTimerAttackSpriteTemplate =
{
    .tileTag = ANIM_TAG_BALL_TIMER,
    .paletteTag = ANIM_TAG_BALL_TIMER,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimTimerBallAttack,
};

const struct SpriteTemplate gBallDuskAttackSpriteTemplate =
{
    .tileTag = ANIM_TAG_BALL_DUSK,
    .paletteTag = ANIM_TAG_BALL_DUSK,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBallAttack,
};

const struct SpriteTemplate gBallLightAttackSpriteTemplate =
{
    .tileTag = ANIM_TAG_BALL_LIGHT,
    .paletteTag = ANIM_TAG_BALL_LIGHT,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBallAttack,
};

const struct SpriteTemplate gBallEnergyAttackSpriteTemplate =
{
    .tileTag = ANIM_TAG_BALL_ENERGY,
    .paletteTag = ANIM_TAG_BALL_ENERGY,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBallAttack,
};


static const union AnimCmd sTCGSlashSwipeAnimCmds[] =
{
    ANIMCMD_FRAME(32, 1),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sTCGSlashSwipeAnimTable[] =
{
    sTCGSlashSwipeAnimCmds,
};
const struct SpriteTemplate gTCGSlashSwipeSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_SLASH,
    .paletteTag = ANIM_TAG_TCG_SLASH,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sTCGSlashSwipeAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};

static const union AnimCmd sTCGSlapAnimCmds[] =
{
    ANIMCMD_FRAME(0, 22),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_FRAME(128, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sTCGSlapAnimTable[] =
{
    sTCGSlapAnimCmds,
};
const struct SpriteTemplate gTCGSlapSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_SLAP,
    .paletteTag = ANIM_TAG_TCG_SLAP,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sTCGSlapAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};

static const union AnimCmd sTCGBigRockAnimCmds[] =
{
    ANIMCMD_FRAME(0, 7),
    ANIMCMD_FRAME(16, 7),
    ANIMCMD_FRAME(32, 7),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sTCGBigRockAnimTable[] =
{
    sTCGBigRockAnimCmds,
};
const struct SpriteTemplate gTCGBigRockSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_ROCKS,
    .paletteTag = ANIM_TAG_TCG_ROCKS,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sTCGBigRockAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};

static const union AnimCmd sTCGNeedleRightAnimCmds[] =
{
    ANIMCMD_FRAME(0, 12),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_END,
};
static const union AnimCmd sTCGNeedleLeftAnimCmds[] =
{
    ANIMCMD_FRAME(4, 12),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sTCGNeedleAnimTable[] =
{
    sTCGNeedleRightAnimCmds,
    sTCGNeedleLeftAnimCmds,
};
const struct SpriteTemplate gTCGNeedleRightSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_NEEDLE,
    .paletteTag = ANIM_TAG_TCG_NEEDLE,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = &sTCGNeedleAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};
const struct SpriteTemplate gTCGNeedleLeftSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_NEEDLE,
    .paletteTag = ANIM_TAG_TCG_NEEDLE,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = &sTCGNeedleAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};

const struct SpriteTemplate gTCGIceSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_ICE,
    .paletteTag = ANIM_TAG_TCG_ICE,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};

static const union AnimCmd sTCGSmallRockAnimCmds[] =
{
    ANIMCMD_FRAME(48, 7),
    ANIMCMD_FRAME(64, 7),
    ANIMCMD_FRAME(80, 7),
    ANIMCMD_FRAME(96, 7),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sTCGSmallRockAnimTable[] =
{
    sTCGSmallRockAnimCmds,
};
const struct SpriteTemplate gTCGSmallRockSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_ROCKS,
    .paletteTag = ANIM_TAG_TCG_ROCKS,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sTCGSmallRockAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};

const struct SpriteTemplate gTCGBlizzardSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_BLIZZARD,
    .paletteTag = ANIM_TAG_TCG_BLIZZARD,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};

static const union AnimCmd sTCGConfusionAnimCmds[] =
{
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_FRAME(64, 10),
    ANIMCMD_FRAME(128, 10),
    ANIMCMD_FRAME(192, 10),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sTCGConfusionAnimTable[] =
{
    sTCGConfusionAnimCmds,
};

const struct SpriteTemplate gTCGConfusionSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_CONFUSION,
    .paletteTag = ANIM_TAG_TCG_CONFUSION,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sTCGConfusionAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sTCGSlashImpactAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sTCGSlashImpactAnimTable[] =
{
    sTCGSlashImpactAnimCmds,
};
const struct SpriteTemplate gTCGSlashImpactSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_SLASH,
    .paletteTag = ANIM_TAG_TCG_SLASH,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sTCGSlashImpactAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};
const struct SpriteTemplate gTCGSlapImpactSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_SLAP_IMPACT,
    .paletteTag = ANIM_TAG_TCG_SLAP_IMPACT,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sTCGSlashImpactAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sTCGLeftPunchSwipeAnimCmds[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sTCGLeftPunchSwipeAnimTable[] =
{
    sTCGLeftPunchSwipeAnimCmds,
};
const struct SpriteTemplate gTCGLeftPunchSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_PUNCH,
    .paletteTag = ANIM_TAG_TCG_PUNCH,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sTCGLeftPunchSwipeAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};

static const union AnimCmd sTCGRightPunchSwipeAnimCmds[] =
{
    ANIMCMD_FRAME(64, 1),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sTCGRightPunchSwipeAnimTable[] =
{
    sTCGRightPunchSwipeAnimCmds,
};
const struct SpriteTemplate gTCGRightPunchSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_PUNCH,
    .paletteTag = ANIM_TAG_TCG_PUNCH,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sTCGRightPunchSwipeAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};


static const union AnimCmd sTCGWaterfallAnimCmds[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(2, 6),
    ANIMCMD_FRAME(4, 6),
    ANIMCMD_END,
};

static const union AnimCmd *const sTCGWaterfallAnimTable[] =
{
    sTCGWaterfallAnimCmds,
};
const struct SpriteTemplate gTCGWaterfallSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_WATER,
    .paletteTag = ANIM_TAG_TCG_WATER,
    .oam = &gOamData_AffineOff_ObjNormal_8x16,
    .anims = sTCGWaterfallAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};

static const union AnimCmd sTCGLeftDashAnimCmds[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sTCGLeftDashAnimTable[] =
{
    sTCGLeftDashAnimCmds,
};
const struct SpriteTemplate gTCGLeftDashSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_DASH,
    .paletteTag = ANIM_TAG_TCG_DASH,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sTCGLeftDashAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};

static const union AnimCmd sTCGRightDashAnimCmds[] =
{
    ANIMCMD_FRAME(64, 1),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sTCGRightDashAnimTable[] =
{
    sTCGRightDashAnimCmds,
};
const struct SpriteTemplate gTCGRightDashSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_DASH,
    .paletteTag = ANIM_TAG_TCG_DASH,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sTCGRightDashAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};

const struct SpriteTemplate gTCGSwordSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_SWORD,
    .paletteTag = ANIM_TAG_TCG_SWORD,
    .oam = &gOamData_AffineNormal_ObjBlend_32x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveStaggeredThenWait,
};


static const union AnimCmd sTCGGooAnimCmd_0[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sTCGGooAnimCmd_1[] =
{
    ANIMCMD_FRAME(64, 1),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sTCGGooAnimCmd_2[] =
{
    ANIMCMD_FRAME(128, 1),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sTCGGooAnimCmd_3[] =
{
    ANIMCMD_FRAME(192, 1),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sTCGGarbotoxinAnimTable[] =
{
    sTCGGooAnimCmd_0,
    sTCGGooAnimCmd_1,
    sTCGGooAnimCmd_2,
    sTCGGooAnimCmd_3,
};
const struct SpriteTemplate gTCGGarbotoxinSpriteTemplate =
{
    .tileTag = ANIM_TAG_TCG_GOO,
    .paletteTag = ANIM_TAG_TCG_GOO,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = sTCGGarbotoxinAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimGarbotoxin,
};

static const union AnimCmd sHongKongRunAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sHongKongRunAnimTable[] =
{
    sHongKongRunAnimCmds,
};

const struct SpriteTemplate gHongKongRunSpriteTemplate =
{
    .tileTag = ANIM_TAG_HONG_KONG_RUN,
    .paletteTag = ANIM_TAG_HONG_KONG_RUN,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sHongKongRunAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gHongKongExplosionSpriteTemplate =
{
    .tileTag = ANIM_TAG_HONG_KONG_EXPLOSION,
    .paletteTag = ANIM_TAG_HONG_KONG_EXPLOSION,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sHongKongRunAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gHongKongBulletSpriteTemplate =
{
    .tileTag = ANIM_TAG_HONG_KONG_BULLET,
    .paletteTag = ANIM_TAG_HONG_KONG_BULLET,
    .oam = &gOamData_AffineOff_ObjNormal_8x8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gHongKongBodySpriteTemplate =
{
    .tileTag = ANIM_TAG_HONG_KONG_BODY,
    .paletteTag = ANIM_TAG_HONG_KONG_BODY,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gLatinasSpriteTemplate =
{
    .tileTag = ANIM_TAG_LATINAS,
    .paletteTag = ANIM_TAG_LATINAS,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gClockSpriteTemplate =
{
    .tileTag = ANIM_TAG_CLOCK,
    .paletteTag = ANIM_TAG_CLOCK,
    .oam = &gOamData_AffineOff_ObjNormal_32x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gClothSpriteTemplate =
{
    .tileTag = ANIM_TAG_CLOTH,
    .paletteTag = ANIM_TAG_CLOTH,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gFeraligatrSpriteTemplate =
{
    .tileTag = ANIM_TAG_FERALIGATR,
    .paletteTag = ANIM_TAG_FERALIGATR,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sLionMaleAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd sLionFemaleAnimCmds[] =
{
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd *const sLionAnimTable[] =
{
    sLionMaleAnimCmds,
    sLionFemaleAnimCmds,
};

const struct SpriteTemplate gLionMaleSpriteTemplate =
{
    .tileTag = ANIM_TAG_LIONS,
    .paletteTag = ANIM_TAG_LIONS,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sLionAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gLionFemaleSpriteTemplate =
{
    .tileTag = ANIM_TAG_LIONS,
    .paletteTag = ANIM_TAG_LIONS,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sLionAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sToadZookaLeftAnimCmds[] =
{
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_END,
};
static const union AnimCmd sToadZookaRightAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};
static const union AnimCmd *const sToadZookaAnimTable[] =
{
    sToadZookaLeftAnimCmds,
    sToadZookaRightAnimCmds,
};

const struct SpriteTemplate gToadLeftSpriteTemplate =
{
    .tileTag = ANIM_TAG_TOAD,
    .paletteTag = ANIM_TAG_TOAD,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sToadZookaAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};
const struct SpriteTemplate gToadRightSpriteTemplate =
{
    .tileTag = ANIM_TAG_TOAD,
    .paletteTag = ANIM_TAG_TOAD,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sToadZookaAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gBulletBillLeftSpriteTemplate =
{
    .tileTag = ANIM_TAG_BULLET_BILL,
    .paletteTag = ANIM_TAG_BULLET_BILL,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sToadZookaAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};
const struct SpriteTemplate gBulletBillRightSpriteTemplate =
{
    .tileTag = ANIM_TAG_BULLET_BILL,
    .paletteTag = ANIM_TAG_BULLET_BILL,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sToadZookaAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gBazookaSpriteTemplate =
{
    .tileTag = ANIM_TAG_BAZOOKA,
    .paletteTag = ANIM_TAG_BAZOOKA,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gVaultBoySpriteTemplate =
{
    .tileTag = ANIM_TAG_VAULT_BOY,
    .paletteTag = ANIM_TAG_VAULT_BOY,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gHumanHandMoveSpriteTemplate =
{
    .tileTag = ANIM_TAG_HUMAN_HAND,
    .paletteTag = ANIM_TAG_HUMAN_HAND,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gHumanHandRotateSpriteTemplate =
{
    .tileTag = ANIM_TAG_HUMAN_HAND,
    .paletteTag = ANIM_TAG_HUMAN_HAND,
    .oam = &gOamData_AffineOff_ObjNormal_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimRotateThenWait,
};


static const union AnimCmd sAnim_Card0[] = { ANIMCMD_FRAME(0, 0), ANIMCMD_END };
static const union AnimCmd sAnim_Card1[] = { ANIMCMD_FRAME(16, 0), ANIMCMD_END };
static const union AnimCmd sAnim_Card2[] = { ANIMCMD_FRAME(32, 0), ANIMCMD_END };
static const union AnimCmd sAnim_Card3[] = { ANIMCMD_FRAME(48, 0), ANIMCMD_END };
static const union AnimCmd sAnim_Card4[] = { ANIMCMD_FRAME(64, 0), ANIMCMD_END };

static const union AnimCmd *const sCardAnims[] =
{
    sAnim_Card0,
    sAnim_Card1,
    sAnim_Card2,
    sAnim_Card3,
    sAnim_Card4,
};

const struct SpriteTemplate gExodiaSpriteTemplate =
{
    .tileTag = ANIM_TAG_EXODIA,
    .paletteTag = ANIM_TAG_EXODIA,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = sCardAnims,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimCardFly,
};


static const u8 sPentagramAngles[5] =
{
    145,  // top-left
    239,  // top-right
    96,   // bottom-left
    32,   // bottom-right
    192   // top
};
static const s16 sStartOffsetX[5] = { 0, 0, 0, 0, 0 };
static const s16 sStartOffsetY[5] = { 0, 0, 0, 0, 0 };

#define CARD_SPEED 8
#define CARD_RADIUS 24
#define ABS(x) ((x) < 0 ? -(x) : (x))

static void AnimCardFly(struct Sprite *sprite)
{
    u8 index;
    s16 centerX;
    s16 centerY;
    s16 endX;
    s16 endY;
    s16 xSpeed;
    s16 ySpeed;
    s16 duration;
    s16 startX;
    s16 startY;
    u8 angle;
    switch (sprite->data[0])
    {
    case 0: // INIT
    {
        index = gBattleAnimArgs[0];

        centerX = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X);
        centerY = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y);

        angle = sPentagramAngles[index];

        // ----- CONFIGURABLE PARAMETERS -----

        endX = centerX + Cos(angle, CARD_RADIUS);
        endY = centerY + Sin(angle, CARD_RADIUS);

        xSpeed = Cos(angle, CARD_SPEED);
        ySpeed = Sin(angle, CARD_SPEED);

        duration = 24;   // tweakable

        // -----------------------------------

        // Compute starting position backwards
        startX = endX - (xSpeed * duration);
        startY = endY - (ySpeed * duration);

        sprite->x = startX;
        sprite->y = startY;

        sprite->data[1] = 0;          // frame counter
        sprite->data[2] = duration;
        sprite->data[3] = endX;
        sprite->data[4] = endY;
        sprite->data[5] = xSpeed;
        sprite->data[6] = ySpeed;
        sprite->data[7] = gBattleAnimArgs[1];  // lifetime

        StartSpriteAnim(sprite, index);

        sprite->data[0] = 1;
        break;
    }

    case 1:
    {
        sprite->x += sprite->data[5];
        sprite->y += sprite->data[6];

        sprite->data[1]++;   // movement timer

        if (sprite->data[1] >= sprite->data[2])
        {
            sprite->x = sprite->data[3];
            sprite->y = sprite->data[4];
        }

        if (sprite->data[1] >= sprite->data[7])
        {
            //DestroySprite(sprite);
            DestroyAnimSprite(sprite);
            //sprite->callback = AnimCardFly_Step;
            //DestroyAnimVisualTask(taskId);
        }

        break;
    }
    }
}

static const union AffineAnimCmd sStretchAttackerAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(96, -13, 0, 8),
    AFFINEANIMCMD_END,
};

static const union AnimCmd sSpeedDustAnimCmds[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(4, 3),
    ANIMCMD_FRAME(8, 3),
    ANIMCMD_FRAME(4, 3),
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_END,
};

static const union AnimCmd *const sSpeedDustAnimTable[] =
{
    sSpeedDustAnimCmds,
};

const struct SpriteTemplate gSpeedDustSpriteTemplate =
{
    .tileTag = ANIM_TAG_SPEED_DUST,
    .paletteTag = ANIM_TAG_SPEED_DUST,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sSpeedDustAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSpeedDust,
};

static const s8 sSpeedDustPosTable[][2] =
{
    {30, 28},
    {-20, 24},
    {16, 26},
    {-10, 28},
};

static const union AnimCmd sBellAnimCmds[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(32, 15),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(16, 6, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 15, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 6, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(32, 15),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_END,
};

static const union AnimCmd *const sBellAnimTable[] =
{
    sBellAnimCmds,
};

const struct SpriteTemplate gBellSpriteTemplate =
{
    .tileTag = ANIM_TAG_BELL,
    .paletteTag = ANIM_TAG_BELL,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sBellAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSpriteOnMonPos,
};

#define NUM_MUSIC_NOTE_PAL_TAGS  3

const u16 gMusicNotePaletteTagsTable[NUM_MUSIC_NOTE_PAL_TAGS] =
{
    ANIM_TAG_MUSIC_NOTES_2,
    ANIM_SPRITES_START - 1,
    ANIM_SPRITES_START - 2,
};

const struct SpriteTemplate gHealBellMusicNoteSpriteTemplate =
{
    .tileTag = ANIM_TAG_MUSIC_NOTES_2,
    .paletteTag = ANIM_TAG_MUSIC_NOTES_2,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimHealBellMusicNote,
};

const struct SpriteTemplate gMagentaHeartSpriteTemplate =
{
    .tileTag = ANIM_TAG_MAGENTA_HEART,
    .paletteTag = ANIM_TAG_MAGENTA_HEART,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMagentaHeart,
};

const struct SpriteTemplate gLettuceSnuggleSpriteTemplate =
{
    .tileTag = ANIM_TAG_LETTUCE,
    .paletteTag = ANIM_TAG_LETTUCE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMagentaHeart,
};

static const union AffineAnimCmd sAffineAnims_StretchBattlerUp[] =
{
    AFFINEANIMCMD_FRAME(10, -13, 0, 10),
    AFFINEANIMCMD_FRAME(-10, 13, 0, 10),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sAffineAnims_GlitchBattlerUp[] =
{
    AFFINEANIMCMD_FRAME(2, -4, 0, 90),
    AFFINEANIMCMD_END,
};

const struct SpriteTemplate gRedHeartProjectileSpriteTemplate =
{
    .tileTag = ANIM_TAG_RED_HEART,
    .paletteTag = ANIM_TAG_RED_HEART,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimRedHeartProjectile,
};

static const union AnimCmd sSparkleBurstAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sSparkleBurstAnimTable[] =
{
    sSparkleBurstAnimCmds,
};


const struct SpriteTemplate gSparkleBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_EYE_SPARKLE,
    .paletteTag = ANIM_TAG_EYE_SPARKLE,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sSparkleBurstAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gWeedBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_WEED_SMALL,
    .paletteTag = ANIM_TAG_WEED_SMALL,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gCandyBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_RARE_CANDY,
    .paletteTag = ANIM_TAG_RARE_CANDY,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gLetterRBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_LETTER_R,
    .paletteTag = ANIM_TAG_LETTER_R,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

static const union AnimCmd sPrimeBurstAnim_0[] =
{
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_END,
};
static const union AnimCmd sPrimeBurstAnim_1[] =
{
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_END,
};
static const union AnimCmd sPrimeBurstAnim_2[] =
{
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sPrimeBurstAnimTable[] =
{
    sPrimeBurstAnim_0,
    sPrimeBurstAnim_1,
    sPrimeBurstAnim_2,
};

const struct SpriteTemplate gPrimeOneBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_PRIME_NUMBERS,
    .paletteTag = ANIM_TAG_PRIME_NUMBERS,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sPrimeBurstAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gPrimeTwoBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_PRIME_NUMBERS,
    .paletteTag = ANIM_TAG_PRIME_NUMBERS,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sPrimeBurstAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gPrimeThreeBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_PRIME_NUMBERS,
    .paletteTag = ANIM_TAG_PRIME_NUMBERS,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sPrimeBurstAnimTable[2],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gRedHeartBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_RED_HEART,
    .paletteTag = ANIM_TAG_RED_HEART,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gPixelBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_SESAME,
    .paletteTag = ANIM_TAG_SESAME,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gEonTicketBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_EON_TICKET,
    .paletteTag = ANIM_TAG_EON_TICKET,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

static const union AnimCmd sAnarchyOneAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};
static const union AnimCmd sAnarchyTwoAnimCmds[] =
{
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_END,
};
static const union AnimCmd sAnarchyThreeAnimCmds[] =
{
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_END,
};
static const union AnimCmd sAnarchyFourAnimCmds[] =
{
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_END,
};
static const union AnimCmd sAnarchyFiveAnimCmds[] =
{
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnarchyAnimTable[] =
{
    sAnarchyOneAnimCmds,
    sAnarchyTwoAnimCmds,
    sAnarchyThreeAnimCmds,
    sAnarchyFourAnimCmds,
    sAnarchyFiveAnimCmds,
};

const struct SpriteTemplate gAnarchyBurstOneSpriteTemplate =
{
    .tileTag = ANIM_TAG_ANARCHY,
    .paletteTag = ANIM_TAG_ANARCHY,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sAnarchyAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};
const struct SpriteTemplate gAnarchyBurstTwoSpriteTemplate =
{
    .tileTag = ANIM_TAG_ANARCHY,
    .paletteTag = ANIM_TAG_ANARCHY,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sAnarchyAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};
const struct SpriteTemplate gAnarchyBurstThreeSpriteTemplate =
{
    .tileTag = ANIM_TAG_ANARCHY,
    .paletteTag = ANIM_TAG_ANARCHY,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sAnarchyAnimTable[2],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};
const struct SpriteTemplate gAnarchyBurstFourSpriteTemplate =
{
    .tileTag = ANIM_TAG_ANARCHY,
    .paletteTag = ANIM_TAG_ANARCHY,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sAnarchyAnimTable[3],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};
const struct SpriteTemplate gAnarchyBurstFiveSpriteTemplate =
{
    .tileTag = ANIM_TAG_ANARCHY,
    .paletteTag = ANIM_TAG_ANARCHY,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sAnarchyAnimTable[4],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gKrabbyBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_THROWN_KRABBY,
    .paletteTag = ANIM_TAG_THROWN_KRABBY,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gShortsBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_MINI_SHORTS,
    .paletteTag = ANIM_TAG_MINI_SHORTS,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gOnionBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_ONION,
    .paletteTag = ANIM_TAG_ONION,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gChocolateBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_CHOCOLATE,
    .paletteTag = ANIM_TAG_CHOCOLATE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

static const union AnimCmd sSmallMushroomAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};

static const union AnimCmd sBigMushroomAnimCmds[] =
{
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sMushroomsAnimTable[] =
{
    sSmallMushroomAnimCmds,
    sBigMushroomAnimCmds,
};

const struct SpriteTemplate gSmallMushroomBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_MUSHROOM,
    .paletteTag = ANIM_TAG_MUSHROOM,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sMushroomsAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gBigMushroomBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_MUSHROOM,
    .paletteTag = ANIM_TAG_MUSHROOM,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sMushroomsAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

static const union AnimCmd sLeftFeatherBurstAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sLeftFeatherBurstAnimTable[] =
{
    sLeftFeatherBurstAnimCmds,
};
const struct SpriteTemplate gLeftFeatherBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_WHITE_FEATHER,
    .paletteTag = ANIM_TAG_WHITE_FEATHER,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sLeftFeatherBurstAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

static const union AnimCmd sRightFeatherBurstAnimCmds[] =
{
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sRightFeatherBurstAnimTable[] =
{
    sRightFeatherBurstAnimCmds,
};
const struct SpriteTemplate gRightFeatherBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_WHITE_FEATHER,
    .paletteTag = ANIM_TAG_WHITE_FEATHER,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sRightFeatherBurstAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gZygardeZBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_ZYGARDE_Z,
    .paletteTag = ANIM_TAG_ZYGARDE_Z,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

static const union AnimCmd sCerealBurstAnimCmd1[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};
static const union AnimCmd sCerealBurstAnimCmd2[] =
{
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_END,
};
static const union AnimCmd sCerealBurstAnimCmd3[] =
{
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_END,
};
static const union AnimCmd sCerealBurstAnimCmd4[] =
{
    ANIMCMD_FRAME(12, 4),
    ANIMCMD_END,
};
static const union AnimCmd sCerealBurstAnimCmd5[] =
{
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sCerealBurstAnimTable[] =
{
    sCerealBurstAnimCmd1,
    sCerealBurstAnimCmd2,
    sCerealBurstAnimCmd3,
    sCerealBurstAnimCmd4,
    sCerealBurstAnimCmd5,
};

const struct SpriteTemplate gCerealBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_CEREAL,
    .paletteTag = ANIM_TAG_CEREAL,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sCerealBurstAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurstWithFrame,
};

const struct SpriteTemplate gBreadBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_BREAD,
    .paletteTag = ANIM_TAG_BREAD,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gPeanutBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_PEANUT,
    .paletteTag = ANIM_TAG_PEANUT,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gLettuceBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_LETTUCE,
    .paletteTag = ANIM_TAG_LETTUCE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gKetchupBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_KETCHUP,
    .paletteTag = ANIM_TAG_KETCHUP,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gPickleBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_PICKLE_SPEAR,
    .paletteTag = ANIM_TAG_PICKLE_SPEAR,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gCheeseBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_CHEESE,
    .paletteTag = ANIM_TAG_CHEESE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gTomatoBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_TOMATO,
    .paletteTag = ANIM_TAG_TOMATO,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gSesameBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_SESAME,
    .paletteTag = ANIM_TAG_SESAME,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gAngerMarkBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_ANGER,
    .paletteTag = ANIM_TAG_ANGER,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAngerMarkAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gMovieFileBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_MOVIE_FILE,
    .paletteTag = ANIM_TAG_MOVIE_FILE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sAngerMarkAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gRedDiamondBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_RED_DIAMOND,
    .paletteTag = ANIM_TAG_RED_DIAMOND,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gBlackSpadeBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_BLACK_SPADE,
    .paletteTag = ANIM_TAG_BLACK_SPADE,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gBlackClubBurstSpriteTemplate =
{
    .tileTag = ANIM_TAG_BLACK_CLUB,
    .paletteTag = ANIM_TAG_BLACK_CLUB,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimParticleBurst,
};

const struct SpriteTemplate gRedHeartRisingSpriteTemplate =    
{
    .tileTag = ANIM_TAG_RED_HEART,
    .paletteTag = ANIM_TAG_RED_HEART,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimRedHeartRising,
};

const struct SpriteTemplate gSmallMushroomRisingSpriteTemplate =    
{
    .tileTag = ANIM_TAG_MUSHROOM,
    .paletteTag = ANIM_TAG_MUSHROOM,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sMushroomsAnimTable[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimRedHeartRising,
};

const struct SpriteTemplate gBigMushroomRisingSpriteTemplate =    
{
    .tileTag = ANIM_TAG_MUSHROOM,
    .paletteTag = ANIM_TAG_MUSHROOM,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = &sMushroomsAnimTable[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimRedHeartRising,
};

static const union AffineAnimCmd sHiddenPowerOrbAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_FRAME(8, 8, 0, 1),
    AFFINEANIMCMD_JUMP(1),
};

static const union AffineAnimCmd *const sHiddenPowerOrbAffineAnimTable[] =
{
    sHiddenPowerOrbAffineAnimCmds,
};

const struct SpriteTemplate gHiddenPowerOrbSpriteTemplate =    
{
    .tileTag = ANIM_TAG_RED_ORB,
    .paletteTag = ANIM_TAG_RED_ORB,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sHiddenPowerOrbAffineAnimTable,
    .callback = AnimOrbitFast,
};

const struct SpriteTemplate gHiddenTowerOrbSpriteTemplate =    
{
    .tileTag = ANIM_TAG_RED_ORB,
    .paletteTag = ANIM_TAG_RED_ORB,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sHiddenPowerOrbAffineAnimTable,
    .callback = AnimOrbitShort,
};

const struct SpriteTemplate gHiddenPowerOrbScatterSpriteTemplate =
{
    .tileTag = ANIM_TAG_RED_ORB,
    .paletteTag = ANIM_TAG_RED_ORB,
    .oam = &gOamData_AffineDouble_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sHiddenPowerOrbAffineAnimTable,
    .callback = AnimOrbitScatter,
};

static const union AffineAnimCmd sSpitUpOrbAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(128, 128, 0, 0),
    AFFINEANIMCMD_FRAME(8, 8, 0, 1),
    AFFINEANIMCMD_JUMP(1),
};

static const union AffineAnimCmd *const sSpitUpOrbAffineAnimTable[] =
{
    sSpitUpOrbAffineAnimCmds,
};

const struct SpriteTemplate gSpitUpOrbSpriteTemplate =
{
    .tileTag = ANIM_TAG_RED_ORB_2,
    .paletteTag = ANIM_TAG_RED_ORB_2,
    .oam = &gOamData_AffineDouble_ObjNormal_8x8,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sSpitUpOrbAffineAnimTable,
    .callback = AnimSpitUpOrb,
};

const struct SpriteTemplate gSpitUpSmallMushroomSpriteTemplate =
{
    .tileTag = ANIM_TAG_MUSHROOM,
    .paletteTag = ANIM_TAG_MUSHROOM,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = &sMushroomsAnimTable[0],
    .images = NULL,
    .affineAnims = sSpitUpOrbAffineAnimTable,
    .callback = AnimSpitUpOrb,
};

const struct SpriteTemplate gSpitUpBigMushroomSpriteTemplate =
{
    .tileTag = ANIM_TAG_MUSHROOM,
    .paletteTag = ANIM_TAG_MUSHROOM,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = &sMushroomsAnimTable[1],
    .images = NULL,
    .affineAnims = sSpitUpOrbAffineAnimTable,
    .callback = AnimSpitUpOrb,
};

static const union AnimCmd sEyeSparkleAnimCmds[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sEyeSparkleAnimTable[] =
{
    sEyeSparkleAnimCmds,
};

const struct SpriteTemplate gEyeSparkleSpriteTemplate =
{
    .tileTag = ANIM_TAG_EYE_SPARKLE,
    .paletteTag = ANIM_TAG_EYE_SPARKLE,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sEyeSparkleAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimEyeSparkle,
};
const struct SpriteTemplate gEyeSparkleAbsoluteSpriteTemplate =
{
    .tileTag = ANIM_TAG_EYE_SPARKLE,
    .paletteTag = ANIM_TAG_EYE_SPARKLE,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sEyeSparkleAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};
const struct SpriteTemplate gVacuumSpriteTemplate =
{
    .tileTag = ANIM_TAG_VACUUM,
    .paletteTag = ANIM_TAG_VACUUM,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

const struct SpriteTemplate gLandingDustSpriteTemplate =
{
    .tileTag = ANIM_TAG_SPEED_DUST,
    .paletteTag = ANIM_TAG_SPEED_DUST,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = sSpeedDustAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSprite_MoveThenWait,
};

static const union AnimCmd sAngelSpriteAnimCmds[] =
{
    ANIMCMD_FRAME(0, 24),
    ANIMCMD_END,
};

static const union AnimCmd *const sAngelSpriteAnimTable[] =
{
    sAngelSpriteAnimCmds,
};

const struct SpriteTemplate gAngelSpriteTemplate =
{
    .tileTag = ANIM_TAG_ANGEL,
    .paletteTag = ANIM_TAG_ANGEL,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAngelSpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimAngel,
};

const struct SpriteTemplate gPinkHeartSpriteTemplate =    
{
    .tileTag = ANIM_TAG_PINK_HEART,
    .paletteTag = ANIM_TAG_PINK_HEART,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimPinkHeart,
};

static const union AnimCmd sDevilAnimCmds1[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sDevilAnimCmds2[] =
{
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sDevilAnimTable[] =
{
    sDevilAnimCmds1,
    sDevilAnimCmds2,
};

const struct SpriteTemplate gDevilSpriteTemplate =
{
    .tileTag = ANIM_TAG_DEVIL,
    .paletteTag = ANIM_TAG_DEVIL,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sDevilAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimDevil,
};

static const union AnimCmd sAnim_FurySwipes[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_FurySwipes_Flipped[] =
{
    ANIMCMD_FRAME(0, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(48, 4, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_FurySwipes[] =
{
    sAnim_FurySwipes,
    sAnim_FurySwipes_Flipped,
};

const struct SpriteTemplate gFurySwipesSpriteTemplate =
{
    .tileTag = ANIM_TAG_SWIPE,
    .paletteTag = ANIM_TAG_SWIPE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sAnims_FurySwipes,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimFurySwipes,
};

static const union AnimCmd sAnim_PSIRockinOne[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(32, 6),
    ANIMCMD_FRAME(48, 6),
    ANIMCMD_FRAME(64, 6),
    ANIMCMD_FRAME(80, 6),
    ANIMCMD_FRAME(96, 6),
    ANIMCMD_FRAME(0, 6, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 6, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 6, .hFlip = TRUE),
    ANIMCMD_FRAME(48, 6, .hFlip = TRUE),
    ANIMCMD_FRAME(64, 6, .hFlip = TRUE),
    ANIMCMD_FRAME(80, 6, .hFlip = TRUE),
    ANIMCMD_FRAME(96, 6, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_PSIRockinOne[] =
{
    sAnim_PSIRockinOne,
};

static const union AnimCmd sAnim_PSIRockinTwo[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(32, 6),
    ANIMCMD_FRAME(48, 6),
    ANIMCMD_FRAME(64, 6),
    ANIMCMD_FRAME(80, 6),
    ANIMCMD_FRAME(96, 6),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_PSIRockinTwo[] =
{
    sAnim_PSIRockinTwo,
};


const struct SpriteTemplate gPSIRockinOneSpriteTemplate =
{
    .tileTag = ANIM_TAG_PSI_ROCKIN_ONE,
    .paletteTag = ANIM_TAG_PSI_ROCKIN_ONE,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = sAnims_PSIRockinOne,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimPSIRockin,
};
const struct SpriteTemplate gPSIRockinTwoSpriteTemplate =
{
    .tileTag = ANIM_TAG_PSI_ROCKIN_TWO,
    .paletteTag = ANIM_TAG_PSI_ROCKIN_TWO,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = sAnims_PSIRockinTwo,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimPSIRockin,
};

static const union AnimCmd sAnim_HBOMaxFinaleOne[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_FRAME(16, 8),
    ANIMCMD_FRAME(32, 8),
    ANIMCMD_FRAME(48, 8),
    ANIMCMD_FRAME(64, 8),
    ANIMCMD_FRAME(80, 8),
    ANIMCMD_FRAME(96, 8),
    ANIMCMD_FRAME(112, 8),
    ANIMCMD_END,
};
static const union AnimCmd sAnim_HBOMaxFinaleTwo[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(16, 8),
    ANIMCMD_FRAME(32, 8),
    ANIMCMD_FRAME(48, 8),
    ANIMCMD_FRAME(64, 8),
    ANIMCMD_FRAME(80, 8),
    ANIMCMD_FRAME(96, 8),
    ANIMCMD_FRAME(112, 20),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_HBOMaxFinale[] =
{
    sAnim_HBOMaxFinaleOne,
    sAnim_HBOMaxFinaleTwo,
};

const struct SpriteTemplate gHBOMaxFinaleOneSpriteTemplate =
{
    .tileTag = ANIM_TAG_FINALE_ONE,
    .paletteTag = ANIM_TAG_FINALE_ONE,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = &sAnims_HBOMaxFinale[0],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimHBOMaxFinale,
};

const struct SpriteTemplate gHBOMaxFinaleTwoSpriteTemplate =
{
    .tileTag = ANIM_TAG_FINALE_TWO,
    .paletteTag = ANIM_TAG_FINALE_TWO,
    .oam = &gOamData_AffineDouble_ObjNormal_32x32,
    .anims = &sAnims_HBOMaxFinale[1],
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimHBOMaxFinale,
};

static const union AnimCmd sMovementWavesAnimCmds1[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(16, 8),
    ANIMCMD_FRAME(32, 8),
    ANIMCMD_FRAME(16, 8),
    ANIMCMD_END,
};

static const union AnimCmd sMovementWavesAnimCmds2[] =
{
    ANIMCMD_FRAME(16, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 8, .hFlip = TRUE),
    ANIMCMD_END,
};

static const union AnimCmd *const sMovementWavesAnimTable[] =
{
    sMovementWavesAnimCmds1,
    sMovementWavesAnimCmds2,
};

const struct SpriteTemplate gMovementWavesSpriteTemplate =
{
    .tileTag = ANIM_TAG_MOVEMENT_WAVES,
    .paletteTag = ANIM_TAG_MOVEMENT_WAVES,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sMovementWavesAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMovementWaves,
};

static const union AffineAnimCmd sUproarAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(-12, 8, 0, 4),
    AFFINEANIMCMD_FRAME(20, -20, 0, 4),
    AFFINEANIMCMD_FRAME(-8, 12, 0, 4),
    AFFINEANIMCMD_END,
};

const struct SpriteTemplate gJaggedMusicNoteSpriteTemplate =
{
    .tileTag = ANIM_TAG_JAGGED_MUSIC_NOTE,
    .paletteTag = ANIM_TAG_JAGGED_MUSIC_NOTE,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimJaggedMusicNote,
};

const struct SpriteTemplate gWeedNoteSpriteTemplate =
{
    .tileTag = ANIM_TAG_WEED_SMALL,
    .paletteTag = ANIM_TAG_WEED_SMALL,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimJaggedMusicNote,
};

const struct SpriteTemplate gFireNoteSpriteTemplate =
{
    .tileTag = ANIM_TAG_SMALL_EMBER,
    .paletteTag = ANIM_TAG_SMALL_EMBER,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimJaggedMusicNote,
};

const struct SpriteTemplate gClangarousSoleSpriteTemplate =
{
    .tileTag = ANIM_TAG_SHOEPRINT,
    .paletteTag = ANIM_TAG_SHOEPRINT,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimJaggedMusicNote,
};

static const union AffineAnimCmd sPerishSongMusicNoteAffineAnimCmds1[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 0, 5),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sPerishSongMusicNoteAffineAnimCmds2[] =
{
    AFFINEANIMCMD_FRAME(0, 0, -8, 16),
    AFFINEANIMCMD_END_ALT(1),
};

static const union AffineAnimCmd sPerishSongMusicNoteAffineAnimCmds3[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 8, 16),
    AFFINEANIMCMD_END_ALT(1),
};

static const union AffineAnimCmd *const sPerishSongMusicNoteAffineAnimTable[] =
{
    sPerishSongMusicNoteAffineAnimCmds1,
    sPerishSongMusicNoteAffineAnimCmds2,
    sPerishSongMusicNoteAffineAnimCmds3,
};

const struct SpriteTemplate gPerishSongMusicNoteSpriteTemplate =
{
    .tileTag = ANIM_TAG_MUSIC_NOTES_2,
    .paletteTag = ANIM_TAG_MUSIC_NOTES_2,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gMusicNotesAnimTable,
    .images = NULL,
    .affineAnims = sPerishSongMusicNoteAffineAnimTable,
    .callback = AnimPerishSongMusicNote,
};

const struct SpriteTemplate gPerishSongMusicNote2SpriteTemplate =
{
    .tileTag = ANIM_TAG_MUSIC_NOTES_2,
    .paletteTag = ANIM_TAG_MUSIC_NOTES_2,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gMusicNotesAnimTable,
    .images = NULL,
    .affineAnims = sPerishSongMusicNoteAffineAnimTable,
    .callback = AnimPerishSongMusicNote2,
};

static const union AffineAnimCmd sGuardRingAffineAnimCmds1[] =
{
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sGuardRingAffineAnimCmds2[] =
{
    AFFINEANIMCMD_FRAME(512, 256, 0, 0),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sGuardRingAffineAnimTable[] =
{
    sGuardRingAffineAnimCmds1,
    sGuardRingAffineAnimCmds2,
};

const struct SpriteTemplate gGuardRingSpriteTemplate =
{
    .tileTag = ANIM_TAG_GUARD_RING,
    .paletteTag = ANIM_TAG_GUARD_RING,
    .oam = &gOamData_AffineDouble_ObjBlend_64x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = sGuardRingAffineAnimTable,
    .callback = AnimGuardRing,
};

// Electrify
const struct SpriteTemplate gElectrifyRingTemplate =
{
    .tileTag = ANIM_TAG_GUARD_RING,
    .paletteTag = ANIM_TAG_SPARK_2,
    .oam = &gOamData_AffineDouble_ObjBlend_64x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gGuardRingAffineAnimTable,
    .callback = SpriteCB_SurroundingRing
};

const struct SpriteTemplate gElectrifyYellowRingTemplate =
{
    .tileTag = ANIM_TAG_THIN_RING,
    .paletteTag = ANIM_TAG_SMALL_EMBER,
    .oam = &gOamData_AffineDouble_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gThinRingExpandingAffineAnimTable,
    .callback = AnimUproarRing
};

const struct SpriteTemplate gMegaStoneSpriteTemplate =
{
    .tileTag = ANIM_TAG_MEGA_STONE,
    .paletteTag = ANIM_TAG_MEGA_STONE,
    .oam = &gOamData_AffineDouble_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gAffineAnims_LusterPurgeCircle,
    .callback = AnimSpriteOnMonPos,
};

const struct SpriteTemplate gMegaParticlesSpriteTemplate =
{
    .tileTag = ANIM_TAG_MEGA_PARTICLES,
    .paletteTag = ANIM_TAG_MEGA_PARTICLES,
    .oam = &gOamData_AffineNormal_ObjBlend_16x16,
    .anims = gPowerAbsorptionOrbAnimTable,
    .images = NULL,
    .affineAnims = gPowerAbsorptionOrbAffineAnimTable,
    .callback = AnimPowerAbsorptionOrb,
};

const struct SpriteTemplate gMegaSymbolSpriteTemplate =
{
    .tileTag = ANIM_TAG_MEGA_SYMBOL,
    .paletteTag = ANIM_TAG_MEGA_SYMBOL,
    .oam = &gOamData_AffineOff_ObjBlend_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMegaSymbolSprite,
};

#define sAmplitudeX  data[1]
#define sCircleSpeed data[2]
#define sMoveSteps   data[3]
#define sAmplitudeY  data[4]

static void AnimCirclingFinger(struct Sprite *sprite)
{
    SetSpriteCoordsToAnimAttackerCoords(sprite);
    SetAnimSpriteInitialXOffset(sprite, gBattleAnimArgs[0]);
    sprite->y += gBattleAnimArgs[1];
    sprite->sAmplitudeX = gBattleAnimArgs[2];
    sprite->sCircleSpeed = gBattleAnimArgs[4];
    sprite->sMoveSteps = gBattleAnimArgs[5];
    sprite->sAmplitudeY = gBattleAnimArgs[3];
    StoreSpriteCallbackInData6(sprite, DestroySpriteAndMatrix);
    sprite->callback = TranslateSpriteInEllipse;
    sprite->callback(sprite);
}

#undef sAmplitudeX
#undef sCircleSpeed
#undef sMoveSteps
#undef sAmplitudeY

static void AnimBouncingMusicNote(struct Sprite *sprite)
{
    u8 battler;
    
    if (gBattleAnimArgs[0] == 0)
        battler = gBattleAnimAttacker;
    else
        battler = gBattleAnimTarget;

    SetSpriteNextToMonHead(battler, sprite);
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->callback = AnimBouncingMusicNote_Step;
}

static void AnimBouncingMusicNote_Step(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->y2 -= 3;
        if (++sprite->data[1] == 6)
            sprite->data[0]++;
        break;
    case 1:
        sprite->y2 += 3;
        if (--sprite->data[1] == 0)
            sprite->data[0]++;
        break;
    case 2:
        if (++sprite->data[1] == 64)
            DestroyAnimSprite(sprite);
        break;
    }
}

static void AnimVibrateBattlerBack_Step(struct Sprite *sprite)
{
    s16 temp;
    gSprites[sprite->data[2]].x2 += sprite->data[1];
    temp = sprite->data[1];
    sprite->data[1] = -temp;
    if (sprite->data[0] == 0)
    {
        gSprites[sprite->data[2]].x2 = 0;
        DestroySpriteAndMatrix(sprite);
    }

    sprite->data[0]--;
}

static void AnimVibrateBattlerBack(struct Sprite *sprite)
{
    u8 spriteId;
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    spriteId = gBattlerSpriteIds[gBattleAnimTarget];
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        sprite->x -= gBattleAnimArgs[0];
    else
        sprite->x += gBattleAnimArgs[0];

    sprite->y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = spriteId;
    sprite->callback = AnimVibrateBattlerBack_Step;
    sprite->invisible = TRUE;
}

static void AnimMovingClamp(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, TRUE);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[4];
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData6(sprite, AnimMovingClamp_Step);
}

static void AnimMovingClamp_Step(struct Sprite *sprite)
{
    sprite->data[0] = sprite->data[1];
    sprite->data[2] = sprite->x;
    sprite->data[4] = sprite->y + 15;
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, AnimMovingClamp_End);
}

static void AnimMovingClamp_End(struct Sprite *sprite)
{
    if (sprite->data[5] == 0)
        DestroyAnimSprite(sprite);
    else
        sprite->data[5]--;
}

// Rotates the attacking mon sprite downwards and then back upwards to its original position.
// No args.
void AnimTask_Withdraw(u8 taskId)
{
    PrepareBattlerSpriteForRotScale(gBattlerSpriteIds[gBattleAnimAttacker], ST_OAM_OBJ_NORMAL);
    gTasks[taskId].func = AnimTask_Withdraw_Step;
}

static void AnimTask_Withdraw_Step(u8 taskId)
{
    u8 spriteId = gBattlerSpriteIds[gBattleAnimAttacker];
    s16 rotation;
    
    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
        rotation = -gTasks[taskId].data[0];
    else
        rotation = gTasks[taskId].data[0];

    SetSpriteRotScale(spriteId, 0x100, 0x100, rotation);
    if (gTasks[taskId].data[1] == 0)
    {
        gTasks[taskId].data[0] += 0xB0;
        // this y position update gets overwritten by SetBattlerSpriteYOffsetFromRotation()
        gSprites[spriteId].y2++;
    }
    else if (gTasks[taskId].data[1] == 1)
    {
        if (++gTasks[taskId].data[3] == 30)
            gTasks[taskId].data[1] = 2;

        return;
    }
    else
    {
        gTasks[taskId].data[0] -= 0xB0;
        // this y position update gets overwritten by SetBattlerSpriteYOffsetFromRotation()
        gSprites[spriteId].y2--;
    }

    SetBattlerSpriteYOffsetFromRotation(spriteId);
    if (gTasks[taskId].data[0] == 0xF20 || gTasks[taskId].data[0] == 0)
    {
        if (gTasks[taskId].data[1] == 2)
        {
            ResetSpriteRotScale(spriteId);
            DestroyAnimVisualTask(taskId);
        }
        else
        {
            gTasks[taskId].data[1]++;
        }
    }
}

// Animates a "zap of energy" used in KINESIS.
// arg 0: x pixel offset
// arg 1: y pixel offset
// arg 2: vertical flip
static void AnimKinesisZapEnergy(struct Sprite *sprite)
{
    SetSpriteCoordsToAnimAttackerCoords(sprite);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        sprite->x -= gBattleAnimArgs[0];
    else
        sprite->x += gBattleAnimArgs[0];

    sprite->y += gBattleAnimArgs[1];
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        sprite->hFlip = TRUE;
        if (gBattleAnimArgs[2])
            sprite->vFlip = TRUE;
    }
    else
    {
        if (gBattleAnimArgs[2])
            sprite->vFlip = TRUE;
    }

    sprite->callback = RunStoredCallbackWhenAnimEnds;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

// Animates a sword that rises into the air after a brief pause.
// arg 0: x pixel offset
// arg 1: y pixel offset
static void AnimSwordsDanceBlade(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, FALSE);
    sprite->callback = RunStoredCallbackWhenAffineAnimEnds;
    StoreSpriteCallbackInData6(sprite, AnimSwordsDanceBlade_Step);
}

static void AnimSwordsDanceBlade_Step(struct Sprite *sprite)
{
    sprite->data[0] = 6;
    sprite->data[2] = sprite->x;
    sprite->data[4] = sprite->y - 32;
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

// Moves a projectile towards the target mon. The sprite is rotated to be pointing
// in the same direction it's moving.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: target x pixel offset
// arg 3: target y pixel offset
// arg 4: duration
void AnimSonicBoomProjectile(struct Sprite *sprite)
{
    s16 targetXPos;
    s16 targetYPos;
    u16 rotation;

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

    InitSpritePosToAnimAttacker(sprite, TRUE);
    targetXPos = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2) + gBattleAnimArgs[2];
    targetYPos = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[3];
    rotation = ArcTan2Neg(targetXPos - sprite->x, targetYPos - sprite->y);
    rotation += 0xF000;
    if (IsContest())
        rotation -= 0x6000;

    TrySetSpriteRotScale(sprite, FALSE, 0x100, 0x100, rotation);
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = targetXPos;
    sprite->data[4] = targetYPos;
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

static void AnimAirWaveProjectile_Step2(struct Sprite *sprite)
{
    if (sprite->data[0]-- <= 0)
    {
        gTasks[sprite->data[7]].data[1]--;
        DestroySprite(sprite);
    }
}

static void AnimAirWaveProjectile_Step1(struct Sprite *sprite)
{
    struct Task* task = &gTasks[sprite->data[7]];
    
    if (sprite->data[0] > task->data[5])
    {
        sprite->data[5] += sprite->data[3];
        sprite->data[6] += sprite->data[4];
    }
    else
    {
        sprite->data[5] -= sprite->data[3];
        sprite->data[6] -= sprite->data[4];
    }

    sprite->data[1] += sprite->data[5];
    sprite->data[2] += sprite->data[6];
    if (1 & task->data[7])
        sprite->x2 = ((u16)sprite->data[1] >> 8) * -1;
    else
        sprite->x2 = (u16)sprite->data[1] >> 8;

    if (1 & task->data[8])
        sprite->y2 = ((u16)sprite->data[2] / 256u) * -1;
    else
        sprite->y2 = (u16)sprite->data[2] / 256u;

    if (sprite->data[0]-- <= 0)
    {
        sprite->data[0] = 30;
        sprite->callback = AnimAirWaveProjectile_Step2;
    }
}

static void AnimAirWaveProjectile(struct Sprite *sprite)
{
    s16 a;
    s16 b;
    s16 c;
    
    struct Task* task = &gTasks[sprite->data[7]];
    
    sprite->data[1] += (-2 & task->data[7]);
    sprite->data[2] += (-2 & task->data[8]);
    if (1 & task->data[7])
        sprite->x2 = ((u16)sprite->data[1] >> 8) * -1;
    else
        sprite->x2 = (u16)sprite->data[1] >> 8;

    if (1 & task->data[8])
        sprite->y2 = ((u16)sprite->data[2] / 256u) * -1;
    else
        sprite->y2 = (u16)sprite->data[2] / 256u;

    if (sprite->data[0]-- <= 0)
    {
        sprite->data[0] = 8;
        task->data[5] = 4;
        a = Q_8_8_inv(0x1000);
        sprite->x += sprite->x2;
        sprite->y += sprite->y2;
        sprite->y2 = 0;
        sprite->x2 = 0;
        if (task->data[11] >= sprite->x)
            b = (task->data[11] - sprite->x) << 8;
        else
            b = (sprite->x - task->data[11]) << 8;

        if (task->data[12] >= sprite->y)
            c = (task->data[12] - sprite->y) << 8;
        else
            c = (sprite->y - task->data[12]) << 8;

        sprite->data[2] = 0;
        sprite->data[1] = 0;
        sprite->data[6] = 0;
        sprite->data[5] = 0;
        sprite->data[3] = Q_8_8_mul(Q_8_8_mul(b, a), Q_8_8_inv(0x1C0));
        sprite->data[4] = Q_8_8_mul(Q_8_8_mul(c, a), Q_8_8_inv(0x1C0));
        sprite->callback = AnimAirWaveProjectile_Step1;
    }
}

static void AirCutterProjectile_Step2(u8 taskId)
{
    if (gTasks[taskId].data[1] == 0)
        DestroyAnimVisualTask(taskId);
}

static void AirCutterProjectile_Step1(u8 taskId)
{
    if (gTasks[taskId].data[0]-- <= 0)
    {
        u8 spriteId;
        struct Sprite *sprite;
        spriteId = CreateSprite(&gAirWaveProjectileSpriteTemplate, gTasks[taskId].data[9], gTasks[taskId].data[10], gTasks[taskId].data[2] - gTasks[taskId].data[1]);
        sprite = &gSprites[spriteId];
        switch (gTasks[taskId].data[4])
        {
        case 1:
            sprite->oam.matrixNum |= (ST_OAM_HFLIP | ST_OAM_VFLIP);
            break;
        case 2:
            sprite->oam.matrixNum = ST_OAM_HFLIP;
            break;
        }

        sprite->data[0] = gTasks[taskId].data[5] - gTasks[taskId].data[6];
        sprite->data[7] = taskId;
        gTasks[taskId].data[gTasks[taskId].data[1] + 13] = spriteId;
        gTasks[taskId].data[0] = gTasks[taskId].data[3];
        gTasks[taskId].data[1]++;
        PlaySE12WithPanning(SE_M_BLIZZARD2, BattleAnimAdjustPanning(-SOUND_PAN_TARGET));
        if (gTasks[taskId].data[1] > 2)
            gTasks[taskId].func = AirCutterProjectile_Step2;
    }
}

void AnimTask_AirCutterProjectile(u8 taskId)
{
    s16 attackerY = 0;
    s16 attackerX = 0;
    s16 targetX = 0;
    s16 targetY = 0;
    s16 xDiff, yDiff;

    if (IsContest())
    {
        gTasks[taskId].data[4] = 2;
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        if (gBattleAnimArgs[2] & 1)
            gBattleAnimArgs[2] &= ~1;
        else
            gBattleAnimArgs[2] |= 1;
    }
    else
    {
        if ((gBattlerPositions[gBattleAnimTarget] & BIT_SIDE) == B_SIDE_PLAYER)
        {
            gTasks[taskId].data[4] = 1;
            gBattleAnimArgs[0] = -gBattleAnimArgs[0];
            gBattleAnimArgs[1] = -gBattleAnimArgs[1];
            if (gBattleAnimArgs[2] & 1)
                gBattleAnimArgs[2] &= ~1;
            else
                gBattleAnimArgs[2] |= 1;
        }
    }

    attackerX = gTasks[taskId].data[9] = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X);
    attackerY = gTasks[taskId].data[10] = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y);
    if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        && IsBattlerSpriteVisible(BATTLE_PARTNER(gBattleAnimTarget)))
    {
        SetAverageBattlerPositions(gBattleAnimTarget, 0, &targetX, &targetY);
    }
    else
    {
        targetX = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X);
        targetY = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y);
    }

    targetX = gTasks[taskId].data[11] = targetX + gBattleAnimArgs[0];
    targetY = gTasks[taskId].data[12] = targetY + gBattleAnimArgs[1];
    if (targetX >= attackerX)
        xDiff = targetX - attackerX;
    else
        xDiff = attackerX - targetX;

    gTasks[taskId].data[5] = Q_8_8_mul(xDiff, Q_8_8_inv(gBattleAnimArgs[2] & ~1));
    gTasks[taskId].data[6] = Q_8_8_mul(gTasks[taskId].data[5], 0x80);
    gTasks[taskId].data[7] = gBattleAnimArgs[2];
    if (targetY >= attackerY)
    {
        yDiff = targetY - attackerY;
        gTasks[taskId].data[8] = Q_8_8_mul(yDiff, Q_8_8_inv(gTasks[taskId].data[5])) & ~1;
    }
    else
    {
        yDiff = attackerY - targetY;
        gTasks[taskId].data[8] = Q_8_8_mul(yDiff, Q_8_8_inv(gTasks[taskId].data[5])) | 1;
    }

    gTasks[taskId].data[3] = gBattleAnimArgs[3];
    if (gBattleAnimArgs[4] & 0x80)
    {
        gBattleAnimArgs[4] ^= 0x80;
        if (gBattleAnimArgs[4] >= 64)
        {
            u16 var = GetBattlerSpriteSubpriority(gBattleAnimTarget) + (gBattleAnimArgs[4] - 64);
            gTasks[taskId].data[2] = var;
        }
        else
        {
            u16 var = GetBattlerSpriteSubpriority(gBattleAnimTarget) - gBattleAnimArgs[4];
            gTasks[taskId].data[2] = var;
        }
    }
    else
    {
        if (gBattleAnimArgs[4] >= 64)
        {
            u16 var = GetBattlerSpriteSubpriority(gBattleAnimTarget) + (gBattleAnimArgs[4] - 64);
            gTasks[taskId].data[2] = var;
        }
        else
        {
            u16 var = GetBattlerSpriteSubpriority(gBattleAnimTarget) - gBattleAnimArgs[4];
            gTasks[taskId].data[2] = var;
        }
    }

    if (gTasks[taskId].data[2] < 3)
        gTasks[taskId].data[2] = 3;

    gTasks[taskId].func = AirCutterProjectile_Step1;
}

static void AnimVoidLines(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, FALSE);
    sprite->data[0] = OBJ_PLTT_ID(IndexOfSpritePaletteTag(sVoidLinesSpriteTemplate.paletteTag));
    sprite->callback = AnimVoidLines_Step;
}

static void AnimVoidLines_Step(struct Sprite *sprite)
{
    u16 id, val;
    int i;

    if (++sprite->data[1] == 2)
    {
        sprite->data[1] = 0;
        id = sprite->data[0];
        val = gPlttBufferFaded[8 + id];
        for (i = 8; i < 16; i++)
            gPlttBufferFaded[i + id] = gPlttBufferFaded[i + id + 1];

        gPlttBufferFaded[id + 15] = val;

        if (++sprite->data[2] == 24)
            DestroyAnimSprite(sprite);
    }
}

static void AnimCoinThrow(struct Sprite *sprite)
{
    s16 r6;
    s16 r7;
    u16 var;

    InitSpritePosToAnimAttacker(sprite, TRUE);
    r6 = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
    r7 = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[3];
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    r6 += gBattleAnimArgs[2];
    var = ArcTan2Neg(r6 - sprite->x, r7 - sprite->y);
    var += 0xC000;
    TrySetSpriteRotScale(sprite, FALSE, 0x100, 0x100, var);
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = r6;
    sprite->data[4] = r7;
    sprite->callback = InitAnimLinearTranslationWithSpeedAndPos;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

static void AnimFallingCoin(struct Sprite *sprite)
{
    sprite->data[2] = -16;
    sprite->y += 8;
    sprite->callback = AnimFallingCoin_Step;
}

static void AnimFallingCoin_Step(struct Sprite *sprite)
{
    sprite->data[0] += 0x80;
    sprite->x2 = sprite->data[0] >> 8;
    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
        sprite->x2 = -sprite->x2;

    sprite->y2 = Sin(sprite->data[1], sprite->data[2]);
    sprite->data[1] += 5;
    if (sprite->data[1] > 126)
    {
        sprite->data[1] = 0;
        sprite->data[2] /= 2;
        if (++sprite->data[3] == 2)
            DestroyAnimSprite(sprite);
    }
}

static void AnimBulletSeed(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, TRUE);
    sprite->data[0] = 20;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->callback = StartAnimLinearTranslation;
    sprite->affineAnimPaused = TRUE;
    StoreSpriteCallbackInData6(sprite, AnimBulletSeed_Step1);
}

static void AnimBulletSeed_Step1(struct Sprite *sprite)
{
    int i;
    u16 rand;
    s16 *ptr;
    
    PlaySE12WithPanning(SE_M_HORN_ATTACK, BattleAnimAdjustPanning(SOUND_PAN_TARGET));
    sprite->x += sprite->x2;
    sprite->y += sprite->y2;
    sprite->y2 = 0;
    sprite->x2 = 0;
    ptr = &sprite->data[7];
    for (i = 0; i < 8; i++)
        ptr[i - 7] = 0;

    rand = Random();
    sprite->data[6] = 0xFFF4 - (rand & 7);
    rand = Random();
    sprite->data[7] = (rand % 0xA0) + 0xA0;
    sprite->callback = AnimBulletSeed_Step2;
    sprite->affineAnimPaused = FALSE;
}

static void AnimBulletPiss(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, TRUE);
    sprite->data[0] = 20;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->callback = StartAnimLinearTranslation;
    sprite->affineAnimPaused = TRUE;
    StoreSpriteCallbackInData6(sprite, AnimBulletPiss_Step1);
}

static void AnimBulletPiss_Step1(struct Sprite *sprite)
{
    int i;
    u16 rand;
    s16 *ptr;
    
    //PlaySE12WithPanning(SE_M_HORN_ATTACK, BattleAnimAdjustPanning(SOUND_PAN_TARGET));
    sprite->x += sprite->x2;
    sprite->y += sprite->y2;
    sprite->y2 = 0;
    sprite->x2 = 0;
    ptr = &sprite->data[7];
    for (i = 0; i < 8; i++)
        ptr[i - 7] = 0;

    rand = Random();
    sprite->data[6] = 0xFFF4 - (rand & 7);
    rand = Random();
    sprite->data[7] = (rand % 0xA0) + 0xA0;
    sprite->callback = AnimBulletSeed_Step2;
    sprite->affineAnimPaused = FALSE;
}

static void AnimDodgeball(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, TRUE);
    sprite->data[0] = 10;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->callback = StartAnimLinearTranslation;
    sprite->affineAnimPaused = TRUE;
    StoreSpriteCallbackInData6(sprite, AnimDodgeball_Step1);
}

static void AnimDodgeball_Step1(struct Sprite *sprite)
{
    int i;
    u16 rand;
    s16 *ptr;
    
    //PlaySE12WithPanning(SE_DODGEBALL, BattleAnimAdjustPanning(SOUND_PAN_TARGET));
    sprite->x += sprite->x2;
    sprite->y += sprite->y2;
    sprite->y2 = 0;
    sprite->x2 = 0;
    ptr = &sprite->data[7];
    for (i = 0; i < 8; i++)
        ptr[i - 7] = 0;

    rand = Random();
    sprite->data[6] = 0xFFF4 - (rand & 7);
    rand = Random();
    sprite->data[7] = (rand % 0xA0) + 0xA0;
    sprite->callback = AnimBulletSeed_Step2;
    sprite->affineAnimPaused = FALSE;
}

static void AnimBulletSeed_Step2(struct Sprite *sprite)
{
    sprite->data[0] += sprite->data[7];
    sprite->x2 = sprite->data[0] >> 8;
    if (sprite->data[7] & 1)
        sprite->x2 = -sprite->x2;

    sprite->y2 = Sin(sprite->data[1], sprite->data[6]);
    sprite->data[1] += 8;
    if (sprite->data[1] > 126)
    {
        sprite->data[1] = 0;
        sprite->data[2] /= 2;
        if (++sprite->data[3] == 1)
            DestroyAnimSprite(sprite);
    }
}

// Moves a tornado in a circlular motion.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: wave amplitude
// arg 3: unused
// arg 4: initial wave offset
// arg 5: wave period (higher means faster wave)
// arg 6: duration
static void AnimRazorWindTornado(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, FALSE);
    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
        sprite->y += 16;

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[2] = gBattleAnimArgs[5];
    sprite->data[3] = gBattleAnimArgs[6];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->callback = TranslateSpriteInCircle;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
    sprite->callback(sprite);
}

// Animates a single pincer line that extends towards the center of the target mon.
// arg 0: invert
static void AnimViceGripPincer(struct Sprite *sprite)
{
    s16 startXOffset = 32;
    s16 startYOffset = -32;
    s16 endXOffset = 16;
    s16 endYOffset = -16;
    
    if (gBattleAnimArgs[0])
    {
        startXOffset = -32;
        startYOffset = 32;
        endXOffset = -16;
        endYOffset = 16;
        StartSpriteAnim(sprite, 1);
    }

    sprite->x += startXOffset;
    sprite->y += startYOffset;
    sprite->data[0] = 6;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2) + endXOffset;
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + endYOffset;
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, AnimViceGripPincer_Step);
}

static void AnimViceGripPincer_Step(struct Sprite *sprite)
{
    if (sprite->animEnded)
        DestroyAnimSprite(sprite);
}

// Animates a single pincer line that extends towards the center of the target mon, and then back out.
// arg 0: animation id
static void AnimGuillotinePincer(struct Sprite *sprite)
{
    s16 startXOffset = 32;
    s16 startYOffset = -32;
    s16 endXOffset = 16;
    s16 endYOffset = -16;
    
    if (gBattleAnimArgs[0])
    {
        startXOffset = -32;
        startYOffset = 32;
        endXOffset = -16;
        endYOffset = 16;
        StartSpriteAnim(sprite, gBattleAnimArgs[0]);
    }

    sprite->x += startXOffset;
    sprite->y += startYOffset;
    sprite->data[0] = 6;
    sprite->data[1] = sprite->x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2) + endXOffset;
    sprite->data[3] = sprite->y;
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + endYOffset;
    InitAnimLinearTranslation(sprite);
    sprite->data[5] = gBattleAnimArgs[0];
    sprite->data[6] = sprite->data[0];
    sprite->callback = AnimGuillotinePincer_Step1;
}

static void AnimGuillotinePincer_Step1(struct Sprite *sprite)
{
    if (AnimTranslateLinear(sprite) && sprite->animEnded)
    {
        SeekSpriteAnim(sprite, 0);
        sprite->animPaused = TRUE;
        sprite->x += sprite->x2;
        sprite->y += sprite->y2;
        sprite->x2 = 2;
        sprite->y2 = -2;
        sprite->data[0] = sprite->data[6];
        sprite->data[1] ^= 1;
        sprite->data[2] ^= 1;
        sprite->data[4] = 0;
        sprite->data[3] = 0;
        sprite->callback = AnimGuillotinePincer_Step2;
    }
}

static void AnimGuillotinePincer_Step2(struct Sprite *sprite)
{
    if (sprite->data[3])
    {
        sprite->x2 = -sprite->x2;
        sprite->y2 = -sprite->y2;
    }

    sprite->data[3] ^= 1;
    if (++sprite->data[4] == 51)
    {
        sprite->y2 = 0;
        sprite->x2 = 0;
        sprite->data[4] = 0;
        sprite->data[3] = 0;
        sprite->animPaused = FALSE;
        StartSpriteAnim(sprite, sprite->data[5] ^ 1);
        sprite->callback = AnimGuillotinePincer_Step3;
    }
}

static void AnimGuillotinePincer_Step3(struct Sprite *sprite)
{
    if (AnimTranslateLinear(sprite))
        DestroyAnimSprite(sprite);
}

// Scales up the target mon sprite, and sets the palette to greyscale.
// Used in MOVE_DISABLE.
// No args.
void AnimTask_GrowAndGrayscale(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(ANIM_TARGET);
    
    PrepareBattlerSpriteForRotScale(spriteId, ST_OAM_OBJ_BLEND);
    SetSpriteRotScale(spriteId, 0xD0, 0xD0, 0);
    SetGreyscaleOrOriginalPalette(gSprites[spriteId].oam.paletteNum + 16, FALSE);
    gTasks[taskId].data[0] = 80;
    gTasks[taskId].func = AnimTask_GrowAndGrayscale_Step;
}

static void AnimTask_GrowAndGrayscale_Step(u8 taskId)
{
    if (--gTasks[taskId].data[0] == -1)
    {
        u8 spriteId = GetAnimBattlerSpriteId(ANIM_TARGET);
        ResetSpriteRotScale(spriteId);
        SetGreyscaleOrOriginalPalette(gSprites[spriteId].oam.paletteNum + 16, TRUE);
        DestroyAnimVisualTask(taskId);
    }
}

// Shrinks and grows the attacking mon several times. Also creates transparent versions of the
// mon's sprite while it is shrinking.
// No args.
void AnimTask_Minimize(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBattlerSpriteId(ANIM_TARGET);
    
    task->data[0] = spriteId;
    PrepareBattlerSpriteForRotScale(spriteId, ST_OAM_OBJ_NORMAL);
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0x100;
    task->data[5] = 0;
    task->data[6] = 0;
    task->data[7] = GetBattlerSpriteSubpriority(gBattleAnimTarget);
    task->func = AnimTask_Minimize_Step1;
}

static void AnimTask_Minimize_Step1(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    
    switch (task->data[1])
    {
    case 0:
        if (task->data[2] == 0 || task->data[2] == 3 || task->data[2] == 6)
            CreateMinimizeSprite(task, taskId);
        task->data[2]++;
        task->data[4] += 0x28;
        SetSpriteRotScale(task->data[0], task->data[4], task->data[4], 0);
        SetBattlerSpriteYOffsetFromYScale(task->data[0]);
        if (task->data[2] == 32)
        {
            task->data[5]++;
            task->data[1]++;
        }
        break;
    case 1:
        if (task->data[6] == 0)
        {
            if (task->data[5] == 3)
            {
                task->data[2] = 0;
                task->data[1] = 3;
            }
            else
            {
                task->data[2] = 0;
                task->data[3] = 0;
                task->data[4] = 0x100;
                SetSpriteRotScale(task->data[0], task->data[4], task->data[4], 0);
                SetBattlerSpriteYOffsetFromYScale(task->data[0]);
                task->data[1] = 2;
            }
        }
        break;
    case 2:
        task->data[1] = 0;
        break;
    case 3:
        if (++task->data[2] > 32)
        {
            task->data[2] = 0;
            task->data[1]++;
        }
        break;
    case 4:
        task->data[2] += 2;
        task->data[4] -= 0x50;
        SetSpriteRotScale(task->data[0], task->data[4], task->data[4], 0);
        SetBattlerSpriteYOffsetFromYScale(task->data[0]);
        if (task->data[2] == 32)
        {
            task->data[2] = 0;
            task->data[1]++;
        }
        break;
    case 5:
        ResetSpriteRotScale(task->data[0]);
        gSprites[task->data[15]].y2 = 0;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void CreateMinimizeSprite(struct Task* task, u8 taskId)
{
    u16 matrixNum;
    s16 spriteId = CloneBattlerSpriteWithBlend(ANIM_TARGET);
    
    if (spriteId >= 0)
    {
        if ((matrixNum = AllocOamMatrix()) == 0xFF)
        {
            DestroySpriteWithActiveSheet(&gSprites[spriteId]);
        }
        else
        {
            gSprites[spriteId].oam.objMode = ST_OAM_OBJ_BLEND;
            gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_DOUBLE;
            gSprites[spriteId].affineAnimPaused = TRUE;
            gSprites[spriteId].oam.matrixNum = matrixNum;
            gSprites[spriteId].subpriority = task->data[7] - task->data[3];
            task->data[3]++;
            task->data[6]++;
            gSprites[spriteId].data[0] = 16;
            gSprites[spriteId].data[1] = taskId;
            gSprites[spriteId].data[2] = 6;
            gSprites[spriteId].callback = ClonedMinizeSprite_Step;
            SetSpriteRotScale(spriteId, task->data[4], task->data[4], 0);
            gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
            CalcCenterToCornerVec(&gSprites[spriteId], gSprites[spriteId].oam.shape, gSprites[spriteId].oam.size, gSprites[spriteId].oam.affineMode);
        }
    }
}

static void ClonedMinizeSprite_Step(struct Sprite *sprite)
{
    if (--sprite->data[0] == 0)
    {
        gTasks[sprite->data[1]].data[sprite->data[2]]--;
        FreeOamMatrix(sprite->oam.matrixNum);
        DestroySpriteWithActiveSheet(sprite);
    }
}

// Task to facilitate expanding and hopping effect seen in Splash.
// arg 0: anim battler
// arg 1: num hops
void AnimTask_Splash(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    
    if (gBattleAnimArgs[1] == 0)
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        u8 spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
        task->data[0] = spriteId;
        task->data[1] = 0;
        task->data[2] = gBattleAnimArgs[1];
        task->data[3] = 0;
        task->data[4] = 0;
        PrepareAffineAnimInTaskData(task, spriteId, sSplashEffectAffineAnimCmds);
        task->func = AnimTask_Splash_Step;
    }
}

static void AnimTask_Splash_Step(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    
    switch (task->data[1])
    {
    case 0:
        RunAffineAnimFromTaskData(task);
        task->data[4] += 3;
        gSprites[task->data[0]].y2 += task->data[4];
        if (++task->data[3] > 7)
        {
            task->data[3] = 0;
            task->data[1]++;
        }
        break;
    case 1:
        RunAffineAnimFromTaskData(task);
        gSprites[task->data[0]].y2 += task->data[4];
        if (++task->data[3] > 7)
        {
            task->data[3] = 0;
            task->data[1]++;
        }
        break;
    case 2:
        if (task->data[4] != 0)
        {
            gSprites[task->data[0]].y2 -= 2;
            task->data[4] -= 2;
        }
        else
            task->data[1]++;
        break;
    case 3:
        if (!RunAffineAnimFromTaskData(task))
        {
            if (--task->data[2] == 0)
            {
                gSprites[task->data[0]].y2 = 0;
                DestroyAnimVisualTask(taskId);
            }
            else
            {
                PrepareAffineAnimInTaskData(task, task->data[0], sSplashEffectAffineAnimCmds);
                task->data[1] = 0;
            }
        }
        break;
    }
}

// Grows, pauses, then shrinks the attacking mon.
// Used by MOVE_SWAGGER and MOVE_BULK_UP
// No args.
void AnimTask_GrowAndShrink(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBattlerSpriteId(ANIM_ATTACKER);
    
    PrepareAffineAnimInTaskData(task, spriteId, sGrowAndShrinkAffineAnimCmds);
    task->func = AnimTask_GrowAndShrink_Step;
}

void AnimTask_PuffUpAndShrink(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBattlerSpriteId(ANIM_ATTACKER);
    
    PrepareAffineAnimInTaskData(task, spriteId, sPuffUpAndShrinkAffineAnimCmds);
    task->func = AnimTask_GrowAndShrink_Step;
}

// Grows, pauses for a long time, then shrinks the attacking mon.
void AnimTask_GrowWaitAndShrink(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBattlerSpriteId(ANIM_ATTACKER);
    
    PrepareAffineAnimInTaskData(task, spriteId, sGrowWaitAndShrinkAffineAnimCmds);
    task->func = AnimTask_GrowAndShrink_Step;
}

static void AnimTask_GrowAndShrink_Step(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    
    if (!RunAffineAnimFromTaskData(task))
        DestroyAnimVisualTask(taskId);
}

// Animates a little puff of the mon's breath.
// Used by MOVE_SWAGGER and MOVE_BULK_UP
// No args.
static void AnimBreathPuff(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
    {
        StartSpriteAnim(sprite, 0);
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2) + 32;
        sprite->data[1] = 64;
    }
    else
    {
        StartSpriteAnim(sprite, 1);
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2) - 32;
        sprite->data[1] = -64;
    }

    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->data[0] = 52;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
    sprite->callback = TranslateSpriteLinearFixedPoint;
}

// Animates an "angry" mark above a mon's head.
// arg 0: target mon (0 = attacker, 1 = target)
// arg 1: x pixel offset
// arg 2: y pixel offset
static void AnimAngerMark(struct Sprite *sprite)
{
    u8 battler;
    
    if (!gBattleAnimArgs[0])
        battler = gBattleAnimAttacker;
    else
        battler = gBattleAnimTarget;

    if (GetBattlerSide(battler) == B_SIDE_OPPONENT)
        gBattleAnimArgs[1] *= -1;

    sprite->x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2) + gBattleAnimArgs[1];
    sprite->y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[2];
    if (sprite->y < 8)
        sprite->y = 8;

    StoreSpriteCallbackInData6(sprite, DestroySpriteAndMatrix);
    sprite->callback = RunStoredCallbackWhenAffineAnimEnds;
}

// left/right movements
void AnimTask_ThrashMoveMonHorizontal(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBattlerSpriteId(ANIM_ATTACKER);
    
    task->data[0] = spriteId;
    task->data[1] = 0;
    PrepareAffineAnimInTaskData(task, spriteId, sThrashMoveMonAffineAnimCmds);
    task->func = AnimTask_ThrashMoveMonHorizontal_Step;
}

static void AnimTask_ThrashMoveMonHorizontal_Step(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    
    if (!RunAffineAnimFromTaskData(task))
        DestroyAnimVisualTask(taskId);
}

// up/down movements
void AnimTask_ThrashMoveMonVertical(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    
    task->data[0] = GetAnimBattlerSpriteId(ANIM_ATTACKER);
    task->data[1] = 0;
    task->data[2] = 4;
    task->data[3] = 7;
    task->data[4] = 3;
    task->data[5] = gSprites[task->data[0]].x;
    task->data[6] = gSprites[task->data[0]].y;
    task->data[7] = 0;
    task->data[8] = 0;
    task->data[9] = 2;
    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_OPPONENT)
        task->data[2] *= -1;

    task->func = AnimTask_ThrashMoveMonVertical_Step;
}

static void AnimTask_ThrashMoveMonVertical_Step(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    
    if (++task->data[7] > 2)
    {
        task->data[7] = 0;
        task->data[8]++;
        if (task->data[8] & 1)
            gSprites[task->data[0]].y += task->data[9];
        else
            gSprites[task->data[0]].y -= task->data[9];
    }
    switch (task->data[1])
    {
    case 0:
        gSprites[task->data[0]].x += task->data[2];
        if (--task->data[3] == 0)
        {
            task->data[3] = 14;
            task->data[1] = 1;
        }
        break;
    case 1:
        gSprites[task->data[0]].x -= task->data[2];
        if (--task->data[3] == 0)
        {
            task->data[3] = 7;
            task->data[1] = 2;
        }
        break;
    case 2:
        gSprites[task->data[0]].x += task->data[2];
        if (--task->data[3] == 0)
        {
            if (--task->data[4] != 0)
            {
                task->data[3] = 7;
                task->data[1] = 0;
            }
            else
            {
                if ((task->data[8] & 1) != 0)
                    gSprites[task->data[0]].y -= task->data[9];

                DestroyAnimVisualTask(taskId);
            }
        }
        break;
    }
}

void AnimTask_SketchDrawMon(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    struct ScanlineEffectParams params;
    s16 i;
    
    task->data[0] = GetBattlerYCoordWithElevation(gBattleAnimTarget) + 32;
    task->data[1] = 4;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0;
    task->data[5] = 0;
    task->data[15] = GetBattlerSpriteCoordAttr(gBattleAnimTarget, BATTLER_COORD_ATTR_HEIGHT);

    if (GetBattlerSpriteBGPriorityRank(gBattleAnimTarget) == 1)
    {
        task->data[6] = gBattle_BG1_X;
        params.dmaDest = (u16 *)REG_ADDR_BG1HOFS;
    }
    else
    {
        task->data[6] = gBattle_BG2_X;
        params.dmaDest = (u16 *)REG_ADDR_BG2HOFS;
    }

    for (i = task->data[0] - 0x40; i <= task->data[0]; i++)
    {
        if (i >= 0)
        {
            gScanlineEffectRegBuffers[0][i] = task->data[6] + 0xF0;
            gScanlineEffectRegBuffers[1][i] = task->data[6] + 0xF0;
        }
    }

    params.dmaControl = SCANLINE_EFFECT_DMACNT_16BIT;
    params.initState = 1;
    params.unused9 = 0;
    ScanlineEffect_SetParams(params);
    task->func = AnimTask_SketchDrawMon_Step;
}


//=====DISCLAIMER: The following code is written by generative AI, modified from the original SketchDrawMon code===========
void AnimTask_SketchupDrawMon(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    struct ScanlineEffectParams params;
    s16 i;
    u8 spriteId;
    u16 palOffset;

    spriteId = GetAnimBattlerSpriteId(ANIM_TARGET);
    palOffset = OBJ_PLTT_ID(gSprites[spriteId].oam.paletteNum);

    task->data[7] = palOffset;

    // Immediately tint the target fully red.
    BlendPalette(palOffset, 16, 16, RGB(30, 0, 0));

    task->data[0] = GetBattlerYCoordWithElevation(gBattleAnimTarget) + 32;
    task->data[1] = 4;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0;
    task->data[5] = 0;
    task->data[15] = GetBattlerSpriteCoordAttr(gBattleAnimTarget, BATTLER_COORD_ATTR_HEIGHT);

    if (GetBattlerSpriteBGPriorityRank(gBattleAnimTarget) == 1)
    {
        task->data[6] = gBattle_BG1_X;
        params.dmaDest = (u16 *)REG_ADDR_BG1HOFS;
    }
    else
    {
        task->data[6] = gBattle_BG2_X;
        params.dmaDest = (u16 *)REG_ADDR_BG2HOFS;
    }

    for (i = task->data[0] - 0x40; i <= task->data[0]; i++)
    {
        if (i >= 0)
        {
            gScanlineEffectRegBuffers[0][i] = task->data[6] + 0xF0;
            gScanlineEffectRegBuffers[1][i] = task->data[6] + 0xF0;
        }
    }

    params.dmaControl = SCANLINE_EFFECT_DMACNT_16BIT;
    params.initState = 1;
    params.unused9 = 0;
    ScanlineEffect_SetParams(params);

    task->func = AnimTask_SketchupDrawMon_Step;
}

static void AnimTask_SketchupDrawMon_Step(u8 taskId)
{
    struct Task* task = &gTasks[taskId];

    switch (task->data[4])
    {
    case 0:
        if (++task->data[5] > 20)
            task->data[4]++;
        break;

    case 1:
        if (++task->data[1] > 3)
        {
            task->data[1] = 0;
            task->data[2] = task->data[3] & 3;
            task->data[5] = task->data[0] - task->data[3];

            switch (task->data[2])
            {
            case 0:
                break;
            case 1:
                task->data[5] -= 2;
                break;
            case 2:
            case 3:
                task->data[5] += 1;
                break;
            }

            if (task->data[5] >= 0)
            {
                gScanlineEffectRegBuffers[0][task->data[5]] = task->data[6];
                gScanlineEffectRegBuffers[1][task->data[5]] = task->data[6];
            }

            if (++task->data[3] >= task->data[15])
            {
                // Stop scanline DMA and begin fading back to normal colors.
                gScanlineEffect.state = 3;
                task->data[4] = 2;
                task->data[5] = 0; // reuse as fade timer
            }
        }
        break;

    case 2:
        {
            // Fade from fully red back to normal by decreasing the blend coefficient.
            u16 palOffset = (u16)task->data[7];
            s16 t = task->data[5];

            if (t <= 16)
                BlendPalette(palOffset, 16, 16 - t, RGB(30, 0, 0));

            if (++task->data[5] > 16)
                DestroyAnimVisualTask(taskId);
        }
        break;
    }
}
//========End of generative AI-written code================


static void AnimTask_SketchDrawMon_Step(u8 taskId)
{
    struct Task* task = &gTasks[taskId];

    switch (task->data[4])
    {
    case 0:
        if (++task->data[5] > 20)
            task->data[4]++;
        break;
    case 1:
        if (++task->data[1] > 3)
        {
            task->data[1] = 0;
            task->data[2] = task->data[3] & 3;
            task->data[5] = task->data[0] - task->data[3];
            switch (task->data[2])
            {
            case 0:
                break;
            case 1:
                task->data[5] -= 2;
                break;
            case 2:
                task->data[5] += 1;
                break;
            case 3:
                task->data[5] += 1;
                break;
            }

            if (task->data[5] >= 0)
            {
                gScanlineEffectRegBuffers[0][task->data[5]] = task->data[6];
                gScanlineEffectRegBuffers[1][task->data[5]] = task->data[6];
            }

            if (++task->data[3] >= task->data[15])
            {
                gScanlineEffect.state = 3;
                DestroyAnimVisualTask(taskId);
            }
        }
        break;
    }
}

static void AnimPencil(struct Sprite *sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X) - 16;
    sprite->y = GetBattlerYCoordWithElevation(gBattleAnimTarget) + 16;
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 16;
    sprite->data[4] = 0;
    sprite->data[5] = GetBattlerSpriteCoordAttr(gBattleAnimTarget, BATTLER_COORD_ATTR_HEIGHT) + 2;
    sprite->data[6] = BattleAnimAdjustPanning(SOUND_PAN_TARGET);
    sprite->callback = AnimPencil_Step;
}

static void AnimPencil_Step(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->invisible = !sprite->invisible;
        }
        if (++sprite->data[1] > 16)
        {
            sprite->invisible = FALSE;
            sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[1] > 3 && sprite->data[2] < sprite->data[5])
        {
            sprite->data[1] = 0;
            sprite->y -= 1;
            sprite->data[2]++;
            if (sprite->data[2] % 10 == 0)
                PlaySE12WithPanning(SE_M_SKETCH, sprite->data[6]);
        }
        sprite->data[4] += sprite->data[3];
        if (sprite->data[4] > 31)
        {
            sprite->data[4] = 0x40 - sprite->data[4];
            sprite->data[3] *= -1;
        }
        else if (sprite->data[4] <= -32)
        {
            sprite->data[4] = -0x40 - sprite->data[4];
            sprite->data[3] *= -1;
        }
        sprite->x2 = sprite->data[4];
        if (sprite->data[5] == sprite->data[2])
        {
            sprite->data[1] = 0;
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->invisible = !sprite->invisible;
        }
        if (++sprite->data[1] > 16)
        {
            sprite->invisible = FALSE;
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

static void AnimKetchup(struct Sprite *sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X) - 16;
    sprite->y = GetBattlerYCoordWithElevation(gBattleAnimTarget) + 16;
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 16;
    sprite->data[4] = 0;
    sprite->data[5] = GetBattlerSpriteCoordAttr(gBattleAnimTarget, BATTLER_COORD_ATTR_HEIGHT) + 2;
    sprite->data[6] = BattleAnimAdjustPanning(SOUND_PAN_TARGET);
    sprite->callback = AnimKetchup_Step;
}

static void AnimKetchup_Step(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->invisible = !sprite->invisible;
        }
        if (++sprite->data[1] > 16)
        {
            sprite->invisible = FALSE;
            sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[1] > 3 && sprite->data[2] < sprite->data[5])
        {
            sprite->data[1] = 0;
            sprite->y -= 1;
            sprite->data[2]++;
        }
        sprite->data[4] += sprite->data[3];
        if (sprite->data[4] > 31)
        {
            sprite->data[4] = 0x40 - sprite->data[4];
            sprite->data[3] *= -1;
        }
        else if (sprite->data[4] <= -32)
        {
            sprite->data[4] = -0x40 - sprite->data[4];
            sprite->data[3] *= -1;
        }
        sprite->x2 = sprite->data[4];
        if (sprite->data[5] == sprite->data[2])
        {
            sprite->data[1] = 0;
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->invisible = !sprite->invisible;
        }
        if (++sprite->data[1] > 16)
        {
            sprite->invisible = FALSE;
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

static void AnimBlendThinRing(struct Sprite *sprite)
{
    u8 battler = 0;
    u16 sp0 = 0;
    u16 sp1 = 0;
    u8 r4;

    if (gBattleAnimArgs[2] == 0)
        battler = gBattleAnimAttacker;
    else
        battler = gBattleAnimTarget;

    r4 = gBattleAnimArgs[3] ^ 1;
    if (IsDoubleBattle() && IsBattlerSpriteVisible(BATTLE_PARTNER(battler)))
    {
        SetAverageBattlerPositions(battler, r4, &sp0, &sp1);
        if (r4 == 0)
            r4 = GetBattlerSpriteCoord(battler, BATTLER_COORD_X);
        else
            r4 = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2);

        if (GetBattlerSide(battler) != B_SIDE_PLAYER)
            gBattleAnimArgs[0] -= (sp0 - r4) - gBattleAnimArgs[0];
        else
            gBattleAnimArgs[0] = sp0 - r4;
    }

    sprite->callback = AnimSpriteOnMonPos;
    sprite->callback(sprite);
}

static void AnimHyperVoiceRing_WaitEnd(struct Sprite *sprite)
{
    if (AnimTranslateLinear(sprite))
    {
        FreeSpriteOamMatrix(sprite);
        DestroyAnimSprite(sprite);
    }
}

static void AnimHyperVoiceRing(struct Sprite *sprite)
{
    u16 startX = 0;
    u16 startY = 0;
    s16 x = 0;
    s16 y = 0;
    u8 yCoordType;
    u8 battler1;
    u8 battler2;
    u8 xCoordType;

    if (gBattleAnimArgs[5] == 0)
    {
        battler1 = gBattleAnimAttacker;
        battler2 = gBattleAnimTarget;
    }
    else
    {
        battler1 = gBattleAnimTarget;
        battler2 = gBattleAnimAttacker;
    }

    if (!gBattleAnimArgs[6])
    {
        xCoordType = BATTLER_COORD_X;
        yCoordType = BATTLER_COORD_Y;
    }
    else
    {
        xCoordType = BATTLER_COORD_X_2;
        yCoordType = BATTLER_COORD_Y_PIC_OFFSET;
    }

    if (GetBattlerSide(battler1) != B_SIDE_PLAYER)
    {
        startX = GetBattlerSpriteCoord(battler1, xCoordType) + gBattleAnimArgs[0];
        if (IsBattlerSpriteVisible(BATTLE_PARTNER(battler2)))
            sprite->subpriority = gSprites[gBattlerSpriteIds[BATTLE_PARTNER(battler2)]].subpriority - 1;
        else
            sprite->subpriority = gSprites[gBattlerSpriteIds[battler2]].subpriority - 1;
    }
    else
    {
        startX = GetBattlerSpriteCoord(battler1, xCoordType) - gBattleAnimArgs[0];
        if (!IsContest() && IsBattlerSpriteVisible(BATTLE_PARTNER(battler1)))
        {
            if (gSprites[gBattlerSpriteIds[battler1]].x < gSprites[gBattlerSpriteIds[BATTLE_PARTNER(battler1)]].x)
                sprite->subpriority = gSprites[gBattlerSpriteIds[BATTLE_PARTNER(battler1)]].subpriority + 1;
            else
                sprite->subpriority = gSprites[gBattlerSpriteIds[battler1]].subpriority - 1;
        }
        else
        {
            sprite->subpriority = gSprites[gBattlerSpriteIds[battler1]].subpriority - 1;
        }

    }

    startY = GetBattlerSpriteCoord(battler1, yCoordType) + gBattleAnimArgs[1];
    if (!IsContest() && IsBattlerSpriteVisible(BATTLE_PARTNER(battler2)))
    {
        SetAverageBattlerPositions(battler2, gBattleAnimArgs[6], &x, &y);
    }
    else
    {
        x = GetBattlerSpriteCoord(battler2, xCoordType);
        y = GetBattlerSpriteCoord(battler2, yCoordType);
    }

    if (GetBattlerSide(battler2) != B_SIDE_PLAYER)
        x += gBattleAnimArgs[3];
    else
        x -= gBattleAnimArgs[3];

    y += gBattleAnimArgs[4];
    sprite->x = sprite->data[1] = startX;
    sprite->y = sprite->data[3] = startY;
    sprite->data[2] = x;
    sprite->data[4] = y;
    sprite->data[0] = gBattleAnimArgs[0];
    InitAnimLinearTranslation(sprite);
    sprite->callback = AnimHyperVoiceRing_WaitEnd;
    sprite->callback(sprite);
}

void AnimUproarRing(struct Sprite *sprite)
{
    u8 index = IndexOfSpritePaletteTag(ANIM_TAG_THIN_RING);
    
    if (index != 0xFF)
        BlendPalette(OBJ_PLTT_ID(index) + 1, 15, gBattleAnimArgs[5], gBattleAnimArgs[4]);

    StartSpriteAffineAnim(sprite, 1);
    sprite->callback = AnimSpriteOnMonPos;
    sprite->callback(sprite);
}

static void AnimRotomRing(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    {
        sprite->x = 170;
        sprite->y = 110;//GetBattlerSpriteCoord2(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);

        SetAnimSpriteInitialXOffset(sprite, gBattleAnimArgs[0]);
        sprite->y += gBattleAnimArgs[1];

        SetGpuReg(REG_OFFSET_BLDCNT,
                  BLDCNT_TGT1_OBJ |
                  BLDCNT_TGT2_BG0 |
                  BLDCNT_EFFECT_BLEND);

        SetGpuReg(REG_OFFSET_BLDALPHA,
                  BLDALPHA_BLEND(8, 8));

        StartSpriteAffineAnim(sprite, 0);

        sprite->data[0] = 1;
        break;
    }

    case 1:
        if (sprite->affineAnimEnded)
        {
            SetGpuReg(REG_OFFSET_BLDCNT, 0);
            DestroySpriteAndMatrix(sprite);
        }
        break;
    }
}

static void AnimSoftBoiledEgg(struct Sprite *sprite)
{
    s16 r1;
    
    InitSpritePosToAnimAttacker(sprite, FALSE);
    r1 = GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER ? -160 : 160;
    sprite->data[0] = 0x380;
    sprite->data[1] = r1;
    sprite->data[7] = gBattleAnimArgs[2];
    sprite->callback = AnimSoftBoiledEgg_Step1;
}

static void AnimSoftBoiledEgg_Step1(struct Sprite *sprite)
{
    s16 add;
    
    sprite->y2 -= (sprite->data[0] >> 8);
    sprite->x2 = sprite->data[1] >> 8;
    sprite->data[0] -= 32;
    add = GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER ? -160 : 160;
    sprite->data[1] += add;
    if (sprite->y2 > 0)
    {
        sprite->y += sprite->y2;
        sprite->x += sprite->x2;
        sprite->y2 = 0;
        sprite->x2 = 0;
        sprite->data[0] = 0;
        StartSpriteAffineAnim(sprite, 1);
        sprite->callback = AnimSoftBoiledEgg_Step2;
    }
}

static void AnimSoftBoiledEgg_Step2(struct Sprite *sprite)
{
    if (sprite->data[0]++ > 19)
    {
        StartSpriteAffineAnim(sprite, 2);
        sprite->callback = AnimSoftBoiledEgg_Step3;
    }
}

static void AnimSoftBoiledEgg_Step3(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        StartSpriteAffineAnim(sprite, 1);
        sprite->data[0] = 0;
        if (sprite->data[7] == 0)
        {
            sprite->oam.tileNum += 16;
            sprite->callback = AnimSoftBoiledEgg_Step3_Callback1;
        }
        else
        {
            sprite->oam.tileNum += 32;
            sprite->callback = AnimSoftBoiledEgg_Step4;
        }
    }
}

static void AnimSoftBoiledEgg_Step3_Callback1(struct Sprite *sprite)
{
    sprite->y2 -= 2;
    if (++sprite->data[0] == 9)
    {
        sprite->data[0] = 16;
        sprite->data[1] = 0;
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT2_ALL | BLDCNT_EFFECT_BLEND);
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND((u16)sprite->data[0], 0));
        sprite->callback = AnimSoftBoiledEgg_Step3_Callback2;
    }
}

static void AnimSoftBoiledEgg_Step3_Callback2(struct Sprite *sprite)
{
    if (sprite->data[1]++ % 3 == 0)
    {
        sprite->data[0]--;
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(sprite->data[0], 16 - sprite->data[0]));
        if (sprite->data[0] == 0)
            sprite->callback = AnimSoftBoiledEgg_Step4;
    }
}

static void AnimSoftBoiledEgg_Step4(struct Sprite *sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->invisible = TRUE;
        if (sprite->data[7] == 0)
            sprite->callback = AnimSoftBoiledEgg_Step4_Callback;
        else
            sprite->callback = DestroyAnimSprite;
    }
}

static void AnimSoftBoiledEgg_Step4_Callback(struct Sprite *sprite)
{
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    DestroyAnimSprite(sprite);
}

// Used by Extremespeed
void AnimTask_AttackerStretchAndDisappear(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBattlerSpriteId(ANIM_ATTACKER);
    
    task->data[0] = spriteId;
    PrepareAffineAnimInTaskData(task, spriteId, sStretchAttackerAffineAnimCmds);
    task->func = AnimTask_AttackerStretchAndDisappear_Step;
}

static void AnimTask_AttackerStretchAndDisappear_Step(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    
    if (!RunAffineAnimFromTaskData(task))
    {
        gSprites[task->data[0]].y2 = 0;
        gSprites[task->data[0]].invisible = TRUE;
        DestroyAnimVisualTask(taskId);
    }
}

void AnimTask_ExtremeSpeedImpact(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    
    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[12] = 3;
    if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
    {
        task->data[13] = 0xFFFF;
        task->data[14] = 8;
    }
    else
    {
        task->data[13] = 1;
        task->data[14] = -8;
    }

    task->data[15] = GetAnimBattlerSpriteId(ANIM_TARGET);
    task->func = AnimTask_ExtremeSpeedImpact_Step;
}

static void AnimTask_ExtremeSpeedImpact_Step(u8 taskId)
{
    struct Task* task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        gSprites[task->data[15]].x2 += task->data[14];
        task->data[1] = 0;
        task->data[2] = 0;
        task->data[3] = 0;
        task->data[0]++;
        break;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            task->data[2]++;
            if (task->data[2] & 1)
                gSprites[task->data[15]].x2 += 6;
            else
                gSprites[task->data[15]].x2 -= 6;

            if (++task->data[3] > 4)
            {
                if (task->data[2] & 1)
                    gSprites[task->data[15]].x2 -= 6;

                task->data[0]++;
            }
        }
        break;
    case 2:
        if (--task->data[12] != 0)
            task->data[0] = 0;
        else
            task->data[0]++;
        break;
    case 3:
        gSprites[task->data[15]].x2 += task->data[13];
        if (gSprites[task->data[15]].x2 == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

void AnimTask_ExtremeSpeedMonReappear(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    
    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 1;
    task->data[13] = 14;
    task->data[14] = 2;
    task->data[15] = GetAnimBattlerSpriteId(ANIM_ATTACKER);
    task->func = AnimTask_ExtremeSpeedMonReappear_Step;
}

static void AnimTask_ExtremeSpeedMonReappear_Step(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    
    if (task->data[0] == 0 && ++task->data[1] > task->data[4])
    {
        task->data[1] = 0;
        if (++task->data[2] & 1)
            gSprites[task->data[15]].invisible = FALSE;
        else
            gSprites[task->data[15]].invisible = TRUE;

        if (++task->data[3] >= task->data[13])
        {
            if (++task->data[4] < task->data[14])
            {
                task->data[1] = 0;
                task->data[2] = 0;
                task->data[3] = 0;
            }
            else
            {
                gSprites[task->data[15]].invisible = FALSE;
                DestroyAnimVisualTask(taskId);
            }
        }
    }
}

void AnimTask_SpeedDust(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    
    task->data[0] = 0;
    task->data[1] = 4;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0;
    task->data[5] = 0;
    task->data[6] = 0;
    task->data[7] = 0;
    task->data[8] = 0;
    task->data[13] = 0;
    task->data[14] = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X);
    task->data[15] = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y);
    task->func = AnimTask_SpeedDust_Step;
}

static void AnimTask_SpeedDust_Step(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    
    switch (task->data[8])
    {
    case 0:
        if (++task->data[4] > 1)
        {
            task->data[4] = 0;
            task->data[5] = (task->data[5] + 1) & 1;
            if (++task->data[6] > 20)
            {
                if (task->data[7] == 0)
                {
                    task->data[6] = 0;
                    task->data[8] = 1;
                }
                else
                    task->data[8] = 2;
            }
        }
        break;
    case 1:
        task->data[5] = 0;
        if (++task->data[4] > 20)
        {
            task->data[7] = 1;
            task->data[8] = 0;
        }
        break;
    case 2:
        task->data[5] = 1;
        break;
    }

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 4)
        {
            u8 spriteId;
            task->data[1] = 0;
            spriteId = CreateSprite(&gSpeedDustSpriteTemplate, task->data[14], task->data[15], 0);
            if (spriteId != MAX_SPRITES)
            {
                gSprites[spriteId].data[0] = taskId;
                gSprites[spriteId].data[1] = 13;
                gSprites[spriteId].x2 = sSpeedDustPosTable[task->data[2]][0];
                gSprites[spriteId].y2 = sSpeedDustPosTable[task->data[2]][1];
                task->data[13]++;
                if (++task->data[2] > 3)
                {
                    task->data[2] = 0;
                    if (++task->data[3] > 5)
                        task->data[0]++;
                }
            }
        }
        break;
    case 1:
        if (task->data[13] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

static void AnimSpeedDust(struct Sprite *sprite)
{
    sprite->invisible = gTasks[sprite->data[0]].data[5];
    if (sprite->animEnded)
    {
        gTasks[sprite->data[0]].data[sprite->data[1]]--;
        DestroySprite(sprite);
    }
}

void AnimTask_LoadMusicNotesPals(u8 taskId)
{
    int i;
    u8 paletteNums[NUM_MUSIC_NOTE_PAL_TAGS];

    paletteNums[0] = IndexOfSpritePaletteTag(ANIM_TAG_MUSIC_NOTES_2);
    for (i = 1; i < NUM_MUSIC_NOTE_PAL_TAGS; i++)
        paletteNums[i] = AllocSpritePalette(ANIM_SPRITES_START - i);

    gMonSpritesGfxPtr->multiUseBuffer = AllocZeroed(MON_PIC_SIZE * MAX_MON_PIC_FRAMES);
    LZDecompressWram(gBattleAnimSpritePal_MusicNotes2, gMonSpritesGfxPtr->multiUseBuffer);
    for (i = 0; i < NUM_MUSIC_NOTE_PAL_TAGS; i++)
        LoadPalette(&gMonSpritesGfxPtr->multiUseBuffer[i * 32], OBJ_PLTT_ID(paletteNums[i]), PLTT_SIZE_4BPP);

    FREE_AND_SET_NULL(gMonSpritesGfxPtr->multiUseBuffer);
    DestroyAnimVisualTask(taskId);
}

void AnimTask_FreeMusicNotesPals(u8 taskId)
{
    int i;
    
    for (i = 0; i < NUM_MUSIC_NOTE_PAL_TAGS; i++)
        FreeSpritePaletteByTag(gMusicNotePaletteTagsTable[i]);

    DestroyAnimVisualTask(taskId);
}

static void SetMusicNotePalette(struct Sprite *sprite, u8 a, u8 b)
{
    u8 tile = (b & 1) ? 32 : 0;
    sprite->oam.tileNum += tile + (a << 2);
    sprite->oam.paletteNum = IndexOfSpritePaletteTag(gMusicNotePaletteTagsTable[b >> 1]);
}

static void AnimHealBellMusicNote(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, FALSE);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y) + gBattleAnimArgs[3];
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
    SetMusicNotePalette(sprite, gBattleAnimArgs[5], gBattleAnimArgs[6]);
}

static void AnimMagentaHeart(struct Sprite *sprite)
{
    if (++sprite->data[0] == 1)
        InitSpritePosToAnimAttacker(sprite, FALSE);

    sprite->x2 = Sin(sprite->data[1], 8);
    sprite->y2 = sprite->data[2] >> 8;
    sprite->data[1] = (sprite->data[1] + 7) & 0xFF;
    sprite->data[2] -= 0x80;
    if (sprite->data[0] == 60)
        DestroyAnimSprite(sprite);
}

void AnimTask_FakeOut(u8 taskId)
{
    u16 win0h = IsContest() ? 152 : DISPLAY_WIDTH;
    u16 win0v = 0;

    gBattle_WIN0H = win0h;
    gBattle_WIN0V = DISPLAY_HEIGHT;
    SetGpuReg(REG_OFFSET_WIN0H, gBattle_WIN0H);
    SetGpuReg(REG_OFFSET_WIN0V, gBattle_WIN0V);
    SetGpuReg(REG_OFFSET_WININ,  WININ_WIN1_CLR | WININ_WIN1_OBJ | WININ_WIN1_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_BG_ALL);
    SetGpuReg(REG_OFFSET_WINOUT, WININ_WIN1_CLR | WININ_WIN1_OBJ | WININ_WIN1_BG_ALL | WININ_WIN0_CLR | WININ_WIN0_OBJ | WININ_WIN0_BG_ALL);    
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG3 | BLDCNT_EFFECT_DARKEN);
    SetGpuReg(REG_OFFSET_BLDY, 16);
    gTasks[taskId].data[0] = win0v;
    gTasks[taskId].data[1] = win0h;
    gTasks[taskId].func = AnimTask_FakeOut_Step1;
}

static void AnimTask_FakeOut_Step1(u8 taskId)
{
    gTasks[taskId].data[0] += 13;
    gTasks[taskId].data[1] -= 13;
    if (gTasks[taskId].data[0] >= gTasks[taskId].data[1])
    {
        gBattle_WIN0H = 0;
        gTasks[taskId].func = AnimTask_FakeOut_Step2;
    }
    else
    {
        gBattle_WIN0H = gTasks[taskId].data[1] | (gTasks[taskId].data[0] << 8);
    }
}

static void AnimTask_FakeOut_Step2(u8 taskId)
{
    if (++gTasks[taskId].data[10] == 5)
    {
        gTasks[taskId].data[11] = 0x88;
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG3 | BLDCNT_EFFECT_LIGHTEN);
        BlendPalettes(GetBattlePalettesMask(TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE), 16, RGB_WHITE);
    }
    else if (gTasks[taskId].data[10] > 4)
    {
        gBattle_WIN0H = 0;
        gBattle_WIN0V = 0;
        SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR | WININ_WIN1_BG_ALL | WININ_WIN1_OBJ | WININ_WIN1_CLR);
        SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR | WINOUT_WINOBJ_BG_ALL | WINOUT_WINOBJ_OBJ | WINOUT_WINOBJ_CLR);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        DestroyAnimVisualTask(taskId);
    }
}

void AnimTask_StretchTargetUp(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(ANIM_TARGET);
    
    if (++gTasks[taskId].data[0] == 1)
    {
        PrepareAffineAnimInTaskData(&gTasks[taskId], GetAnimBattlerSpriteId(ANIM_TARGET), sAffineAnims_StretchBattlerUp);
        gSprites[spriteId].x2 = 4;
    }
    else
    {
        gSprites[spriteId].x2 = -gSprites[spriteId].x2;
        if (!RunAffineAnimFromTaskData(&gTasks[taskId]))
        {
            gSprites[spriteId].x2 = 0;
            gSprites[spriteId].y2 = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
}

void AnimTask_GlitchTargetUp(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(ANIM_TARGET);
    
    if (++gTasks[taskId].data[0] == 1)
    {
        PrepareAffineAnimInTaskData(&gTasks[taskId], GetAnimBattlerSpriteId(ANIM_TARGET), sAffineAnims_GlitchBattlerUp);
        gSprites[spriteId].x2 = 4;
    }
    else
    {
        gSprites[spriteId].x2 = -gSprites[spriteId].x2;
        if (!RunAffineAnimFromTaskData(&gTasks[taskId]))
        {
            gSprites[spriteId].x2 = 0;
            gSprites[spriteId].y2 = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
}

void AnimTask_StretchAttackerUp(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(ANIM_ATTACKER);
    
    if (++gTasks[taskId].data[0] == 1)
    {
        PrepareAffineAnimInTaskData(&gTasks[taskId], GetAnimBattlerSpriteId(ANIM_ATTACKER), sAffineAnims_StretchBattlerUp);
        gSprites[spriteId].x2 = 4;
    }
    else
    {
        gSprites[spriteId].x2 = -gSprites[spriteId].x2;
        if (!RunAffineAnimFromTaskData(&gTasks[taskId]))
        {
            gSprites[spriteId].x2 = 0;
            gSprites[spriteId].y2 = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
}

static void AnimRedHeartProjectile(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, TRUE);
    sprite->data[0] = 95;
    sprite->data[1] = sprite->x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
    sprite->data[3] = sprite->y;
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
    InitAnimLinearTranslation(sprite);
    sprite->callback = AnimRedHeartProjectile_Step;
}

static void AnimRedHeartProjectile_Step(struct Sprite *sprite)
{
    if (!AnimTranslateLinear(sprite))
    {
        sprite->y2 += Sin(sprite->data[5], 14);
        sprite->data[5] = (sprite->data[5] + 4) & 0xFF;
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}

void AnimParticleBurst(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[1] = gBattleAnimArgs[0];
        sprite->data[2] = gBattleAnimArgs[1];
        sprite->data[0]++;
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

void AnimParticleBurstOnAttacker(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[1] = gBattleAnimArgs[0];
        sprite->data[2] = gBattleAnimArgs[1];
        sprite->data[0]++;
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

void AnimParticleBurstWithFrame(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, gBattleAnimArgs[2]);
    if (sprite->data[0] == 0)
    {
        sprite->data[1] = gBattleAnimArgs[0];
        sprite->data[2] = gBattleAnimArgs[1];
        sprite->data[0]++;
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

static void AnimRedHeartRising(struct Sprite *sprite)
{
    sprite->x = gBattleAnimArgs[0];
    sprite->y = DISPLAY_HEIGHT;
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData6(sprite, AnimRedHeartRising_Step);
}

static void AnimRedHeartRising_Step(struct Sprite *sprite)
{
    s16 y;
    
    sprite->data[2] += sprite->data[1];
    sprite->y2 = -((u16)sprite->data[2] >> 8);
    sprite->x2 = Sin(sprite->data[3], 4);
    sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
    y = sprite->y + sprite->y2;
    if (y <= 72)
    {
        sprite->invisible = sprite->data[3] % 2;
        if (y <= 64)
            DestroyAnimSprite(sprite);
    }
}

void AnimTask_HeartsBackground(u8 taskId)
{
    struct BattleAnimBgData animBg;

    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT2_ALL | BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(0, 16));
    SetAnimBgAttribute(1, BG_ANIM_PRIORITY, 3);
    SetAnimBgAttribute(1, BG_ANIM_SCREEN_SIZE, 0);
    if (!IsContest())
        SetAnimBgAttribute(1, BG_ANIM_CHAR_BASE_BLOCK, 1);

    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    SetGpuReg(REG_OFFSET_BG1HOFS, gBattle_BG1_X);
    SetGpuReg(REG_OFFSET_BG1VOFS, gBattle_BG1_Y);
    GetBattleAnimBg1Data(&animBg);
    AnimLoadCompressedBgTilemap(animBg.bgId, gBattleAnimBg_AttractTilemap);
    AnimLoadCompressedBgGfx(animBg.bgId, gBattleAnimBg_AttractGfx, animBg.tilesOffset);
    LoadCompressedPalette(gBattleAnimBg_AttractPal, BG_PLTT_ID(animBg.paletteId), PLTT_SIZE_4BPP);
    if (IsContest())
        RelocateBattleBgPal(animBg.paletteId, animBg.bgTilemap, 0, 0);
    
    gTasks[taskId].func = AnimTask_HeartsBackground_Step;
}

static void AnimTask_HeartsBackground_Step(u8 taskId)
{
    struct BattleAnimBgData animBg;

    switch (gTasks[taskId].data[12])
    {
    case 0:
        if (++gTasks[taskId].data[10] == 4)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]++;
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gTasks[taskId].data[11], 16 - gTasks[taskId].data[11]));
            if (gTasks[taskId].data[11] == 16)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 1:
        if (++gTasks[taskId].data[11] == 141)
        {
            gTasks[taskId].data[11] = 16;
            gTasks[taskId].data[12]++;
        }
        break;
    case 2:
        if (++gTasks[taskId].data[10] == 4)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]--;
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gTasks[taskId].data[11], 16 - gTasks[taskId].data[11]));
            if (gTasks[taskId].data[11] == 0)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 3:
        GetBattleAnimBg1Data(&animBg);
        InitBattleAnimBg(animBg.bgId);
        gTasks[taskId].data[12]++;
        break;
    case 4:
        if (!IsContest())
            SetAnimBgAttribute(1, BG_ANIM_CHAR_BASE_BLOCK, 0);

        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetAnimBgAttribute(1, BG_ANIM_PRIORITY, 1);
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void AnimTask_ScaryFace(u8 taskId)
{
    struct BattleAnimBgData animBg;

    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT2_ALL | BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(0, 16));
    SetAnimBgAttribute(1, BG_ANIM_PRIORITY, 1);
    SetAnimBgAttribute(1, BG_ANIM_SCREEN_SIZE, 0);
    if (!IsContest())
        SetAnimBgAttribute(1, BG_ANIM_CHAR_BASE_BLOCK, 1);

    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    SetGpuReg(REG_OFFSET_BG1HOFS, gBattle_BG1_X);
    SetGpuReg(REG_OFFSET_BG1VOFS, gBattle_BG1_Y);
    GetBattleAnimBg1Data(&animBg);
    
    if (IsContest())
        LZDecompressVram(gBattleAnimBgTilemap_ScaryFaceContest, animBg.bgTilemap);
    else if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_OPPONENT)
        AnimLoadCompressedBgTilemap(animBg.bgId, gBattleAnimBgTilemap_ScaryFacePlayer);
    else
        AnimLoadCompressedBgTilemap(animBg.bgId, gBattleAnimBgTilemap_ScaryFaceOpponent);

    AnimLoadCompressedBgGfx(animBg.bgId, gBattleAnim_ScaryFaceGfx, animBg.tilesOffset);
    LoadCompressedPalette(gBattleAnim_ScaryFacePal, BG_PLTT_ID(animBg.paletteId), PLTT_SIZE_4BPP);
    if (IsContest())
        RelocateBattleBgPal(animBg.paletteId, animBg.bgTilemap, 0, 0);
    
    gTasks[taskId].func = AnimTask_ScaryFace_Step;
}

static void AnimTask_ScaryFace_Step(u8 taskId)
{
    struct BattleAnimBgData animBg;

    switch (gTasks[taskId].data[12])
    {
    case 0:
        if (++gTasks[taskId].data[10] == 2)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]++;
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gTasks[taskId].data[11], 16 - gTasks[taskId].data[11]));
            if (gTasks[taskId].data[11] == 14)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 1:
        if (++gTasks[taskId].data[11] == 21)
        {
            gTasks[taskId].data[11] = 14;
            gTasks[taskId].data[12]++;
        }
        break;
    case 2:
        if (++gTasks[taskId].data[10] == 2)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]--;
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gTasks[taskId].data[11], 16 - gTasks[taskId].data[11]));
            if (gTasks[taskId].data[11] == 0)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 3:
        GetBattleAnimBg1Data(&animBg);
        InitBattleAnimBg(1);
        InitBattleAnimBg(2);
        gTasks[taskId].data[12]++;
        // fall through
    case 4:
        if (!IsContest())
            SetAnimBgAttribute(1, BG_ANIM_CHAR_BASE_BLOCK, 0);

        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetAnimBgAttribute(1, BG_ANIM_PRIORITY, 1);
        DestroyAnimVisualTask(taskId);
        break;
    }
}


void AnimTask_CherryFace(u8 taskId)
{
    struct BattleAnimBgData animBg;

    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT2_ALL | BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(0, 16));
    SetAnimBgAttribute(1, BG_ANIM_PRIORITY, 1);
    SetAnimBgAttribute(1, BG_ANIM_SCREEN_SIZE, 0);
    if (!IsContest())
        SetAnimBgAttribute(1, BG_ANIM_CHAR_BASE_BLOCK, 1);

    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    SetGpuReg(REG_OFFSET_BG1HOFS, gBattle_BG1_X);
    SetGpuReg(REG_OFFSET_BG1VOFS, gBattle_BG1_Y);
    GetBattleAnimBg1Data(&animBg);
    
    if (IsContest())
        LZDecompressVram(gBattleAnimBgTilemap_ScaryFaceContest, animBg.bgTilemap);
    else if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_OPPONENT)
        AnimLoadCompressedBgTilemap(animBg.bgId, gBattleAnimBgTilemap_ScaryFacePlayer);
    else
        AnimLoadCompressedBgTilemap(animBg.bgId, gBattleAnimBgTilemap_ScaryFaceOpponent);

    AnimLoadCompressedBgGfx(animBg.bgId, gBattleAnim_CherryFaceGfx, animBg.tilesOffset);
    LoadCompressedPalette(gBattleAnim_CherryFacePal, BG_PLTT_ID(animBg.paletteId), PLTT_SIZE_4BPP);
    if (IsContest())
        RelocateBattleBgPal(animBg.paletteId, animBg.bgTilemap, 0, 0);
    
    gTasks[taskId].func = AnimTask_CherryFace_Step;
}

static void AnimTask_CherryFace_Step(u8 taskId)
{
    struct BattleAnimBgData animBg;

    switch (gTasks[taskId].data[12])
    {
    case 0:
        if (++gTasks[taskId].data[10] == 2)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]++;
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gTasks[taskId].data[11], 16 - gTasks[taskId].data[11]));
            if (gTasks[taskId].data[11] == 14)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 1:
        if (++gTasks[taskId].data[11] == 21)
        {
            gTasks[taskId].data[11] = 14;
            gTasks[taskId].data[12]++;
        }
        break;
    case 2:
        if (++gTasks[taskId].data[10] == 2)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]--;
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gTasks[taskId].data[11], 16 - gTasks[taskId].data[11]));
            if (gTasks[taskId].data[11] == 0)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 3:
        GetBattleAnimBg1Data(&animBg);
        InitBattleAnimBg(1);
        InitBattleAnimBg(2);
        gTasks[taskId].data[12]++;
        // fall through
    case 4:
        if (!IsContest())
            SetAnimBgAttribute(1, BG_ANIM_CHAR_BASE_BLOCK, 0);

        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetAnimBgAttribute(1, BG_ANIM_PRIORITY, 1);
        DestroyAnimVisualTask(taskId);
        break;
    }
}


void AnimTask_MissileFace(u8 taskId)
{
    struct BattleAnimBgData animBg;

    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT2_ALL | BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(0, 16));
    SetAnimBgAttribute(1, BG_ANIM_PRIORITY, 1);
    SetAnimBgAttribute(1, BG_ANIM_SCREEN_SIZE, 0);
    if (!IsContest())
        SetAnimBgAttribute(1, BG_ANIM_CHAR_BASE_BLOCK, 1);

    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    SetGpuReg(REG_OFFSET_BG1HOFS, gBattle_BG1_X);
    SetGpuReg(REG_OFFSET_BG1VOFS, gBattle_BG1_Y);
    GetBattleAnimBg1Data(&animBg);
    
    if (IsContest())
        LZDecompressVram(gBattleAnimBgTilemap_ScaryFaceContest, animBg.bgTilemap);
    else if (GetBattlerSide(gBattleAnimTarget) == B_SIDE_OPPONENT)
        AnimLoadCompressedBgTilemap(animBg.bgId, gBattleAnimBgTilemap_ScaryFacePlayer);
    else
        AnimLoadCompressedBgTilemap(animBg.bgId, gBattleAnimBgTilemap_ScaryFaceOpponent);

    AnimLoadCompressedBgGfx(animBg.bgId, gBattleAnim_MissileFaceGfx, animBg.tilesOffset);
    LoadCompressedPalette(gBattleAnim_MissileFacePal, BG_PLTT_ID(animBg.paletteId), PLTT_SIZE_4BPP);
    if (IsContest())
        RelocateBattleBgPal(animBg.paletteId, animBg.bgTilemap, 0, 0);
    
    gTasks[taskId].func = AnimTask_MissileFace_Step;
}

static void AnimTask_MissileFace_Step(u8 taskId)
{
    struct BattleAnimBgData animBg;

    switch (gTasks[taskId].data[12])
    {
    case 0:
        if (++gTasks[taskId].data[10] == 2)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]++;
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gTasks[taskId].data[11], 16 - gTasks[taskId].data[11]));
            if (gTasks[taskId].data[11] == 14)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 1:
        if (++gTasks[taskId].data[11] == 21)
        {
            gTasks[taskId].data[11] = 14;
            gTasks[taskId].data[12]++;
        }
        break;
    case 2:
        if (++gTasks[taskId].data[10] == 2)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]--;
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gTasks[taskId].data[11], 16 - gTasks[taskId].data[11]));
            if (gTasks[taskId].data[11] == 0)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 3:
        GetBattleAnimBg1Data(&animBg);
        InitBattleAnimBg(1);
        InitBattleAnimBg(2);
        gTasks[taskId].data[12]++;
        // fall through
    case 4:
        if (!IsContest())
            SetAnimBgAttribute(1, BG_ANIM_CHAR_BASE_BLOCK, 0);

        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetAnimBgAttribute(1, BG_ANIM_PRIORITY, 1);
        DestroyAnimVisualTask(taskId);
        break;
    }
}

// Orbits a sphere in an ellipse around the mon.
// Used by MOVE_HIDDEN_POWER
// arg 0: duration
// arg 1: initial wave offset
static void AnimOrbitFast(struct Sprite *sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->affineAnimPaused = TRUE;
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[7] = GetBattlerSpriteSubpriority(gBattleAnimAttacker);
    sprite->callback = AnimOrbitFast_Step;
    sprite->callback(sprite);
}

static void AnimOrbitFast_Step(struct Sprite *sprite)
{
    if (sprite->data[1] >= 64 && sprite->data[1] <= 191)
        sprite->subpriority = sprite->data[7] + 1;
    else
        sprite->subpriority = sprite->data[7] - 1;

    sprite->x2 = Sin(sprite->data[1], sprite->data[2] >> 8);
    sprite->y2 = Cos(sprite->data[1], sprite->data[3] >> 8);
    sprite->data[1] = (sprite->data[1] + 9) & 0xFF;
    switch (sprite->data[5])
    {
    case 1:
        sprite->data[2] -= 0x400;
        sprite->data[3] -= 0x100;
        if (++sprite->data[4] == sprite->data[0])
        {
            sprite->data[5] = 2;
            return;
        }
        break;
    case 0:
        sprite->data[2] += 0x400;
        sprite->data[3] += 0x100;
        if (++sprite->data[4] == sprite->data[0])
        {
            sprite->data[4] = 0;
            sprite->data[5] = 1;
        }
        break;
    }

    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
        DestroyAnimSprite(sprite);
}

static void AnimOrbitShort(struct Sprite *sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);

    sprite->affineAnimPaused = TRUE;

    sprite->data[0] = gBattleAnimArgs[0]; // duration
    sprite->data[1] = gBattleAnimArgs[1]; // angle
    sprite->data[2] = 0;                 // x radius (fixed-point)
    sprite->data[3] = 0;                 // y radius (fixed-point)
    sprite->data[4] = 0;                 // frame counter
    sprite->data[5] = 0;                 // phase
    sprite->data[6] = 0;                 // finished flag

    sprite->data[7] = GetBattlerSpriteSubpriority(gBattleAnimAttacker);

    sprite->callback = AnimOrbitShort_Step;
    sprite->callback(sprite);
}

static void AnimOrbitShort_Step(struct Sprite *sprite)
{
    // Layering (front/back)
    if (sprite->data[1] >= 64 && sprite->data[1] <= 191)
        sprite->subpriority = sprite->data[7] + 1;
    else
        sprite->subpriority = sprite->data[7] - 1;

    // Orbit motion
    sprite->x2 = Sin(sprite->data[1], sprite->data[2] >> 8);
    sprite->y2 = Cos(sprite->data[1], sprite->data[3] >> 8);
    sprite->data[1] = (sprite->data[1] + 9) & 0xFF;

    // Radius expansion/contraction
    switch (sprite->data[5])
    {
    case 0: // expand
        sprite->data[2] += 0x400;
        sprite->data[3] += 0x100;
        if (++sprite->data[4] >= sprite->data[0])
        {
            sprite->data[4] = 0;
            sprite->data[5] = 1;
        }
        break;

    case 1: // contract
        sprite->data[2] -= 0x400;
        sprite->data[3] -= 0x100;
        if (++sprite->data[4] >= sprite->data[0])
        {
            // Orbit complete → mark finished
            sprite->data[6] = 1;
        }
        break;
    }

    // Clean termination
    if (sprite->data[6])
        DestroyAnimSprite(sprite);
}


// Moves orbs away from the mon, based on where they are in their orbit.
// Used in MOVE_HIDDEN_POWER.
// arg 0: initial wave offset
static void AnimOrbitScatter(struct Sprite *sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->data[0] = Sin(gBattleAnimArgs[0], 10);
    sprite->data[1] = Cos(gBattleAnimArgs[0], 7);
    sprite->callback = AnimOrbitScatter_Step;
}

static void AnimOrbitScatter_Step(struct Sprite *sprite)
{
    sprite->x2 += sprite->data[0];
    sprite->y2 += sprite->data[1];
    if (sprite->x + sprite->x2 + 16 > ((u32)DISPLAY_WIDTH + 32)
     || sprite->y + sprite->y2 > DISPLAY_HEIGHT || sprite->y + sprite->y2 < -16)
        DestroyAnimSprite(sprite);
}

static void AnimSpitUpOrb_Step(struct Sprite *sprite)
{
    sprite->x2 += sprite->data[0];
    sprite->y2 += sprite->data[1];
    if (sprite->data[3]++ >= sprite->data[2])
        DestroyAnimSprite(sprite);
}

static void AnimSpitUpOrb(struct Sprite *sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
    sprite->data[0] = Sin(gBattleAnimArgs[0], 10);
    sprite->data[1] = Cos(gBattleAnimArgs[0], 7);
    sprite->data[2] = gBattleAnimArgs[1];
    sprite->callback = AnimSpitUpOrb_Step;
}

static void AnimEyeSparkle_Step(struct Sprite *sprite)
{
    if (sprite->animEnded)
        DestroyAnimSprite(sprite);
}

static void AnimEyeSparkle(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, TRUE);
    sprite->callback = AnimEyeSparkle_Step;
}

static void AnimAngel(struct Sprite *sprite)
{
    s16 var0;
    
    if (!sprite->data[0])
    {
        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
    }

    sprite->data[0]++;
    var0 = (sprite->data[0] * 10) & 0xFF;
    sprite->x2 = Sin(var0, 80) >> 8;
    if (sprite->data[0] < 80)
        sprite->y2 = (sprite->data[0] / 2) + (Cos(var0, 80) >> 8);

    if (sprite->data[0] > 90)
    {
        sprite->data[2]++;
        sprite->x2 -= sprite->data[2] / 2;
    }

    if (sprite->data[0] > 100)
        DestroyAnimSprite(sprite);
}

static void AnimPinkHeart_Step(struct Sprite *sprite)
{
    sprite->data[5]++;
    sprite->x2 = Sin(sprite->data[3], 5);
    sprite->y2 = sprite->data[5] / 2;
    sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
    if (sprite->data[5] > 20)
        sprite->invisible = sprite->data[5] % 2;

    if (sprite->data[5] > 30)
        DestroyAnimSprite(sprite);
}

static void AnimPinkHeart(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[1] = gBattleAnimArgs[0];
        sprite->data[2] = gBattleAnimArgs[1];
        sprite->data[0]++;
    }
    else
    {
        sprite->data[4] += sprite->data[1];
        sprite->x2 = sprite->data[4] >> 8;
        sprite->y2 = Sin(sprite->data[3], sprite->data[2]);
        sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
        if (sprite->data[3] > 70)
        {
            sprite->callback = AnimPinkHeart_Step;
            sprite->x += sprite->x2;
            sprite->y += sprite->y2;
            sprite->x2 = 0;
            sprite->y2 = 0;
            sprite->data[3] = Random() % 180;
        }
    }
}

static void AnimDevil(struct Sprite *sprite)
{
    if (sprite->data[3] == 0)
    {
        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
        StartSpriteAnim(sprite, 0);
        sprite->subpriority = GetBattlerSpriteSubpriority(gBattleAnimTarget) - 1;
        sprite->data[2] = 1;
    }
    sprite->data[0] += sprite->data[2];
    sprite->data[1] = (sprite->data[0] * 4) % 256;
    if (sprite->data[1] < 0)
        sprite->data[1] = 0;
    sprite->x2 = Cos(sprite->data[1], 30 - sprite->data[0] / 4);
    sprite->y2 = Sin(sprite->data[1], 10 - sprite->data[0] / 8);
    if (sprite->data[1] > 128 && sprite->data[2] > 0)
        sprite->data[2] = -1;
    if (sprite->data[1] == 0 && sprite->data[2] < 0)
        sprite->data[2] = 1;
    sprite->data[3]++;
    if (sprite->data[3] < 10 || sprite->data[3] > 80)
        sprite->invisible = sprite->data[0] % 2;
    else
        sprite->invisible = FALSE;
    if (sprite->data[3] > 90)
        DestroyAnimSprite(sprite);
}

static void AnimFurySwipes(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
        StartSpriteAnim(sprite, gBattleAnimArgs[2]);
        sprite->data[0]++;
    }
    else if (sprite->animEnded)
    {
        DestroyAnimSprite(sprite);
    }
}

static void AnimMovementWaves(struct Sprite *sprite)
{
    if (!gBattleAnimArgs[2])
    {
        DestroyAnimSprite(sprite);
    }
    else
    {
        if (!gBattleAnimArgs[0])
        {
            sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
            sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);
        }
        else
        {
            sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
            sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
        }

        if (!gBattleAnimArgs[1])
            sprite->x += 32;
        else
            sprite->x -= 32;

        sprite->data[0] = gBattleAnimArgs[2];
        sprite->data[1] = gBattleAnimArgs[1];
        StartSpriteAnim(sprite, sprite->data[1]);
        sprite->callback = AnimMovementWaves_Step;
    }
}

static void AnimMovementWaves_Step(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        if (--sprite->data[0])
            StartSpriteAnim(sprite, sprite->data[1]);
        else
            DestroyAnimSprite(sprite);
    }
}

void AnimTask_UproarDistortion(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);

    PrepareAffineAnimInTaskData(&gTasks[taskId], spriteId, sUproarAffineAnimCmds);
    gTasks[taskId].func = AnimTask_UproarDistortion_Step;
}

static void AnimTask_UproarDistortion_Step(u8 taskId)
{
    if (!RunAffineAnimFromTaskData(&gTasks[taskId]))
        DestroyAnimVisualTask(taskId);
}

static void AnimJaggedMusicNote(struct Sprite *sprite)
{
    int var1;
    u8 battler = !gBattleAnimArgs[0] ? gBattleAnimAttacker : gBattleAnimTarget;

    if (GetBattlerSide(battler) == B_SIDE_OPPONENT)
        gBattleAnimArgs[1] *= -1;

    sprite->x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2)  + gBattleAnimArgs[1];
    sprite->y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[2];
    sprite->data[0] = 0;
    sprite->data[1] = (u16)sprite->x << 3;
    sprite->data[2] = (u16)sprite->y << 3;

    var1 = gBattleAnimArgs[1] << 3;
    if (var1 < 0)
        var1 += 7;
    sprite->data[3] = var1 >> 3;

    var1 = gBattleAnimArgs[2] << 3;
    if (var1 < 0)
        var1 += 7;
    sprite->data[4] = var1 >> 3;

    sprite->oam.tileNum += gBattleAnimArgs[3] * 16;
    sprite->callback = AnimJaggedMusicNote_Step;
}

static void AnimJaggedMusicNote_Step(struct Sprite *sprite)
{
    sprite->data[1] += sprite->data[3];
    sprite->data[2] += sprite->data[4];
    sprite->x = sprite->data[1] >> 3;
    sprite->y = sprite->data[2] >> 3;
    if (++sprite->data[0] > 16)
        DestroyAnimSprite(sprite);
}

static void AnimPerishSongMusicNote2(struct Sprite *sprite)
{
    if (!sprite->data[0])
    {
        sprite->data[1] = 120 - gBattleAnimArgs[0];
        sprite->invisible = TRUE;
    }

    if (++sprite->data[0] == sprite->data[1])
        SetGreyscaleOrOriginalPalette(sprite->oam.paletteNum + 16, FALSE);

    if (sprite->data[0] == sprite->data[1] + 80)
        DestroyAnimSprite(sprite);
}

static void AnimPerishSongMusicNote(struct Sprite *sprite)
{
    int index;
    int var2;

    if (!sprite->data[0])
    {
        sprite->x = 120;
        sprite->y = gBattleAnimArgs[0] / 2 - 15;

        StartSpriteAnim(sprite, gBattleAnimArgs[1]);

        sprite->data[5] = 120;
        sprite->data[3] = gBattleAnimArgs[2];
    }

    sprite->data[0]++;

    sprite->data[1] = sprite->data[0] / 2;
    index = ((sprite->data[0] * 3) + (u16)sprite->data[3]);
    var2 = 0xFF;
    sprite->data[6] = (sprite->data[6] + 10) & 0xFF;

    index &= var2;
    sprite->x2 = Cos(index, 100);

    sprite->y2 = sprite->data[1] + Sin(index, 10) + Cos(sprite->data[6], 4);

    if (sprite->data[0] > sprite->data[5])
    {
        sprite->callback = AnimPerishSongMusicNote_Step1;

        sprite->data[0] = 0;
        SetSpritePrimaryCoordsFromSecondaryCoords(sprite);
        sprite->data[2] = 5;
        sprite->data[4] = 0;
        sprite->data[3] = 0;

        StartSpriteAffineAnim(sprite, 1);
    }
}

static void AnimPerishSongMusicNote_Step1(struct Sprite *sprite)
{
    if (++sprite->data[0] > 10)
    {
        sprite->data[0] = 0;
        sprite->callback = AnimPerishSongMusicNote_Step2;
    }
}

static void AnimPerishSongMusicNote_Step2(struct Sprite *sprite)
{
    sprite->data[3] += sprite->data[2];
    sprite->y2 = sprite->data[3];

    sprite->data[2]++;

    if (sprite->data[3] > 48 && sprite->data[2] > 0)
    {
        sprite->data[2] = sprite->data[4] - 5;
        sprite->data[4]++;
    }

    if (sprite->data[4] > 3)
    {
        sprite->invisible = sprite->data[2] % 2;
        DestroyAnimSprite(sprite);
    }

    if (sprite->data[4] == 4)
    {
        DestroyAnimSprite(sprite);
    }
}

static void AnimGuardRing(struct Sprite *sprite)
{
    if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE) && IsBattlerSpriteVisible(BATTLE_PARTNER(gBattleAnimAttacker)))
    {
        SetAverageBattlerPositions(gBattleAnimAttacker, FALSE, &sprite->x, &sprite->y);
        sprite->y += 40;

        StartSpriteAffineAnim(sprite, 1);
    }
    else
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y) + 40;
    }

    sprite->data[0] = 13;
    sprite->data[2] = sprite->x;
    sprite->data[4] = sprite->y - 72;

    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

void AnimTask_IsFuryCutterHitRight(u8 taskId)
{
    gBattleAnimArgs[ARG_RET_ID] = gAnimDisableStructPtr->furyCutterCounter & 1;
    DestroyAnimVisualTask(taskId);
}

void AnimTask_GetFuryCutterHitCount(u8 taskId)
{
    gBattleAnimArgs[ARG_RET_ID] = gAnimDisableStructPtr->furyCutterCounter;
    DestroyAnimVisualTask(taskId);
}

static void AnimBallAttack(struct Sprite *sprite)
{
    int attackerX;
    int attackerY;
    int targetX;
    int targetY;

    attackerX = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X);
    attackerY = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y);

    targetX = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X);
    targetY = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y);

    sprite->x = attackerX - 16;
    sprite->y = attackerY - 8;

    sprite->data[0] = 0;

    sprite->data[1] = sprite->x;
    sprite->data[2] = sprite->y;

    sprite->data[3] = targetX;
    sprite->data[4] = targetY;

    sprite->callback = AnimBallAttack_Arc;
}

static void AnimBallAttack_Arc(struct Sprite *sprite)
{
    int t;
    int startX;
    int startY;
    int endX;
    int endY;
    int arc;
    int duration;

    duration = 28;

    t = sprite->data[0]++;

    if (t >= duration)
    {
        sprite->data[0] = 0;
        sprite->callback = AnimBallAttack_Bounce;
        return;
    }

    startX = sprite->data[1];
    startY = sprite->data[2];
    endX = sprite->data[3];
    endY = sprite->data[4];

    sprite->x = startX + (endX - startX) * t / duration;

    /* taller arc */
    arc = -((t - duration / 2) * (t - duration / 2)) + (duration * duration) / 4;

    sprite->y = startY + (endY - startY) * t / duration - arc / 6;
}

static void AnimBallAttack_Bounce(struct Sprite *sprite)
{
    sprite->x -= 4;
    sprite->y += 6;

    if (sprite->x < -16 || sprite->y > DISPLAY_HEIGHT + 16)
        DestroyAnimSprite(sprite);
}

static void AnimQuickBallAttack(struct Sprite *sprite)
{
    int attackerX;
    int attackerY;
    int targetX;
    int targetY;

    attackerX = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X);
    attackerY = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y);

    targetX = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X);
    targetY = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y);

    sprite->x = attackerX - 16;
    sprite->y = attackerY - 8;

    sprite->data[0] = 0;

    sprite->data[1] = sprite->x;
    sprite->data[2] = sprite->y;

    sprite->data[3] = targetX;
    sprite->data[4] = targetY;

    sprite->callback = AnimQuickBallAttack_Arc;
}

static void AnimQuickBallAttack_Arc(struct Sprite *sprite)
{
    int t;
    int startX;
    int startY;
    int endX;
    int endY;
    int arc;
    int duration;

    duration = 14;

    t = sprite->data[0]++;

    if (t >= duration)
    {
        sprite->data[0] = 0;
        sprite->callback = AnimQuickBallAttack_Bounce;
        return;
    }

    startX = sprite->data[1];
    startY = sprite->data[2];

    endX = sprite->data[3];
    endY = sprite->data[4];

    sprite->x =
        startX + (endX - startX) * t / duration;

    // Preserve same arc shape while shortening duration
    arc =
        -((t - duration / 2) * (t - duration / 2))
        + (duration * duration) / 4;

    sprite->y =
        startY + (endY - startY) * t / duration
        - arc / 6;
}

static void AnimQuickBallAttack_Bounce(struct Sprite *sprite)
{
    sprite->x -= 8;
    sprite->y += 12;

    if (sprite->x < -16 || sprite->y > DISPLAY_HEIGHT + 16)
        DestroyAnimSprite(sprite);
}

static void AnimTimerBallAttack(struct Sprite *sprite)
{
    int attackerX = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X);
    int attackerY = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y);
    int targetX   = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X);
    int targetY   = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y);

    sprite->x = attackerX - 16;
    sprite->y = attackerY - 8;

    sprite->data[0] = 0; // t

    sprite->data[1] = sprite->x; // startX
    sprite->data[2] = sprite->y; // startY
    sprite->data[3] = targetX;
    sprite->data[4] = targetY;

    sprite->data[5] = gBattleAnimArgs[0]; // pause frame
    sprite->data[6] = gBattleAnimArgs[1]; // pause duration
    sprite->data[7] = 0;                  // pause counter

    sprite->callback = AnimTimerBallAttack_Arc;
}
static void AnimTimerBallAttack_Arc(struct Sprite *sprite)
{
    int t;
    int startX, startY, endX, endY;
    int arc;
    int duration = 28;

    // -----------------------------
    // PAUSE LOGIC
    // -----------------------------
    if (sprite->data[0] == sprite->data[5] && sprite->data[7] < sprite->data[6])
    {
        sprite->data[7]++; // count pause frames
        // DO NOT increment t → freezes position
    }
    else
    {
        sprite->data[0]++; // resume motion
    }

    t = sprite->data[0];

    // -----------------------------
    // END CONDITION
    // -----------------------------
    if (t >= duration)
    {
        sprite->data[0] = 0;
        sprite->callback = AnimBallAttack_Bounce;
        return;
    }

    startX = sprite->data[1];
    startY = sprite->data[2];
    endX   = sprite->data[3];
    endY   = sprite->data[4];

    // -----------------------------
    // POSITION (unchanged math)
    // -----------------------------
    sprite->x = startX + (endX - startX) * t / duration;

    arc = -((t - duration / 2) * (t - duration / 2)) + (duration * duration) / 4;

    sprite->y = startY + (endY - startY) * t / duration - arc / 6;
}


static void AnimSprite_MoveThenWait(struct Sprite *sprite)
{
    s16 battler;

    switch (sprite->data[0])
    {
    // -----------------------------------
    // INITIALIZE
    // -----------------------------------
    case 0:
        if (gBattleAnimArgs[7] == 2) // ABSOLUTE MODE
        {
            sprite->x = gBattleAnimArgs[0];
            sprite->y = gBattleAnimArgs[1];
        }
        else // RELATIVE MODE
        {
            battler = (gBattleAnimArgs[7] == 0)
                ? gBattleAnimAttacker
                : gBattleAnimTarget;

            sprite->x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2);
            sprite->y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y_PIC_OFFSET);

            sprite->x += gBattleAnimArgs[0];
            sprite->y += gBattleAnimArgs[1];
        }

        sprite->data[1] = gBattleAnimArgs[2]; // x speed
        sprite->data[2] = gBattleAnimArgs[3]; // y speed
        sprite->data[3] = gBattleAnimArgs[4]; // move duration
        sprite->data[4] = gBattleAnimArgs[5]; // wait duration
        sprite->data[5] = gBattleAnimArgs[6]; // shake mode

        sprite->data[6] = 0;
        sprite->data[7] = 0;

        sprite->x2 = 0;
        sprite->y2 = 0;

        sprite->data[0] = 1;
        break;

    // -----------------------------------
    // MOVEMENT
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
    // WAIT + SHAKE
    // -----------------------------------
    case 2:
        sprite->data[7]++;

        if (sprite->data[7] >= 6)
        {
            sprite->data[7] = 0;

            if (sprite->data[5] == 1)
                sprite->y2 = (sprite->y2 == 0) ? 2 : -sprite->y2;
            else if (sprite->data[5] == 2)
                sprite->x2 = (sprite->x2 == 0) ? 2 : -sprite->x2;
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

static void AnimSprite_MoveStaggeredThenWait(struct Sprite *sprite)
{
    s16 battler;

    switch (sprite->data[0])
    {
    // -----------------------------------
    // INITIALIZE
    // -----------------------------------
    case 0:
        if (gBattleAnimArgs[7] == 2) // ABSOLUTE MODE
        {
            sprite->x = gBattleAnimArgs[0];
            sprite->y = gBattleAnimArgs[1];
        }
        else // RELATIVE MODE
        {
            battler = (gBattleAnimArgs[7] == 0)
                ? gBattleAnimAttacker
                : gBattleAnimTarget;

            sprite->x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2);
            sprite->y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y_PIC_OFFSET);

            sprite->x += gBattleAnimArgs[0];
            sprite->y += gBattleAnimArgs[1];
        }

        sprite->data[1] = gBattleAnimArgs[2]; // x step
        sprite->data[2] = gBattleAnimArgs[3]; // y step
        sprite->data[3] = gBattleAnimArgs[4]; // number of steps
        sprite->data[4] = gBattleAnimArgs[5]; // wait duration
        sprite->data[5] = gBattleAnimArgs[6]; // delay between steps

        sprite->data[6] = 0; // delay counter
        sprite->data[7] = 0; // steps completed

        sprite->x2 = 0;
        sprite->y2 = 0;

        sprite->data[0] = 1;
        break;

    // -----------------------------------
    // STAGGERED MOVEMENT
    // -----------------------------------
    case 1:
        if (++sprite->data[6] >= sprite->data[5])
        {
            sprite->data[6] = 0;

            sprite->x += sprite->data[1];
            sprite->y += sprite->data[2];

            if (++sprite->data[7] >= sprite->data[3])
            {
                sprite->data[6] = 0;
                sprite->data[7] = 0;
                sprite->data[0] = 2;
            }
        }
        break;

    // -----------------------------------
    // WAIT PHASE
    // -----------------------------------
    case 2:
        if (++sprite->data[6] >= sprite->data[4])
        {
            DestroyAnimSprite(sprite);
        }
        break;
    }
}


#define ROT_UPRIGHT   0x0000
#define ROT_WINDUP    0x2000   // -45°
#define ROT_STRIKE    -0x4000   // +90°

static void AnimHammerSwing(struct Sprite *sprite)
{
    s16 battler;

    switch (sprite->data[0])
    {
    // Initialization
    case 0:
        battler = (gBattleAnimArgs[0] == 0) ? gBattleAnimAttacker : gBattleAnimTarget;

        sprite->x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2) + gBattleAnimArgs[1];
        sprite->y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[2];

        sprite->data[1] = 0;
        sprite->data[2] = ROT_UPRIGHT;
        sprite->data[3] = gBattleAnimArgs[3];
        sprite->data[4] = gBattleAnimArgs[4];

        sprite->data[0] = 1;
        break;

    // Stage 1: Windup to -45°
    case 1:
        if (sprite->data[1] < 16)
        {
            s16 angle = (ROT_WINDUP * sprite->data[1]) / 16;
            TrySetSpriteRotScale(sprite, FALSE, 0x100, 0x100, angle);
            CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, 0);

            sprite->data[1]++;
        }
        else
        {
            sprite->data[1] = 0;
            sprite->data[0] = 2;
        }
        break;

    // Windup pause
    case 2:
        if (++sprite->data[1] >= sprite->data[3])
        {
            sprite->data[1] = 0;
            sprite->data[0] = 3;
        }
        break;

    // Stage 2: Strike to +90°
    case 3:
        if (sprite->data[1] < 8)
        {
            s16 angle = ROT_WINDUP + ((ROT_STRIKE - ROT_WINDUP) * sprite->data[1]) / 8;
            TrySetSpriteRotScale(sprite, FALSE, 0x100, 0x100, angle);
            CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, 0);

            sprite->data[1]++;
        }
        else
        {
            sprite->data[1] = 0;
            sprite->data[0] = 4;
        }
        break;

    // Impact shake
    case 4:
        sprite->y2 = (sprite->data[1] == 0) ? -4 : 4;

        if (++sprite->data[1] >= 2)
        {
            sprite->y2 = 0;
            sprite->data[1] = 0;
            sprite->data[0] = 5;
        }
        break;

    // End wait
    case 5:
        if (++sprite->data[1] >= sprite->data[4])
            DestroyAnimSprite(sprite);
        break;
    }
}

void AnimTask_OnionCutter(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u8 battler;
    s16 x, y;

    battler = (gBattleAnimArgs[0] == 0) ? gBattleAnimAttacker : gBattleAnimTarget;

    x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2) + gBattleAnimArgs[1];
    y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[2];

    task->data[10] = x;
    task->data[11] = y;
    task->data[12] = gBattleAnimArgs[3];
    task->data[13] = gBattleAnimArgs[4];

    task->data[14] = CreateSprite(&gOnionCutterSpriteTemplate, x, y,
                                  GetBattlerSpriteSubpriority(battler) + 1);

    if (task->data[14] == MAX_SPRITES)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    StartSpriteAnim(&gSprites[task->data[14]], 0);

    task->data[0] = 0;
    task->data[1] = 0;
    task->func = AnimTask_OnionCutter_Step;
}

static void AnimTask_OnionCutter_Step(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    struct Sprite *sprite;

    switch (task->data[0])
    {
    // WAIT BEFORE SPLIT
    case 0:
        if (++task->data[1] >= task->data[12])
        {
            DestroySprite(&gSprites[task->data[14]]);

            // create left half
            task->data[14] = CreateSprite(&gOnionCutterSpriteTemplate,
                                          task->data[10], task->data[11], 0);
            StartSpriteAnim(&gSprites[task->data[14]], 1);
            gSprites[task->data[14]].data[0] = -8;   // velocity
            gSprites[task->data[14]].data[1] = 0;

            // create right half
            task->data[15] = CreateSprite(&gOnionCutterSpriteTemplate,
                                          task->data[10], task->data[11], 0);
            StartSpriteAnim(&gSprites[task->data[15]], 2);
            gSprites[task->data[15]].data[0] = 8;
            gSprites[task->data[15]].data[1] = 0;

            task->data[0] = 1;
            task->data[1] = 0;
        }
        break;

    // MOVE HALVES WITH DECELERATION
    case 1:
    {
        struct Sprite *left = &gSprites[task->data[14]];
        struct Sprite *right = &gSprites[task->data[15]];

        // left half
        left->x2 += left->data[0];
        if (left->data[0] < 0)
            left->data[0]++;

        // right half
        right->x2 += right->data[0];
        if (right->data[0] > 0)
            right->data[0]--;

        if (++task->data[1] >= task->data[13])
        {
            DestroySprite(left);
            DestroySprite(right);
            task->data[0] = 2;
        }
        break;
    }

    case 2:
        DestroyAnimVisualTask(taskId);
        break;
    }
}


void AnimTask_EarthQuaker(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u8 battler;
    s16 x, y;

    battler = (gBattleAnimArgs[0] == 0) ? gBattleAnimAttacker : gBattleAnimTarget;

    x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X_2) + gBattleAnimArgs[1];
    y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[2];

    task->data[10] = x;
    task->data[11] = y;
    task->data[12] = gBattleAnimArgs[3];
    task->data[13] = gBattleAnimArgs[4];

    task->data[14] = CreateSprite(&gEarthQuakerSpriteTemplate, x, y,
                                  GetBattlerSpriteSubpriority(battler) + 1);

    if (task->data[14] == MAX_SPRITES)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    StartSpriteAnim(&gSprites[task->data[14]], 0);

    task->data[0] = 0;
    task->data[1] = 0;
    task->func = AnimTask_EarthQuaker_Step;
}

static void AnimTask_EarthQuaker_Step(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    struct Sprite *sprite;

    switch (task->data[0])
    {
    // WAIT BEFORE SPLIT
    case 0:
        if (++task->data[1] >= task->data[12])
        {
            DestroySprite(&gSprites[task->data[14]]);

            // create left half
            task->data[14] = CreateSprite(&gEarthQuakerSpriteTemplate,
                                          task->data[10], task->data[11], 0);
            StartSpriteAnim(&gSprites[task->data[14]], 1);
            gSprites[task->data[14]].data[0] = -8;   // velocity
            gSprites[task->data[14]].data[1] = 0;

            // create right half
            task->data[15] = CreateSprite(&gEarthQuakerSpriteTemplate,
                                          task->data[10], task->data[11], 0);
            StartSpriteAnim(&gSprites[task->data[15]], 2);
            gSprites[task->data[15]].data[0] = 8;
            gSprites[task->data[15]].data[1] = 0;

            task->data[0] = 1;
            task->data[1] = 0;
        }
        break;

    // MOVE HALVES WITH DECELERATION
    case 1:
    {
        struct Sprite *left = &gSprites[task->data[14]];
        struct Sprite *right = &gSprites[task->data[15]];

        // left half
        left->x2 += left->data[0];
        if (left->data[0] < 0)
            left->data[0]++;

        // right half
        right->x2 += right->data[0];
        if (right->data[0] > 0)
            right->data[0]--;

        if (++task->data[1] >= task->data[13])
        {
            DestroySprite(left);
            DestroySprite(right);
            task->data[0] = 2;
        }
        break;
    }

    case 2:
        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void AnimGarbotoxin(struct Sprite *sprite)
{
    // -----------------------------------
    // INITIALISE ARGUMENTS
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
    // 0. INITIALISE POSITION + WAIT 2
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

        if (++sprite->data[1] >= 2)
        {
            sprite->data[1] = 0;
            sprite->data[0] = 1;
        }
        break;

    // -----------------------------------
    // 1. +6 X, +10 Y, WAIT 2
    // -----------------------------------
    case 1:
        if (sprite->data[1] == 0)
        {
            sprite->x += 6;
            sprite->y += 10;
        }
        if (++sprite->data[1] >= 2)
        {
            sprite->data[1] = 0;
            sprite->data[0] = 2;
        }
        break;

    // -----------------------------------
    // 2. +2 X, +12 Y, WAIT 2
    // -----------------------------------
    case 2:
        if (sprite->data[1] == 0)
        {
            sprite->x += 2;
            sprite->y += 12;
        }
        if (++sprite->data[1] >= 2)
        {
            sprite->data[1] = 0;
            sprite->data[0] = 3;
        }
        break;

    // -----------------------------------
    // 3. +4 X, +12 Y, WAIT 2
    // -----------------------------------
    case 3:
        if (sprite->data[1] == 0)
        {
            sprite->x += 4;
            sprite->y += 12;
        }
        if (++sprite->data[1] >= 2)
        {
            sprite->data[1] = 0;
            sprite->data[0] = 4;
        }
        break;

    // -----------------------------------
    // 4. +4 X, +14 Y, WAIT 2
    // -----------------------------------
    case 4:
        if (sprite->data[1] == 0)
        {
            sprite->x += 4;
            sprite->y += 14;
        }
        if (++sprite->data[1] >= 2)
        {
            sprite->data[1] = 0;
            sprite->data[0] = 5;
        }
        break;

    // -----------------------------------
    // 5. ANIM 1, WAIT 3
    // -----------------------------------
    case 5:
        if (sprite->data[1] == 0)
            StartSpriteAnim(sprite, 1);

        if (++sprite->data[1] >= 3)
        {
            sprite->data[1] = 0;
            sprite->data[0] = 6;
        }
        break;

    // -----------------------------------
    // 6. ANIM 2, WAIT 5
    // -----------------------------------
    case 6:
        if (sprite->data[1] == 0)
            StartSpriteAnim(sprite, 2);

        if (++sprite->data[1] >= 5)
        {
            sprite->data[1] = 0;
            sprite->data[0] = 7;
        }
        break;

    // -----------------------------------
    // 7. ANIM 3, -4 X, +4 Y, WAIT 4
    // -----------------------------------
    case 7:
        if (sprite->data[1] == 0)
        {
            StartSpriteAnim(sprite, 3);
            sprite->x -= 4;
            sprite->y += 4;
        }
        if (++sprite->data[1] >= 4)
        {
            sprite->data[1] = 0;
            sprite->data[0] = 8;
        }
        break;

    // -----------------------------------
    // 8. +2 Y, WAIT 4
    // -----------------------------------
    case 8:
        if (sprite->data[1] == 0)
            sprite->y += 2;

        if (++sprite->data[1] >= 4)
        {
            sprite->data[1] = 0;
            sprite->data[0] = 9;
        }
        break;

    // -----------------------------------
    // 9. ANIM 2, +4 X, +2 Y, WAIT 5
    // -----------------------------------
    case 9:
        if (sprite->data[1] == 0)
        {
            StartSpriteAnim(sprite, 2);
            sprite->x += 4;
            sprite->y += 2;
        }
        if (++sprite->data[1] >= 5)
        {
            sprite->data[1] = 0;
            sprite->data[0] = 10;
        }
        break;

    // -----------------------------------
    // 10. ANIM 1, -2 X, +2 Y, WAIT 3
    // -----------------------------------
    case 10:
        if (sprite->data[1] == 0)
        {
            StartSpriteAnim(sprite, 1);
            sprite->x -= 2;
            sprite->y += 2;
        }
        if (++sprite->data[1] >= 3)
        {
            sprite->data[1] = 0;
            sprite->data[0] = 11;
        }
        break;

    // -----------------------------------
    // 11. ANIM 0, -2 X, +4 Y, WAIT 2
    // -----------------------------------
    case 11:
        if (sprite->data[1] == 0)
        {
            StartSpriteAnim(sprite, 0);
            sprite->x -= 2;
            sprite->y += 4;
        }
        if (++sprite->data[1] >= 2)
        {
            sprite->data[1] = 0;
            sprite->data[0] = 12;
        }
        break;

    // -----------------------------------
    // 12. +6 Y, WAIT 2
    // -----------------------------------
    case 12:
        if (sprite->data[1] == 0)
            sprite->y += 6;

        if (++sprite->data[1] >= 2)
        {
            sprite->data[1] = 0;
            sprite->data[0] = 13;
        }
        break;

    // -----------------------------------
    // 13. END
    // -----------------------------------
    case 13:
        DestroyAnimSprite(sprite);
        break;
    }
}

static void AnimSprite_FadeInOut(struct Sprite *sprite)
{
    u8 palIndex = IndexOfSpritePaletteTag(sprite->template->paletteTag);
    switch (sprite->data[0]) // state machine
    {
    case 0: // INIT
        // Absolute screen position
        sprite->x = gBattleAnimArgs[0];
        sprite->y = gBattleAnimArgs[1];

        sprite->data[1] = gBattleAnimArgs[2]; // initial wait
        sprite->data[2] = gBattleAnimArgs[3]; // fade speed
        sprite->data[3] = gBattleAnimArgs[4]; // target colour
        sprite->data[4] = gBattleAnimArgs[5]; // direction
        sprite->data[5] = gBattleAnimArgs[6]; // post wait

        sprite->data[6] = 0; // blend coefficient
        sprite->data[7] = 0; // frame counter

        // If fading FROM colour, start fully blended
        if (sprite->data[4] != 0)
            sprite->data[6] = 16;

        sprite->data[0] = 1;
        break;

    case 1: // INITIAL WAIT
        if (--sprite->data[1] <= 0)
            sprite->data[0] = 2;
        break;

    case 2: // FADING
        if (++sprite->data[7] >= sprite->data[2])
        {
            sprite->data[7] = 0;

            if (sprite->data[4] == 0)
            {
                // Fade TO colour
                if (sprite->data[6] < 16)
                    sprite->data[6]++;
            }
            else
            {
                // Fade FROM colour
                if (sprite->data[6] > 0)
                    sprite->data[6]--;
            }

            if (palIndex != 0xFF)
            {
                BlendPalette(
                    OBJ_PLTT_ID(palIndex),
                    16,
                    sprite->data[6],
                    sprite->data[3]
                );
            }


            // Check completion
            if ((sprite->data[4] == 0 && sprite->data[6] == 16) ||
                (sprite->data[4] != 0 && sprite->data[6] == 0))
            {
                sprite->data[0] = 3;
            }
        }
        break;

    case 3: // POST WAIT
        if (--sprite->data[5] <= 0)
            DestroyAnimSprite(sprite);
        break;
    }
}


static void AnimTask_DynamaxGrowthStep(u8 taskId) // from CFRU
{
    struct Task* task = &gTasks[taskId];
    if (!RunAffineAnimFromTaskData(task))
        DestroyAnimVisualTask(taskId);
}

// DYNAMAX
static const union AffineAnimCmd sDynamaxGrowthAffineAnimCmds[] = // from CFRU
{
    AFFINEANIMCMD_FRAME(-2, -2, 0, 64), //Double in size over 1 second
    AFFINEANIMCMD_FRAME(0, 0, 0, 64), //Pause for 1 seconds
    AFFINEANIMCMD_FRAME(16, 16, 0, 8), //Shrink back down in 1/8 of a second
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sDynamaxGrowthAttackAnimationAffineAnimCmds[] =
{
    AFFINEANIMCMD_FRAME(-4, -4, 0, 32), //Double in size quicker
    AFFINEANIMCMD_FRAME(0, 0, 0, 32), //Pause for less
    AFFINEANIMCMD_FRAME(16, 16, 0, 8),
    AFFINEANIMCMD_END,
};

//Arg 0: Animation for attack
void AnimTask_DynamaxGrowth(u8 taskId) // from CFRU
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBattlerSpriteId(ANIM_ATTACKER);

    if (gBattleAnimArgs[0] == 0)
        PrepareAffineAnimInTaskData(task, spriteId, sDynamaxGrowthAffineAnimCmds);
    else
        PrepareAffineAnimInTaskData(task, spriteId, sDynamaxGrowthAttackAnimationAffineAnimCmds);
    task->func = AnimTask_DynamaxGrowthStep;
}

void AnimThrowProtagonist(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, Random() % 4);
    InitSpritePosToAnimAttacker(sprite, 1);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[5];
    InitAnimArcTranslation(sprite);
    sprite->callback = AnimThrowProtagonist_Step;
}
void AnimThrowKanga(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, Random() % 3);
    InitSpritePosToAnimAttacker(sprite, 1);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET) + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[5];
    InitAnimArcTranslation(sprite);
    sprite->callback = AnimThrowProtagonist_Step;
}
static void AnimThrowProtagonist_Step(struct Sprite *sprite)
{
    if (TranslateAnimHorizontalArc(sprite))
        DestroyAnimSprite(sprite);
}

static void PSIRockin_ShiftPalette(u8 paletteNum)
{
    u16 base = OBJ_PLTT_ID(paletteNum);

    u16 temp = gPlttBufferFaded[base + 1];

    gPlttBufferFaded[base + 1] = gPlttBufferFaded[base + 2];
    gPlttBufferFaded[base + 2] = gPlttBufferFaded[base + 3];
    gPlttBufferFaded[base + 3] = temp;
}


static void AnimHBOMaxFinale(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        // -------------------------------
        // Position
        // -------------------------------
        if (gBattleAnimArgs[2] == 0)
            InitSpritePosToAnimAttacker(sprite, FALSE);
        else
            InitSpritePosToAnimTarget(sprite, FALSE);

        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];

        // -------------------------------
        // Start animation
        // -------------------------------
        StartSpriteAnim(sprite, 0);

        // -------------------------------
        // Apply 2× scale
        // -------------------------------
        sprite->oam.affineMode = ST_OAM_AFFINE_DOUBLE;
        SetSpriteRotScale(sprite - gSprites, 128, 128, 0);

        // -------------------------------
        // Palette index
        // -------------------------------
        sprite->data[1] = IndexOfSpritePaletteTag(sprite->template->paletteTag);

        // -------------------------------
        // Lifetime
        // -------------------------------
        sprite->data[3] = gBattleAnimArgs[3];

        // -------------------------------
        // Flip delay
        // -------------------------------
        sprite->data[4] = gBattleAnimArgs[4];

        // Frame counter
        sprite->data[5] = 0;

        // Flip state (0 = normal, 1 = flipped)
        sprite->data[6] = 0;

        sprite->data[0] = 1;
    }

    sprite->callback = AnimHBOMaxFinale_Step;
}


static void AnimHBOMaxFinale_Step(struct Sprite *sprite)
{
    // -----------------------------------
    // Lifetime
    // -----------------------------------
    if (--sprite->data[3] <= 0)
    {
        //FreeOamMatrix(sprite->oam.matrixNum);
        DestroySpriteAndMatrix(sprite);
    }
}

static void AnimPSIRockin(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        // -------------------------------
        // Position
        // -------------------------------
        if (gBattleAnimArgs[2] == 0)
            InitSpritePosToAnimAttacker(sprite, FALSE);
        else
            InitSpritePosToAnimTarget(sprite, FALSE);

        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];

        // -------------------------------
        // Start animation
        // -------------------------------
        StartSpriteAnim(sprite, 0);

        // -------------------------------
        // Apply 2× scale
        // -------------------------------
        sprite->oam.affineMode = ST_OAM_AFFINE_DOUBLE;
        SetSpriteRotScale(sprite - gSprites, 128, 128, 0);

        // -------------------------------
        // Palette index
        // -------------------------------
        sprite->data[1] = IndexOfSpritePaletteTag(sprite->template->paletteTag);

        // -------------------------------
        // Lifetime
        // -------------------------------
        sprite->data[3] = gBattleAnimArgs[3];

        // -------------------------------
        // Flip delay
        // -------------------------------
        sprite->data[4] = gBattleAnimArgs[4];

        // Frame counter
        sprite->data[5] = 0;

        // Flip state (0 = normal, 1 = flipped)
        sprite->data[6] = 0;

        sprite->data[0] = 1;
    }

    sprite->callback = AnimPSIRockin_Step;
}


static void AnimPSIRockin_Step(struct Sprite *sprite)
{
    sprite->data[5]++; // frame counter

    // -----------------------------------
    // Palette shift every 4 frames
    // -----------------------------------
    if ((sprite->data[5] & 3) == 0)
    {
        if (sprite->data[1] != 0xFF)
            PSIRockin_ShiftPalette(sprite->data[1]);
    }

    // -----------------------------------
    // Apply affine flip after delay
    // -----------------------------------
    if (!sprite->data[6] && sprite->data[5] >= sprite->data[4])
    {
        sprite->data[6] = 1;

        // Flip horizontally via negative X scale
        SetSpriteRotScale(sprite - gSprites, -128, 128, 0);
    }

    // -----------------------------------
    // Lifetime
    // -----------------------------------
    if (--sprite->data[3] <= 0)
    {
        //FreeOamMatrix(sprite->oam.matrixNum);
        DestroySpriteAndMatrix(sprite);
    }
}

void AnimMegaSymbolSprite(struct Sprite *sprite)
{
    u16 coeffB, coeffA;

    // Force spawn on attacker
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X_2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y_PIC_OFFSET);

    // --- original behaviour below ---
    sprite->x2 = Sin(sprite->data[0], 12);
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        sprite->x2 = -sprite->x2;

    sprite->data[0] = (sprite->data[0] + 6) & 0xFF;
    sprite->data[1] += 0x100;
    sprite->y2 = -(sprite->data[1] >> 8);

    ++sprite->data[7];

    if (sprite->data[7] == 1)
    {
        sprite->data[6] = 0x050B;
        SetGpuReg(REG_OFFSET_BLDCNT, (BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_ALL));
        SetGpuReg(REG_OFFSET_BLDALPHA, sprite->data[6]);
    }
    else if (sprite->data[7] > 30)
    {
        ++sprite->data[2];

        coeffB = sprite->data[6] >> 8;
        coeffA = sprite->data[6] & 0xFF;

        if (++coeffB > 16)
            coeffB = 16;

        --coeffA;
        if ((s16)coeffA < 0)
            coeffA = 0;

        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(coeffA, coeffB));
        sprite->data[6] = BLDALPHA_BLEND(coeffA, coeffB);

        if (coeffB == 16 && coeffA == 0)
        {
            sprite->invisible = TRUE;
            sprite->callback = AnimMegaSymbolSprite_End;
        }
    }
}

static void AnimMegaSymbolSprite_End(struct Sprite *sprite)
{
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    DestroyAnimSprite(sprite);
}

// Rotates a sprite template around its center.
//
// -------------------------------------------------------------------------
// ARGUMENTS
// -------------------------------------------------------------------------
//
// arg 0: starting X position
// arg 1: starting Y position
//
// arg 2: rotation magnitude / speed
//         Same angle units as SetSpriteRotScale()
//
// arg 3: amount of frames to rotate
//
// arg 4: amount of frames to wait after rotation finishes
//         before destroying the sprite
//
// arg 5: positioning mode
//         0 = relative to attacker
//         1 = relative to target
//         2 = screen space
//
// -------------------------------------------------------------------------
// EXAMPLE USAGE
// -------------------------------------------------------------------------
//
// createsprite gMySpriteTemplate, ANIM_ATTACKER, 2,
//              0, -20,   @ start x/y
//              0x400,    @ rotation speed
//              30,       @ rotation duration
//              15,       @ hold duration
//              0         @ relative to attacker
//
// -------------------------------------------------------------------------

void AnimRotateThenWait(struct Sprite *sprite)
{
    s16 baseX;
    s16 baseY;
    u8 battler;

    // -------------------------------------------------
    // Determine positioning basis
    // -------------------------------------------------

    switch (gBattleAnimArgs[5])
    {
    // Relative to attacker
    case 0:
        battler = gBattleAnimAttacker;

        baseX = GetBattlerSpriteCoord(battler, BATTLER_COORD_X);
        baseY = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y);
        break;

    // Relative to target
    case 1:
        battler = gBattleAnimTarget;

        baseX = GetBattlerSpriteCoord(battler, BATTLER_COORD_X);
        baseY = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y);
        break;

    // Screen space
    case 2:
    default:
        baseX = 0;
        baseY = 0;
        break;
    }

    // -------------------------------------------------
    // Apply initial position
    // -------------------------------------------------

    sprite->x = baseX + gBattleAnimArgs[0];
    sprite->y = baseY + gBattleAnimArgs[1];

    // Rotation speed
    sprite->data[0] = gBattleAnimArgs[2];

    // Rotation duration
    sprite->data[1] = gBattleAnimArgs[3];

    // Hold duration
    sprite->data[2] = gBattleAnimArgs[4];

    // Frame counter
    sprite->data[3] = 0;

    // Current angle
    sprite->data[4] = 0;

    // State
    // 0 = rotating
    // 1 = holding
    sprite->data[5] = 0;

    sprite->oam.affineMode = ST_OAM_AFFINE_NORMAL;

    sprite->callback = AnimRotateThenWait_Step;
}

static void AnimRotateThenWait_Step(struct Sprite *sprite)
{    
    switch (sprite->data[5])
    {
    // -------------------------------------------------
    // ROTATING
    // -------------------------------------------------
    case 0:

        sprite->data[4] += sprite->data[0];

        SetSpriteRotScale(
            sprite->oam.affineParam,
            0x100,
            0x100,
            sprite->data[4]
        );

        sprite->data[3]++;

        if (sprite->data[3] >= sprite->data[1])
        {
            sprite->data[3] = 0;
            sprite->data[5] = 1;
        }

        break;

    // -------------------------------------------------
    // HOLD
    // -------------------------------------------------
    case 1:

        sprite->data[3]++;

        if (sprite->data[3] >= sprite->data[2])
        {
            //ResetSpriteRotScale(spriteId);

            //sprite->x2 = 0;
            //sprite->y2 = 0;

            DestroyAnimSprite(sprite);
        }

        break;
    }
}
