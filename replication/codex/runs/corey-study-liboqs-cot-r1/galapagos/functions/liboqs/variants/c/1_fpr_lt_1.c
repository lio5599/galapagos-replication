#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Select among different-sign, positive, and negative comparisons.
    // Different signs select the negative operand as smaller.
    // Strict comparisons preserve equality and distinguish signed zeros.
    unsigned sx = (unsigned)(x >> 63);
    unsigned sy = (unsigned)(y >> 63);
    return (int)(((sx ^ sy) & sx)
        | ((1U ^ (sx ^ sy))
        & ((sx & (unsigned)(x > y))
        | ((1U ^ sx) & (unsigned)(x < y)))));
}


int main(){
    fpr_lt(0,0);
}
