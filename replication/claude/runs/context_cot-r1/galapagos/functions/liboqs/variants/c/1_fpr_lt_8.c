#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Flipping the sign bit turns a signed comparison into an unsigned one.
    // For non-negative or mixed signs, the result is [(x^S) < (y^S)], which equals [sx < sy].
    // For both negative, the order is reversed, so the result is [y < x] unsigned.
    // Within the same sign, the unsigned and signed orders agree. Equal inputs give 0.
    uint64_t s = 0x8000000000000000ULL;
    if ((x & y) & s) {
        return y < x;
    }
    return (x ^ s) < (y ^ s);
}


int main(){
    fpr_lt(0,0);
}
