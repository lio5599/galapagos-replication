#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // For an extracted byte v, subtracting v from 255 equals XOR with 255.
    // This replaces mask complements without changing any of their eight bits.
    // Unsigned differences also preserve the reference on all its defined integer inputs.
    const unsigned int u = (unsigned int)c;
    const unsigned int a =
        (255U - (((u - (unsigned int)'A') >> 8) & 255U)) &
        (255U - ((((unsigned int)'Z' - u) >> 8) & 255U));
    const unsigned int b =
        (255U - (((u - (unsigned int)'a') >> 8) & 255U)) &
        (255U - ((((unsigned int)'z' - u) >> 8) & 255U));
    const unsigned int d =
        (255U - (((u - (unsigned int)'0') >> 8) & 255U)) &
        (255U - ((((unsigned int)'9' - u) >> 8) & 255U));
    const unsigned int p = 255U - (((0U - (u ^ (unsigned int)'+')) >> 8) & 255U);
    const unsigned int s = 255U - (((0U - (u ^ (unsigned int)'/')) >> 8) & 255U);
    const unsigned int x = (a & (u - (unsigned int)'A')) |
                           (b & (u - (unsigned int)'a' + 26U)) |
                           (d & (u - (unsigned int)'0' + 52U)) |
                           (p & 62U) | (s & 63U);
    const unsigned int z = 255U - (((0U - x) >> 8) & 255U);
    const unsigned int n = ((0U - (u ^ (unsigned int)'A')) >> 8) & 255U;
    return x | (z & n);
}


int main(){
    b64_char_to_byte(0);
}
