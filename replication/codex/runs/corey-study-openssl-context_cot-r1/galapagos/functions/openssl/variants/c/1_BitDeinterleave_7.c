#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Separate the upper and lower 32 bits, then reassemble them.
    // The disjoint halves preserve every bit for all inputs.
    uint64_t upper = Ai >> 32;
    uint64_t lower = Ai & (uint64_t)0xFFFFFFFFULL;
    return (upper << 32) | lower;
}


int main(){
    BitDeinterleave(0);
}
