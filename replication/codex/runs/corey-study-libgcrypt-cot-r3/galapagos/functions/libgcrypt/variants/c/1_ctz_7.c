#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Propagate every set bit upward, filling from the lowest one to bit 63.
 // The complement then contains one set bit per original trailing zero.
 // Zero stays zero during propagation, so its complement counts to 64.
 uint64_t bits;
 int i, r = 0;
 in |= in << 1;
 in |= in << 2;
 in |= in << 4;
 in |= in << 8;
 in |= in << 16;
 in |= in << 32;
 bits = ~in;
 for (i = 0; i < 64; ++i)
 {
  r += (int)(bits & 1);
  bits >>= 1;
 }
 return r;
}


int main(){
    ctz(0);
}
