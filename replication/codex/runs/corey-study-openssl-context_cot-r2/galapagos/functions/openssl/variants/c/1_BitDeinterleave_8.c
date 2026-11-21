#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Separate the low and high 32-bit halves, then recombine them.
    // Both shifts are within range and no original bits are lost.
    // This returns every input unchanged, including both extreme values.
    uint64_t low = Ai & (uint64_t)0xffffffffULL;
    uint64_t high = Ai >> 32;
    return (high << 32) | low;
}


int main(){
    BitDeinterleave(0);
}
