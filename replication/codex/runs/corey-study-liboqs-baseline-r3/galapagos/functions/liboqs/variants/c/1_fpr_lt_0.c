#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    uint64_t sx = x >> 63;
    uint64_t sy = y >> 63;

    if (sx != sy) {
        return (int)sx;
    }
    return sx ? (x > y) : (x < y);
}


int main(){
    fpr_lt(0,0);
}
