#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // A nonzero original exponent produces an all-one mask.
    // An original zero exponent produces a zero mask, regardless of other bits.
    uint64_t keep = (uint64_t)(((x >> 52) & 0x7FF) != 0);
    uint64_t mask = (uint64_t)0 - keep;
    return (x - ((uint64_t)1 << 52)) & mask;
}


int main(){
    fpr_half(0);
}
