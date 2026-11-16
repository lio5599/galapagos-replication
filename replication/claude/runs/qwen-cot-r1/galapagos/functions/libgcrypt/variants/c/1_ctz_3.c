#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Counts trailing zeros using binary search on bit positions
 // Check halves, quarters, etc. to narrow down position of LSB
 // If in==0, all checks fail, return 64
 int r = 0;
 if (in == 0)
  return 64;
 if ((in & 0xFFFFFFFF) == 0) { in >>= 32; r += 32; }
 if ((in & 0xFFFF) == 0) { in >>= 16; r += 16; }
 if ((in & 0xFF) == 0) { in >>= 8; r += 8; }
 if ((in & 0xF) == 0) { in >>= 4; r += 4; }
 if ((in & 0x3) == 0) { in >>= 2; r += 2; }
 if ((in & 0x1) == 0) { r += 1; }
 return r;
}


int main(){
    ctz(0);
}
