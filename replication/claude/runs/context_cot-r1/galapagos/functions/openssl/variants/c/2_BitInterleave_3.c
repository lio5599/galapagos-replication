#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Approach: split into 32-bit halves and recombine them in their original positions.
    // The casts keep exactly the low and high 32 bits, so the rebuilt value equals Ai.
    uint32_t hi = (uint32_t)(Ai >> 32);
    uint32_t lo = (uint32_t)Ai;
    return ((uint64_t)hi << 32) | (uint64_t)lo;
}


int main(){
    BitInterleave(0);
}
