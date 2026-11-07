#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;

	data = (data >> 4) & 0x07FFFFFFU;
	do {
		parity ^= (0x6996U >> (data & 0xFU)) & 1U;
		data >>= 4;
	} while (data);

	return parity;
}


int main(){
    iec958_parity(0);
}
