#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Multiply the unsigned subtraction by a predicate that is exactly zero or one.
    // Nonzero exponents retain the result, including special-value encodings.
    // Zero exponents produce zero even when the subtraction wraps.
    uint64_t keep = (uint64_t)(((x >> 52) & 0x7FF) != 0);
    return (x - ((uint64_t)1 << 52)) * keep;
}


int main(){
    fpr_half(0);
}
