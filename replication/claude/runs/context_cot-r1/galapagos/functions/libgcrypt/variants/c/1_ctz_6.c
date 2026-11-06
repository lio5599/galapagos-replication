#include <stdint.h>

__attribute__((noinline))
int ctz(uint64_t in)
{
 // Branchless binary search: t is the step width if the low window is zero, else 0.
 // Adding t to r and shifting by t moves toward the lowest set bit.
 // After the steps, bit 0 is set for nonzero input, so the final add is 0.
 // For in == 0 the steps add 63 and the final add contributes 1, giving 64.
 int r = 0, t;
 t = ((in & 0xFFFFFFFFULL) == 0) << 5; r += t; in >>= t;
 t = ((in & 0xFFFFULL) == 0) << 4; r += t; in >>= t;
 t = ((in & 0xFFULL) == 0) << 3; r += t; in >>= t;
 t = ((in & 0xFULL) == 0) << 2; r += t; in >>= t;
 t = ((in & 0x3ULL) == 0) << 1; r += t; in >>= t;
 t = ((in & 0x1ULL) == 0); r += t; in >>= t;
 r += (int)((in & 1) ^ 1);
 return r;
}


int main(){
    ctz(0);
}
