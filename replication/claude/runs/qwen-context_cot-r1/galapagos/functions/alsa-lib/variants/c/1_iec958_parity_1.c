#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Count set bits in bits 4-30 by iterating through each bit position.
	// Shift data right by 4 to align bit 4 to position 0.
	// Loop 27 times (bits 4 to 30 inclusive) checking LSB each time.
	unsigned int temp = data >> 4;
	unsigned int count = 0;
	int i;
	for (i = 0; i < 27; i++) {
		count += temp & 1;
		temp >>= 1;
	}
	return count & 1;
}


int main(){
    iec958_parity(0);
}
