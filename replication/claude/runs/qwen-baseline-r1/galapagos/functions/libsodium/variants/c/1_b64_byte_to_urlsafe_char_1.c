#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int result;
    if (x <= 25) result = x + 'A';
    else if (x <= 51) result = x - 26 + 'a';
    else if (x <= 61) result = x - 52 + '0';
    else if (x == 62) result = '-';
    else result = '_';
    return (int)result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
