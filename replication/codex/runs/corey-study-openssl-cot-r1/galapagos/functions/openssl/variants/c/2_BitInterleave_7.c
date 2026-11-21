#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // XOR twice with the same mask cancels every toggled bit.
    // The original value is restored for every input, without overflow.
    uint64_t mask = (uint64_t)0xA5A5A5A5A5A5A5A5ULL;
    Ai ^= mask;
    return Ai ^ mask;
}


int main(){
    BitInterleave(0);
}
