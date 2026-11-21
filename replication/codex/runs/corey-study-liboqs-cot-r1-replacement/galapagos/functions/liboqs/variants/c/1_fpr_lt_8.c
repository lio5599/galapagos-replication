#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Spread differing bits downward, then isolate the highest differing bit.
    // That bit determines unsigned order, reversed for matching negative signs.
    // Separate sign and equality cases preserve signed-zero ordering and strictness.
    uint64_t d = x ^ y;
    uint64_t bit;
    int sx = (int)(x >> 63);

    if ((d >> 63) != 0) {
        return sx;
    }
    if (d == 0) {
        return 0;
    }
    d |= d >> 1;
    d |= d >> 2;
    d |= d >> 4;
    d |= d >> 8;
    d |= d >> 16;
    d |= d >> 32;
    bit = d ^ (d >> 1);

    return ((x & bit) == 0) ^ sx;
}


int main(){
    fpr_lt(0,0);
}
