#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Test each original bit from 4 through 30 using a moving mask.
	// Toggle parity for each set bit, ignoring every other position.
	// The unsigned long mask safely advances past bit 30 without wrapping.
	unsigned long mask;
	unsigned int parity = 0;

	for (mask = 0x10UL; mask <= 0x40000000UL; mask <<= 1) {
		if (((unsigned long)data & mask) != 0)
			parity ^= 1U;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
