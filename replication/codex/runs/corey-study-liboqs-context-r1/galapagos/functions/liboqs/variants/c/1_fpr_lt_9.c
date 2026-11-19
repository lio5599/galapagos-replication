#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y) {
    uint64_t sign = (uint64_t)1 << 63;
    uint64_t kx = (x >> 63) ? ~x : x + sign;
    uint64_t ky = (y >> 63) ? ~y : y + sign;
    uint64_t hx = kx >> 32;
    uint64_t hy = ky >> 32;
    uint64_t low_mask = ((uint64_t)1 << 32) - 1;

    return (hx < hy)
        || ((hx == hy) && ((kx & low_mask) < (ky & low_mask)));
}


int main(){
    fpr_lt(0,0);
}
