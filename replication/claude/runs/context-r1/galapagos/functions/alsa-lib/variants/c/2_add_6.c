#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned long long wide = (unsigned long long)a + (unsigned long long)b;
	return (unsigned int)(wide | (0ULL - (wide >> 32)));
}


int main(){
    add(0,0);
}
