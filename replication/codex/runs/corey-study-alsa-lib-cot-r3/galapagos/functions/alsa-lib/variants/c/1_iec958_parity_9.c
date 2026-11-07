#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Process the selected bits in pairs, accumulating each lane separately.
	// XOR of the two lane parities equals parity of all 27 selected bits.
	// Masking supplies a zero partner for the last bit and excludes all other bits.
	unsigned long x = ((unsigned long)data >> 4) & 0x07FFFFFFUL;
	unsigned int even = 0;
	unsigned int odd = 0;
	int pair;

	for (pair = 0; pair < 14; pair++) {
		even ^= (unsigned int)(x & 1UL);
		odd ^= (unsigned int)((x >> 1) & 1UL);
		x >>= 2;
	}
	return even ^ odd;
}


int main(){
    iec958_parity(0);
}
