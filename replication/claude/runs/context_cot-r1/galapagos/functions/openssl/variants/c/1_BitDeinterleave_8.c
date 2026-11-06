#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Approach: extract the four 16-bit lanes and reassemble them in place.
    // Each lane is shifted back to its original position, then OR-combined.
    // The lanes are disjoint and cover all 64 bits, so the result equals Ai.
    uint64_t a = Ai & 0xFFFFULL;
    uint64_t b = (Ai >> 16) & 0xFFFFULL;
    uint64_t c = (Ai >> 32) & 0xFFFFULL;
    uint64_t d = (Ai >> 48) & 0xFFFFULL;
    return a | (b << 16) | (c << 32) | (d << 48);
}


int main(){
    BitDeinterleave(0);
}
