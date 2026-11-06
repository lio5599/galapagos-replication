#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Approach: SWAR population count of bits 4..30, then take the low bit.
	// Pairwise, nibble, and byte partial sums produce the total count in the low byte.
	// The maximum count is 27, so no field overflows, and count & 1 is the parity.
	// The mask excludes bits 0-3 and 31 to match the reference; zero input returns 0.
	unsigned int x = data & 0x7FFFFFF0U;
	x = x - ((x >> 1) & 0x55555555U);
	x = (x & 0x33333333U) + ((x >> 2) & 0x33333333U);
	x = (x + (x >> 4)) & 0x0F0F0F0FU;
	x = x + (x >> 8);
	x = x + (x >> 16);
	return x & 1U;
}


int main(){
    iec958_parity(0);
}
