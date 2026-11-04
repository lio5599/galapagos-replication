#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 int r = 0, s;
 uint64_t x = in;

 s = ((x & 0xFFFFFFFFULL) == 0) << 5;
 x >>= s;
 r += s;
 s = ((x & 0xFFFFULL) == 0) << 4;
 x >>= s;
 r += s;
 s = ((x & 0xFFULL) == 0) << 3;
 x >>= s;
 r += s;
 s = ((x & 0xFULL) == 0) << 2;
 x >>= s;
 r += s;
 s = ((x & 0x3ULL) == 0) << 1;
 x >>= s;
 r += s;
 s = ((x & 0x1ULL) == 0);
 r += s;
 r += (in == 0);

 return r;
}


int main(){
    ctz(0);
}
