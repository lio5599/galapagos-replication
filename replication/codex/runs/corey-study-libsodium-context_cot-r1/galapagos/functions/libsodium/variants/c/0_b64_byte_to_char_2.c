#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Use De Morgan's law to express each masked term using complement and OR.
    // Full-width inversions are harmless because the final result is byte-masked.
    // The unsigned shifts and wraparound remain unchanged for every input.
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int d = (0U - (x ^ 62U)) >> 8;
    unsigned int e = (0U - (x ^ 63U)) >> 8;
    unsigned int t0 = ~(~a | ~(x + 'A'));
    unsigned int t1 = ~(a | ~b | ~(x + ('a' - 26)));
    unsigned int t2 = ~(b | ~c | ~(x + ('0' - 52)));
    unsigned int t3 = ~(d | ~(unsigned int)'+');
    unsigned int t4 = ~(e | ~(unsigned int)'/');
    return (int)((t0 | t1 | t2 | t3 | t4) & 0xFFU);
}


int main(){
    b64_byte_to_char(0);
}
