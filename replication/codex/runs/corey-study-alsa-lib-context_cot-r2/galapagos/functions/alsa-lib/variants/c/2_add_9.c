#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Add a correction only when the original comparison selects cap.
	// With selector zero, return sum; with one, sum plus cap minus sum.
	// Unsigned arithmetic preserves that identity even across wrapping.
	// Equality enables the correction and returns the cap.
	unsigned int sum = a + b;
	unsigned int cap = 4294967295;
	unsigned int saturated = (unsigned int)(a >= 4294967295 - b);
	return sum + (cap - sum) * saturated;
}


int main(){
    add(0,0);
}
