#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// The bits of 0x6996 encode parity for all four-bit values.
	// XOR seven nibble parities to cover the 27 retained bits.
	// The extra bit in the last nibble is masked to zero.
	unsigned int parity = 0;
	int group;

	data = (data >> 4) & 0x07ffffffu;
	for (group = 0; group < 7; group++) {
		parity ^= (0x6996u >> (data & 15u)) & 1u;
		data >>= 4;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
