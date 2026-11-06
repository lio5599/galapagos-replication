#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// ~b equals 4294967295 - b, so a > ~b means a + b exceeds the max.
	// Equality a == ~b gives a sum of exactly 4294967295, same as reference.
	// Otherwise the sum fits and is returned unchanged.
	if (a > ~b)
		return 4294967295u;
	return a + b;
}


int main(){
    add(0,0);
}
