#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int sum = a + b;
	unsigned int limit = 4294967295;
	unsigned int adjustment = 0u;
	if (a >= 4294967295 - b)
		adjustment = limit - sum;
	return sum + adjustment;
}


int main(){
    add(0,0);
}
