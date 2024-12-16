#ifndef GUARD_POKEDEX_SCREEN_H
#define GUARD_POKEDEX_SCREEN_H

#define DEX_CATEGORY_FIRST_BADGE      0
#define DEX_CATEGORY_SECOND_BADGE         1
#define DEX_CATEGORY_THIRD_BADGE    2
#define DEX_CATEGORY_FOURTH_BADGE            3
#define DEX_CATEGORY_FIFTH_BADGE           4
#define DEX_CATEGORY_SIXTH_BADGE       5
#define DEX_CATEGORY_SEVENTH_BADGE  6
#define DEX_CATEGORY_FINAL_BADGE          7
#define DEX_CATEGORY_RARE           8
#define DEX_CATEGORY_COUNT          9

#define DEX_ORDER_NUMERICAL_KANTO    0
#define DEX_ORDER_ATOZ               1
#define DEX_ORDER_TYPE               2
#define DEX_ORDER_LIGHTEST           3
#define DEX_ORDER_SMALLEST           4
#define DEX_ORDER_NUMERICAL_NATIONAL 5

#define DEX_MODE(name) (DEX_CATEGORY_COUNT + DEX_ORDER_##name)

#include "pokedex.h"

extern const struct PokedexEntry gPokedexEntries[];

void CB2_OpenPokedexFromStartMenu(void);
s8 DexScreen_GetSetPokedexFlag(u16 nationalDexNo, u8 caseId, bool8 indexIsSpecies);

#endif //GUARD_POKEDEX_SCREEN_H
