#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// The reference returns 4294967295 at its saturation threshold, otherwise a + b.
	// Using the identical condition preserves all cases, including equality.
	return a >= 4294967295 - b ? 4294967295 : a + b;
}


int main(){
    add(0,0);
}
