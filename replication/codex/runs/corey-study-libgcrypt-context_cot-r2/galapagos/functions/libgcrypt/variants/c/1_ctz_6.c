#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Build masks covering successively longer low-bit prefixes.
 // A prefix is zero exactly when its length does not exceed the count.
 // All 64 prefixes are zero for input zero, producing 64.
 uint64_t mask = 1;
 int i;
 int r = 0;
 for (i = 0; i < 64; ++i)
 {
  r += (in & mask) == 0;
  mask = (uint64_t)((mask << 1) | 1);
 }
 return r;
}


int main(){
    ctz(0);
}
