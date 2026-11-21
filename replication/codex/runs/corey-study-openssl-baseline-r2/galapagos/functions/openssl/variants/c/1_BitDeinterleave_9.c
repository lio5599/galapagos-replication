#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    uint64_t result;
    const unsigned char *src = (const unsigned char *)&Ai;
    unsigned char *dst = (unsigned char *)&result;

    for (unsigned int i = 0; i < sizeof result; ++i)
        dst[i] = src[i];

    return result;
}


int main(){
    BitDeinterleave(0);
}
