#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // If either sign bit is set, the result equals unsigned x > y:
    // with mixed signs the negative operand has the larger pattern, giving x's sign;
    // with both negative the order reverses, as in the reference's sgn(sy - sx).
    // If both are non-negative, the result is plain unsigned x < y.
    // Equal inputs give 0 in all cases.
    return ((x | y) >> 63) ? (x > y) : (x < y);
}


int main(){
    fpr_lt(0,0);
}
