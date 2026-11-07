#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Weight the two possible results with complementary zero-or-one values.
	// Exactly one term survives, as determined by the original comparison.
	// Equality selects the limit; any wrapped unused sum is multiplied by zero.
	unsigned int saturated = (a >= 4294967295 - b);
	unsigned int sum = a + b;
	unsigned int limit = 4294967295;
	return sum * (1u - saturated) + limit * saturated;
}


int main(){
    add(0,0);
}
