#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Compare signs first, then compare magnitudes with sign bits removed.
    // Equal-sign magnitudes increase for positives and decrease for negatives.
    // Strict comparisons preserve equality; sign ordering distinguishes zeros.
    uint64_t mask = ((uint64_t)1 << 63) - 1;
    uint64_t ax = x & mask;
    uint64_t ay = y & mask;
    int sx = (int)(x >> 63);
    int sy = (int)(y >> 63);
    if (sx != sy) {
        return sx;
    }
    return sx ? (ay < ax) : (ax < ay);
}


int main(){
    fpr_lt(0,0);
}
