#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Compare magnitudes, reversing strict order when both signs are negative.
    // The inequality guard prevents reversal from making equal values less.
    // Different signs are ordered directly, including the two zero encodings.
    uint64_t mask = (UINT64_C(1) << 63) - UINT64_C(1);
    uint64_t ax = x & mask;
    uint64_t ay = y & mask;
    unsigned sx = (unsigned)(x >> 63);
    unsigned sy = (unsigned)(y >> 63);

    return sx != sy
        ? (int)sx
        : ((ax != ay) & ((ax < ay) ^ (int)sx));
}


int main(){
    fpr_lt(0,0);
}
