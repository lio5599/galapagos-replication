#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Build ordering keys using masks instead of conditional expressions.
    // Negatives are complemented; nonnegatives have only their sign bit toggled.
    // This places negatives first, reverses their order, and preserves equality.
    uint64_t high = (uint64_t)1 << 63;
    uint64_t mx = ((uint64_t)0 - (x >> 63)) | high;
    uint64_t my = ((uint64_t)0 - (y >> 63)) | high;
    return (x ^ mx) < (y ^ my);
}


int main(){
    fpr_lt(0,0);
}
