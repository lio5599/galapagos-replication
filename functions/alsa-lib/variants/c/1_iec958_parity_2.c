#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;

	data &= 0x7FFFFFF0u;
	while (data) {
		parity ^= 1;
		data &= data - 1;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
