#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Add a correction only when the original saturation condition holds.
	// Unsigned modular arithmetic makes sum plus cap minus sum equal the cap.
	// With no saturation the correction is zero, including when both inputs are zero.
	unsigned int sum = a + b;
	unsigned int cap = 4294967295;
	unsigned int saturated = (unsigned int)(a >= 4294967295 - b);
	return sum + saturated * (cap - sum);
}


int main(){
    add(0,0);
}
