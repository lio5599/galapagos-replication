#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Copy each input bit into the same position of a zeroed result.
    // All 64 bits are visited, and shift counts stay within zero through 63.
    // Therefore zero, all ones, and every other input remain unchanged.
    uint64_t result = 0;
    for (unsigned int i = 0; i < 64; ++i) {
        result |= ((Ai >> i) & (uint64_t)1) << i;
    }
    return result;
}


int main(){
    BitInterleave(0);
}
