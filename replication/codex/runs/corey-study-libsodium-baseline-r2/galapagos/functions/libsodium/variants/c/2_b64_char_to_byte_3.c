#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    unsigned int terms[5];
    unsigned int x = 0U;
    unsigned int i;

    terms[0] = (255U ^ (((u - 'A') >> 8) & 255U))
             & (255U ^ ((('Z' - u) >> 8) & 255U))
             & (u - 'A');
    terms[1] = (255U ^ (((u - 'a') >> 8) & 255U))
             & (255U ^ ((('z' - u) >> 8) & 255U))
             & (u - ('a' - 26));
    terms[2] = (255U ^ (((u - '0') >> 8) & 255U))
             & (255U ^ ((('9' - u) >> 8) & 255U))
             & (u - ('0' - 52));
    terms[3] = (255U ^ (((0U - (u ^ '+')) >> 8) & 255U)) & 62U;
    terms[4] = (255U ^ (((0U - (u ^ '/')) >> 8) & 255U)) & 63U;

    for (i = 0U; i < 5U; ++i)
        x |= terms[i];

    return x != 0U ? x : (((0U - (u ^ 'A')) >> 8) & 255U);
}


int main(){
    b64_char_to_byte(0);
}
