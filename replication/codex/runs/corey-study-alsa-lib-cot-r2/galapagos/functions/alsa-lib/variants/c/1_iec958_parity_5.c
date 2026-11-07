#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Each bit of 0x6996 encodes the parity of its four-bit index.
	// XOR the parities of the masked field's successive nibbles.
	// The incomplete top nibble is zero-padded, and zero returns zero.
	unsigned long value = (data >> 4) & 0x07ffffffUL;
	unsigned int parity = 0;

	while (value != 0) {
		parity ^= (unsigned int)((0x6996UL >> (value & 15UL)) & 1UL);
		value >>= 4;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
