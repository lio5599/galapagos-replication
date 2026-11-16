#include <stdint.h>

__attribute__((noinline))
static inline unsigned int add(unsigned int a, unsigned int b)
{
	// Reference: computes saturated addition of two unsigned ints.
	// If a + b would overflow 32-bit unsigned, returns UINT_MAX.
	// Otherwise returns a + b. Uses threshold 4294967295 (UINT_MAX).
	// Check: if a > UINT_MAX - b, overflow would occur.
	// Since UINT_MAX is 4294967295, a >= 4294967295 - b is equivalent to a > 4294967294 - b when b>0, but the original uses >= which correctly handles all cases including b=0 where 4294967295-0=4294967295 and a>=4294967295 means a==UINT_MAX, so a+b would overflow only if a+b>UINT_MAX. Wait: if a=UINT_MAX and b=0, a+b=UINT_MAX which is valid. But the condition a>=4294967295-0 means a>=UINT_MAX, so if a=UINT_MAX, it returns UINT_MAX. That's correct since UINT_MAX+0=UINT_MAX. If a=UINT_MAX and b=1, a>=4294967295-1=4294967294, so true, returns UINT_MAX. Correct.
	if (a >= 4294967295 - b)
		return 4294967295;
	return a + b;
}


int main(){
    add(0,0);
}
