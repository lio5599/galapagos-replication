#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int count = 0;

	data = (data >> 4) & 0x07fffffful;
	while (data != 0) {
		data &= data - 1u;
		++count;
	}
	return count & 1u;
}


int main(){
    iec958_parity(0);
}
