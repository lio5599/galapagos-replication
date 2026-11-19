#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
    uint64_t bit;
    int r = 0;

    if (in == 0)
        return 64;

    bit = in & (uint64_t)(~in + 1);

    if (bit & 0xAAAAAAAAAAAAAAAAULL)
        r += 1;
    if (bit & 0xCCCCCCCCCCCCCCCCULL)
        r += 2;
    if (bit & 0xF0F0F0F0F0F0F0F0ULL)
        r += 4;
    if (bit & 0xFF00FF00FF00FF00ULL)
        r += 8;
    if (bit & 0xFFFF0000FFFF0000ULL)
        r += 16;
    if (bit & 0xFFFFFFFF00000000ULL)
        r += 32;

    return r;
}


int main(){
    ctz(0);
}
