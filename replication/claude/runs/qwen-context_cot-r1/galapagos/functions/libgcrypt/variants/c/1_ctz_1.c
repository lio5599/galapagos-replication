#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Alternative 1: Direct loop checking each bit position.
 // Increment counter while current bit is 0.
 // Stop when first 1-bit is found or all 64 bits checked.
 // Handles in=0 by returning 64 after full loop.
 int i;
 for (i = 0; i < 64; i++)
 {
  if ((in & 1) == 1)
   return i;
  in >>= 1;
 }
 return 64;
}


int main(){
    ctz(0);
}
