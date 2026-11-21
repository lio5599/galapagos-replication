#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Swap operands only when both are negative to reverse their unsigned order.
    // For different signs, invert unsigned order so the negative encoding is first.
    // Equal operands are never inverted and therefore compare false.
    uint64_t different = (x ^ y) >> 63;
    uint64_t swap = (uint64_t)0 - ((x & y) >> 63);
    uint64_t delta = (x ^ y) & swap;
    uint64_t a = x ^ delta;
    uint64_t b = y ^ delta;

    return (int)((uint64_t)(a < b) ^ different);
}


int main(){
    fpr_lt(0,0);
}
