#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 uint64_t y = in & (~in + 1);
 int r = 0;

 r |= ((y & 0xAAAAAAAAAAAAAAAAULL) != 0);
 r |= ((y & 0xCCCCCCCCCCCCCCCCULL) != 0) << 1;
 r |= ((y & 0xF0F0F0F0F0F0F0F0ULL) != 0) << 2;
 r |= ((y & 0xFF00FF00FF00FF00ULL) != 0) << 3;
 r |= ((y & 0xFFFF0000FFFF0000ULL) != 0) << 4;
 r |= ((y & 0xFFFFFFFF00000000ULL) != 0) << 5;
 r |= (in == 0) << 6;

 return r;
}


int main(){
    ctz(0);
}
