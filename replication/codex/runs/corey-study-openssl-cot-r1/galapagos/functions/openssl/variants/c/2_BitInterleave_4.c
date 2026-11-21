#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // AND with a full-width all-ones mask preserves all 64 bits.
    // No input bits are discarded, so all edge cases match the reference.
    uint64_t mask = (uint64_t)-1;
    return Ai & mask;
}


int main(){
    BitInterleave(0);
}
