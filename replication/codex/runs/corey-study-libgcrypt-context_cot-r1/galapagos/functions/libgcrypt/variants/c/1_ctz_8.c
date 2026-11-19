#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Skip complete zero nibbles, then count remaining low zero bits.
 // Every skipped bit is zero and counting stops at the first one.
 // Return 64 explicitly for zero to avoid an endless nibble loop.
 int r = 0;
 if (in == 0)
  return 64;
 while ((in & 15) == 0)
 {
  r += 4;
  in >>= 4;
 }
 while ((in & 1) == 0)
 {
  r++;
  in >>= 1;
 }
 return r;
}


int main(){
    ctz(0);
}
