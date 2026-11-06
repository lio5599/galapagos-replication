#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Scan from bit 63 down to bit 0, recording the index of every set bit.
 // The last recorded index is the lowest set bit, i.e. the trailing zero count.
 // If no bit is set, r keeps its initial value 64, matching the reference.
 int i, r = 64;
 for (i = 63; i >= 0; i--)
  if ((in >> i) & 1)
   r = i;
 return r;
}


int main(){
    ctz(0);
}
