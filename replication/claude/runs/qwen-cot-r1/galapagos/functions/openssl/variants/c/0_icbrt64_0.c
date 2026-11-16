#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Reference: computes integer cube root of x, scaled by 2^(12)
    // Uses bit-by-bit restoration method for cube root
    // Iterates from highest bit, building result r
    // Final result is r * 2^12 due to fixed-point scaling
    uint64_t r = 0;
    uint64_t b;
    int s;
    for (s = 63; s >= 0; s -= 3) {
        r <<= 1;
        b = 3 * r * (r + 1) + 1;
        if ((x >> s) >= b) {
            x -= b << s;
            r++;
        }
    }
    return r * 1 << (2 * 18 / 3);
}


int main(){
    icbrt64(0);
}
