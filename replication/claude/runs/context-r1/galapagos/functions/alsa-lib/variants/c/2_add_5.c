#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned long long wide = (unsigned long long)a + (unsigned long long)b;
	if (wide > 4294967295ULL)
		return 4294967295U;
	return (unsigned int)wide;
}


int main(){
    add(0,0);
}
