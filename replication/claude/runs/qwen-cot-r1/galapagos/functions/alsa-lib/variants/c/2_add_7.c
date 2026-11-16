#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Use logical OR to combine overflow checks.
	// Overflow if a > UINT_MAX - b, which is same as a + b > UINT_MAX.
	// Return UINT_MAX on overflow, otherwise return sum.
	// This is a direct translation of the reference logic.
	if (a >= 4294967295 - b)
		return 4294967295;
	return a + b;
}


int main(){
    add(0,0);
}
