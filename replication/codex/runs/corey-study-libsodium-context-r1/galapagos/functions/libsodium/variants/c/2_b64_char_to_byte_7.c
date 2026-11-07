#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    const unsigned int a = (((u - 'A') >> 8) | (('Z' - u) >> 8)) & 255U;
    const unsigned int b = (((u - 'a') >> 8) | (('z' - u) >> 8)) & 255U;
    const unsigned int d = (((u - '0') >> 8) | (('9' - u) >> 8)) & 255U;
    const unsigned int p = ((0U - (u ^ '+')) >> 8) & 255U;
    const unsigned int s = ((0U - (u ^ '/')) >> 8) & 255U;
    const unsigned int x = (((u - 'A') & ~a) |
                            ((u - ('a' - 26)) & ~b) |
                            ((u - ('0' - 52)) & ~d) |
                            (62U & ~p) | (63U & ~s)) & 255U;
    const unsigned int z = ((0U - x) >> 8) & 255U;
    const unsigned int n = ((0U - (u ^ 'A')) >> 8) & 255U;
    return x | (n & ~z);
}


int main(){
    b64_char_to_byte(0);
}
