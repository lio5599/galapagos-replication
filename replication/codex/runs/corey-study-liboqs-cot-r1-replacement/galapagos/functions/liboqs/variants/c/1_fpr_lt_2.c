#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Map negative encodings to complemented keys and positive ones above them.
    // Unsigned key order reverses negatives and preserves positives.
    // The mapping is injective, preserving equality and distinguishing signed zeros.
    uint64_t high = (uint64_t)1 << 63;
    uint64_t mx = (uint64_t)0 - (x >> 63);
    uint64_t my = (uint64_t)0 - (y >> 63);
    uint64_t kx = x ^ (mx | high);
    uint64_t ky = y ^ (my | high);

    return kx < ky;
}


int main(){
    fpr_lt(0,0);
}
