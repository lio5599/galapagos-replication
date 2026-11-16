#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Reference: counts trailing zeros (bits after last set bit) in 64-bit integer
 // If in==0, returns 64. Uses loop to scan bits from LSB upward.
 // Accumulates result by adding 1 for each zero bit before first 1.
 // m tracks whether any 1 has been seen; r counts zeros before first 1.
 int i, b, m = 0, r = 0;
 for (i = 0; i < 64; i++)
 {
  b = (in >> i) & 1;
  m |= b;
  r += (m^1) & (b^1);
 }
 return r;
}


int main(){
    ctz(0);
}
