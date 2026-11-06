#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Approach: shift away bits 0-3, mask to 27 bits, then loop while bits remain.
	// After >> 4 and & 0x07FFFFFF, only the original bits 4..30 are left.
	// Stopping early once data is 0 does not change the parity.
	// Each remaining bit is XORed into parity; zero input skips the loop and returns 0.
	unsigned int parity = 0;
	data = (data >> 4) & 0x07FFFFFFU;
	while (data) {
		parity ^= data & 1U;
		data >>= 1;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
