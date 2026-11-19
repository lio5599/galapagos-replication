#include <stdint.h>

__attribute__((noinline))
int.h>

static int fpr_lt(uint64_t x, uint64_t y)
{
    uint64_t sign = (uint64_t)1 << 63;

    if (x == y)
        return 0;
    if ((x ^ y) & sign)
        return (x & sign) != 0;

    return (int)(x < y) ^ (int)((x & sign) != 0);
}


int main(){
    fpr_lt(0,0);
}
