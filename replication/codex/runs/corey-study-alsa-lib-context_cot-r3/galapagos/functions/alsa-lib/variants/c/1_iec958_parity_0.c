#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// The reference computes the XOR of input bits 4 through 30.
	// Examine exactly those 27 bits, XORing each into the result.
	// Other bits are ignored, and an all-zero field returns zero.
	unsigned int parity = 0;
	int bit;

	data >>= 4;
	for (bit = 0; bit < 27; bit++) {
		parity ^= data & 1U;
		data >>= 1;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
