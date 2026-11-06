#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Approach: skip whole zero bytes first, then skip single zero bits.
 // Each shift adds the number of zeros removed to r.
 // Both loops stop at the lowest set bit, so r is the trailing zero count.
 // in == 0 returns 64 first, which also keeps the loops from running forever.
 int r = 0;
 if (in == 0) return 64;
 while ((in & 0xFF) == 0) { in >>= 8; r += 8; }
 while ((in & 1) == 0) { in >>= 1; r++; }
 return r;
}


int main(){
    ctz(0);
}
