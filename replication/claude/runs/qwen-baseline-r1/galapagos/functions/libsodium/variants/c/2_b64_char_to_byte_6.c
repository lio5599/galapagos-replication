#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    unsigned int res = 0;
    if (c >= 65 && c <= 90)
        res = (unsigned int)(c - 65);
    else if (c >= 97 && c <= 122)
        res = (unsigned int)(c - 97 + 26);
    else if (c >= 48 && c <= 57)
        res = (unsigned int)(c - 48 + 52);
    else if (c == 43)
        res = 62;
    else if (c == 47)
        res = 63;
    return res;
}


int main(){
    b64_char_to_byte(0);
}
