#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // The first iteration is peeled. At s = 63, r = 0 and b = 1, so cond = x >> 63.
    // That step sets r = x >> 63 and removes the top bit from x.
    // The remaining 21 iterations run from s = 60 down to 0, unchanged.
    // This holds for all x, including values with the top bit set and x == 0.
    // The return value is r << 12.
    uint64_t r;
    uint64_t b;
    int s;

    r = x >> 63;
    x -= r << 63;
    for (s = 60; s >= 0; s -= 3) {
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
