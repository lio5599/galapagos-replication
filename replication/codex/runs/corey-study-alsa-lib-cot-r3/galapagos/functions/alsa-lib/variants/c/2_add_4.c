#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Dispatch on the original comparison, whose value is either zero or one.
	// The default path includes threshold equality and returns the same cap.
	switch (a >= 4294967295 - b) {
	case 0:
		return a + b;
	default:
		return 4294967295;
	}
}


int main(){
    add(0,0);
}
