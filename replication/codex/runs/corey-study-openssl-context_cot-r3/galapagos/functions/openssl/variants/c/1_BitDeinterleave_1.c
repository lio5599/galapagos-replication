#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // The reference's disabled branch leaves Ai unchanged.
    // Copying the value preserves all inputs, including zero and the maximum.
    uint64_t result = Ai;
    return result;
}


int main(){
    BitDeinterleave(0);
}
