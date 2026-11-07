#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Remainder by two extracts each binary digit; division removes it.
	// Sum the digits of the masked field and return the sum modulo two.
	// At most 27 are counted, so the sum fits; zero yields zero.
	unsigned int value = (data >> 4) & 0x07ffffffUL;
	unsigned int count = 0;

	while (value != 0) {
		count += value % 2U;
		value /= 2U;
	}
	return count % 2U;
}


int main(){
    iec958_parity(0);
}
