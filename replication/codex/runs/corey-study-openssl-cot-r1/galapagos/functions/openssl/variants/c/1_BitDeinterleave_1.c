#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Copy the input into another uint64_t and return that copy.
    // The reference is an identity function because its branch never runs.
    // The copy preserves all 64 bits for every input.
    uint64_t result = Ai;
    return result;
}


int main(){
    BitDeinterleave(0);
}
