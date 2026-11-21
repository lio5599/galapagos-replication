#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    // XOR with the same fixed mask twice cancels every toggled bit.
    // This restores all inputs exactly, without arithmetic overflow.
    uint64_t masked = Ai ^ (uint64_t)0xa5a5a5a5a5a5a5a5ULL;
    return masked ^ (uint64_t)0xa5a5a5a5a5a5a5a5ULL;
}


int main(){
    BitInterleave(0);
}
