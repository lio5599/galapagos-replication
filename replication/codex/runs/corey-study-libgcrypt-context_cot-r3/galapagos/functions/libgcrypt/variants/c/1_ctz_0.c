#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // The reference counts trailing zero bits, returning 64 for zero.
 // Shift away each low zero bit until a one appears.
 // Handle zero separately so the loop always terminates.
 int r = 0;
 if (in == 0)
  return 64;
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
