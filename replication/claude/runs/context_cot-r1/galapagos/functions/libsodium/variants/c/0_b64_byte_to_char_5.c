#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Build the result by accumulating each reference term into r with |=.
    // OR is associative and commutative, so the final value equals the reference OR of all five terms.
    // Each term is computed with exactly the reference masks and offsets, so large x also matches.
    unsigned int r = 0U;
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    r |= (((0U - (x ^ 63U)) >> 8) & 0xFFU ^ 0xFFU) & 47U;
    r |= (((0U - (x ^ 62U)) >> 8) & 0xFFU ^ 0xFFU) & 43U;
    r |= (b ^ 0xFFU) & c & (x - 4U);
    r |= (a ^ 0xFFU) & b & (x + 71U);
    r |= a & (x + 65U);
    return (int) r;
}


int main(){
    b64_byte_to_char(0);
}
