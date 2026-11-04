#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int sum = a + b;
	return sum | (0U - (unsigned int)(sum < a));
}


int main(){
    add(0,0);
}
