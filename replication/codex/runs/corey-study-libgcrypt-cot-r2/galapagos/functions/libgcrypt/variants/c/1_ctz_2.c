#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Move a single-bit mask upward, counting unset low positions.
 // After testing bit 63, unsigned wraparound ends the scan.
 // Thus zero counts all 64 bits without an out-of-range shift.
 uint64_t mask = 1;
 int r = 0;
 while (mask != 0 && (in & mask) == 0)
 {
  ++r;
  mask <<= 1;
 }
 return r;
}


int main(){
    ctz(0);
}
