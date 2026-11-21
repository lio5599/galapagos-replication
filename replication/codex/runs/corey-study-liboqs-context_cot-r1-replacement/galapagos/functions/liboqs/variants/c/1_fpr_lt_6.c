#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Reproduce the reference's masking and result selection using unsigned math.
    // Same-sign differences have the required top bit; differing signs clear y.
    // Equality returns zero, and unsigned subtraction avoids signed overflow.
    uint64_t different = (x ^ y) >> 63;
    uint64_t masked_y = y & (different - (uint64_t)1);
    int cc0 = (int)((x - masked_y) >> 63);
    int cc1 = (int)((masked_y - x) >> 63);
    int both_negative = (int)((x & y) >> 63);

    return cc0 ^ ((cc0 ^ cc1) & both_negative);
}


int main(){
    fpr_lt(0,0);
}
