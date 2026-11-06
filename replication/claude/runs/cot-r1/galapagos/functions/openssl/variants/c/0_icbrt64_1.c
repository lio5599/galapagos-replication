#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Binary search for the largest r in [0, 2642245] with r^3 <= x.
    // 2642245^3 < 2^64 <= 2642246^3, so the answer lies in this range and no cube overflows.
    // Invariant: lo^3 <= x, and every value above hi has a cube greater than x.
    // Using mid = lo + (hi - lo + 1) / 2 ensures progress. x = 0 yields lo = 0.
    // The result is shifted left by 12, matching the reference return value.
    uint64_t lo = 0, hi = 2642245, mid;
    while (lo < hi) {
        mid = lo + (hi - lo + 1) / 2;
        if (mid * mid * mid <= x)
            lo = mid;
        else
            hi = mid - 1;
    }
    return lo << 12;
}


int main(){
    icbrt64(0);
}
