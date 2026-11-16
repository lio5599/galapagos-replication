#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Equivalent: compute sum, then saturate using conditional.
	// If sum < a, overflow happened, so return UINT32_MAX.
	unsigned int sum = a + b;
	return (sum < a) ? 4294967295U : sum;
}


int main(){
    add(0,0);
}
