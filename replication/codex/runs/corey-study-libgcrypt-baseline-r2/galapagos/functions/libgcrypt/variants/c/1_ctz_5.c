#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
    uint64_t bits = (uint64_t)(in - 1) & ~in;

    bits -= (bits >> 1) & 0x5555555555555555ULL;
    bits = (bits & 0x3333333333333333ULL)
         + ((bits >> 2) & 0x3333333333333333ULL);
    bits = (bits + (bits >> 4)) & 0x0F0F0F0F0F0F0F0FULL;
    bits += bits >> 8;
    bits += bits >> 16;
    bits += bits >> 32;

    return (int)(bits & 0x7F);
}


int main(){
    ctz(0);
}
