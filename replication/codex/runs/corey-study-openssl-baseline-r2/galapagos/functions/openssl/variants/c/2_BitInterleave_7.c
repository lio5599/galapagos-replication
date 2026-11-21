#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    uint64_t swapped = (Ai << 32) | (Ai >> 32);
    return (swapped << 32) | (swapped >> 32);
}


int main(){
    BitInterleave(0);
}
