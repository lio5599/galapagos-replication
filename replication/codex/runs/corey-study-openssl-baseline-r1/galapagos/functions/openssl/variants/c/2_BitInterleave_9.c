#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    uint64_t result = 0;
    unsigned int i;
    for (i = 0; i < 8; ++i) {
        unsigned int shift = i * 8;
        result |= ((Ai >> shift) & (uint64_t)0xff) << shift;
    }
    return result;
}


int main(){
    BitInterleave(0);
}
