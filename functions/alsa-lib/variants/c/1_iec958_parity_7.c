#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int v = data & 0x7FFFFFF0u;

	v = v - ((v >> 1) & 0x55555555u);
	v = (v & 0x33333333u) + ((v >> 2) & 0x33333333u);
	v = (v + (v >> 4)) & 0x0F0F0F0Fu;
	v = (v * 0x01010101u) >> 24;
	return v & 1u;
}


int main(){
    iec958_parity(0);
}
