#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    unsigned sx = (unsigned)(x >> 63);
    unsigned sy = (unsigned)(y >> 63);

    return (sx != sy) ? (int)sx : (sx ? (y < x) : (x < y));
}


int main(){
    fpr_lt(0,0);
}
