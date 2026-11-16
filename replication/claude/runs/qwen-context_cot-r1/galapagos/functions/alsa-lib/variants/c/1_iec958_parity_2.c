#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Extract bits 4-30 using mask and count parity via XOR accumulation.
	// Mask 0x7FFFFF00 isolates bits 8-31, but we need bits 4-30.
	// Shift right by 4 to get bits 4-30 into positions 0-26, then count.
	unsigned int temp = (data >> 4) & 0x1FFFFFF;
	unsigned int parity = 0;
	while (temp) {
		parity ^= temp & 1;
		temp >>= 1;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
