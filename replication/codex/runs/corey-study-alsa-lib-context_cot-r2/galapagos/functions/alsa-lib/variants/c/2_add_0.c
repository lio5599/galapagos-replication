#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// The reference adds a and b, saturating at 4294967295.
	// Below the original threshold, return the sum.
	// Equality and values above the threshold return the cap.
	if (a < 4294967295 - b)
		return a + b;
	return 4294967295;
}


int main(){
    add(0,0);
}
