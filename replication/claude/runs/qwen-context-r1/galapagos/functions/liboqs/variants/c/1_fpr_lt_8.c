#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    
    int x_neg = (sx >> 63) & 1;
    int y_neg = (sy >> 63) & 1;
    
    if (x_neg != y_neg) {
        return x_neg;
    }
    
    if (x_neg) {
        return (sy > sx) ? 1 : 0;
    }
    
    return (sx < sy) ? 1 : 0;
}


int main(){
    fpr_lt(0,0);
}
