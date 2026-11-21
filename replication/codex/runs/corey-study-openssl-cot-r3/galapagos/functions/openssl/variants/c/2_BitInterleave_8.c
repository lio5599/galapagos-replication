#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Copy each set bit into the same position in an initially zero result.
    // Every position is visited, so the result equals the unchanged reference.
    // Shifts stop at 63; zero, all ones, and the highest bit are preserved.
    uint64_t result = 0;
    unsigned int bit;
    for (bit = 0; bit < 64; ++bit) {
        uint64_t mask = (uint64_t)1 << bit;
        if ((Ai & mask) != 0)
            result |= mask;
    }
    return result;
}


int main(){
    BitInterleave(0);
}
