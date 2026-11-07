#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Apply De Morgan's law to the OR of the reference's five masked terms.
    // Every term is byte-limited, so the complemented intersection yields the same byte.
    // All mask arithmetic remains unsigned, preserving wraparound for every input.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U;
    unsigned int p = a & (x + 'A');
    unsigned int q = (~a & b) & (x + ('a' - 26));
    unsigned int r = (~b & c) & (x + ('0' - 52));
    unsigned int s = d & '-';
    unsigned int t = e & '_';

    return (int)(~(~p & ~q & ~r & ~s & ~t) & 255U);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
