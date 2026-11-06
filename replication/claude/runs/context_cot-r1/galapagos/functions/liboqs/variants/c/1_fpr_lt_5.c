#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Reproduces the reference subtraction scheme using unsigned arithmetic, which cannot overflow.
    // sy is cleared when the signs differ, so cc0 becomes the sign of x, which is the answer.
    // With equal signs, the true difference fits in 63 bits, so the wrapped sign bit is exact.
    // cc0 = [sx<sy] and cc1 = [sy<sx]. The result picks cc1 only when both inputs are negative.
    uint64_t m = 0 - ((x ^ y) >> 63);
    uint64_t yy = y & ~m;
    int cc0 = (int)((x - yy) >> 63);
    int cc1 = (int)((yy - x) >> 63);
    return cc0 ^ ((cc0 ^ cc1) & (int)((x & y) >> 63));
}


int main(){
    fpr_lt(0,0);
}
