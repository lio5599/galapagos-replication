#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Approach: scan from bit 63 down to bit 0.
 // Each time a set bit is found, store its index in r.
 // The last value stored is the lowest set bit index, which is the zero count.
 // If no bit is set, r keeps its start value of 64, matching the reference.
 int i, r = 64;
 for (i = 63; i >= 0; i--)
  if ((in >> i) & 1) r = i;
 return r;
}


int main(){
    ctz(0);
}
