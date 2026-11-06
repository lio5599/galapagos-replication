#include <stdint.h>

__attribute__((noinline))
static uint64_t fpr_half(uint64_t x) {
    // Approach: compute a 0/1 flag t = (e != 0) using the (e | -e) >> 31 trick on 32 bits.
    // Since e < 2^31, e | -e has its top bit set exactly when e is nonzero.
    // Subtract t*2^52, then mask with -t: for t=1 this is x - 2^52 unmasked.
    // For t=0 the mask is 0, so the result is +0, matching the reference's edge case.
    uint32_t t = (uint32_t)(x >> 52) & 0x7FF;
    t = (t | (0u - t)) >> 31;
    return (x - ((uint64_t)t << 52)) & ((uint64_t)0 - (uint64_t)t);
}


int main(){
    fpr_half(0);
}
