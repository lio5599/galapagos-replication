#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Compare equal-sign encodings lexicographically by their 32-bit halves.
    // Reverse each comparison for negatives, preserving strict equality.
    // Handle different signs first, so signed zeros retain reference order.
    unsigned sx = (unsigned)(x >> 63);
    uint32_t xh = (uint32_t)(x >> 32);
    uint32_t yh = (uint32_t)(y >> 32);
    uint32_t xl = (uint32_t)x;
    uint32_t yl = (uint32_t)y;
    if (sx != (unsigned)(y >> 63)) {
        return (int)sx;
    }
    if (xh != yh) {
        return sx ? xh > yh : xh < yh;
    }
    return sx ? xl > yl : xl < yl;
}


int main(){
    fpr_lt(0,0);
}
