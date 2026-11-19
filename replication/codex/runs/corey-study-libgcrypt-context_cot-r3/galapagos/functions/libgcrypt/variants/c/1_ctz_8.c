#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // A low-bit prefix is zero exactly when it precedes the first one.
 // Left shifting discards all bits outside each tested prefix.
 // Count zero prefixes of lengths 1 through 64, including all for zero.
 int i, r = 0;
 for (i = 0; i < 64; ++i)
 {
  r += (in << (63 - i)) == 0;
 }
 return r;
}


int main(){
    ctz(0);
}
