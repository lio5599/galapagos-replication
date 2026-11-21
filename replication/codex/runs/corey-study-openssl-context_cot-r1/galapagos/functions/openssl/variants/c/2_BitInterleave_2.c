#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // XOR with zero preserves every bit, matching the reference's identity.
    // This also preserves zero and the maximum uint64_t value.
    return Ai ^ (uint64_t)0;
}


int main(){
    BitInterleave(0);
}
