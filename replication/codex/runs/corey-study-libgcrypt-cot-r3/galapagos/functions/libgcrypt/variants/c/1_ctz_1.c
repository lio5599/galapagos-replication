#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Test each bit from least to most significant.
 // The first set bit's index equals the number of trailing zeros.
 // If no bit is set, return 64 without shifting by 64.
 int i;
 uint64_t mask = 1;
 for (i = 0; i < 64; ++i)
 {
  if ((in & mask) != 0)
   return i;
  mask <<= 1;
 }
 return 64;
}


int main(){
    ctz(0);
}
