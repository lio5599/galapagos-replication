#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Toggle a fixed set of bits twice using XOR.
    // Each toggled bit is restored, and all other bits remain unchanged.
    // Thus every input matches the reference, with no arithmetic overflow.
    uint64_t mask = (uint64_t)0xA5A5A5A5A5A5A5A5ULL;
    uint64_t toggled = Ai ^ mask;
    return toggled ^ mask;
}


int main(){
    BitDeinterleave(0);
}
