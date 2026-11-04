#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    return Ai;
}


int main(){
    BitDeinterleave(0);
}
