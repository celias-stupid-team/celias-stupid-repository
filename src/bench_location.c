#include "global.h"
#include "bench_location.h"
#include "event_data.h"
#include "constants/maps.h"
#include "constants/bench_locations.h"
#include "data/bench_locations.h"

static u32 GetBenchLocationIndexFromMapGroupAndNum(u16 mapGroup, u16 mapNum)
{
    u32 i;

    for (i = 0; i < NELEMS(sBenchPoints); i++) {
        if (sBenchPoints[i].group == mapGroup && sBenchPoints[i].map == mapNum)
        {
            return i + 1;
        }
    }

    return 0;
}

static const struct BenchLocation * GetBenchLocationPointerFromMapGroupAndNum(u16 mapGroup, u16 mapNum)
{
    u32 i = GetBenchLocationIndexFromMapGroupAndNum(mapGroup, mapNum);
    if (i == 0)
        return NULL;

    return &sBenchPoints[i - 1];
}

const struct BenchLocation * GetBenchLocation(u32 idx)
{
    if (idx == 0)
        return NULL;
    if (idx > NELEMS(sBenchPoints))
        return NULL;
    return &sBenchPoints[idx - 1];
}
