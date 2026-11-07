#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// The reference returns the parity of original data bits 4 through 30.
	// Isolate those 27 bits, then XOR-fold them into the lowest bit.
	// Bits outside the range are ignored; an all-zero range returns zero.
	// unsigned long provides at least 32 bits for the folding shifts.
	unsigned long x = (data >> 4) & 0x07ffffffUL;

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
