#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Unsigned subtraction makes mask all ones when saturation is required.
	// The masks select exactly one result, including at equality.
	// Any overflow in the unselected unsigned sum is defined and harmless.
	unsigned int mask = 0U - (unsigned int)(a >= 4294967295 - b);
	return (mask & (unsigned int)4294967295) | (~mask & (a + b));
}


int main(){
    add(0,0);
}
