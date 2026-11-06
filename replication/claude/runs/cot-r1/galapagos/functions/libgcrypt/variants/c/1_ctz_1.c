#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Approach: binary search over halves of 32, 16, 8, 4, 2 and 1 bits.
 // If the low half is all zero, add its width to r and shift it out.
 // When the steps finish, the lowest set bit sits at position r.
 // That gives the same count as the bitwise scan in the reference.
 // in == 0 is handled first and returns 64, as the reference does.
 int r = 0;
 if (in == 0) return 64;
 if ((in & 0xFFFFFFFFULL) == 0) { r += 32; in >>= 32; }
 if ((in & 0xFFFFULL) == 0) { r += 16; in >>= 16; }
 if ((in & 0xFFULL) == 0) { r += 8; in >>= 8; }
 if ((in & 0xFULL) == 0) { r += 4; in >>= 4; }
 if ((in & 0x3ULL) == 0) { r += 2; in >>= 2; }
 if ((in & 0x1ULL) == 0) { r += 1; }
 return r;
}


int main(){
    ctz(0);
}
