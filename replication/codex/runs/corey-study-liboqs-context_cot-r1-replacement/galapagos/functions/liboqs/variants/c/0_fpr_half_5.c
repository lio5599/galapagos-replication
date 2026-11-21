#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Handle the original zero exponent before doing any subtraction.
    // The reference clears all such inputs, including nonzero fraction bits.
    // For all remaining inputs its mask is all ones.
    if ((x & ((uint64_t)0x7FF << 52)) == 0)
        return (uint64_t)0;
    return x - ((uint64_t)1 << 52);
}


int main(){
    fpr_half(0);
}
