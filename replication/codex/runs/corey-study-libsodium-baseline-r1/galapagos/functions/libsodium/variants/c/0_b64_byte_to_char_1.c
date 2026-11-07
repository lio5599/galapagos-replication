#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int result = a & (x + 'A');

    result |= (~a & b) & (x + ('a' - 26));
    result |= (~b & c) & (x + ('0' - 52));
    result |= (~((0U - (x ^ 62U)) >> 8) & 255U) & '+';
    result |= (~((0U - (x ^ 63U)) >> 8) & 255U) & '/';

    return (int)result;
}


int main(){
    b64_byte_to_char(0);
}
