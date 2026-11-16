#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Counts trailing zeros using recursive halving approach
 // Divide problem into smaller halves recursively via iteration
 // Check if lower half has any bits set, recurse accordingly
 // If in==0, return 64
 if (in == 0)
  return 64;
 int r = 0;
 uint64_t mask = 0x00000000FFFFFFFFULL;
 if ((in & mask) == 0) { in >>= 32; r += 32; }
 mask = 0x0000FFFF0000FFFFULL;
 if ((in & mask) == 0) { in >>= 16; r += 16; }
 mask = 0x00FF00FF00FF00FFULL;
 if ((in & mask) == 0) { in >>= 8; r += 8; }
 mask = 0x0F0F0F0F0F0F0F0FULL;
 if ((in & mask) == 0) { in >>= 4; r += 4; }
 mask = 0x3333333333333333ULL;
 if ((in & mask) == 0) { in >>= 2; r += 2; }
 if ((in & 1) == 0) r += 1;
 return r;
}


int main(){
    ctz(0);
}
