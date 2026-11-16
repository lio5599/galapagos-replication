#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Since if(0) is always false, the function does nothing to Ai.
    // It returns the input value unchanged.
    // This implementation returns Ai directly, ensuring equivalence.
    return Ai;
}


int main(){
    BitDeinterleave(0);
}
