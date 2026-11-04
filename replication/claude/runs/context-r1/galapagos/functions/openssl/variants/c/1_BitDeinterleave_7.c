#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    uint64_t negated = UINT64_C(0) - Ai;

    return UINT64_C(0) - negated;
}


int main(){
    BitDeinterleave(0);
}
