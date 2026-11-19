#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
    uint64_t bit;

    if (in == 0)
        return 64;

    bit = in & ((uint64_t)0 - in);

    return ((bit & 0xAAAAAAAAAAAAAAAAULL) != 0)
         + 2 * ((bit & 0xCCCCCCCCCCCCCCCCULL) != 0)
         + 4 * ((bit & 0xF0F0F0F0F0F0F0F0ULL) != 0)
         + 8 * ((bit & 0xFF00FF00FF00FF00ULL) != 0)
         + 16 * ((bit & 0xFFFF0000FFFF0000ULL) != 0)
         + 32 * ((bit & 0xFFFFFFFF00000000ULL) != 0);
}


int main(){
    ctz(0);
}
