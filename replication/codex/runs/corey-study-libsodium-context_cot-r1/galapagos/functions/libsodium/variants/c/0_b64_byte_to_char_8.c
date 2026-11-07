#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Express unsigned subtraction through complemented constants and addition.
    // Modulo unsigned arithmetic gives x - n = x + complement(n - 1).
    // Likewise, unsigned negation is complement plus one, including at zero.
    unsigned int a = ((x + ~25U) >> 8) & 255U;
    unsigned int b = ((x + ~51U) >> 8) & 255U;
    unsigned int c = ((x + ~61U) >> 8) & 255U;
    unsigned int d = (((~(x ^ 62U) + 1U) >> 8) & 255U) ^ 255U;
    unsigned int e = (((~(x ^ 63U) + 1U) >> 8) & 255U) ^ 255U;
    unsigned int result = a & (x + 'A');
    result |= (a ^ 255U) & b & (x + ('a' - 26));
    result |= (b ^ 255U) & c & (x + ('0' - 52));
    result |= d & '+';
    result |= e & '/';
    return (int)result;
}


int main(){
    b64_byte_to_char(0);
}
