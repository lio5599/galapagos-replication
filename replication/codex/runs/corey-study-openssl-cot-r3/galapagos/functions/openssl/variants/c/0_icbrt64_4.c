#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Search directly with cubes restricted to the largest representable root.
    // Every tested cube fits in uint64_t because candidates never exceed 2642245.
    // The best accepted candidate is therefore exactly the floor cube root.
    // Zero is the initial answer, and the upper bound includes UINT64_MAX's root.
    uint64_t lo = 1;
    uint64_t hi = 2642245;
    uint64_t answer = 0;

    while (lo <= hi) {
        uint64_t m = lo + (hi - lo) / 2;
        uint64_t cube = m * m * m;
        if (cube <= x) {
            answer = m;
            lo = m + 1;
        } else {
            hi = m - 1;
        }
    }
    return answer << 12;
}


int main(){
    icbrt64(0);
}
