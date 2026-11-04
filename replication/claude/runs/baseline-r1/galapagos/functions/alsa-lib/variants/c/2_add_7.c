#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned long long s = (unsigned long long)a + b;
	return (unsigned int)s | (unsigned int)(0ULL - (s >> 32));
}


int main(){
    add(0,0);
}
