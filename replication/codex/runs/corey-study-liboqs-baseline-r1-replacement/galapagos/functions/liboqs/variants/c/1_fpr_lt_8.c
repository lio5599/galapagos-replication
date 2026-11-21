#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    unsigned sx = (unsigned)(x >> 63);
    unsigned sy = (unsigned)(y >> 63);
    uint64_t magnitude_x = x & (((uint64_t)1 << 63) - 1);
    uint64_t magnitude_y = y & (((uint64_t)1 << 63) - 1);

    return (sx > sy)
        || ((sx == sy)
            && (sx ? magnitude_x > magnitude_y
                   : magnitude_x < magnitude_y));
}


int main(){
    fpr_lt(0,0);
}
