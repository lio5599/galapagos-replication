#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Multiplication by a zero-or-one flag either clears or preserves the result.
    // The flag is zero exactly when the original exponent is zero.
    // Both arithmetic operations are unsigned, including any subtraction wraparound.
    uint64_t keep = (uint64_t)(((x >> 52) & (uint64_t)0x7FF) != 0);
    uint64_t y = x - ((uint64_t)1 << 52);
    return y * keep;
}


int main(){
    fpr_half(0);
}
