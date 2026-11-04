#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    uint64_t kx, ky;

    kx = x ^ ((uint64_t)((int64_t)x >> 63) | ((uint64_t)1 << 63));
    ky = y ^ ((uint64_t)((int64_t)y >> 63) | ((uint64_t)1 << 63));
    return kx < ky;
}


int main(){
    fpr_lt(0,0);
}
