#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y) {
    uint64_t dxy = x - y;
    uint64_t dyx = y - x;
    int less = (int)(((~x & y) | (~(x ^ y) & dxy)) >> 63);
    int greater = (int)(((~y & x) | (~(x ^ y) & dyx)) >> 63);
    int sx = (int)(x >> 63);
    int different = (int)((x ^ y) >> 63);

    return different ? sx : (sx ? greater : less);
}


int main(){
    fpr_lt(0,0);
}
