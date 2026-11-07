#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// An all-one mask toggles exactly the bits that differ from the cap.
	// An all-zero mask leaves the sum unchanged.
	// The original comparison selects the cap at equality and beyond.
	unsigned int sum = a + b;
	unsigned int cap = 4294967295;
	unsigned int mask = 0u - (unsigned int)(a >= 4294967295 - b);
	return sum ^ ((sum ^ cap) & mask);
}


int main(){
    add(0,0);
}
