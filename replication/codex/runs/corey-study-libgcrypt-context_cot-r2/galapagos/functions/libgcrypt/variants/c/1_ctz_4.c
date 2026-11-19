#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Unsigned negation isolates the least significant set bit.
 // Shifting this power of two down to one counts its bit index.
 // Zero is handled separately and returns 64.
 uint64_t bit;
 int r = 0;
 if (in == 0)
  return 64;
 bit = in & (uint64_t)(0ULL - in);
 while (bit > 1)
 {
  bit >>= 1;
  ++r;
 }
 return r;
}


int main(){
    ctz(0);
}
