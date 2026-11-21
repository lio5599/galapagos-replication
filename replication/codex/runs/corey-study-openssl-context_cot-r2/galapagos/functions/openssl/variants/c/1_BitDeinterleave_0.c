#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // The reference returns its input unchanged.
    // Its if (0) body never executes, so this is identical for every input.
    return Ai;
}


int main(){
    BitDeinterleave(0);
}
