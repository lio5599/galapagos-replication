#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // For each i in 0..63, test whether the low i+1 bits of in are all zero.
 // Exactly ctz(in) such prefixes are zero, so counting them gives the result.
 // For in == 0 all 64 prefixes are zero, giving 64 as in the reference.
 int i, r = 0;
 for (i = 0; i < 64; i++)
  r += (in & (~0ULL >> (63 - i))) == 0;
 return r;
}


int main(){
    ctz(0);
}
