#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Branch-free variant: mask is all ones when (x >> s) >= b, otherwise zero.
    // x -= (b << s) & mask subtracts b << s only when the reference would.
    // r += mask & 1 performs the conditional increment.
    // The loop bounds are identical (s = 63 down to 0 in steps of 3).
    // The return value is r << 12, as in the reference.
    uint64_t r = 0;
    uint64_t b;
    uint64_t mask;
    int s;

    for (s = 63; s >= 0; s -= 3) {
        r <<= 1;
        b = 3 * r * (r + 1) + 1;
        mask = (uint64_t)0 - (uint64_t)((x >> s) >= b);
        x -= (b << s) & mask;
        r += mask & 1;
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
