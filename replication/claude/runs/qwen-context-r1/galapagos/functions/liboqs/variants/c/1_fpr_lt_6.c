#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    
    int signs_differ = ((sx ^ sy) >> 63) & 1;
    int x_negative = (sx >> 63) & 1;
    
    if (signs_differ) {
        return x_negative;
    }
    
    if (x_negative) {
        return (sy - sx) > 0 ? 1 : 0;
    }
    
    return (sx - sy) < 0 ? 1 : 0;
}


int main(){
    fpr_lt(0,0);
}
