#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Greedy bit setting: the root is below 2^22, so try bits 21 down to 0.
    // A bit is kept when t^3 <= x, tested as t <= x / (t*t) to avoid overflow.
    // For integer t this test is exact, and t >= 1 so there is no division by zero.
    // Because t^3 <= x is monotone in t, the greedy result is floor(cbrt(x)).
    // x = 0 keeps no bits. The result is shifted left by 12 as in the reference.
    uint64_t r = 0, t;
    int bit;
    for (bit = 21; bit >= 0; bit--) {
        t = r | ((uint64_t)1 << bit);
        if (t <= x / (t * t))
            r = t;
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
