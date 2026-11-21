#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // Add one and then subtract one using unsigned arithmetic.
    // Wraparound restores even the maximum value, matching the identity.
    Ai += (uint64_t)1;
    Ai -= (uint64_t)1;
    return Ai;
}


int main(){
    BitInterleave(0);
}
