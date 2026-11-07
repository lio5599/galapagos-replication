#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Initialize the result to the cap and overwrite it only below the threshold.
	// The unchanged result covers equality and the saturation case.
	unsigned int result = 4294967295;
	if (a < 4294967295 - b)
		result = a + b;
	return result;
}


int main(){
    add(0,0);
}
