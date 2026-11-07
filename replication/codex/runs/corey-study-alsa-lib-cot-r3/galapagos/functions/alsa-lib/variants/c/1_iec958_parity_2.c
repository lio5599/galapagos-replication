#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Mask to original bits 4 through 30, ignoring every other input bit.
	// Each iteration removes one set bit and toggles parity.
	// Zero executes no iterations; any set-bit count yields its low bit.
	unsigned long x = (unsigned long)data & 0x7FFFFFF0UL;
	unsigned int parity = 0;

	while (x != 0) {
		x &= x - 1UL;
		parity ^= 1U;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
