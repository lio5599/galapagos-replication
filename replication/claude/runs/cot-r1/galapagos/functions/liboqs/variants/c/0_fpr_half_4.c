#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Approach: mirror the reference but replace the mask arithmetic with a comparison.
    // After subtracting 2^52, the exponent field is 0x7FF only if it borrowed from 0.
    // In that case return 0, as the reference's zero mask does; otherwise return y.
    uint64_t y = x - ((uint64_t)1 << 52);
    return (((y >> 52) & 0x7FF) == 0x7FF) ? (uint64_t)0 : y;
}


int main(){
    fpr_half(0);
}
