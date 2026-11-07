#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Start with the cap and replace it only below the threshold.
	// Equality and excess leave the capped result unchanged.
	unsigned int result = 4294967295;
	if (a < 4294967295 - b)
		result = a + b;
	return result;
}


int main(){
    add(0,0);
}
