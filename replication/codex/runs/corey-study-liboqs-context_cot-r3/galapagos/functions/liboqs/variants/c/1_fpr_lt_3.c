#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Select unsigned ascending or descending order for equal signs.
    // An all-zero or all-one mask instead selects x's sign when signs differ.
    // Strict comparisons ensure equality returns zero.
    uint64_t sx = x >> 63;
    uint64_t different = (x ^ y) >> 63;
    uint64_t mask = (uint64_t)0 - different;
    uint64_t same = sx ? (uint64_t)(x > y) : (uint64_t)(x < y);
    return (int)((same & ~mask) | (sx & mask));
}


int main(){
    fpr_lt(0,0);
}
