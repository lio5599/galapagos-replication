#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    uint64_t hi = Ai >> 32;
    uint64_t lo = Ai & (uint64_t)0xffffffffULL;
    return (hi << 32) | lo;
}


int main(){
    BitDeinterleave(0);
}
