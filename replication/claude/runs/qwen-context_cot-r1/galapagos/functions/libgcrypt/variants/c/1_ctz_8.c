#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Alternative 8: Use a lookup table for 4-bit nibbles.
 // Precompute ctz for each 4-bit value.
 // Find first non-zero nibble from LSB, add offset.
 // Then find exact bit within that nibble.
 static const uint8_t nibble_ctz[16] = {4,0,1,2,3,1,2,3,4,1,2,3,4,2,3,4};
 int r = 0;
 uint64_t tmp = in;
 int nibble;
 for (nibble = 0; nibble < 16; nibble++)
 {
  if ((tmp & 0xFULL) != 0)
   break;
  tmp >>= 4;
  r += 4;
 }
 if (nibble == 16)
  return 64;
 uint8_t n = (uint8_t)(tmp & 0xFULL);
 r += nibble_ctz[n];
 return r;
}


int main(){
    ctz(0);
}
