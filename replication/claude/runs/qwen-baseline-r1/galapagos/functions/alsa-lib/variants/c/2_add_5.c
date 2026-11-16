#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	if (a > 0xFFFFFFFFU - b)
		return 0xFFFFFFFFU;
	return a + b;
}


int main(){
    add(0,0);
}
