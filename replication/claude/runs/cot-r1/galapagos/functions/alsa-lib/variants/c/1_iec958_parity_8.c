#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Approach: look up the parity of each nibble in a 16-entry table and XOR the results.
	// The mask 0x7FFFFFF0 keeps only bits 4..30, so the nibbles cover exactly those bits.
	// The XOR of the nibble parities is the parity of the whole masked word.
	// A zero word gives all-zero lookups and returns 0, as in the reference.
	static const unsigned char nib[16] = { 0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0 };
	unsigned int x = data & 0x7FFFFFF0U;
	unsigned int parity = 0;
	while (x) {
		parity ^= nib[x & 0xFU];
		x >>= 4;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
