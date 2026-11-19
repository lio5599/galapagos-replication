#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    uint32_t hx = (uint32_t)(x >> 32);
    uint32_t hy = (uint32_t)(y >> 32);
    uint32_t lx = (uint32_t)x;
    uint32_t ly = (uint32_t)y;

    if ((hx >> 31) != (hy >> 31)) {
        return (int)(hx >> 31);
    }
    if (hx >> 31) {
        return (hx > hy) || (hx == hy && lx > ly);
    }
    return (hx < hy) || (hx == hy && lx < ly);
}


int main(){
    fpr_lt(0,0);
}
