#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Bit n of 0x96696996 stores the parity of the five-bit value n.
	// XOR six table results to cover the isolated 27-bit range.
	// The last group has three zero padding bits, which add no parity.
	unsigned long x = (data >> 4) & 0x07ffffffUL;
	unsigned int parity = 0;
	int group;

	for (group = 0; group < 6; ++group) {
		parity ^= (unsigned int)((0x96696996UL >> (x & 31UL)) & 1UL);
		x >>= 5;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
