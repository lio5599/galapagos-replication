#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned long long s = (unsigned long long)a + b;
	return (unsigned int)(s < 4294967295ULL ? s : 4294967295ULL);
}


int main(){
    add(0,0);
}
