#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Handle different signs first, then swap operands for negative pairs.
    // Swapping reverses unsigned order without turning equality into less-than.
    // The sign test also distinguishes negative zero from positive zero.
    unsigned sx = (unsigned)(x >> 63);
    unsigned sy = (unsigned)(y >> 63);

    if (sx != sy) {
        return (int)sx;
    }
    if (sx) {
        uint64_t t = x;
        x = y;
        y = t;
    }
    return x < y;
}


int main(){
    fpr_lt(0,0);
}
