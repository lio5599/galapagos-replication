#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Complementing twice restores every original bit.
    // The intermediate is explicitly stored as an unsigned 64-bit value.
    uint64_t inverted = (uint64_t)~Ai;
    return (uint64_t)~inverted;
}


int main(){
    BitDeinterleave(0);
}
