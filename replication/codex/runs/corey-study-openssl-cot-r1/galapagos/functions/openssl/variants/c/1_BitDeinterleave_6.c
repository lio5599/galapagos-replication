#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Apply unsigned modular negation twice to recover the input.
    // Conversion to uint64_t makes each result modulo 2 to the power of 64.
    // Zero, the top-bit-only value, and all other inputs are preserved.
    uint64_t negated = (uint64_t)(0ULL - Ai);
    return (uint64_t)(0ULL - negated);
}


int main(){
    BitDeinterleave(0);
}
