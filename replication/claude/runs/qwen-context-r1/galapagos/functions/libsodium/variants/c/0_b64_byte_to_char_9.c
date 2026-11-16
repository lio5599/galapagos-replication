#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    int out;
    if (x < 26)
        out = 65 + x;
    else if (x < 52)
        out = 97 + x - 26;
    else if (x < 62)
        out = 48 + x - 52;
    else if (x == 62)
        out = 43;
    else if (x == 63)
        out = 47;
    else
        out = 0;
    return out;
}


int main(){
    b64_byte_to_char(0);
}
