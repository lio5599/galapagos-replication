#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Split the selected 27 bits into exactly nine three-bit groups.
	// Bit n of 0x96 records the parity of the three-bit value n.
	// XOR combines all groups; masked-out bits and all-zero groups contribute zero.
	unsigned long x = ((unsigned long)data >> 4) & 0x07FFFFFFUL;
	unsigned int parity = 0;
	int group;

	for (group = 0; group < 9; group++) {
		parity ^= (unsigned int)((0x96UL >> (x & 7UL)) & 1UL);
		x >>= 3;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
