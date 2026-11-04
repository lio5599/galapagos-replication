#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    union {
        uint64_t v;
        uint32_t w[2];
    } u;
    u.v = Ai;
    return u.v;
}


int main(){
    BitInterleave(0);
}
