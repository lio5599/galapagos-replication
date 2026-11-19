#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Spread every set bit toward higher positions, leaving low zeros intact.
 // Afterwards only the original trailing-zero positions remain zero.
 // Count all zero bits; zero stays zero and therefore returns 64.
 int i;
 int r = 0;
 in |= in << 1;
 in |= in << 2;
 in |= in << 4;
 in |= in << 8;
 in |= in << 16;
 in |= in << 32;
 for (i = 0; i < 64; ++i)
  r += (int)(((in >> i) & UINT64_C(1)) ^ UINT64_C(1));
 return r;
}


int main(){
    ctz(0);
}
