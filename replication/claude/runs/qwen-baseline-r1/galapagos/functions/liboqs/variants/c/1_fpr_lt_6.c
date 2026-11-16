#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int64_t sx = *(int64_t *)&x;
    int64_t sy = *(int64_t *)&y;
    
    int sign_x = (sx >> 63) & 1;
    int sign_y = (sy >> 63) & 1;
    
    if (sign_x == sign_y) {
        if (sign_x == 0) {
            return sx < sy;
        } else {
            return sx > sy;
        }
    }
    
    return sign_x;
}


int main(){
    fpr_lt(0,0);
}
