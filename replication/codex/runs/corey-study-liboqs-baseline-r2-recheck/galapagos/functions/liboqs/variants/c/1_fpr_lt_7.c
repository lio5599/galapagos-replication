#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    uint64_t sx = x >> 63;
    uint64_t different = (x ^ y) >> 63;
    uint64_t forward = (x - y) >> 63;
    uint64_t reverse = (y - x) >> 63;

    return (int)((different & sx)
               | ((different ^ 1)
                  & ((forward & (sx ^ 1)) | (reverse & sx))));
}


int main(){
    fpr_lt(0,0);
}
