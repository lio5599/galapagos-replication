#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Swaps the operands when both are negative, then does one signed compare.
    // Both negative: the reference gives sy < sx, which is what the swap produces.
    // Otherwise sx < sy, which is correct for non-negatives and gives x's sign for mixed signs.
    // Equal inputs give 0 either way.
    uint64_t n = 0 - ((x & y) >> 63);
    uint64_t a = (x & ~n) | (y & n);
    uint64_t b = (y & ~n) | (x & n);
    return (int64_t)a < (int64_t)b;
}


int main(){
    fpr_lt(0,0);
}
