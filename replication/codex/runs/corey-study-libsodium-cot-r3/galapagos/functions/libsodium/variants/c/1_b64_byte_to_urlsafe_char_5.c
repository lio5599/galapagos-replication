#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Apply De Morgan's law to combine the five reference contributions.
    // Complementing their complemented intersection gives their bitwise OR.
    // Final byte truncation preserves the exact result for all unsigned inputs.
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int d = (0U - (x ^ 62U)) >> 8;
    unsigned int e = (0U - (x ^ 63U)) >> 8;
    unsigned int inverted = ~(a & (x + 'A'));

    inverted &= ~(~a & b & (x + ('a' - 26)));
    inverted &= ~(~b & c & (x + ('0' - 52)));
    inverted &= ~(~d & '-');
    inverted &= ~(~e & '_');
    return (int)((~inverted) & 255U);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
