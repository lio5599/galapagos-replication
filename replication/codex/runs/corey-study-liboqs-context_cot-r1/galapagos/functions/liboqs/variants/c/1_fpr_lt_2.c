#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Combine three disjoint cases: differing signs, two positives, two negatives.
    // Strict unsigned comparisons make equal encodings return zero.
    // The differing-sign case also orders negative zero before positive zero.
    int sx = (int)(x >> 63);
    int sy = (int)(y >> 63);
    return (sx & (sy ^ 1))
         | ((sx ^ 1) & (sy ^ 1) & (x < y))
         | (sx & sy & (x > y));
}


int main(){
    fpr_lt(0,0);
}
