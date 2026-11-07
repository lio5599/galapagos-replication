#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Initialize the result to the limit and use short-circuit evaluation.
	// Only a false saturation test evaluates the assignment of the sum.
	// Equality keeps the limit, and zero inputs behave exactly as in the reference.
	unsigned int result = 4294967295;
	(void)((a >= 4294967295 - b) || ((result = a + b), 1));
	return result;
}


int main(){
    add(0,0);
}
