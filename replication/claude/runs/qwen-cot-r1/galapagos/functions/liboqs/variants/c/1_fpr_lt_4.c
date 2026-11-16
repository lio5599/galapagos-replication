#include <stdint.h>

__attribute__((noinline))
int fpr_lt_5(uint64_t x, uint64_t y) {
    // Alternative branchless approach using conditional move logic
    // Determine if signs are same or different, then apply appropriate comparison
    // Uses bitwise operations to avoid branches while maintaining correctness
    // Handles edge cases through careful combination of sign and magnitude checks
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    int sx_sign = (x >> 63) & 1;
    int sy_sign = (y >> 63) & 1;
    int same_sign = !(sx_sign ^ sy_sign);
    int result_if_same = same_sign ? (sx_sign ? (sy < sx) : (sx < sy)) : sx_sign;

    return result_if_same;
}


int main(){
    fpr_lt_5(0,0);
}
