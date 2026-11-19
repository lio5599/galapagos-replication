#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // For a nonzero exponent, subtraction changes only the exponent field.
    // Rebuild that field while retaining the sign and fraction unchanged.
    // A zero exponent is explicitly cleared, including nonzero fractions.
    uint64_t exponent_mask = (uint64_t)0x7FF << 52;
    uint64_t e = (x >> 52) & (uint64_t)0x7FF;
    if (e == 0)
        return 0;
    return (x & ~exponent_mask) | ((e - (uint64_t)1) << 52);
}


int main(){
    fpr_half(0);
}
