#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Split the selected 27 bits into nine groups of three bits.
	// XOR each group's three bits into the accumulated parity.
	// The mask removes unrelated bits, and zero groups contribute zero.
	unsigned int parity = 0;
	int group;

	data = (data >> 4) & 0x07ffffffU;
	for (group = 0; group < 9; group++) {
		parity ^= (data ^ (data >> 1) ^ (data >> 2)) & 1U;
		data >>= 3;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
