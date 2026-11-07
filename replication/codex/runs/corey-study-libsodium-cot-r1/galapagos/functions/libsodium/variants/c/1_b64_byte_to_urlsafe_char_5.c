#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Reduce x to its low 16 bits before evaluating the byte masks.
    // Every extracted mask depends only on bits 8 through 15 of unsigned arithmetic.
    // Candidate values contribute only their low byte, so discarded bits never matter.
    // This preserves all inputs, including values above 65535.
    unsigned int a;
    unsigned int b;
    unsigned int result;

    x &= 65535U;
    a = ((x - 26U) >> 8) & 255U;
    b = ((x - 52U) >> 8) & 255U;
    result = a & (x + 'A');
    result |= (a ^ 255U) & b & (x + ('a' - 26));
    result |= (b ^ 255U) & (((x - 62U) >> 8) & 255U) &
              (x + ('0' - 52));
    result |= ((((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U) & '-';
    result |= ((((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U) & '_';

    return (int)result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
