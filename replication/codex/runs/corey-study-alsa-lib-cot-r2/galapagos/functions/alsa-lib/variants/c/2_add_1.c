#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Invert the reference condition and return the sum first.
	// Equality and larger values still take the saturation branch.
	if (a < 4294967295 - b)
		return a + b;
	return 4294967295;
}


int main(){
    add(0,0);
}
