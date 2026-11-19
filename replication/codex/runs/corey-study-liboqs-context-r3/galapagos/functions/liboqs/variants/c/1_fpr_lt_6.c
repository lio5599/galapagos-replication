#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    unsigned sx = (unsigned)(x >> 63);
    unsigned sy = (unsigned)(y >> 63);
    uint64_t mx = x << 1;
    uint64_t my = y << 1;

    if (sx != sy)
        return (int)sx;

    return (mx != my) & ((int)(mx < my) ^ (int)sx);
}


int main(){
    fpr_lt(0,0);
}
