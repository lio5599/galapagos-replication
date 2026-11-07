#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// XOR thirteen pairs of bits, then the final twenty-seventh bit.
	// These are exactly original positions 4 through 30.
	// The final mask excludes all higher bits, including original bit 31.
	unsigned int parity = 0;
	int pair;

	data >>= 4;
	for (pair = 0; pair < 13; pair++) {
		parity ^= (data ^ (data >> 1)) & 1u;
		data >>= 2;
	}
	return parity ^ (data & 1u);
}


int main(){
    iec958_parity(0);
}
