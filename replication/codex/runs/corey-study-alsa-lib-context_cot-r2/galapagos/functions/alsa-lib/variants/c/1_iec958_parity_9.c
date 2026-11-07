#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Process 26 selected bits in pairs, then include the remaining bit.
	// Each pair contributes its XOR, equivalent to its count modulo two.
	// Masking excludes other bits, and zero yields zero throughout.
	unsigned int value = (data >> 4) & 0x07ffffffU;
	unsigned int parity = 0;
	int pair;

	for (pair = 0; pair < 13; pair++) {
		parity ^= (value ^ (value >> 1)) & 1U;
		value >>= 2;
	}
	return parity ^ (value & 1U);
}


int main(){
    iec958_parity(0);
}
