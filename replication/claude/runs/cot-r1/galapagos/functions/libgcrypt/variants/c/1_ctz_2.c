#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Approach: isolate the lowest set bit with in & -in, then subtract 1.
 // The result is a mask of exactly the trailing zero positions.
 // Kernighan's loop then counts the set bits in that mask.
 // If in == 0, the isolated bit is 0 and 0 - 1 is all ones.
 // That mask has 64 bits set, so the result is 64, matching the reference.
 uint64_t m = (in & (0 - in)) - 1;
 int r = 0;
 while (m) { m &= m - 1; r++; }
 return r;
}


int main(){
    ctz(0);
}
