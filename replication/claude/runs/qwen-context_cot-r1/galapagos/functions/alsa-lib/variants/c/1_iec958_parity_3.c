#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Use Brian Kernighan's algorithm to count set bits in bits 4-30.
	// Shift right by 4, mask to 27 bits, then clear lowest set bit each iteration.
	unsigned int temp = (data >> 4) & 0x1FFFFFF;
	unsigned int count = 0;
	while (temp) {
		temp &= temp - 1;
		count++;
	}
	return count & 1;
}


int main(){
    iec958_parity(0);
}
