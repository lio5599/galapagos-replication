#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Test each nonempty low-bit prefix for being entirely zero.
 // Exactly the prefixes ending below the first set bit qualify.
 // For zero all 64 prefixes qualify; mask shifts are unsigned.
 uint64_t mask = 1;
 int i;
 int r = 0;
 for (i = 0; i < 64; i++)
 {
  r += ((in & mask) == 0);
  mask = (mask << 1) | (uint64_t)1;
 }
 return r;
}


int main(){
    ctz(0);
}
