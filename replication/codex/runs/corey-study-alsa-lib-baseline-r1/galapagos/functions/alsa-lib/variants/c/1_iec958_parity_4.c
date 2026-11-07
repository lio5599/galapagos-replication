#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	data = (data >> 4) & 0x07ffffffU;
	data ^= data >> 16;
	data ^= data >> 8;
	data ^= data >> 4;

	return (0x6996U >> (data & 0xfU)) & 1U;
}


int main(){
    iec958_parity(0);
}
