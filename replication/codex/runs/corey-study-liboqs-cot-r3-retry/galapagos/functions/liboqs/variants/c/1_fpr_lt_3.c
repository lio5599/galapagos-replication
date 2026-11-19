#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Select among three disjoint cases using Boolean masks.
    // Mixed signs use x's sign; matching signs select forward or reversed comparison.
    // Strict comparisons ensure equal encodings never compare less.
    unsigned sx = (unsigned)(x >> 63);
    unsigned sy = (unsigned)(y >> 63);
    unsigned different = sx ^ sy;
    unsigned forward = (unsigned)(x < y);
    unsigned reverse = (unsigned)(x > y);

    return (int)((different & sx)
        | ((different ^ 1U) & (sx ^ 1U) & forward)
        | ((different ^ 1U) & sx & reverse));
}


int main(){
    fpr_lt(0,0);
}
