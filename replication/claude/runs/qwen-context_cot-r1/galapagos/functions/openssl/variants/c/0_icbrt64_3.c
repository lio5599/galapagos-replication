#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Computes integer cube root of x scaled by 2^12.
    // Restructured loop with post-decrement in condition.
    // Algorithm builds cube root bit by bit in groups of 3.
    // The scaling factor 2^12 is applied at the end.
    uint64_t r = 0;
    uint64_t b;
    int s;

    for (s = 63; s >= 0; s = s - 3) {
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
