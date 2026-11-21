#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Return zero explicitly for zero and preserve every nonzero input.
    // Both paths equal the reference's unchanged input result.
    if (Ai == (uint64_t)0)
        return (uint64_t)0;
    return Ai;
}


int main(){
    BitDeinterleave(0);
}
