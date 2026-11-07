#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Compute the unsigned sum, then replace it when the reference would saturate.
	// Unsigned wraparound is defined and is discarded in the saturation case.
	// Equality also replaces the sum with the cap.
	unsigned int result = a + b;
	if (a >= 4294967295 - b)
		result = 4294967295;
	return result;
}


int main(){
    add(0,0);
}
