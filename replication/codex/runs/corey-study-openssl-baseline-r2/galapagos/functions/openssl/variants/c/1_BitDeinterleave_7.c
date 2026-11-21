#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    uint64_t result = 0;
    for (unsigned int i = 0; i < 64; ++i)
        result |= ((Ai >> i) & (uint64_t)1) << i;
    return result;
}


int main(){
    BitDeinterleave(0);
}
