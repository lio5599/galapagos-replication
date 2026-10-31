#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int s = a + b;
	unsigned int overflow = (s < b);
	return overflow ? 4294967295U : s;
}


int main(){
    add(0,0);
}
