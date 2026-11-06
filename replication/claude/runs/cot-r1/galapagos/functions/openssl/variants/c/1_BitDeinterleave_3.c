#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Approach: split Ai into its 32-bit halves and recombine them in the same positions.
    // hi holds bits 63..32 and lo holds bits 31..0, so (hi << 32) | lo rebuilds Ai exactly.
    // This is the same identity the reference returns, for every input.
    uint32_t hi = (uint32_t)(Ai >> 32);
    uint32_t lo = (uint32_t)Ai;
    return ((uint64_t)hi << 32) | (uint64_t)lo;
}


int main(){
    BitDeinterleave(0);
}
