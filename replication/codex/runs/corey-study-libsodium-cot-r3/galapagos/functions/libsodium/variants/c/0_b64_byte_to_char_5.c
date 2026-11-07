#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Replace each mask AND candidate with the identity u AND v = (u+v-(u XOR v))/2.
    // Both operands are truncated to bytes, so the arithmetic cannot overflow.
    // The masks are unchanged, preserving all inputs including overlapping cases.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int masks[5];
    unsigned int values[5];
    unsigned int result = 0U;
    unsigned int i;

    masks[0] = a;
    masks[1] = (255U ^ a) & b;
    masks[2] = (255U ^ b) & (((x - 62U) >> 8) & 255U);
    masks[3] = (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U;
    masks[4] = (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U;
    values[0] = (x + 'A') & 255U;
    values[1] = (x + ('a' - 26)) & 255U;
    values[2] = (x + ('0' - 52)) & 255U;
    values[3] = (unsigned int)'+' & 255U;
    values[4] = (unsigned int)'/' & 255U;

    for (i = 0U; i < 5U; ++i)
        result |= (masks[i] + values[i] - (masks[i] ^ values[i])) / 2U;

    return (int)result;
}


int main(){
    b64_byte_to_char(0);
}
