#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;

	data &= 0x7ffffff0U;
	while (data != 0) {
		data &= data - 1U;
		parity ^= 1U;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
