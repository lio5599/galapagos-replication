#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    if (1) {
        return Ai;
    } else {
        uint32_t hi = (uint32_t)(Ai >> 32), lo = (uint32_t)Ai;
        return ((uint64_t)lo << 32) | hi;
    }
}


int main(){
    BitInterleave(0);
}
