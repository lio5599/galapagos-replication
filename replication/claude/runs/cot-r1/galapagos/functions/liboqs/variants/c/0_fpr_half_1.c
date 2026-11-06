#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Approach: if-statement on the masked exponent bits, without shifting.
    // An exponent field of zero, covering +-0 and subnormals, returns +0 as in the reference.
    // Any nonzero exponent is at least 1, so subtracting 2^52 never borrows past the exponent.
    // Sign and mantissa are therefore preserved, matching the reference.
    if ((x & (uint64_t)0x7FF0000000000000) == 0)
        return 0;
    return x - ((uint64_t)1 << 52);
}


int main(){
    fpr_half(0);
}
