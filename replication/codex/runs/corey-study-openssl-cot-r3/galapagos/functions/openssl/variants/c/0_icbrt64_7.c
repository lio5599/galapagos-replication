#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Input bit length supplies a strict power-of-two upper bound on the root.
    // Binary search maintains a fitting lower bound and a nonfitting upper bound.
    // Comparing m squared to x divided by m avoids overflowing a cube.
    // Zero returns immediately; even for UINT64_MAX, m squared fits in uint64_t.
    uint64_t t = x;
    uint64_t lo = 0;
    uint64_t hi;
    unsigned int bits = 0;

    if (x == 0)
        return 0;

    while (t != 0) {
        ++bits;
        t >>= 1;
    }
    hi = (uint64_t)1 << ((bits + 2) / 3);

    while (hi - lo > 1) {
        uint64_t m = lo + (hi - lo) / 2;
        if (m * m <= x / m)
            lo = m;
        else
            hi = m;
    }
    return lo << 12;
}


int main(){
    icbrt64(0);
}
