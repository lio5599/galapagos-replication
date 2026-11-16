#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Computes integer cube root of x scaled by 2^12.
    // Uses same digit-by-digit method with loop variable initialized differently.
    // The shift amount 12 comes from 2*18/3 which equals 12.
    // Edge case x=0 returns 0 correctly.
    uint64_t r = 0;
    uint64_t b;
    int s = 63;

    while (s >= 0) {
        r <<= 1;
        b = 3 * r * (r + 1) + 1;
        if ((x >> s) >= b) {
            x -= b << s;
            r++;
        }
        s -= 3;
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
