#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    uint64_t inverted = ~Ai;

    return ~inverted;
}


int main(){
    BitDeinterleave(0);
}
