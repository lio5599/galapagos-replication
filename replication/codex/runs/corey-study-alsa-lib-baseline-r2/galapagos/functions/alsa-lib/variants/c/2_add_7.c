#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int saturated = (a >= 4294967295 - b);
	return (a + b) * (1u - saturated)
	     + (unsigned int)4294967295 * saturated;
}


int main(){
    add(0,0);
}
