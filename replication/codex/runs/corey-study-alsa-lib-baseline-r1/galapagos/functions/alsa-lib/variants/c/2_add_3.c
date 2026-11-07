#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	if (a >= 4294967295U - b)
		a = 4294967295U - b;
	return a + b;
}


int main(){
    add(0,0);
}
