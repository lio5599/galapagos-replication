#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    uint64_t mask = (uint64_t)0xa5a5a5a5a5a5a5a5ULL;
    uint64_t transformed = Ai ^ mask;
    return transformed ^ mask;
}


int main(){
    BitDeinterleave(0);
}
