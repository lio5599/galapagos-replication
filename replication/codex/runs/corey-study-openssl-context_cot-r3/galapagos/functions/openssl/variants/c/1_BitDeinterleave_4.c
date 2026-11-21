#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // The reference is the identity function.
    // Complementing twice restores every bit, including boundary inputs.
    uint64_t inverted = (uint64_t)~Ai;
    return (uint64_t)~inverted;
}


int main(){
    BitDeinterleave(0);
}
