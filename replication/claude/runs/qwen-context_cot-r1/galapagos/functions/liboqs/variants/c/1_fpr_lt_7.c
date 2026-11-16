#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // Adjust representation so unsigned comparison works.
    // Flip all bits for negative numbers to reverse magnitude order.
    // Then standard unsigned comparison gives correct result.
    uint64_t ax = (x >> 63) ? ~x : x;
    uint64_t ay = (y >> 63) ? ~y : y;
    int sx = (x >> 63) & 1;
    int sy = (y >> 63) & 1;
    if (sx != sy) return sx;
    return (ax < ay) ? 1 : 0;
}


int main(){
    fpr_lt(0,0);
}
