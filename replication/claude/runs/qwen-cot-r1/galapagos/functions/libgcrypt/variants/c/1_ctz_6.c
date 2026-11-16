#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Counts trailing zeros using log2 of (in & -in)
 // in & -in isolates the lowest set bit
 // log2 of that value gives the position of LSB
 // If in==0, in&-in is 0, handle separately returning 64
 if (in == 0)
  return 64;
 uint64_t lowbit = in & (~in + 1);
 int r = 0;
 while (lowbit > 1)
 {
  lowbit >>= 1;
  r++;
 }
 return r;
}


int main(){
    ctz(0);
}
