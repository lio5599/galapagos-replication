#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Positive keys occupy the upper unsigned half; negative keys the lower.
    // Complementing negatives reverses their order without losing equality.
    // The two zero encodings remain ordered as in the reference.
    uint64_t high = (uint64_t)1 << 63;
    uint64_t kx = (x >> 63) ? ~x : (x | high);
    uint64_t ky = (y >> 63) ? ~y : (y | high);

    return kx < ky;
}


int main(){
    fpr_lt(0,0);
}
