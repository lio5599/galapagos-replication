#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	if (a != 4294967295 - b) {
		if (a < 4294967295 - b)
			return a + b;
	}
	return 4294967295;
}


int main(){
    add(0,0);
}
