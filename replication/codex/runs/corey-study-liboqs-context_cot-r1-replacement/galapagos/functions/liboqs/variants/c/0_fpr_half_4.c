#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Use a 64-bit carry calculation for the reference's exponent test.
    // The masked exponent plus one is at most 2048, so widening changes nothing.
    // Only an all-ones decremented exponent yields a zero output mask.
    uint64_t y = x - ((uint64_t)1 << 52);
    uint64_t t = (((y >> 52) & 0x7FF) + (uint64_t)1) >> 11;
    return y & (t - (uint64_t)1);
}


int main(){
    fpr_half(0);
}
