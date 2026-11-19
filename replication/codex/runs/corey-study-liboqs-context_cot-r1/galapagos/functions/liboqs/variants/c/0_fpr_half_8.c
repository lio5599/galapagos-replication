#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // The decremented exponent plus one overflows 11 bits only for original exponent zero.
    // Multiplication by zero or one implements the reference's clearing mask exactly.
    uint64_t y = x - ((uint64_t)1 << 52);
    uint64_t clear = (((y >> 52) & 0x7FF) + 1) >> 11;
    return y * ((uint64_t)1 - clear);
}


int main(){
    fpr_half(0);
}
