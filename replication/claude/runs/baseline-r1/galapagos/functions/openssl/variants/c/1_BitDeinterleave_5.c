#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    uint64_t k = 0x0123456789abcdefULL;
    return (Ai ^ k) ^ k;
}


int main(){
    BitDeinterleave(0);
}
