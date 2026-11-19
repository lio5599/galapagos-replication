#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    const uint64_t magnitude = ((uint64_t)1 << 63) - 1;
    uint64_t mx = x & magnitude;
    uint64_t my = y & magnitude;

    if (x >> 63) {
        return !(y >> 63) || mx > my;
    }
    return !(y >> 63) && mx < my;
}


int main(){
    fpr_lt(0,0);
}
