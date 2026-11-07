#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Retain precisely original bits 4 through 30.
	// Successive XOR folds reduce their parity into the least significant bit.
	// Unsigned long supports all shifts; masking excludes higher bits and handles zero.
	unsigned long x = (unsigned long)data & 0x7FFFFFF0UL;

	x ^= x >> 16;
	x ^= x >> 8;
	x ^= x >> 4;
	x ^= x >> 2;
	x ^= x >> 1;
	return (unsigned int)(x & 1UL);
}


int main(){
    iec958_parity(0);
}
