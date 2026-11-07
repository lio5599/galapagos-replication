#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;
	int count = 27;

	data >>= 4;
	while (count--) {
		parity ^= data & 1U;
		data >>= 1;
	}

	return parity;
}


int main(){
    iec958_parity(0);
}
