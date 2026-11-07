#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	return a >= 4294967295U - b ? 4294967295U : a + b;
}


int main(){
    add(0,0);
}
