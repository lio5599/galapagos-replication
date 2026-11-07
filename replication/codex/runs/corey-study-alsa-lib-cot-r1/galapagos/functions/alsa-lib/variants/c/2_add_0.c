#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// The reference returns 4294967295 when a >= 4294967295 - b, otherwise a + b.
	// A conditional expression selects exactly the same two results.
	// The unchanged comparison preserves equality and zero-input cases.
	return a >= 4294967295 - b ? 4294967295 : a + b;
}


int main(){
    add(0,0);
}
