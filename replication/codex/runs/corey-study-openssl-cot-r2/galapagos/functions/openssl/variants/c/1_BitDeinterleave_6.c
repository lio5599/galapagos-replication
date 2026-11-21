#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Split into two 32-bit halves and reassemble them in their original positions.
    // This reconstructs the unchanged input returned by the reference.
    // The halves do not overlap, and all shifts are valid for every input.
    uint32_t lo = (uint32_t)Ai;
    uint32_t hi = (uint32_t)(Ai >> 32);
    return ((uint64_t)hi << 32) | (uint64_t)lo;
}


int main(){
    BitDeinterleave(0);
}
