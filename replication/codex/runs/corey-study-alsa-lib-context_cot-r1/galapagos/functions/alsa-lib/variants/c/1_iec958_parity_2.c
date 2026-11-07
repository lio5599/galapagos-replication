#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Retain only original bits 4 through 30, then consume them.
	// XOR with each low bit accumulates parity.
	// Stopping at zero only skips zero bits, including for zero input.
	unsigned int parity = 0;

	data = (data >> 4) & 0x07ffffffu;
	while (data != 0) {
		parity ^= data & 1u;
		data >>= 1;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
