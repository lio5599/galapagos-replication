#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Ternary with ~a = max - a: b <= ~a means the sum fits in 32 bits.
	// The sum then is at most 4294967295, equal to the reference result.
	// If b > ~a the true sum exceeds the max, so return 4294967295.
	return (b <= ~a) ? a + b : 4294967295u;
}


int main(){
    add(0,0);
}
