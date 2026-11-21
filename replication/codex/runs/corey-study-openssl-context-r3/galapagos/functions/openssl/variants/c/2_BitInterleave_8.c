#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    uint64_t mask = (uint64_t)0xa5a5a5a5a5a5a5a5ULL;
    uint64_t encoded = Ai ^ mask;
    return encoded ^ mask;
}


int main(){
    BitInterleave(0);
}
