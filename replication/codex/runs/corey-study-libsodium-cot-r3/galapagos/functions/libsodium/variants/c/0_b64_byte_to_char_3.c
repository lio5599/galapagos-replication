#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Store the five original masks and candidates, then OR their contributions.
    // No assumption of mutually exclusive masks is made.
    // Thus arbitrary unsigned inputs retain the reference's overlapping-mask behavior.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int masks[5];
    unsigned int values[5];
    unsigned int result = 0U;
    unsigned int i;

    masks[0] = a;
    masks[1] = (a ^ 255U) & b;
    masks[2] = (b ^ 255U) & (((x - 62U) >> 8) & 255U);
    masks[3] = (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U;
    masks[4] = (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U;
    values[0] = x + 'A';
    values[1] = x + ('a' - 26);
    values[2] = x + ('0' - 52);
    values[3] = '+';
    values[4] = '/';

    for (i = 0U; i < 5U; ++i)
        result |= masks[i] & values[i];

    return (int)result;
}


int main(){
    b64_byte_to_char(0);
}
