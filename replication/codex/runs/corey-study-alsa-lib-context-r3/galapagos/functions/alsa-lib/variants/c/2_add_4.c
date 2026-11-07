#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int saturate = (a >= 4294967295 - b);
	if (saturate)
		return 4294967295;
	return a + b;
}


int main(){
    add(0,0);
}
