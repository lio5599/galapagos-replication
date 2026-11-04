#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    uint64_t mask = 0xAAAAAAAAAAAAAAAAULL;
    return (Ai & mask) | (Ai & ~mask);
}


int main(){
    BitInterleave(0);
}
