#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Swap the two 32-bit halves twice to recover the input.
    // All shifts are by 32, and unsigned storage retains exactly 64 bits.
    uint64_t swapped = (Ai << 32) | (Ai >> 32);
    return (swapped << 32) | (swapped >> 32);
}


int main(){
    BitDeinterleave(0);
}
