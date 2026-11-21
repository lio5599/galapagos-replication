#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    int sx = (int)(x >> 63);
    int sy = (int)(y >> 63);

    if (sx != sy)
        return sx;
    return ((x < y) ^ sx) & (x != y);
}


int main(){
    fpr_lt(0,0);
}
