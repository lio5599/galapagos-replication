#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    const unsigned int a = (~((u - 'A') >> 8) & 255U) &
                           (~(('Z' - u) >> 8) & 255U);
    const unsigned int b = (~((u - 'a') >> 8) & 255U) &
                           (~(('z' - u) >> 8) & 255U);
    const unsigned int d = (~((u - '0') >> 8) & 255U) &
                           (~(('9' - u) >> 8) & 255U);
    const unsigned int p = ~( (0U - (u ^ '+')) >> 8) & 255U;
    const unsigned int s = ~( (0U - (u ^ '/')) >> 8) & 255U;
    const unsigned int x = (a & (u - 'A')) |
                           (b & (u - ('a' - 26))) |
                           (d & (u - ('0' - 52))) |
                           (p & 62U) | (s & 63U);
    return x | ((~((0U - x) >> 8) & 255U) &
                (((0U - (u ^ 'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
