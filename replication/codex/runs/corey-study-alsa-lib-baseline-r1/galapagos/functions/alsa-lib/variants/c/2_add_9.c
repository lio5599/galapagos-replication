#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int remaining = 4294967295U - b;
	unsigned int deficit = remaining > a ? remaining - a : 0U;
	return 4294967295U - deficit;
}


int main(){
    add(0,0);
}
