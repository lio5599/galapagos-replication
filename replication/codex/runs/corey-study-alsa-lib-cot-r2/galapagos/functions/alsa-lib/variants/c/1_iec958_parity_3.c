#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Mask to the reference field, then clear one set bit per iteration.
	// Each cleared bit toggles parity, giving the set-bit count modulo two.
	// Zero skips the loop, and bits outside the field cannot contribute.
	unsigned int value = (data >> 4) & 0x07ffffffUL;
	unsigned int parity = 0;

	while (value != 0) {
		value &= value - 1U;
		parity ^= 1U;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
