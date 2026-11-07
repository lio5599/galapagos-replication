#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Turn the saturation condition into an all-zero or all-one unsigned mask.
	// Select either the unsigned sum or the converted cap bit by bit.
	// Any wrapped sum is discarded when the original condition requires the cap.
	unsigned int mask = 0u - (unsigned int)(a >= 4294967295 - b);
	unsigned int cap = 4294967295;
	return ((a + b) & ~mask) | (cap & mask);
}


int main(){
    add(0,0);
}
