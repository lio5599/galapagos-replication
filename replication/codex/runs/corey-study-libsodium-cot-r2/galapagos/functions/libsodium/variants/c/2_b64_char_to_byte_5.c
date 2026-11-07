#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Accumulate the complement of the result with AND instead of using OR.
    // De Morgan's law makes its final complement the original five-term union.
    // All terms remain byte-masked, including for unusual non-byte inputs.
    // The original correction and unsigned differences preserve defined results.
    const unsigned int u = (unsigned int)c;
    const unsigned int term[5] = {
        ((~((u - 'A') | ('Z' - u)) >> 8) & 255U) & (u - 'A'),
        ((~((u - 'a') | ('z' - u)) >> 8) & 255U) &
            (u - 'a' + 26U),
        ((~((u - '0') | ('9' - u)) >> 8) & 255U) &
            (u - '0' + 52U),
        ((~(0U - (u ^ '+')) >> 8) & 255U) & 62U,
        ((~(0U - (u ^ '/')) >> 8) & 255U) & 63U
    };
    unsigned int absent = ~0U;
    unsigned int x;
    unsigned int i;
    for (i = 0U; i < 5U; ++i)
        absent &= ~term[i];
    x = ~absent;
    return x |
        ((255U ^ (((0U - x) >> 8) & 255U)) &
         (((0U - (u ^ 'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
