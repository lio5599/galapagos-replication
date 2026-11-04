#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	if (b >= (4294967295U ^ a))
		return 4294967295U;
	return a + b;
}


int main(){
    add(0,0);
}
