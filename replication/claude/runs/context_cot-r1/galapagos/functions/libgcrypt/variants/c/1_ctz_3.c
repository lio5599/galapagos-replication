#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // (in & -in) - 1 sets exactly the trailing-zero positions of in.
 // A SWAR popcount of that value is the number of trailing zeros.
 // For in == 0 the value is all ones, so the popcount is 64, as in the reference.
 uint64_t x = (in & (~in + 1)) - 1;
 x = x - ((x >> 1) & 0x5555555555555555ULL);
 x = (x & 0x3333333333333333ULL) + ((x >> 2) & 0x3333333333333333ULL);
 x = (x + (x >> 4)) & 0x0F0F0F0F0F0F0F0FULL;
 return (int)((x * 0x0101010101010101ULL) >> 56);
}


int main(){
    ctz(0);
}
