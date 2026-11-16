#include <stdint.h>

__attribute__((noinline))
int fpr_lt_3(uint64_t x, uint64_t y) {
    // Use sign bit extraction and branchless conditional selection
    // Compute both possible comparison results and select based on sign agreement
    // For positive numbers: normal signed comparison; for negative: reversed comparison
    // Sign difference case handled by selecting sign of x directly
    int sx_sign = (x >> 63) & 1;
    int sy_sign = (y >> 63) & 1;
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    int signs_differ = sx_sign ^ sy_sign;
    int pos_compare = (sx < sy);
    int neg_compare = (sy < sx);

    return signs_differ ? sx_sign : (sx_sign ? neg_compare : pos_compare);
}


int main(){
    fpr_lt_3(0,0);
}
