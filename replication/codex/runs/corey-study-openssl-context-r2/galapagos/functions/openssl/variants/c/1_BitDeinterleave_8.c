#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    uint64_t flipped = Ai ^ UINT64_C(0xA5A5A5A5A5A5A5A5);
    return flipped ^ UINT64_C(0xA5A5A5A5A5A5A5A5);
}


int main(){
    BitDeinterleave(0);
}
