#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // The reference computes floor(cube_root(x)) multiplied by 4096.
    // Binary search brackets the root between a feasible and an exclusive bound.
    // 2642245 is the largest root for uint64_t, so every tested cube fits.
    // The initial bounds cover zero and UINT64_MAX without special cases.
    uint64_t lo = 0;
    uint64_t hi = 2642246;

    while (hi - lo > 1) {
        uint64_t mid = lo + (hi - lo) / 2;
        uint64_t cube = mid * mid * mid;
        if (cube <= x)
            lo = mid;
        else
            hi = mid;
    }
    return lo << 12;
}


int main(){
    icbrt64(0);
}
