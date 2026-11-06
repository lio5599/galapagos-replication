#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Approach: negate twice with modular unsigned arithmetic: 0 - (0 - x) == x.
    // Unsigned wraparound is well defined, so 0 and 2^63 are handled correctly.
    // The result is the identity, as in the reference.
    uint64_t neg = (uint64_t)0 - Ai;
    return (uint64_t)0 - neg;
}


int main(){
    BitDeinterleave(0);
}
