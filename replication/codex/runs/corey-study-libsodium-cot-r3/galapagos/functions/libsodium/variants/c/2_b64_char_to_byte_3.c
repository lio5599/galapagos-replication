#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Five mask sources describe the three ranges and two punctuation characters.
    // Complementing each shifted source yields its original mask.
    // OR reduction preserves overlapping contributions for arbitrary int inputs.
    // The final conditional is valid because every contribution fits in eight bits.
    const unsigned int u = (unsigned int)c;
    const unsigned int source[5] = {
        (u - (unsigned int)'A') | ((unsigned int)'Z' - u),
        (u - (unsigned int)'a') | ((unsigned int)'z' - u),
        (u - (unsigned int)'0') | ((unsigned int)'9' - u),
        0U - (u ^ (unsigned int)'+'),
        0U - (u ^ (unsigned int)'/')
    };
    const unsigned int value[5] = {
        u - (unsigned int)'A',
        u - ((unsigned int)'a' - 26U),
        u - ((unsigned int)'0' - 52U),
        62U, 63U
    };
    unsigned int x = 0U;
    unsigned int i;

    for (i = 0U; i < 5U; ++i)
        x |= ~(source[i] >> 8) & value[i] & 255U;
    return x != 0U ? x : (((0U - (u ^ (unsigned int)'A')) >> 8) & 255U);
}


int main(){
    b64_char_to_byte(0);
}
