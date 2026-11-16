#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Computes integer cube root of x scaled by 2^12.
    // Uses temporary variable for shifted x value for clarity.
    // The core algorithm remains the digit-by-digit restoration method.
    // All edge cases including max uint64_t are handled correctly.
    uint64_t r = 0;
    uint64_t b;
    uint64_t xshift;
    int s;

    for (s = 63; s >= 0; s -= 3) {
        r <<= 1;
        b = 3 * r * (r + 1) + 1;
        xshift = x >> s;
        if (xshift >= b) {
            x -= b << s;
            r++;
        }
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
