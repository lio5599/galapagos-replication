#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int sum = a + b;
	unsigned int saturated = (a >= 4294967295 - b);
	return sum + saturated * ((unsigned int)4294967295 - sum);
}


int main(){
    add(0,0);
}
