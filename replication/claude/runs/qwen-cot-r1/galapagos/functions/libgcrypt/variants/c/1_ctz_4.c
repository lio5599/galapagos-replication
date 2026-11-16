#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Counts trailing zeros using Brian Kernighan's trick variation
 // Repeatedly clear lowest set bit and count iterations
 // Each iteration removes one trailing zero group, count shifts
 // If in==0, return 64 directly
 if (in == 0)
  return 64;
 int r = 0;
 while ((in & 1) == 0)
 {
  in >>= 1;
  r++;
 }
 return r;
}


int main(){
    ctz(0);
}
