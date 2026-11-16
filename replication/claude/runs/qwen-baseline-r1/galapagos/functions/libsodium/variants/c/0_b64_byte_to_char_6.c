#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    static const unsigned char map[] = {
        'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P',
        'Q','R','S','T','U','V','W','X','Y','Z',
        'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p',
        'q','r','s','t','u','v','w','x','y','z',
        '0','1','2','3','4','5','6','7','8','9',
        '+','/'
    };
    if (x < 64)
        return map[x];
    return 0;
}


int main(){
    b64_byte_to_char(0);
}
