#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Clear one selected set bit per iteration and toggle parity.
	// The number of iterations equals the selected population count.
	// Zero skips the loop; unsigned subtraction has defined behavior.
	unsigned int parity = 0;

	data = (data >> 4) & 0x07ffffffU;
	while (data != 0) {
		data &= data - 1U;
		parity ^= 1U;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
