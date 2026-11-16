#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Equivalent: compute sum and use unsigned comparison for saturation.
	// When overflow occurs, sum wraps around and becomes less than a.
	// Return UINT32_MAX in that case, otherwise return sum.
	unsigned int sum = a + b;
	if (sum < a)
		return 0xFFFFFFFFU;
	return sum;
}


int main(){
    add(0,0);
}
