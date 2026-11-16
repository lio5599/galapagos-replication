#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    
    int sx_neg = (int)(sx >> 63);
    int sy_neg = (int)(sy >> 63);
    
    if (sx_neg ^ sy_neg) {
        return sx_neg;
    }
    
    if (sx_neg) {
        return (int)((sy - sx) >> 63) & 1;
    }
    
    return (int)((sx - sy) >> 63) & 1;
}


int main(){
    fpr_lt(0,0);
}
