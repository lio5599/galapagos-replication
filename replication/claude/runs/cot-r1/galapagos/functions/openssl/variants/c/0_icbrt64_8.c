#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // With s = 3k, floor(cbrt(x >> s)) equals floor(floor(cbrt(x)) / 2^k).
    // So each step's root is twice the previous root, or twice plus one.
    // Each step sets r = 2r and adds 1 when (2r+1)^3 <= (x >> s).
    // Every candidate is at most 2642245, so its cube fits in 64 bits.
    // After s = 0, r = floor(cbrt(x)), including x = 0. The result is shifted left by 12.
    uint64_t r = 0, t;
    int s;
    for (s = 63; s >= 0; s -= 3) {
        r <<= 1;
        t = r + 1;
        if (t * t * t <= (x >> s))
            r = t;
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
