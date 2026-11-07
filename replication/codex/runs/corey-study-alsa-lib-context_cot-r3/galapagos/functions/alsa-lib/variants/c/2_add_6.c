#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Clamp the first addend to the reference's threshold before adding b.
	// On the saturation path, adding b cancels the subtraction of b.
	// Otherwise the selected addend is a, giving the original sum.
	return b + (a >= 4294967295 - b ? 4294967295 - b : a);
}


int main(){
    add(0,0);
}
