#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// The reference returns the parity of original bits 4 through 30.
	// XOR accumulates those 27 bits, ignoring all other bits.
	// Zero and every even population return zero; odd populations return one.
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
