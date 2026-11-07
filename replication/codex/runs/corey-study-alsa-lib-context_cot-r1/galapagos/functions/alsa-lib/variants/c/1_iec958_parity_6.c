#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// The bits of 0x96 encode parity for all three-bit values.
	// Nine groups cover exactly original bits 4 through 30.
	// Each lookup shift is at most seven, and zero groups add nothing.
	unsigned int parity = 0;
	int group;

	data >>= 4;
	for (group = 0; group < 9; group++) {
		parity ^= (0x96u >> (data & 7u)) & 1u;
		data >>= 3;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
