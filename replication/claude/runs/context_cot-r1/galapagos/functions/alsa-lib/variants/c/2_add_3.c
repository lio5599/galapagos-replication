#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Overflow test b > max - a; max - a never underflows for unsigned a.
	// When b equals max - a the sum is exactly 4294967295, which is what
	// the reference returns via its >= branch, so strict > is fine here.
	if (b > 4294967295u - a)
		return 4294967295u;
	return a + b;
}


int main(){
    add(0,0);
}
