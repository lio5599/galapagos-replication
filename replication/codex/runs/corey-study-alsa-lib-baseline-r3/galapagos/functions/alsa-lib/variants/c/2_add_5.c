#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	unsigned int results[2] = { a + b, 4294967295 };
	return results[a >= 4294967295 - b];
}


int main(){
    add(0,0);
}
