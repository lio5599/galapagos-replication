#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Unsigned division by 256 replaces each right shift by eight.
    // Remainder modulo 256 replaces extraction of the low eight bits.
    // Subtracting an extracted byte from 255 gives its bitwise complement.
    // Thus range, punctuation, and invalid-input masks match even outside byte inputs.
    const unsigned int u = (unsigned int)c;
    const unsigned int ma =
        255U - (((u - (unsigned int)'A') | ((unsigned int)'Z' - u)) / 256U % 256U);
    const unsigned int mb =
        255U - (((u - (unsigned int)'a') | ((unsigned int)'z' - u)) / 256U % 256U);
    const unsigned int md =
        255U - (((u - (unsigned int)'0') | ((unsigned int)'9' - u)) / 256U % 256U);
    const unsigned int mp =
        255U - ((0U - (u ^ (unsigned int)'+')) / 256U % 256U);
    const unsigned int ms =
        255U - ((0U - (u ^ (unsigned int)'/')) / 256U % 256U);
    const unsigned int x =
        (ma & (u - (unsigned int)'A')) |
        (mb & (u - ((unsigned int)'a' - 26U))) |
        (md & (u - ((unsigned int)'0' - 52U))) |
        (mp & 62U) | (ms & 63U);

    return x ? x : ((0U - (u ^ (unsigned int)'A')) / 256U % 256U);
}


int main(){
    b64_char_to_byte(0);
}
