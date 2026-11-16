#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Digit-by-digit extraction in base 8 (octal)
    // Processes 3 bits at a time, similar to reference
    // Builds result by testing each octal digit position
    // Scales final result by 2^12 for fixed-point output
    uint64_t r = 0;
    for (int s = 63; s >= 0; s -= 3) {
        r <<= 1;
        uint64_t b = 3 * r * (r + 1) + 1;
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
