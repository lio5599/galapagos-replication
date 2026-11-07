#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int sum = a + b;
	unsigned int saturate = (a >= 4294967295 - b);
	return sum + ((unsigned int)4294967295 - sum) * saturate;
}


int main(){
    add(0,0);
}
