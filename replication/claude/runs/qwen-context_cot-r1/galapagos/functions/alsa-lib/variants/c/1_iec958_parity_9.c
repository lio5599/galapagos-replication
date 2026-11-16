#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Use XOR-based parity computation on the extracted 27-bit field.
	// Shift right by 4 to isolate bits 4-30 into positions 0-26.
	// XOR all bits together: parity is 1 if odd number of bits set.
	unsigned int temp = (data >> 4) & 0x1FFFFFF;
	unsigned int result = 0;
	int i;
	for (i = 0; i < 27; i++) {
		result ^= (temp >> i) & 1;
	}
	return result;
}


int main(){
    iec958_parity(0);
}
