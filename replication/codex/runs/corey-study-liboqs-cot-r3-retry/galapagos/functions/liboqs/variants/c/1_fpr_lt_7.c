#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Handle equality explicitly so reversing a strict comparison remains correct.
    // Mixed signs use x's sign; unequal matching-sign negatives invert unsigned order.
    // Distinct signed zeros follow the mixed-sign rule.
    unsigned sx = (unsigned)(x >> 63);
    unsigned sy = (unsigned)(y >> 63);

    if (x == y) {
        return 0;
    }
    if (sx != sy) {
        return (int)sx;
    }
    return (x < y) ^ (int)sx;
}


int main(){
    fpr_lt(0,0);
}
