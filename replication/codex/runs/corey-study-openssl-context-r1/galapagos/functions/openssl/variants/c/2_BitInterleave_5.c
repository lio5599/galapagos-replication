#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    return (uint64_t)~(uint64_t)~Ai;
}


int main(){
    BitInterleave(0);
}
