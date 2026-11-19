#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Multiply the unsigned subtraction result by a zero-or-one predicate.
    // A zero exponent clears the result, including signed subnormal inputs.
    // Every other exponent keeps the exact subtraction, even for NaNs.
    uint64_t keep = (uint64_t)(((x >> 52) & 0x7FF) != 0);
    uint64_t y = x - ((uint64_t)1 << 52);
    return y * keep;
}


int main(){
    fpr_half(0);
}
