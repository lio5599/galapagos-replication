#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	return (unsigned int)__builtin_popcount(data & 0x7FFFFFF0u) & 1u;
}


int main(){
    iec958_parity(0);
}
