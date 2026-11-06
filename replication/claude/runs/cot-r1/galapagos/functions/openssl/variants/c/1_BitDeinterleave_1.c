#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Approach: rebuild the value one bit at a time in a loop over all 64 positions.
    // Bit i of the result is set exactly when bit i of Ai is set, so result equals Ai.
    // Shifts are by 0..63 on uint64_t, so none is undefined behavior.
    // Zero and all-ones inputs are copied exactly like any other input.
    uint64_t r = 0;
    int i;
    for (i = 0; i < 64; i++)
        r |= ((Ai >> i) & (uint64_t)1) << i;
    return r;
}


int main(){
    BitDeinterleave(0);
}
