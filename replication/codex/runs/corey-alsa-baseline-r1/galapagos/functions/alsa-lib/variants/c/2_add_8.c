#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int result = a + b;
	if (a >= 4294967295U - b)
		result = 4294967295U;
	return result;
}


int main(){
    add(0,0);
}
