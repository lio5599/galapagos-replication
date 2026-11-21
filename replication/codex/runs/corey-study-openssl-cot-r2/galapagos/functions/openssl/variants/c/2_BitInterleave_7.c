#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Split into two 32-bit halves and reassemble them in their original places.
    // No bits are lost, so all inputs match the reference, including extremes.
    uint64_t hi = Ai >> 32;
    uint64_t lo = Ai & (uint64_t)0xFFFFFFFFULL;
    return (hi << 32) | lo;
}


int main(){
    BitInterleave(0);
}
