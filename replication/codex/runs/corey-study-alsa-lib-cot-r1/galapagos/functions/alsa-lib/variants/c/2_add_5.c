#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Convert the original comparison into an all-zero or all-one unsigned mask.
	// Masked OR selects the sum when false and the converted limit when true.
	// Unsigned wrap in the unused sum cannot affect the selected result.
	unsigned int sum = a + b;
	unsigned int limit = 4294967295;
	unsigned int mask = 0u - (unsigned int)(a >= 4294967295 - b);
	return (sum & ~mask) | (limit & mask);
}


int main(){
    add(0,0);
}
