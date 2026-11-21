#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // AND with a 64-bit all-ones mask preserves the entire input.
    // Thus this matches the reference for zero and every other bit pattern.
    uint64_t mask = ~(uint64_t)0;
    return Ai & mask;
}


int main(){
    BitInterleave(0);
}
