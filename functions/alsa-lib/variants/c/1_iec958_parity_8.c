#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;
	int bit = 30;

	data <<= 1;
	do {
		parity += data >> 31;
		data <<= 1;
	} while (--bit >= 4);
	return parity % 2;
}


int main(){
    iec958_parity(0);
}
