#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    unsigned int out = 0;
    if (c >= 'A' && c <= 'Z')
        out = (unsigned int)(c - 'A');
    else if (c >= 'a' && c <= 'z')
        out = (unsigned int)(c - 'a' + 26);
    else if (c >= '0' && c <= '9')
        out = (unsigned int)(c - '0' + 52);
    else if (c == '+')
        out = 62;
    else if (c == '/')
        out = 63;
    return out;
}


int main(){
    b64_char_to_byte(0);
}
