#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    const unsigned int upper =
        ~(((u - 'A') | ('Z' - u)) >> 8);
    const unsigned int lower =
        ~(((u - 'a') | ('z' - u)) >> 8);
    const unsigned int digit =
        ~(((u - '0') | ('9' - u)) >> 8);
    const unsigned int x =
        ((upper & (u - 'A')) |
         (lower & (u - ('a' - 26))) |
         (digit & (u - ('0' - 52))) |
         (~((0U - (u ^ '+')) >> 8) & 62U) |
         (~((0U - (u ^ '/')) >> 8) & 63U)) & 255U;

    return x | (~((0U - x) >> 8) &
                ((0U - (u ^ 'A')) >> 8) & 255U);
}


int main(){
    b64_char_to_byte(0);
}
