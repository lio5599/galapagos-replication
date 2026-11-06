#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Uses three explicit cases with unsigned compares only.
    // If the signs differ, the result is x's sign bit, since a negative value is smaller.
    // If both are negative, a larger raw value means a larger magnitude, so the result is y < x.
    // If both are non-negative, the raw unsigned order equals the numeric order.
    // Equal inputs give 0 in every case, matching the reference.
    if ((x ^ y) >> 63) {
        return (int)(x >> 63);
    }
    if (x >> 63) {
        return y < x;
    }
    return x < y;
}


int main(){
    fpr_lt(0,0);
}
