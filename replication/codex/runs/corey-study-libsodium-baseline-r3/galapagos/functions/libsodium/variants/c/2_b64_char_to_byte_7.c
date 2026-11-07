#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    unsigned int u = (unsigned int)c;
    unsigned int x = 0U;
    unsigned int i;

    for (i = 0U; i < 5U; ++i) {
        unsigned int value;
        unsigned int reject;

        switch (i) {
        case 0U:
            value = u - 'A';
            reject = (u - 'A') | ('Z' - u);
            break;
        case 1U:
            value = u - ('a' - 26);
            reject = (u - 'a') | ('z' - u);
            break;
        case 2U:
            value = u - ('0' - 52);
            reject = (u - '0') | ('9' - u);
            break;
        case 3U:
            value = 62U;
            reject = 0U - (u ^ '+');
            break;
        default:
            value = 63U;
            reject = 0U - (u ^ '/');
            break;
        }

        x |= value & ~(reject >> 8) & 255U;
    }

    if (x == 0U)
        x = ((0U - (u ^ 'A')) >> 8) & 255U;
    return x;
}


int main(){
    b64_char_to_byte(0);
}
