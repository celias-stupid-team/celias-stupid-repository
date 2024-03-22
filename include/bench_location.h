#ifndef GUARD_BENCH_LOCATION_H
#define GUARD_BENCH_LOCATION_H

#include "global.h"

struct BenchLocation
{
    s8 group;
    s8 map;
    s16 x;
    s16 y;
};

const struct BenchLocation *GetBenchLocation(u32 loc);
//void SetWhiteoutRespawnWarpAndHealerNpc(struct WarpData * warp); WIP?

#endif // GUARD_BENCH_LOCATION_H
