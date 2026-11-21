#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // The reference computes floor(cube_root(x)) multiplied by 4096.
    // Binary search keeps the answer in the inclusive interval lo through hi.
    // Division tests m cubed <= x without overflowing; m is always positive.
    // 2642245 is the largest possible root, covering zero and UINT64_MAX.
    uint64_t lo = 0;
    uint64_t hi = 2642245;

    while (lo < hi) {
        uint64_t m = lo + (hi - lo + 1) / 2;
        if (m <= x / m / m)
            lo = m;
        else
            hi = m - 1;
    }
    return lo << 12;
}


int main(){
    icbrt64(0);
}
