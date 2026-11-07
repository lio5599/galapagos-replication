#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int count = 0;

	data = (data >> 4) & 0x07ffffffU;
	while (data) {
		data &= data - 1U;
		++count;
	}
	return count & 1U;
}


int main(){
    iec958_parity(0);
}
