#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Approach: use the identity (x | m) == x + m - (x & m), so (x | m) - m + (x & m) == x.
    // All operations are unsigned modulo 2^64, so the identity holds for every input.
    const uint64_t m = 0x00ff00ff00ff00ffULL;
    uint64_t t = (Ai | m) - m;
    return t + (Ai & m);
}


int main(){
    BitInterleave(0);
}
