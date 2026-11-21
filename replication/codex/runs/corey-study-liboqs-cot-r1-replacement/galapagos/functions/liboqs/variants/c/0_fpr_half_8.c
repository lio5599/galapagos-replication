#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // For a nonzero exponent, subtract 2^52 using a binary borrow chain.
    // Toggle zero exponent bits until the first set bit absorbs the borrow.
    // The initial zero-exponent check prevents borrowing into the sign bit.
    // Thus all other sign and fraction bits, including NaN payloads, are preserved.
    uint64_t bit = UINT64_C(1) << 52;
    if ((x & UINT64_C(0x7FF0000000000000)) == 0)
        return 0;
    while ((x & bit) == 0) {
        x ^= bit;
        bit <<= 1;
    }
    return x ^ bit;
}


int main(){
    fpr_half(0);
}
