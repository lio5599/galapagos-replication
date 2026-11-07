#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// The reference adds a and b, saturating at 4294967295 for 32-bit unsigned int.
	// This uses exactly the reference's comparison and return expressions.
	// Equality selects the saturation value, as does exceeding the threshold.
	return a >= 4294967295 - b ? 4294967295 : a + b;
}


int main(){
    add(0,0);
}
