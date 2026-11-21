#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Compare sign-free magnitudes, reversing the direction for two negatives.
    // Different signs take precedence even when both magnitudes are zero.
    // Equal magnitudes with equal signs always compare false.
    uint64_t mask = ((uint64_t)1 << 63) - 1;
    uint64_t a = x & mask;
    uint64_t b = y & mask;
    int sx = (int)(x >> 63);
    int sy = (int)(y >> 63);

    if (sx != sy) {
        return sx;
    }
    return sx ? (a > b) : (a < b);
}


int main(){
    fpr_lt(0,0);
}
