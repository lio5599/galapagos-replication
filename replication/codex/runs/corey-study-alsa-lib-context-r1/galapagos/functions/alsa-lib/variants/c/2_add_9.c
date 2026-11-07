#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int sum = a + b;
	unsigned int limit = 4294967295;
	unsigned int mask = 0u - (unsigned int)(a >= 4294967295 - b);
	unsigned int adjustment = limit - sum;
	return sum + (adjustment & mask);
}


int main(){
    add(0,0);
}
