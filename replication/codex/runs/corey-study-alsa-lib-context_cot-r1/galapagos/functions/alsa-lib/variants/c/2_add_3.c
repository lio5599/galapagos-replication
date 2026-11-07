#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Split the reference's greater-than-or-equal test into two disjoint cases.
	// Both strict excess and exact equality return the cap.
	// Only inputs strictly below the threshold reach the addition.
	if (a > 4294967295 - b)
		return 4294967295;
	if (a == 4294967295 - b)
		return 4294967295;
	return a + b;
}


int main(){
    add(0,0);
}
