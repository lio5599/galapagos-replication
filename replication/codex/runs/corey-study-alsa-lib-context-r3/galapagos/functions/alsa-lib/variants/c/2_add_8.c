#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int saturate = (a >= 4294967295 - b);
	return (a + b) * (1u - saturate)
	     + (unsigned int)4294967295 * saturate;
}


int main(){
    add(0,0);
}
