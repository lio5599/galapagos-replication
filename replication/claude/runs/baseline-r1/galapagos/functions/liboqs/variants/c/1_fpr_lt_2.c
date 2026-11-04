#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int64_t sx, sy, kx, ky;

    sx = (int64_t)x;
    sy = (int64_t)y;
    kx = sx ^ (int64_t)((uint64_t)(sx >> 63) >> 1);
    ky = sy ^ (int64_t)((uint64_t)(sy >> 63) >> 1);
    return kx < ky;
}


int main(){
    fpr_lt(0,0);
}
