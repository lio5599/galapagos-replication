#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    return (Ai & UINT64_C(0x5555555555555555)) |
           (Ai & UINT64_C(0xAAAAAAAAAAAAAAAA));
}


int main(){
    BitDeinterleave(0);
}
