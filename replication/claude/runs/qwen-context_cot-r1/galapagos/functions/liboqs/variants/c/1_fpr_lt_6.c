#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Transform negative numbers to preserve order.
    // For negative floats, invert magnitude bits to reverse order.
    // Then compare as unsigned.
    uint64_t mx = x;
    uint64_t my = y;
    int sx = (x >> 63) & 1;
    int sy = (y >> 63) & 1;
    if (sx) mx = ~mx;
    if (sy) my = ~my;
    if (sx != sy) return sx;
    return (mx < my) ? 1 : 0;
}


int main(){
    fpr_lt(0,0);
}
