#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	data &= 0x7FFFFFF0u;
	data ^= data >> 16;
	data ^= data >> 8;
	data ^= data >> 4;
	return (0x6996u >> (data & 0xFu)) & 1u;
}


int main(){
    iec958_parity(0);
}
