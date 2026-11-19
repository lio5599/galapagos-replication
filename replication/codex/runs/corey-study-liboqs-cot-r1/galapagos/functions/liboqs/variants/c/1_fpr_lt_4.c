#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // For equal signs, the unsigned difference's top bit detects ordering.
    // Such operands differ by at most 2 to the power 63 minus one.
    // Reverse subtraction for negatives; equality produces zero.
    // Different signs are handled directly, including signed zeros.
    uint64_t sx = x >> 63;
    uint64_t sy = y >> 63;
    uint64_t d;
    if (sx != sy) {
        return (int)sx;
    }
    d = sx ? y - x : x - y;
    return (int)(d >> 63);
}


int main(){
    fpr_lt(0,0);
}
