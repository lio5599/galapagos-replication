#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Approach: for 32-bit unsigned, ~b equals 4294967295 - b, the headroom for a.
	// If a > ~b, the true sum exceeds max, so saturate.
	// If a <= ~b, the sum fits, and a == ~b gives exactly max, matching the reference.
	if (a > ~b)
		return 4294967295u;
	return a + b;
}


int main(){
    add(0,0);
}
