#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Reference computes floor(cbrt(x)) shifted left by 12 (2*18/3 == 12).
    // Same digit-by-digit cube root, but driven by an up-counting index i.
    // s = 63 - 3*i covers 63,60,...,0, which is the same 22 steps as the reference.
    // The test (x >> s) >= b is kept, so b << s never overflows.
    // The final r * 1 << 12 equals r << 12. x == 0 gives 0 and the max input matches.
    uint64_t r = 0;
    uint64_t b;
    int i;
    int s;

    for (i = 0; i < 22; i++) {
        s = 63 - 3 * i;
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
