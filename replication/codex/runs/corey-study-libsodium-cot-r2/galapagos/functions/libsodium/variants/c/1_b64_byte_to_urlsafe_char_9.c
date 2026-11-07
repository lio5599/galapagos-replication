#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Combine terms with the identity u OR v equals u plus v minus (u AND v).
    // Each operand is at most 255, so these additions cannot overflow unsigned int.
    // Overlapping and partial masks are handled exactly, including outside 0 through 63.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int result = a & (x + 'A');
    unsigned int term;

    term = (a ^ 255U) & b & (x + ('a' - 26));
    result = result + term - (result & term);
    term = (b ^ 255U) & c & (x + ('0' - 52));
    result = result + term - (result & term);
    term = ((((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U) & '-';
    result = result + term - (result & term);
    term = ((((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U) & '_';
    result = result + term - (result & term);

    return (int)result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
