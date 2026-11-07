#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Store the original masks and candidate values in parallel arrays.
    // OR their masked contributions; overlapping bits must not be added.
    // This preserves the reference even when out-of-range inputs yield partial masks.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int masks[5] = {
        a,
        (a ^ 255U) & b,
        (b ^ 255U) & (((x - 62U) >> 8) & 255U),
        (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U,
        (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U
    };
    unsigned int values[5] = {
        x + 'A', x + ('a' - 26), x + ('0' - 52), '-', '_'
    };
    unsigned int result = 0U;
    unsigned int i;

    for (i = 0U; i < 5U; ++i)
        result |= masks[i] & values[i];

    return (int)result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
