#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Select the cap using exactly the reference's comparison.
	// Otherwise select the sum; equality selects the cap.
	return (a >= 4294967295 - b) ? 4294967295 : a + b;
}


int main(){
    add(0,0);
}
