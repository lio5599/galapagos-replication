#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Approach: count the set bits in 4..30 with the popcount builtin and keep the low bit.
	// The low bit of the count is the parity, the same value as parity & 1 in the reference.
	// The mask 0x7FFFFFF0 restricts counting to the reference's bit range.
	// All-zero or excluded-only inputs give count 0 and so return 0.
	return (unsigned int)__builtin_popcount(data & 0x7FFFFFF0U) & 1U;
}


int main(){
    iec958_parity(0);
}
