#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int max_val = 4294967295;
	if (a > max_val - b)
		return max_val;
	return a + b;
}


int main(){
    add(0,0);
}
