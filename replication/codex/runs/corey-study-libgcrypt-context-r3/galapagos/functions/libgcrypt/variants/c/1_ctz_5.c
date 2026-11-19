#include <stdint.h>

__attribute__((noinline))
int.h>

static int ctz(uint64_t in)
{
    uint64_t x = (~in) & (in - UINT64_C(1));

    x -= (x >> 1) & UINT64_C(0x5555555555555555);
    x = (x & UINT64_C(0x3333333333333333))
        + ((x >> 2) & UINT64_C(0x3333333333333333));
    x = (x + (x >> 4)) & UINT64_C(0x0f0f0f0f0f0f0f0f);
    x += x >> 8;
    x += x >> 16;
    x += x >> 32;
    return (int)(x & UINT64_C(0x7f));
}


int main(){
    ctz(0);
}
