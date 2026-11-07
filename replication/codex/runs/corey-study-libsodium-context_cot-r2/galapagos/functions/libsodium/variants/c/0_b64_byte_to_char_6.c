#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Replace each final OR accumulation by u plus v minus their intersection.
    // That unsigned arithmetic identity equals bitwise OR for all bit patterns.
    // The original masks and terms remain unchanged, including outside Base64's range.
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int result = a & (x + 'A');
    unsigned int term = (a ^ 0xFFU) & b & (x + ('a' - 26));
    result = result + term - (result & term);
    term = (b ^ 0xFFU) & c & (x + ('0' - 52));
    result = result + term - (result & term);
    term = ((((0U - (x ^ 62U)) >> 8) & 0xFFU) ^ 0xFFU) & '+';
    result = result + term - (result & term);
    term = ((((0U - (x ^ 63U)) >> 8) & 0xFFU) ^ 0xFFU) & '/';
    result = result + term - (result & term);
    return result;
}


int main(){
    b64_byte_to_char(0);
}
