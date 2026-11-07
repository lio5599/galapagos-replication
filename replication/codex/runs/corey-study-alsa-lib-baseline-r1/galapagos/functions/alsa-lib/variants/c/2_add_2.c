#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int result = 4294967295U;
	if (a < 4294967295U - b)
		result = a + b;
	return result;
}


int main(){
    add(0,0);
}
