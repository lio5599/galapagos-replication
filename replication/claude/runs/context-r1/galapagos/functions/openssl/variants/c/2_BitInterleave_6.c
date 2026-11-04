#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    uint64_t t = (Ai << 32) | (Ai >> 32);
    t = (t << 32) | (t >> 32);
    return t;
}


int main(){
    BitInterleave(0);
}
