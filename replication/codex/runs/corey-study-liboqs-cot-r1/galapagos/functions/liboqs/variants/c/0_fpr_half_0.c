#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // The reference returns zero for exponent field zero, otherwise x minus 2^52.
    // Test the original exponent before subtracting to avoid exponent wraparound.
    // This matches every bit pattern, including signed zeros, subnormals, and NaNs.
    if (((x >> 52) & 0x7FF) == 0) {
        return 0;
    }
    return x - ((uint64_t)1 << 52);
}


int main(){
    fpr_half(0);
}
