#ifndef GUARD_ITEM_MENU_ICONS
#define GUARD_ITEM_MENU_ICONS

#include "global.h"

// Values for 2nd argument to GetItemIconGfxPtr
enum {
    ITEMICON_TILES,
    ITEMICON_PAL,
};

// Sprite/palette tags for item menu OBJ slots
#define TAG_BAG                   100
#define TAG_SWAP_LINE             101
#define TAG_ITEM_ICON             102
#define TAG_ITEM_ICON_ALT         103
#define TAG_SANDWICH_CASE         104
#define TAG_SC_INGREDIENT_BREAD   105
#define TAG_SC_INGREDIENT_SESAME  106
#define TAG_SC_INGREDIENT_MEAT    107
#define TAG_SC_INGREDIENT_CHEESE  108
#define TAG_SC_INGREDIENT_LETTUCE 109
#define TAG_SC_INGREDIENT_PICKLES 110

extern const struct CompressedSpriteSheet gSpriteSheet_BagMale;
extern const struct CompressedSpriteSheet gSpriteSheet_BagFemale;
extern const struct CompressedSpritePalette gSpritePalette_Bag;

extern const struct CompressedSpriteSheet gBagSwapSpriteSheet;
extern const struct CompressedSpritePalette gBagSwapSpritePalette;

void ResetItemMenuIconState(void);
void CreateSwapLine(void);
void DestroyItemMenuIcon(bool8 a0);
void CreateItemMenuIcon(u16 itemId, bool8 a0);
void CopyItemIconPicTo4x4Buffer(const void *src, void *dest);
u8 AddItemIconObject(u16 tilesTag, u16 paletteTag, u16 itemId);
u8 AddItemIconObjectWithCustomObjectTemplate(const struct SpriteTemplate * origTemplate, u16 tilesTag, u16 paletteTag, u16 itemId);
void CreateBerryPouchItemIcon(u16 itemId, u8 idx);
void UpdateSwapLinePos(s16 x, u16 y);
void SetSwapLineInvisibility(bool8 invisible);
void SetBagVisualPocketId(u8);
void ShakeBagSprite(void);
const u32 *GetItemIconGfxPtr(u16 itemId, u8 ptrId);
void CreateBagSprite(u8 animNum);

#endif // GUARD_ITEM_MENU_ICONS
