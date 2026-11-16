#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    
    int same_sign = !((sx ^ sy) >> 63);
    int x_neg = (sx >> 63) & 1;
    
    if (!same_sign) {
        return x_neg;
    }
    
    if (x_neg) {
        return (sy - sx) >> 63 & 1;
    }
    
    return (sx - sy) >> 63 & 1;
}


int main(){
    fpr_lt(0,0);
}
