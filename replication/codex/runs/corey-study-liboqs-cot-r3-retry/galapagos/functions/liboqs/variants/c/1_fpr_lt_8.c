#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // After resolving different signs, apply the same XOR mask to both encodings.
    // Complementing both negatives reverses their unsigned order; positives stay unchanged.
    // A strict comparison preserves equality and handles both extreme encodings.
    uint64_t sx = x >> 63;
    uint64_t sy = y >> 63;
    uint64_t mask;

    if (sx != sy) {
        return (int)sx;
    }
    mask = (uint64_t)0 - sx;
    return (x ^ mask) < (y ^ mask);
}


int main(){
    fpr_lt(0,0);
}
