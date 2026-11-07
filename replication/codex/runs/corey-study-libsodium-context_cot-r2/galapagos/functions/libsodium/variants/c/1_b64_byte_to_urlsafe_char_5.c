#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Accumulate the five reference contributions in reverse order.
    // Bitwise OR is associative and commutative, including when masks overlap.
    // Each mask uses the original unsigned arithmetic for unrestricted inputs.
    unsigned int result;
    unsigned int mask;
    mask = (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U;
    result = mask & '_';
    mask = (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U;
    result |= mask & '-';
    mask = ((((x - 52U) >> 8) & 255U) ^ 255U) &
           (((x - 62U) >> 8) & 255U);
    result |= mask & (x + ('0' - 52));
    mask = ((((x - 26U) >> 8) & 255U) ^ 255U) &
           (((x - 52U) >> 8) & 255U);
    result |= mask & (x + ('a' - 26));
    mask = ((x - 26U) >> 8) & 255U;
    result |= mask & (x + 'A');
    return (int)result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
