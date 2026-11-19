#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Reproduce the reference's sign gating with defined unsigned arithmetic.
    // Equal-sign differences have the same sign bits as the reference differences.
    // For differing signs the selected result is x's sign; equality returns zero.
    uint64_t different = (x ^ y) >> 63;
    uint64_t gated_y = y & (different - (uint64_t)1);
    int cc0 = (int)((x - gated_y) >> 63);
    int cc1 = (int)((gated_y - x) >> 63);
    return cc0 ^ ((cc0 ^ cc1) & (int)((x & y) >> 63));
}


int main(){
    fpr_lt(0,0);
}
