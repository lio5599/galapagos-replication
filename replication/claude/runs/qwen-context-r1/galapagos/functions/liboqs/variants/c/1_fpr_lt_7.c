#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    
    int sx_sign = (int)(sx >> 63);
    int sy_sign = (int)(sy >> 63);
    
    if (sx_sign != sy_sign) {
        return sx_sign;
    }
    
    int64_t diff = sx - sy;
    int diff_sign = (int)(diff >> 63);
    
    if (sx_sign) {
        return !diff_sign;
    }
    
    return diff_sign;
}


int main(){
    fpr_lt(0,0);
}
