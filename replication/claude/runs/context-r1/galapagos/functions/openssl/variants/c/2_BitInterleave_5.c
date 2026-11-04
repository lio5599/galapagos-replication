#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    uint64_t t = Ai + 0x0123456789ABCDEFULL;
    t -= 0x0123456789ABCDEFULL;
    return t;
}


int main(){
    BitInterleave(0);
}
