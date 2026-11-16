#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    int offset;
    if (x < 26)
        offset = 'A';
    else if (x < 52)
        offset = 'a' - 26;
    else if (x < 62)
        offset = '0' - 52;
    else if (x == 62)
        return '-';
    else
        return '_';
    return x + offset;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
