#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    uint32_t hi = (uint32_t)(Ai >> 32);
    uint32_t lo = (uint32_t)Ai;

    return ((uint64_t)hi << 32) | (uint64_t)lo;
}


int main(){
    BitDeinterleave(0);
}
