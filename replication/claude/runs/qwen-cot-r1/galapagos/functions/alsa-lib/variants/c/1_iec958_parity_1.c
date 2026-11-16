#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Alternative 1: Use XOR accumulation for parity
	// XOR all bits 4-30 together; result is 1 if odd count of 1s
	// Equivalent because parity is XOR of all bits in range
	// Edge case: empty range yields 0 parity
	unsigned int parity = 0;
	int bit;
	for (bit = 4; bit <= 30; bit++) {
		parity ^= (data >> bit) & 1;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
