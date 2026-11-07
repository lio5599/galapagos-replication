#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Accumulate OR using u + v - (u AND v), an exact bitwise identity.
    // Each contribution and accumulated result is a byte, so sums cannot overflow.
    // Original unsigned mask expressions preserve behavior for every input.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int result = a & (x + 'A');
    unsigned int term = (a ^ 255U) & b & (x + ('a' - 26));
    result = result + term - (result & term);
    term = (b ^ 255U) & c & (x + ('0' - 52));
    result = result + term - (result & term);
    term = ((((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U) & '+';
    result = result + term - (result & term);
    term = ((((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U) & '/';
    result = result + term - (result & term);
    return result;
}


int main(){
    b64_byte_to_char(0);
}
