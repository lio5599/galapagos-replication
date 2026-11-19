#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Accumulate whether any set bit has appeared in the scanned prefix.
 // Add one only while that prefix remains entirely zero.
 // A zero input keeps every prefix zero and therefore returns 64.
 int i;
 int seen = 0;
 int r = 0;
 for (i = 0; i < 64; ++i)
 {
  seen |= (int)((in >> i) & 1);
  r += 1 - seen;
 }
 return r;
}


int main(){
    ctz(0);
}
