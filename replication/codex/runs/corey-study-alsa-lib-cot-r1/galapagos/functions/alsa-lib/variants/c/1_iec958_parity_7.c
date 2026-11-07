#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Extract the isolated range's binary digits using division.
	// Summing remainders counts precisely original bits 4 through 30.
	// Modulo two produces parity, including zero for an empty range.
	unsigned long x = (data >> 4) & 0x07ffffffUL;
	unsigned int count = 0;

	while (x != 0) {
		count += (unsigned int)(x % 2UL);
		x /= 2UL;
	}
	return count % 2U;
}


int main(){
    iec958_parity(0);
}
