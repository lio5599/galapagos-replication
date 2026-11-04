#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int64_t kx, ky;

    kx = (int64_t)x;
    ky = (int64_t)y;
    if (kx < 0) {
        kx = (int64_t)(x ^ 0x7FFFFFFFFFFFFFFFULL);
    }
    if (ky < 0) {
        ky = (int64_t)(y ^ 0x7FFFFFFFFFFFFFFFULL);
    }
    return kx < ky;
}


int main(){
    fpr_lt(0,0);
}
