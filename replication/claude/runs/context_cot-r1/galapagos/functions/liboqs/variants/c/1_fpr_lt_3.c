#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Branchless select between lt = [sx<sy] and gt = [sx>sy], driven by the both-negative bit.
    // This mirrors the reference formula cc0 ^ ((cc0 ^ cc1) & n), with n = sign of x AND y.
    // For mixed signs, n is 0 and lt equals the sign of x, which is the reference result.
    // For both non-negative, the result is lt. For both negative, it is gt.
    // Equal inputs make lt = gt = 0.
    int64_t sx = (int64_t)x;
    int64_t sy = (int64_t)y;
    int lt = sx < sy;
    int gt = sx > sy;
    int n = (int)((x & y) >> 63);
    return lt ^ ((lt ^ gt) & n);
}


int main(){
    fpr_lt(0,0);
}
