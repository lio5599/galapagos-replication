#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Adding one to the updated exponent carries at bit 11 only for exponent 2047.
    // Invert that one-bit indicator and negate it to retain or clear every bit.
    uint64_t y = x - ((uint64_t)1 << 52);
    uint64_t clear = (((y >> 52) & 0x7FF) + 1) >> 11;
    uint64_t mask = (uint64_t)0 - (clear ^ (uint64_t)1);
    return y & mask;
}


int main(){
    fpr_half(0);
}
