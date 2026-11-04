#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int64_t sx = (int64_t)x;
    int64_t sy = (int64_t)y;

    if (((x & y) >> 63) != 0) {
        return sy < sx;
    }
    return sx < sy;
}


int main(){
    fpr_lt(0,0);
}
