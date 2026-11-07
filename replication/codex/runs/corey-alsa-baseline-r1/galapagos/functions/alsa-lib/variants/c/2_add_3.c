#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int remaining = 4294967295U - b;
	if (a >= remaining)
		return 4294967295U;
	return 4294967295U - (remaining - a);
}


int main(){
    add(0,0);
}
