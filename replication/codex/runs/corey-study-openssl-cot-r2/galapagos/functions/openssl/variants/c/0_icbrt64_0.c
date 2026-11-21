#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // The reference computes floor(cube_root(x)) multiplied by 4096.
    // Binary search maintains a feasible lower and infeasible upper bound.
    // Division tests cubes without overflow; every tested midpoint is positive.
    // The bounds cover all uint64_t inputs, including zero and UINT64_MAX.
    uint64_t lo = 0;
    uint64_t hi = 2642246;

    while (hi - lo > 1) {
        uint64_t m = lo + (hi - lo) / 2;
        if (m <= x / m / m)
            lo = m;
        else
            hi = m;
    }
    return lo << 12;
}


int main(){
    icbrt64(0);
}
