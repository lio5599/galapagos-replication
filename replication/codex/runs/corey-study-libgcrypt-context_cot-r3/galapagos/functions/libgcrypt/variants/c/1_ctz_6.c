#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Skip whole zero nibbles, then the remaining low zero bits.
 // Each shift adds precisely the number of discarded zero bits.
 // The explicit zero case prevents an endless nibble scan.
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
  ++r;
  in >>= 1;
 }
 return r;
}


int main(){
    ctz(0);
}
