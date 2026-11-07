#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int masks[5] = {
        a,
        ~a & b,
        ~b & ((x - 62U) >> 8),
        ~((0U - (x ^ 62U)) >> 8),
        ~((0U - (x ^ 63U)) >> 8)
    };
    unsigned int values[5] = {
        x + 'A', x + ('a' - 26), x + ('0' - 52), '+', '/'
    };
    unsigned int result = 0U;
    unsigned int i;

    for (i = 0U; i < 5U; ++i)
        result |= masks[i] & values[i];

    return (int)(result & 255U);
}


int main(){
    b64_byte_to_char(0);
}
