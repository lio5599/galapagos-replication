#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;

	data = (data >> 4) & 0x07ffffffU;
	while (data) {
		parity ^= 1U;
		data &= data - 1U;
	}

	return parity;
}


int main(){
    iec958_parity(0);
}
