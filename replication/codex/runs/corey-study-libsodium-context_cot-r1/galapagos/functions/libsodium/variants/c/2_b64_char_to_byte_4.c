#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Accumulate the original five terms sequentially using a reusable mask.
    // Combining range differences before shifting is a bitwise De Morgan transformation.
    // The final mask remains unchanged, including its behavior on arbitrary integers.
    const unsigned int u = (unsigned int)c;
    unsigned int m;
    unsigned int x;
    m = ~(((u - (unsigned int)'A') | ((unsigned int)'Z' - u)) >> 8) & 255U;
    x = m & (u - (unsigned int)'A');
    m = ~(((u - (unsigned int)'a') | ((unsigned int)'z' - u)) >> 8) & 255U;
    x |= m & (u - (unsigned int)'a' + 26U);
    m = ~(((u - (unsigned int)'0') | ((unsigned int)'9' - u)) >> 8) & 255U;
    x |= m & (u - (unsigned int)'0' + 52U);
    m = ~((0U - (u ^ (unsigned int)'+')) >> 8) & 255U;
    x |= m & 62U;
    m = ~((0U - (u ^ (unsigned int)'/')) >> 8) & 255U;
    x |= m & 63U;
    m = ~((0U - x) >> 8) & 255U;
    return x | (m & (((0U - (u ^ (unsigned int)'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
