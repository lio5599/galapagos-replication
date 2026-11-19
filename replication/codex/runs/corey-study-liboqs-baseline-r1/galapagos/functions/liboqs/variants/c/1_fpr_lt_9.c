#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int sx = (int)(x >> 63);
    int sy = (int)(y >> 63);
    int order = (x > y) - (x < y);

    if (sx != sy) {
        return sx;
    }
    return order * (1 - 2 * sx) < 0;
}


int main(){
    fpr_lt(0,0);
}
