#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Unrolls two successive reference rounds into each loop iteration.
    // The paired shifts run from 63 and 60 down to 3 and 0.
    // Their order and remainder updates are identical for all inputs.
    uint64_t r = 0;
    for (int s = 63; s >= 3; s -= 6) {
        r <<= 1;
        uint64_t b = 3 * r * (r + 1) + 1;
        if ((x >> s) >= b) {
            x -= b << s;
            ++r;
        }

        r <<= 1;
        b = 3 * r * (r + 1) + 1;
        if ((x >> (s - 3)) >= b) {
            x -= b << (s - 3);
            ++r;
        }
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
