#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Approach: fold the masked value to 4 bits, then use 0x6996 as a 16-entry parity table.
	// Folding by XOR preserves the overall parity of bits 4..30.
	// Bit n of 0x6996 is the parity of the 4-bit value n.
	// The mask removes bits 0-3 and 31, so the result equals the reference for every input.
	unsigned int x = data & 0x7FFFFFF0U;
	x ^= x >> 16;
	x ^= x >> 8;
	x ^= x >> 4;
	return (0x6996U >> (x & 0xFU)) & 1U;
}


int main(){
    iec958_parity(0);
}
