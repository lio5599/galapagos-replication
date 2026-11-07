#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Split the reference's greater-than-or-equal test into its two cases.
	// Both exceeding the threshold and exactly reaching it return the constant.
	// Every remaining input takes the original addition path.
	if (a > 4294967295 - b)
		return 4294967295;
	if (a == 4294967295 - b)
		return 4294967295;
	return a + b;
}


int main(){
    add(0,0);
}
