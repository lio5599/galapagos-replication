#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int mask = 0u - (unsigned int)(a >= 4294967295 - b);
	return ((a + b) & ~mask) | ((unsigned int)4294967295 & mask);
}


int main(){
    add(0,0);
}
