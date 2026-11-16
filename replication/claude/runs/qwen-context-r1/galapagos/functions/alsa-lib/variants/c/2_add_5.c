#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	if (a + b < a)
		return 4294967295;
	return a + b;
}


int main(){
    add(0,0);
}
