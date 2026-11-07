#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    const unsigned int a =
        (u - 'A') & ~(((u - 'A') | ('Z' - u)) >> 8);
    const unsigned int b =
        (u - 'a' + 26U) & ~(((u - 'a') | ('z' - u)) >> 8);
    const unsigned int d =
        (u - '0' + 52U) & ~(((u - '0') | ('9' - u)) >> 8);
    const unsigned int p = 62U & ~((0U - (u ^ '+')) >> 8);
    const unsigned int s = 63U & ~((0U - (u ^ '/')) >> 8);
    const unsigned int x = ~(~a & ~b & ~d & ~p & ~s) & 255U;
    const unsigned int fallback = ((0U - (u ^ 'A')) >> 8) & 255U;

    return x + (unsigned int)(x == 0U) * fallback;
}


int main(){
    b64_char_to_byte(0);
}
