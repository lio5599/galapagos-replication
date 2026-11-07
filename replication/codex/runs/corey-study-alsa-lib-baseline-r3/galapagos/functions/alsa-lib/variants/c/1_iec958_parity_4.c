#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	data = (data >> 4) & 0x07ffffffu;
	data ^= data >> 16;
	data ^= data >> 8;
	data ^= data >> 4;

	return (0x6996u >> (data & 15u)) & 1u;
}


int main(){
    iec958_parity(0);
}
