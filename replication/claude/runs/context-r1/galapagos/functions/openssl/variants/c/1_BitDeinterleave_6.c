#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    uint64_t even = Ai & UINT64_C(0x5555555555555555);
    uint64_t odd = Ai & UINT64_C(0xaaaaaaaaaaaaaaaa);

    return even | odd;
}


int main(){
    BitDeinterleave(0);
}
