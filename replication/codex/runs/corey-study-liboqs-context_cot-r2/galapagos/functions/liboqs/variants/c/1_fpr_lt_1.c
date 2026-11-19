#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Select the comparison directly from the two sign bits.
    // Opposite signs return the sign of x; two negatives reverse unsigned order.
    // Strict comparisons return zero for identical encodings.
    int sx = (int)(x >> 63);
    int sy = (int)(y >> 63);

    return sx ? (sy ? x > y : 1) : (sy ? 0 : x < y);
}


int main(){
    fpr_lt(0,0);
}
