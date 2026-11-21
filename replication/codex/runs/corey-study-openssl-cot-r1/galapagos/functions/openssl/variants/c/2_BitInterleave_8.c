#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Extract the upper and lower 32-bit halves, then recombine them.
    // The halves cover all bits without overlap, preserving every input.
    uint64_t hi = Ai >> 32;
    uint64_t lo = Ai & (uint64_t)0xFFFFFFFFULL;
    return (hi << 32) | lo;
}


int main(){
    BitInterleave(0);
}
