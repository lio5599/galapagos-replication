#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // x = (in & -in) - 1 has ones exactly at the trailing-zero positions of in.
 // Kernighan's loop clears one set bit per iteration, counting them.
 // For in == 0, x is all ones and 64 iterations give 64, as in the reference.
 uint64_t x = (in & (~in + 1)) - 1;
 int r = 0;
 while (x)
 {
  x &= x - 1;
  r++;
 }
 return r;
}


int main(){
    ctz(0);
}
