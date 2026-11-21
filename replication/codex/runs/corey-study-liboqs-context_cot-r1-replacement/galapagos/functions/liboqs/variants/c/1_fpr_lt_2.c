#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Map negatives to complemented encodings and positives above them.
    // The resulting unsigned keys preserve exactly the reference ordering.
    // Keys are distinct for signed zeros and equal only for equal encodings.
    uint64_t high = (uint64_t)1 << 63;
    uint64_t kx = (x & high) ? ~x : (x ^ high);
    uint64_t ky = (y & high) ? ~y : (y ^ high);

    return kx < ky;
}


int main(){
    fpr_lt(0,0);
}
