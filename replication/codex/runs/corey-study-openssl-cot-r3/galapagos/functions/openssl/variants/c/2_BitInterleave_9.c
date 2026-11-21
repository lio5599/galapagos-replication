#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Swap the two 32-bit halves twice, restoring their original positions.
    // Each swap preserves every bit, so this matches the reference identity.
    // Both shifts are by 32, valid even for zero and all-ones inputs.
    uint64_t swapped = (Ai << 32) | (Ai >> 32);
    return (swapped << 32) | (swapped >> 32);
}


int main(){
    BitInterleave(0);
}
