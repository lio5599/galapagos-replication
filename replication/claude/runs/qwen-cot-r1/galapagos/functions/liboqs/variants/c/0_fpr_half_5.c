#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Approach: separate exponent and mantissa, decrement exponent, recombine.
    // Extract exponent and mantissa parts.
    // Decrement exponent; if it becomes 0, result is 0.
    // Otherwise, subtract 1<<52 to decrement exponent in place.
    // Mantissa is preserved unless exponent underflows.
    uint32_t exp = (uint32_t)(x >> 52) & 0x7FF;
    if (exp == 0) {
        return 0;
    }
    return x - ((uint64_t)1 << 52);
}


int main(){
    fpr_half(0);
}
