#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Partition the comparison into opposite-sign and same-sign cases.
    // Negative pairs reverse unsigned order; positive pairs preserve it.
    // Strict comparisons handle equality, and opposite signed zeros use sign.
    int sx = (int)(x >> 63);
    int sy = (int)(y >> 63);
    int different = sx ^ sy;

    return (different & sx)
        | ((different ^ 1) & (sx ^ 1) & (int)(x < y))
        | ((different ^ 1) & sx & (int)(x > y));
}


int main(){
    fpr_lt(0,0);
}
