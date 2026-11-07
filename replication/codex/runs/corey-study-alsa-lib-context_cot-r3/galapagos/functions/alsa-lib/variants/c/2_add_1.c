#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Reverse the branch order without changing the threshold.
	// Only values strictly below the threshold use the ordinary sum.
	// Equality and larger values return the same constant as the reference.
	if (a < 4294967295 - b)
		return a + b;
	return 4294967295;
}


int main(){
    add(0,0);
}
