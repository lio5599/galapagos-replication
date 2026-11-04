#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    uint64_t mask = 0x5555555555555555ULL;
    return (Ai & mask) | (Ai & ~mask);
}


int main(){
    BitDeinterleave(0);
}
