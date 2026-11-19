#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Scan from the highest bit down, recording each set bit's index.
 // The last recorded index belongs to the least significant set bit.
 // The initial result of 64 is preserved for zero.
 int i;
 int r = 64;
 for (i = 63; i >= 0; --i)
 {
  if (((in >> i) & 1) != 0)
   r = i;
 }
 return r;
}


int main(){
    ctz(0);
}
