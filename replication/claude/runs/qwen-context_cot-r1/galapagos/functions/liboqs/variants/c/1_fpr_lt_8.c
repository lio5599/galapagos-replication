#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Use sign mask to adjust comparison.
    // Create adjusted values where unsigned order matches float order.
    // Handle sign differences separately.
    int sx = (x >> 63) & 1;
    int sy = (y >> 63) & 1;
    uint64_t ax = x ^ ((uint64_t)sx << 63) ^ (~((uint64_t)sx << 63) & (uint64_t)0x7FFFFFFFFFFFFFFFULL);
    uint64_t ay = y ^ ((uint64_t)sy << 63) ^ (~((uint64_t)sy << 63) & (uint64_t)0x7FFFFFFFFFFFFFFFULL);
    if (sx != sy) return sx;
    return (ax < ay) ? 1 : 0;
}


int main(){
    fpr_lt(0,0);
}
