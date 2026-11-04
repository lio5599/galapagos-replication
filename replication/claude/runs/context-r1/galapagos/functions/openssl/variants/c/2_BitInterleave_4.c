#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    uint64_t t = Ai ^ 0xA5A5A5A5A5A5A5A5ULL;
    t ^= 0xA5A5A5A5A5A5A5A5ULL;
    return t;
}


int main(){
    BitInterleave(0);
}
