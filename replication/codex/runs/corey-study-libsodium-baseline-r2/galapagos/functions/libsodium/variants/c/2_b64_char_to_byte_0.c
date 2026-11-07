#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    unsigned int x;

    x = (~((u - 'A') >> 8) & ~(('Z' - u) >> 8) & (u - 'A') & 255U)
      | (~((u - 'a') >> 8) & ~(('z' - u) >> 8) & (u - ('a' - 26)) & 255U)
      | (~((u - '0') >> 8) & ~(('9' - u) >> 8) & (u - ('0' - 52)) & 255U)
      | (~((0U - (u ^ '+')) >> 8) & 62U)
      | (~((0U - (u ^ '/')) >> 8) & 63U);

    return x ? x : (((0U - (u ^ 'A')) >> 8) & 255U);
}


int main(){
    b64_char_to_byte(0);
}
