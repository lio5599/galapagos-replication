#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Track whether any examined bit has been one.
 // Increment only while all bits examined so far are zero.
 // Zero input increments on all 64 iterations.
 int i;
 int seen = 0;
 int r = 0;
 for (i = 0; i < 64; i++)
 {
  seen |= (int)((in >> i) & 1);
  r += (seen == 0);
 }
 return r;
}


int main(){
    ctz(0);
}
