#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    const uint64_t mask = (uint64_t)0x5555555555555555ULL;
    uint64_t transformed = Ai ^ mask;
    return transformed ^ mask;
}


int main(){
    BitInterleave(0);
}
