#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Reference: saturating 32-bit unsigned add, returns min(a + b, 4294967295).
	// Approach: do the wrapping add and detect overflow by checking sum < a.
	// Unsigned addition wraps modulo 2^32, so the sum is smaller than a exactly on overflow.
	// If a + b == 4294967295 exactly, there is no wrap and the sum is already the max.
	// That matches the reference, which also returns 4294967295 in that case.
	unsigned int sum = a + b;
	if (sum < a)
		return 4294967295u;
	return sum;
}


int main(){
    add(0,0);
}
