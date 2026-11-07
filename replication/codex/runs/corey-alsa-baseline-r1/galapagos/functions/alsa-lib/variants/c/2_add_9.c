#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int sum = a + b;
	unsigned int mask = 0U - (unsigned int)(a >= 4294967295U - b);
	return sum + ((4294967295U - sum) & mask);
}


int main(){
    add(0,0);
}
