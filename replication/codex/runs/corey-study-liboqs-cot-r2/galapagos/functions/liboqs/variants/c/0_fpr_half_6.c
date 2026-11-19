#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // For an exponent from zero through 2047, adding 2047 and shifting yields its nonzero flag.
    // Negating that flag unsigned creates the required preservation mask.
    // Thus zero exponents clear the result, while all others retain the subtraction.
    uint64_t exponent = (x >> 52) & 0x7FF;
    uint64_t keep = (exponent + 2047) >> 11;
    return (x - ((uint64_t)1 << 52)) & ((uint64_t)0 - keep);
}


int main(){
    fpr_half(0);
}
