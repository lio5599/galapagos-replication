#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Isolate the lowest set bit and decode its position using six masks.
 // Each mask selects positions with a particular binary index bit set.
 // The decoded position is the trailing-zero count; zero returns 64 explicitly.
 uint64_t low;
 int r = 0;
 if (in == 0)
  return 64;
 low = in & (UINT64_C(0) - in);
 if ((low & UINT64_C(0xaaaaaaaaaaaaaaaa)) != 0)
  r |= 1;
 if ((low & UINT64_C(0xcccccccccccccccc)) != 0)
  r |= 2;
 if ((low & UINT64_C(0xf0f0f0f0f0f0f0f0)) != 0)
  r |= 4;
 if ((low & UINT64_C(0xff00ff00ff00ff00)) != 0)
  r |= 8;
 if ((low & UINT64_C(0xffff0000ffff0000)) != 0)
  r |= 16;
 if ((low & UINT64_C(0xffffffff00000000)) != 0)
  r |= 32;
 return r;
}


int main(){
    ctz(0);
}
