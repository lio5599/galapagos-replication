#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Half-open binary search keeping lo^3 <= x < hi^3, with lo = 0 and hi = 2^22 at the start.
    // The invariant holds initially since (2^22)^3 = 2^66 exceeds any 64-bit x.
    // mid^3 <= x is tested as mid <= x / (mid*mid), which is exact for integers and cannot overflow.
    // mid > lo >= 0, so the divisor is never zero. The loop ends with lo = floor(cbrt(x)).
    // The result is shifted left by 12 as in the reference.
    uint64_t lo = 0, hi = (uint64_t)1 << 22, mid;
    while (hi - lo > 1) {
        mid = lo + (hi - lo) / 2;
        if (mid <= x / (mid * mid))
            lo = mid;
        else
            hi = mid;
    }
    return lo << 12;
}


int main(){
    icbrt64(0);
}
