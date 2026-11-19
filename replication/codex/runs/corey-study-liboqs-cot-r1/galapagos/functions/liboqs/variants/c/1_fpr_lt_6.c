#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Swap operands only when both are negative to reverse their order.
    // Flipping the sign bits then puts negatives before positives.
    // The strict unsigned comparison handles equality and signed zeros.
    uint64_t sign = (uint64_t)1 << 63;
    uint64_t mask = (uint64_t)0 - ((x & y) >> 63);
    uint64_t swap = (x ^ y) & mask;
    uint64_t a = x ^ swap;
    uint64_t b = y ^ swap;
    return (a ^ sign) < (b ^ sign);
}


int main(){
    fpr_lt(0,0);
}
