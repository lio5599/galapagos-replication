#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    int sign_diff = ((sx ^ sy) >> 63) & 1;
    int both_neg = ((sx & sy) >> 63) & 1;
    
    if (sign_diff) {
        return sx < 0 ? 1 : 0;
    }
    
    if (both_neg) {
        return sy < sx ? 1 : 0;
    }
    
    return sx < sy ? 1 : 0;
}


int main(){
    fpr_lt(0,0);
}
