#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y) {
    uint64_t mask = ((uint64_t)1 << 63) - 1;
    uint64_t ax = x & mask;
    uint64_t ay = y & mask;
    int sx = (int)(x >> 63);
    int sy = (int)(y >> 63);

    return sx != sy ? sx : (sx ? ax > ay : ax < ay);
}


int main(){
    fpr_lt(0,0);
}
