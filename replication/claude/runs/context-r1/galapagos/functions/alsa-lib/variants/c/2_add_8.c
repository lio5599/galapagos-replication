#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int sum = a + b;
	unsigned int carry = ((a & b) | ((a | b) & ~sum)) >> 31;
	return sum | (0U - carry);
}


int main(){
    add(0,0);
}
