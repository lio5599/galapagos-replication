#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    uint64_t result = 0;
    for (unsigned int i = 0; i < 8; ++i)
        result |= ((Ai >> (8 * i)) & (uint64_t)0xff) << (8 * i);
    return result;
}


int main(){
    BitDeinterleave(0);
}
