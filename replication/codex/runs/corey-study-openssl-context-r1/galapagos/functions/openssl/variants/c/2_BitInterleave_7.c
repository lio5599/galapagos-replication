#include <stdint.h>

__attribute__((noinline))
static uint64_t BitInterleave(uint64_t Ai)
{
    return Ai >> 0;
}


int main(){
    BitInterleave(0);
}
