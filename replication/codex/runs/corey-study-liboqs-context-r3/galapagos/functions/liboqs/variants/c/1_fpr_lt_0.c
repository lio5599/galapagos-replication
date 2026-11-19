#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    unsigned sx = (unsigned)(x >> 63);
    unsigned sy = (unsigned)(y >> 63);

    if (sx != sy)
        return (int)sx;
    if (sx)
        return x > y;
    return x < y;
}


int main(){
    fpr_lt(0,0);
}
