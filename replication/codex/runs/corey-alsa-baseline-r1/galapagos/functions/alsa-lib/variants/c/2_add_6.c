#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int saturated = (a >= 4294967295U - b);
	return (a + b) * (1U - saturated) + 4294967295U * saturated;
}


int main(){
    add(0,0);
}
