#include <stdint.h>

__attribute__((noinline))
int fpr_lt_9(uint64_t x, uint64_t y) {
    // Use the property that IEEE 754 doubles can be compared as signed integers
    // after adjusting for the sign bit's effect on ordering
    // Positive values compare normally; negative values need reversed comparison
    // Sign bit extraction and conditional logic handles all cases correctly
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    int xs = (int)(x >> 63);
    int ys = (int)(y >> 63);
    int cmp = (int)(sx < sy);
    int rev_cmp = (int)(sy < sx);

    return xs ^ ys ? xs : (xs ? rev_cmp : cmp);
}


int main(){
    fpr_lt_9(0,0);
}
