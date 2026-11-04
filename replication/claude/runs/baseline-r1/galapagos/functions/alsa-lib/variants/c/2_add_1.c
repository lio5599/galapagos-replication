#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	return (a + b < a) ? 4294967295U : a + b;
}


int main(){
    add(0,0);
}
