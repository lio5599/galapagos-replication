#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    int64_t sx, sy;

    sx = (int64_t)x;
    sy = (int64_t)y;
    if ((sx ^ sy) < 0) {
        return sx < 0;
    }
    return (sx < 0) ? (sy < sx) : (sx < sy);
}


int main(){
    fpr_lt(0,0);
}
