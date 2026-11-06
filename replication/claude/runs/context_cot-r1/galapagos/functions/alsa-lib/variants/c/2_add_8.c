#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Branchless using comparison with b: wrapped sum < b iff overflow,
	// since addition is commutative and wrap occurs only past the max.
	// Mask of all ones saturates; exact-max sum does not wrap and is kept.
	unsigned int s = a + b;
	unsigned int m = 0u - (unsigned int)(s < b);
	return s | m;
}


int main(){
    add(0,0);
}
