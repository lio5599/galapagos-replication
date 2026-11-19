#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Separate the sign from the lower 63 bits.
    // Signs decide mixed-sign cases; magnitudes ascend for positives and descend for negatives.
    // Equal magnitudes with equal signs are equal, while opposite signed zeros stay distinct.
    uint64_t mask = ((uint64_t)1 << 63) - 1;
    uint64_t mx = x & mask;
    uint64_t my = y & mask;
    unsigned sx = (unsigned)(x >> 63);
    unsigned sy = (unsigned)(y >> 63);

    if (sx > sy) {
        return 1;
    }
    if (sx < sy) {
        return 0;
    }
    if (sx) {
        return my < mx;
    }
    return mx < my;
}


int main(){
    fpr_lt(0,0);
}
