#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Complement every bit twice to recover the unchanged reference result.
    // Both complements cover all 64 bits, including the highest and lowest.
    uint64_t inverted = (uint64_t)~Ai;
    return (uint64_t)~inverted;
}


int main(){
    BitInterleave(0);
}
