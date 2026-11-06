#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // A branchless version of: (either sign set) ? x > y : x < y, all unsigned.
    // Mixed signs: x > y is true exactly when x is the negative one, which is the reference.
    // Both negative: x > y is the reversed magnitude order, as in sgn(sy - sx).
    // Both non-negative: x < y. Select with lt ^ ((lt ^ gt) & neg), the reference's blend.
    int lt = x < y, gt = x > y;
    int neg = (int)((x | y) >> 63);
    return lt ^ ((lt ^ gt) & neg);
}


int main(){
    fpr_lt(0,0);
}
