#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Start with the saturation result and replace it only below the threshold.
	// The strict comparison leaves equality on the saturation path.
	unsigned int result = 4294967295;
	if (a < 4294967295 - b)
		result = a + b;
	return result;
}


int main(){
    add(0,0);
}
