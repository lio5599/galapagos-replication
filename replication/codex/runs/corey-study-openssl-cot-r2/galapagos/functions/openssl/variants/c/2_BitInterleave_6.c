#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // XOR twice with the same mask cancels every toggled bit.
    // Thus every input is returned unchanged, including zero and all ones.
    const uint64_t mask = 0xA5A5A5A5A5A5A5A5ULL;
    Ai ^= mask;
    return Ai ^ mask;
}


int main(){
    BitInterleave(0);
}
