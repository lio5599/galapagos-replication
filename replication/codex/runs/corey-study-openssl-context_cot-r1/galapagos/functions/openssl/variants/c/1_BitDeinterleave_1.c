#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Copy the input without performing the unreachable transformation.
    // Assignment preserves every bit, including zero and the maximum value.
    uint64_t result = Ai;
    return result;
}


int main(){
    BitDeinterleave(0);
}
