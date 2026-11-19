#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // The exponent ranges from zero through 2047.
    // Adding 2047 and shifting by 11 gives zero only for exponent zero, else one.
    // Negating that indicator creates the mask that selects the subtraction result.
    uint64_t e = (x >> 52) & (uint64_t)0x7FF;
    uint64_t keep = (e + 2047) >> 11;
    return (x - ((uint64_t)1 << 52)) & ((uint64_t)0 - keep);
}


int main(){
    fpr_half(0);
}
