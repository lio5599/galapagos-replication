#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Factor the common low-byte restriction out of the five-term OR.
    // Higher temporary bits cannot affect lower bits in these bitwise operations.
    // The final computation therefore matches even when c is not a character.
    const unsigned int u = (unsigned int)c;
    const unsigned int a = ~((u - (unsigned int)'A') >> 8) &
                           ~(((unsigned int)'Z' - u) >> 8) &
                           (u - (unsigned int)'A');
    const unsigned int b = ~((u - (unsigned int)'a') >> 8) &
                           ~(((unsigned int)'z' - u) >> 8) &
                           (u - (unsigned int)'a' + 26U);
    const unsigned int d = ~((u - (unsigned int)'0') >> 8) &
                           ~(((unsigned int)'9' - u) >> 8) &
                           (u - (unsigned int)'0' + 52U);
    const unsigned int p = ~((0U - (u ^ (unsigned int)'+')) >> 8) & 62U;
    const unsigned int s = ~((0U - (u ^ (unsigned int)'/')) >> 8) & 63U;
    const unsigned int x = (a | b | d | p | s) & 255U;
    return x | (~((0U - x) >> 8) &
                ((0U - (u ^ (unsigned int)'A')) >> 8) & 255U);
}


int main(){
    b64_char_to_byte(0);
}
