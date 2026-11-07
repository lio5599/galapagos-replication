#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Isolate the 27 relevant bits and fold their XOR into bit zero.
	// Successive power-of-two shifts include each field bit exactly once.
	// Unsigned long supports every shift; masked-out bits and zero add nothing.
	unsigned long value = (data >> 4) & 0x07ffffffUL;

	value ^= value >> 16;
	value ^= value >> 8;
	value ^= value >> 4;
	value ^= value >> 2;
	value ^= value >> 1;
	return (unsigned int)(value & 1UL);
}


int main(){
    iec958_parity(0);
}
