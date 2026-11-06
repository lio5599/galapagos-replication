#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Ternary form of the reference step: the condition c selects the update amounts.
    // x -= c ? (b << s) : 0 subtracts only when (x >> s) >= b.
    // r = 2*r + (c ? 1 : 0), where b is computed from 2*r before adding c.
    // The iteration range (s = 63 down to 0 in steps of 3) is unchanged.
    // The result is r << 12, the same as r * 1 << (2 * 18 / 3).
    uint64_t r = 0;
    uint64_t b;
    int c;
    int s;

    for (s = 63; s >= 0; s -= 3) {
        r = 2 * r;
        b = 3 * r * (r + 1) + 1;
        c = (x >> s) >= b;
        x -= c ? (b << s) : 0;
        r += c ? 1 : 0;
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
