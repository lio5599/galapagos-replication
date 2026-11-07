#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Process the selected range as seven zero-padded nibbles.
	// Bit n of 0x6996 is the parity of the four-bit number n.
	// XOR combines nibble parities; the masked padding contributes zero.
	unsigned int value = (data >> 4) & 0x07ffffffU;
	unsigned int parity = 0;
	int group;

	for (group = 0; group < 7; group++) {
		parity ^= (0x6996U >> (value & 15U)) & 1U;
		value >>= 4;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
