#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    unsigned sx = (unsigned)(x >> 63);
    unsigned different = (unsigned)((x ^ y) >> 63);
    unsigned forward = (unsigned)((x - y) >> 63);
    unsigned reverse = (unsigned)((y - x) >> 63);

    return (int)((different & sx)
        | ((different ^ 1U)
            & ((forward & (sx ^ 1U)) | (reverse & sx))));
}


int main(){
    fpr_lt(0,0);
}
