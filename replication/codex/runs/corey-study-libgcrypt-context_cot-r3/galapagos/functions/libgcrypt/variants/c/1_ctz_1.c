#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Examine bits from least to most significant.
 // The first set bit's index is the trailing-zero count.
 // If no bit is set, return 64; all shifts are below 64.
 int i;
 for (i = 0; i < 64; ++i)
 {
  if (((in >> i) & 1) != 0)
   return i;
 }
 return 64;
}


int main(){
    ctz(0);
}
