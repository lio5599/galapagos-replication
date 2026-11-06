#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Approach: branchless. nz = (seg != 0) adds 0x100 and reduces the shift by one.
	// t = ((m<<4) + 8 + (nz<<8)) << (seg - nz), which matches both reference cases.
	// mask is 0 when bit 7 is set and -1 otherwise.
	// (t ^ mask) - mask then yields t or -t, the same sign as the reference.
	int x = (a_val ^ 0x55) & 0x7f;
	int seg = x >> 4;
	int nz = (seg != 0);
	int t = (((x & 0x0f) << 4) + 8 + (nz << 8)) << (seg - nz);
	int mask = ((a_val >> 7) & 1) - 1;
	return (t ^ mask) - mask;
}


int main(){
    alaw_to_s16('a');
}
