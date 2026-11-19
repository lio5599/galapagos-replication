#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Map negative encodings to the lower half in reversed order.
    // Map nonnegative encodings to the upper half in original order.
    // The mapping is injective, so equality and sign-boundary cases are preserved.
    uint64_t high = (uint64_t)1 << 63;
    uint64_t kx = (x >> 63) ? ~x : (x ^ high);
    uint64_t ky = (y >> 63) ? ~y : (y ^ high);
    return kx < ky;
}


int main(){
    fpr_lt(0,0);
}
