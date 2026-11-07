#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int sum = a + b;
	unsigned int limit = 4294967295;
	unsigned int saturate = (unsigned int)(a >= 4294967295 - b);
	return sum * (1u - saturate) + limit * saturate;
}


int main(){
    add(0,0);
}
