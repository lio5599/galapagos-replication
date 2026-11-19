#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // The reference counts trailing zero bits, returning 64 for zero.
 // Scan from the least significant bit and stop at the first one.
 // If no bit is set, all 64 positions are counted.
 int r;
 for (r = 0; r < 64; ++r)
 {
  if ((in >> r) & 1)
   break;
 }
 return r;
}


int main(){
    ctz(0);
}
