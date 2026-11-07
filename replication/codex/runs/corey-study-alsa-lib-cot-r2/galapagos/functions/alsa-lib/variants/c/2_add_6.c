#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Begin with saturation and use short-circuit evaluation to assign the sum.
	// The assignment occurs only strictly below the reference threshold.
	// Equality therefore preserves the saturation result.
	unsigned int result = 4294967295;
	(void)((a < 4294967295 - b) && (result = a + b));
	return result;
}


int main(){
    add(0,0);
}
