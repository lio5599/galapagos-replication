#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Add the unsigned additive inverse of 2^52 instead of subtracting it.
    // Modular unsigned addition gives exactly the reference subtraction.
    // The exponent test clears every zero-exponent encoding before that operation.
    if ((x & ((uint64_t)0x7FF << 52)) == 0)
        return 0;
    return x + (~((uint64_t)1 << 52) + (uint64_t)1);
}


int main(){
    fpr_half(0);
}
