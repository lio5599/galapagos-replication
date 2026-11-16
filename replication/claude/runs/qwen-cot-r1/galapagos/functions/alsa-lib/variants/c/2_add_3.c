#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Compute sum and check if it wrapped around.
	// Overflow occurs when a + b < a due to unsigned wrap.
	// Alternatively, check if b > UINT_MAX - a.
	// This is symmetric to checking a > UINT_MAX - b.
	if (b > 4294967295 - a)
		return 4294967295;
	return a + b;
}


int main(){
    add(0,0);
}
