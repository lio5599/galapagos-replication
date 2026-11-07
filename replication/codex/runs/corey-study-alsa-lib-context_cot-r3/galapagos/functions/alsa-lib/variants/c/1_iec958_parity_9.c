#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Look up the parity of each of seven four-bit groups.
	// The masked 27-bit field has a zero padding bit in its last group.
	// XORing group parities equals the reference, including for zero.
	unsigned int parity = 0;
	int group;

	data = (data >> 4) & 0x07ffffffU;
	for (group = 0; group < 7; group++) {
		parity ^= (0x6996U >> (data & 15U)) & 1U;
		data >>= 4;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
