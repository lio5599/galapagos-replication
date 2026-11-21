#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // The reference clears inputs with exponent zero and otherwise subtracts 2^52.
    // After subtraction, exponent 0x7FF identifies an original zero exponent.
    // This includes both signed zeros and all subnormal bit patterns.
    // All other patterns, including infinities and NaNs, retain the subtraction.
    uint64_t y = x - (UINT64_C(1) << 52);
    if (((y >> 52) & UINT64_C(0x7FF)) == UINT64_C(0x7FF))
        return 0;
    return y;
}


int main(){
    fpr_half(0);
}
