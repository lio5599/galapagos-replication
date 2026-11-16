#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    unsigned int val = 0;
    if (c >= 'A' && c <= 'Z')
        val = (unsigned int)(c - 'A');
    else if (c >= 'a' && c <= 'z')
        val = (unsigned int)(c - 'a' + 26);
    else if (c >= '0' && c <= '9')
        val = (unsigned int)(c - '0' + 52);
    else if (c == '+')
        val = 62;
    else if (c == '/')
        val = 63;
    return val;
}


int main(){
    b64_char_to_byte(0);
}
