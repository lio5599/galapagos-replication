#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    return Ai + UINT64_C(0);
}


int main(){
    BitDeinterleave(0);
}
