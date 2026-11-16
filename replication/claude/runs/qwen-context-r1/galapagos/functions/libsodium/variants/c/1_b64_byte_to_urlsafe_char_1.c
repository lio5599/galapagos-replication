#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    int result;
    if (x <= 25)
        result = x + 'A';
    else if (x <= 51)
        result = x + 'a' - 26;
    else if (x <= 61)
        result = x + '0' - 52;
    else if (x == 62)
        result = '-';
    else
        result = '_';
    return result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
