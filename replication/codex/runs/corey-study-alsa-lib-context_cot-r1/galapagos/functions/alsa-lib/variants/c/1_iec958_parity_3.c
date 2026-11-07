#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Mask to the 27 bits examined by the reference.
	// Each subtraction-and-mask step removes exactly one set bit.
	// Toggling once per removed bit gives parity; zero needs no steps.
	unsigned int parity = 0;

	data = (data >> 4) & 0x07ffffffu;
	while (data != 0) {
		data &= data - 1u;
		parity ^= 1u;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
