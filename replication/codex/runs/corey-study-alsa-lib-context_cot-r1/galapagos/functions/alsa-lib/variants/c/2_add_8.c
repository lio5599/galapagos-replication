#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Use an unsigned mask and XOR to select between the sum and the cap.
	// A zero mask leaves the sum; an all-one mask changes it exactly to the cap.
	// The exact reference comparison includes equality and discards wrapped sums.
	unsigned int sum = a + b;
	unsigned int cap = 4294967295;
	unsigned int mask = 0U - (unsigned int)(a >= 4294967295 - b);
	return sum ^ ((sum ^ cap) & mask);
}


int main(){
    add(0,0);
}
