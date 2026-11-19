#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Swap the comparison operands when the first encoding is negative.
    // With equal signs this reverses precisely the negative ordering.
    // Differing signs override that comparison; equality remains strict.
    uint64_t sx = x >> 63;
    uint64_t mask = (uint64_t)0 - sx;
    uint64_t a = (x & ~mask) | (y & mask);
    uint64_t b = (y & ~mask) | (x & mask);
    if ((x ^ y) >> 63) {
        return (int)sx;
    }
    return a < b;
}


int main(){
    fpr_lt(0,0);
}
