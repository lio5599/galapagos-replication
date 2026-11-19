#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    uint64_t mask = ((uint64_t)1 << 63) - 1;
    unsigned sx = (unsigned)(x >> 63);
    unsigned sy = (unsigned)(y >> 63);
    uint64_t mx = x & mask;
    uint64_t my = y & mask;

    return (int)((sx > sy)
        | ((sx == sy) & ((sx & (mx > my))
        | ((sx ^ 1U) & (mx < my)))));
}


int main(){
    fpr_lt(0,0);
}
