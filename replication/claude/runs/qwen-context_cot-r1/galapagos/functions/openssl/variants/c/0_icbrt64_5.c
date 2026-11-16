#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Computes integer cube root of x scaled by 2^12.
    // Iterates through 22 iterations (63 down to 0 in steps of 3).
    // Each iteration determines one trit of the cube root.
    // Final shift by 12 provides the required scaling.
    uint64_t r = 0;
    uint64_t b;
    int i;

    for (i = 0; i < 22; i++) {
        int s = 63 - 3 * i;
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
