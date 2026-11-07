#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Compute the unsigned sum, then add a correction when saturation is needed.
	// Unsigned modular arithmetic makes sum plus limit minus sum equal limit.
	// The exact reference condition handles equality and all boundary inputs.
	unsigned int sum = a + b;
	unsigned int saturated = (unsigned int)(a >= 4294967295 - b);
	unsigned int correction = (unsigned int)4294967295 - sum;
	return sum + saturated * correction;
}


int main(){
    add(0,0);
}
