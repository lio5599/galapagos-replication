#include <stdint.h>

__attribute__((noinline))
int.h>

static int ctz(uint64_t in)
{
    uint64_t bit;
    int r = 0;

    if (in == 0)
        return 64;

    bit = in & (~in + UINT64_C(1));
    if ((bit & UINT64_C(0xffffffff00000000)) != 0)
        r += 32;
    if ((bit & UINT64_C(0xffff0000ffff0000)) != 0)
        r += 16;
    if ((bit & UINT64_C(0xff00ff00ff00ff00)) != 0)
        r += 8;
    if ((bit & UINT64_C(0xf0f0f0f0f0f0f0f0)) != 0)
        r += 4;
    if ((bit & UINT64_C(0xcccccccccccccccc)) != 0)
        r += 2;
    if ((bit & UINT64_C(0xaaaaaaaaaaaaaaaa)) != 0)
        r += 1;
    return r;
}


int main(){
    ctz(0);
}
