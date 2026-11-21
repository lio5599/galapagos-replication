#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    uint64_t even = Ai & (uint64_t)0x5555555555555555ULL;
    uint64_t odd = Ai & (uint64_t)0xaaaaaaaaaaaaaaaaULL;
    return even ^ odd;
}


int main(){
    BitInterleave(0);
}
