#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Separate the sign from the lower 63 encoding bits.
    // Different signs use the sign of x; equal signs compare the lower bits,
    // reversing direction for negatives. Equality remains strict.
    uint64_t low = ~((uint64_t)1 << 63);
    uint64_t ax = x & low;
    uint64_t ay = y & low;
    int sx = (int)(x >> 63);
    int sy = (int)(y >> 63);

    return (sx != sy) ? sx : (sx ? ax > ay : ax < ay);
}


int main(){
    fpr_lt(0,0);
}
