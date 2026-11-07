#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Normalize and mask the selected bits, then extract binary digits arithmetically.
	// Remainders modulo two count set bits; division removes each processed digit.
	// The count cannot exceed 27, and zero input correctly produces zero.
	unsigned long x = ((unsigned long)data >> 4) & 0x07FFFFFFUL;
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
