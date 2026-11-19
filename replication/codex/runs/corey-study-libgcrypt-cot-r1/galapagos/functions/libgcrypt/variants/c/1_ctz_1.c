#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Test successive bit positions using a single-bit mask.
 // The first set bit's position equals the number of trailing zeros.
 // For zero, the unsigned mask wraps to zero after all 64 positions.
 uint64_t mask = 1;
 int r = 0;
 while (mask != 0 && (in & mask) == 0)
 {
  ++r;
  mask <<= 1;
 }
 return r;
}


int main(){
    ctz(0);
}
