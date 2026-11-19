#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Binary-search the smallest prefix width containing a set bit.
 // That width is one more than the lowest set bit's index.
 // Zero returns 64 explicitly, and every shift is between 0 and 63.
 int low = 0, high = 64;
 if (in == 0)
  return 64;
 while (low < high)
 {
  int mid = low + (high - low) / 2;
  uint64_t mask = ((uint64_t)1 << mid) - (uint64_t)1;
  if ((in & mask) != 0)
   high = mid;
  else
   low = mid + 1;
 }
 return low - 1;
}


int main(){
    ctz(0);
}
