#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Reference computes parity of bits 4-30 of input (27 bits).
	// It shifts right by 4, then counts set bits in positions 0-26
	// (originally 4-30), returning the LSB of the count.
	unsigned int parity;
	int bit;

	data >>= 4;
	parity = 0;
	for (bit = 4; bit <= 30; bit++) {
		if (data & 1)
			parity++;
		data >>= 1;
	}
	return (parity & 1);
}


int main(){
    iec958_parity(0);
}
