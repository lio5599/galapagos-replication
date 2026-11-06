#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // The reference's first iteration has r = 0 and b = 1, so it only checks the top bit.
    // Here that step is done directly: if bit 63 is set, clear it and set r = 1.
    // The remaining iterations, s = 60 down to 0, are identical to the reference.
    // This gives floor(cbrt(x)) for all x, including 0 and UINT64_MAX.
    // The result is shifted left by 12 as in the reference.
    uint64_t r = 0, b;
    int s;
    if (x >> 63) {
        x -= (uint64_t)1 << 63;
        r = 1;
    }
    for (s = 60; s >= 0; s -= 3) {
        r <<= 1;
        b = 3 * r * (r + 1) + 1;
        if ((x >> s) >= b) {
            x -= b << s;
            r++;
        }
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
