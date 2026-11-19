#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // For a nonzero exponent, e OR its unsigned negation has the top bit set.
    // Negating that bit produces an all-ones mask; exponent zero produces zero.
    // Applying the mask reproduces the reference for all input bit patterns.
    uint64_t e = (x >> 52) & 0x7FF;
    uint64_t keep = (e | ((uint64_t)0 - e)) >> 63;
    return (x - ((uint64_t)1 << 52)) & ((uint64_t)0 - keep);
}


int main(){
    fpr_half(0);
}
