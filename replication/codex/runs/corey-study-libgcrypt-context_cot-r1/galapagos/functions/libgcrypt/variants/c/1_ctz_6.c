#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // The mask has one set bit for each trailing zero of the input.
 // Zero input produces an all-ones mask, whose population is 64.
 // Parallel sums count bits in pairs, nibbles, bytes, then words.
 uint64_t bits = ~in & (in - (uint64_t)1);
 bits -= (bits >> 1) & 0x5555555555555555ULL;
 bits = (bits & 0x3333333333333333ULL)
      + ((bits >> 2) & 0x3333333333333333ULL);
 bits = (bits + (bits >> 4)) & 0x0F0F0F0F0F0F0F0FULL;
 bits += bits >> 8;
 bits += bits >> 16;
 bits += bits >> 32;
 return (int)(bits & 0x7FULL);
}


int main(){
    ctz(0);
}
