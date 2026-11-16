#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Array-based lookup with bounds checking
    // Precomputed array maps indices 0-63 to URL-safe base64 chars
    const int lookup[64] = {
        'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P',
        'Q','R','S','T','U','V','W','X','Y','Z',
        'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p',
        'q','r','s','t','u','v','w','x','y','z',
        '0','1','2','3','4','5','6','7','8','9','-','_'
    };
    return (x < 64) ? lookup[x] : 0;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
