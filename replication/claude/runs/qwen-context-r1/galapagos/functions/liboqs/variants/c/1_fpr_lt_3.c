#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    
    int x_sign = sx >> 63;
    int y_sign = sy >> 63;
    
    if (x_sign != y_sign) {
        return x_sign & 1;
    }
    
    if (x_sign) {
        return (sy > sx) ? 1 : 0;
    }
    
    return (sx < sy) ? 1 : 0;
}


int main(){
    fpr_lt(0,0);
}
