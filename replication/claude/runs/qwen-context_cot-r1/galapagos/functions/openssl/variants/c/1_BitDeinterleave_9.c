#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Identity function using multiplication by one, which leaves value unchanged.
    // Ai * 1 equals Ai for all valid inputs, matching the reference behavior.
    uint64_t result = Ai * 1ULL;
    return result;
}


int main(){
    BitDeinterleave(0);
}
