#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // A bitwise multiplexer combines the uppercase and lowercase contributions.
    // For each bit, a selects uppercase; otherwise the masked lowercase bit remains.
    // This works for arbitrary partial masks, preserving all unsigned edge cases.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int letters = b & (x + ('a' - 26));
    unsigned int digit = (b ^ 255U) & c & (x + ('0' - 52));
    unsigned int plus = ((((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U) & '+';
    unsigned int slash = ((((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U) & '/';
    letters ^= (letters ^ (x + 'A')) & a;
    return letters | digit | plus | slash;
}


int main(){
    b64_byte_to_char(0);
}
