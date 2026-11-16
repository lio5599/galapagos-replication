#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Compute parity using a loop that processes bits from MSB to LSB.
	// Shift right by 4, then check each of 27 bits by masking with 1.
	unsigned int temp = data >> 4;
	unsigned int parity = 0;
	int i;
	for (i = 26; i >= 0; i--) {
		if ((temp >> i) & 1) {
			parity++;
		}
	}
	return parity & 1;
}


int main(){
    iec958_parity(0);
}
