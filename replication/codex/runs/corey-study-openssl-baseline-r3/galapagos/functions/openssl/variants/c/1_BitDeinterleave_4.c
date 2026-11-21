#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    return Ai & (uint64_t)-1;
}


int main(){
    BitDeinterleave(0);
}
