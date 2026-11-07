#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Treat the isolated range as nine three-bit groups.
	// Bit n of 0x96 is the parity of n, so XOR combines group parities.
	// All 27 selected bits are covered exactly; excluded bits are masked.
	// Zero groups contribute zero, including when the entire range is zero.
	unsigned long x = (data >> 4) & 0x07ffffffUL;
	unsigned int parity = 0;
	int group;

	for (group = 0; group < 9; ++group) {
		parity ^= (unsigned int)((0x96UL >> (x & 7UL)) & 1UL);
		x >>= 3;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
