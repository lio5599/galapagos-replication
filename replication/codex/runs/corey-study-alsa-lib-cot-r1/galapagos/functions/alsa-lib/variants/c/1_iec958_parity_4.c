#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Each bit of 0x6996 stores the parity of its four-bit index.
	// XOR the table results for the isolated range's seven nibbles.
	// The top nibble is zero-padded, so excluded bits cannot contribute.
	unsigned long x = (data >> 4) & 0x07ffffffUL;
	unsigned int parity = 0;
	int group;

	for (group = 0; group < 7; ++group) {
		parity ^= (unsigned int)((0x6996UL >> (x & 15UL)) & 1UL);
		x >>= 4;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
