#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Different signs are resolved before comparing encodings.
    // Swap operands for two negatives, turning reversed order into ordinary
    // unsigned order. Equal operands remain equal after the swap.
    uint64_t sx = x >> 63;
    uint64_t sy = y >> 63;
    uint64_t a;
    uint64_t b;

    if (sx != sy) {
        return (int)sx;
    }
    a = sx ? y : x;
    b = sx ? x : y;
    return a < b;
}


int main(){
    fpr_lt(0,0);
}
