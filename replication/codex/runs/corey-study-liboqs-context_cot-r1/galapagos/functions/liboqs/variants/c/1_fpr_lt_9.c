#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Compare equal-sign encodings lexicographically in two 32-bit pieces.
    // Reverse each strict comparison for negatives, preserving equality.
    // Differing signs are handled first, including the two zero encodings.
    int sx = (int)(x >> 63);
    uint64_t hx = x >> 32;
    uint64_t hy = y >> 32;
    uint64_t lx = x & (uint64_t)0xFFFFFFFF;
    uint64_t ly = y & (uint64_t)0xFFFFFFFF;
    if ((x ^ y) >> 63) {
        return sx;
    }
    if (hx != hy) {
        return sx ? (hx > hy) : (hx < hy);
    }
    return sx ? (lx > ly) : (lx < ly);
}


int main(){
    fpr_lt(0,0);
}
