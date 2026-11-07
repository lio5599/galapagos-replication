#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    const unsigned int a = (~((u - 'A') | ('Z' - u)) >> 8) & 255U;
    const unsigned int b = (~((u - 'a') | ('z' - u)) >> 8) & 255U;
    const unsigned int d = (~((u - '0') | ('9' - u)) >> 8) & 255U;
    const unsigned int p = (~(0U - (u ^ '+')) >> 8) & 62U;
    const unsigned int s = (~(0U - (u ^ '/')) >> 8) & 63U;
    const unsigned int x = (a & (u - 'A')) |
                           (b & (u - ('a' - 26))) |
                           (d & (u - ('0' - 52))) | p | s;
    const unsigned int correction =
        ((~(0U - x) & (0U - (u ^ 'A'))) >> 8) & 255U;
    return x ^ (correction & ~x);
}


int main(){
    b64_char_to_byte(0);
}
