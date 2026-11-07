#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Isolate bits 4 through 30 and remove one set bit per iteration.
	// Toggling once per removed bit gives the set-bit count modulo two.
	// An empty range skips the loop and returns zero.
	unsigned long x = (data >> 4) & 0x07ffffffUL;
	unsigned int parity = 0;

	while (x != 0) {
		x &= x - 1UL;
		parity ^= 1U;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
