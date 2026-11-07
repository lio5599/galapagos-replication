#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Test original bits 4 through 30 directly and count set bits.
	// Taking the count modulo two matches the reference.
	// Unsigned long masks make every shift valid, even with narrow int.
	unsigned int parity = 0;
	unsigned long value = data;
	int bit;

	for (bit = 4; bit <= 30; bit++)
		parity += (value & (1UL << bit)) != 0;
	return parity & 1U;
}


int main(){
    iec958_parity(0);
}
