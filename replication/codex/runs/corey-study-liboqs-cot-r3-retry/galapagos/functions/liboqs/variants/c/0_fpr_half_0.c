#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // The reference returns zero for a zero exponent field; otherwise it subtracts 2^52.
    // Test the original 11-bit exponent before subtracting.
    // Both signed zeros and all subnormal encodings become zero.
    // Every other encoding, including infinity and NaN, is decremented exactly.
    uint32_t e = (uint32_t)(x >> 52) & 0x7FFU;
    if (e == 0) {
        return 0;
    }
    return x - ((uint64_t)1 << 52);
}


int main(){
    fpr_half(0);
}
