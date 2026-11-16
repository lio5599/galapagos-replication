#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Alternative 2: Use bitwise AND with mask to check bits.
 // Similar to reference but using explicit condition.
 // Count zeros until first one encountered.
 // If no one found, return 64.
 int r = 0;
 uint64_t tmp = in;
 while (r < 64 && (tmp & 1) == 0)
 {
  r++;
  tmp >>= 1;
 }
 return r;
}


int main(){
    ctz(0);
}
