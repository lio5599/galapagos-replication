#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Map each pattern to an unsigned key that is monotone in the float order.
    // Negative: invert all bits, so a larger magnitude gives a smaller key below 2^63.
    // Non-negative: set the top bit, so the key is at least 2^63 and keeps its order.
    // -0 maps to 2^63-1 and +0 maps to 2^63, so -0 < +0 as in the reference.
    // Equal inputs give equal keys, so the result is 0.
    uint64_t mx = (uint64_t)0 - (x >> 63);
    uint64_t my = (uint64_t)0 - (y >> 63);
    uint64_t kx = x ^ (mx | 0x8000000000000000ULL);
    uint64_t ky = y ^ (my | 0x8000000000000000ULL);
    return kx < ky;
}


int main(){
    fpr_lt(0,0);
}
