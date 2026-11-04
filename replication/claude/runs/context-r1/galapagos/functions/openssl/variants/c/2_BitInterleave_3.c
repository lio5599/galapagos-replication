#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    uint64_t even = Ai & 0x5555555555555555ULL;
    uint64_t odd = Ai & 0xAAAAAAAAAAAAAAAAULL;
    return odd | even;
}


int main(){
    BitInterleave(0);
}
