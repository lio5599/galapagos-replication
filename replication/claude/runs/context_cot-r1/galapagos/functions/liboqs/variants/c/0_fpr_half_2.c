#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Test the exponent bits in place with a 64-bit mask.
    // If they are all zero (zero or subnormal input), the reference yields 0.
    // Otherwise subtracting 2^52 decrements the exponent without a borrow out.
    if ((x & (uint64_t)0x7FF0000000000000) == 0) {
        return 0;
    }
    return x - ((uint64_t)1 << 52);
}


int main(){
    fpr_half(0);
}
