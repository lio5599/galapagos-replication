#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int remaining = 4294967295U - b;
	return b + (a < remaining ? a : remaining);
}


int main(){
    add(0,0);
}
