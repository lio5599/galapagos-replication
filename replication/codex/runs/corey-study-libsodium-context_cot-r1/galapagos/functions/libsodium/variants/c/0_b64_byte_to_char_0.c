#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Maps 0..63 to Base64 characters and other inputs to the reference's masked result.
    // Name each byte mask without assuming that x is in the Base64 range.
    // Unsigned subtraction and all five masked terms retain the original semantics.
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int t0 = a & (x + 'A');
    unsigned int t1 = (a ^ 0xFFU) & b & (x + ('a' - 26));
    unsigned int t2 = (b ^ 0xFFU) & c & (x + ('0' - 52));
    unsigned int t3 = d & '+';
    unsigned int t4 = e & '/';
    return (int)(t0 | t1 | t2 | t3 | t4);
}


int main(){
    b64_byte_to_char(0);
}
