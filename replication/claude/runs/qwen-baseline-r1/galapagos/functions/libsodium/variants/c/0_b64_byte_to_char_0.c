#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    if (x < 26)
        return 'A' + x;
    else if (x < 52)
        return 'a' + (x - 26);
    else if (x < 62)
        return '0' + (x - 52);
    else if (x == 62)
        return '+';
    else if (x == 63)
        return '/';
    else
        return 0;
}


int main(){
    b64_byte_to_char(0);
}
