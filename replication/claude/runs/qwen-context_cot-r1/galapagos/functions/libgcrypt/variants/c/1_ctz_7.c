#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Alternative 7: Process bytes from LSB to MSB.
 // Find first non-zero byte, then find bit within that byte.
 // This reduces iterations by processing 8 bits at a time.
 int r = 0;
 uint64_t tmp = in;
 int byte;
 for (byte = 0; byte < 8; byte++)
 {
  if ((tmp & 0xFFULL) != 0)
   break;
  tmp >>= 8;
  r += 8;
 }
 if (byte == 8)
  return 64;
 uint8_t b = (uint8_t)(tmp & 0xFFULL);
 while ((b & 1) == 0)
 {
  b >>= 1;
  r++;
 }
 return r;
}


int main(){
    ctz(0);
}
