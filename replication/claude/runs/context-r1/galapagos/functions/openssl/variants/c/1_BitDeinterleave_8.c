#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    uint64_t low_half = Ai & UINT64_C(0x00000000ffffffff);
    uint64_t high_half = Ai & UINT64_C(0xffffffff00000000);

    return high_half + low_half;
}


int main(){
    BitDeinterleave(0);
}
