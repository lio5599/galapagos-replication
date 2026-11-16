#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Alternative 3: Use Brian Kernighan algorithm to count bits
	// Extract bits 4-30, then use n &= n-1 to count set bits
	// Each iteration removes lowest set bit
	// Edge case: zero masked value loops zero times, count=0
	unsigned int masked = data & 0x7FFFFFF0;
	unsigned int count = 0;
	while (masked) {
		masked &= masked - 1;
		count++;
	}
	return count & 1;
}


int main(){
    iec958_parity(0);
}
