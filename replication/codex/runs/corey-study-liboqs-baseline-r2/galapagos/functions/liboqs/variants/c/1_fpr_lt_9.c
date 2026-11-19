#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    uint64_t difference = x ^ y;
    uint64_t bit = (uint64_t)1 << 63;

    if (difference == 0) {
        return 0;
    }
    if (difference & bit) {
        return (int)(x >> 63);
    }

    do {
        bit >>= 1;
    } while (!(difference & bit));

    return (x >> 63) ? ((x & bit) != 0) : ((y & bit) != 0);
}


int main(){
    fpr_lt(0,0);
}
