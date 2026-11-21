#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    int sx = (int)(x >> 63);
    int sy = (int)(y >> 63);
    int different = sx ^ sy;

    return (different & sx)
        | ((different ^ 1)
           & (((sx ^ 1) & (x < y)) | (sx & (x > y))));
}


int main(){
    fpr_lt(0,0);
}
