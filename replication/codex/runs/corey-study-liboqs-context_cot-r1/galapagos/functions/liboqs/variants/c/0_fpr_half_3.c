#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // For an exponent in 0 through 2047, adding 2047 then shifting yields its nonzero flag.
    // Negating that flag masks the subtraction exactly as the reference does.
    uint64_t e = (x >> 52) & 0x7FF;
    uint64_t keep = (e + 0x7FF) >> 11;
    return (x - ((uint64_t)1 << 52)) & ((uint64_t)0 - keep);
}


int main(){
    fpr_half(0);
}
