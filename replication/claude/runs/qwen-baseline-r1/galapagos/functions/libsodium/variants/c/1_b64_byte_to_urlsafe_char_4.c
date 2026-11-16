#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    if (x < 26) return (int)('A' + x);
    x -= 26;
    if (x < 26) return (int)('a' + x);
    x -= 26;
    if (x < 10) return (int)('0' + x);
    x -= 10;
    if (x == 0) return '-';
    return '_';
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
