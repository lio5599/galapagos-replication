#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Compute the unsigned sum, then conditionally overwrite it.
	// Short-circuit evaluation performs the assignment only on saturation.
	// The unchanged reference comparison also handles equality identically.
	unsigned int result = a + b;
	(a >= 4294967295 - b) && (result = 4294967295);
	return result;
}


int main(){
    add(0,0);
}
