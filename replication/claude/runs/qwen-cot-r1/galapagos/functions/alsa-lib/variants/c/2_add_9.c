#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Check if b causes overflow when added to a.
	// If b > UINT_MAX - a, overflow occurs.
	// This is equivalent to checking a > UINT_MAX - b.
	// Return saturated result on overflow.
	if (b > 4294967295 - a)
		return 4294967295;
	return a + b;
}


int main(){
    add(0,0);
}
