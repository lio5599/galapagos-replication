#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Combine three disjoint cases: negative versus positive, two positives,
    // and two negatives. The last case reverses unsigned order.
    // Strict comparisons preserve equality, without treating signed zeros alike.
    int sx = (int)(x >> 63);
    int sy = (int)(y >> 63);

    return (sx & (sy ^ 1))
        | ((sx ^ 1) & (sy ^ 1) & (int)(x < y))
        | (sx & sy & (int)(x > y));
}


int main(){
    fpr_lt(0,0);
}
