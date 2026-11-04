#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    switch ((int)(((x >> 63) << 1) | (y >> 63))) {
    case 0:
        return x < y;
    case 1:
        return 0;
    case 2:
        return 1;
    default:
        return y < x;
    }
}


int main(){
    fpr_lt(0,0);
}
