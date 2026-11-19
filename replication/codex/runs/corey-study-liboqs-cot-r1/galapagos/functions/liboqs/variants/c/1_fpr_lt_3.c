#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Compare signs first, then compare the sign-cleared magnitudes.
    // Negative magnitudes use reversed order; positive ones use normal order.
    // Equal encodings compare false, while opposite signed zeros use signs.
    uint64_t mask = ((uint64_t)1 << 63) - 1;
    uint64_t mx = x & mask;
    uint64_t my = y & mask;
    unsigned sx = (unsigned)(x >> 63);
    unsigned sy = (unsigned)(y >> 63);
    return sx != sy ? (int)sx : (sx ? mx > my : mx < my);
}


int main(){
    fpr_lt(0,0);
}
