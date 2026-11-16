#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Identity function using right shift by 0, which leaves value unchanged.
    // Ai >> 0 equals Ai for all valid inputs, matching the reference behavior.
    uint64_t result = Ai >> 0;
    return result;
}


int main(){
    BitDeinterleave(0);
}
