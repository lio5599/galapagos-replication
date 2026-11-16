#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Count bits by processing 27 bits individually using bit extraction.
	// For each bit position 0-26 in the shifted value, add to count.
	unsigned int shifted = data >> 4;
	unsigned int count = 0;
	int i;
	for (i = 0; i < 27; i++) {
		if ((shifted >> i) & 1) {
			count++;
		}
	}
	return count & 1;
}


int main(){
    iec958_parity(0);
}
