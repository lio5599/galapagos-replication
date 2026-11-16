#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    
    int same_sign = ~((sx ^ sy) >> 63) & 1;
    int neg_sign = (sx >> 63) & 1;
    
    int lt_pos = (sx - sy) >> 63 & 1;
    int lt_neg = (sy - sx) >> 63 & 1;
    
    return (same_sign & (neg_sign ? lt_neg : lt_pos)) | (~same_sign & neg_sign);
}


int main(){
    fpr_lt(0,0);
}
