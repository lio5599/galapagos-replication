#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Move a single-bit mask upward until it meets a set bit.
 // Unsigned wraparound makes the mask zero after 64 shifts.
 // Thus zero input returns 64 without any shift by 64.
 uint64_t mask = 1;
 int r = 0;
 while (mask != 0 && (in & mask) == 0)
 {
  r++;
  mask <<= 1;
 }
 return r;
}


int main(){
    ctz(0);
}
