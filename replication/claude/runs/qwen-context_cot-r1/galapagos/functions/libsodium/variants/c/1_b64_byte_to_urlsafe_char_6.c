#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Lookup using computed index into string literal
    // String contains all 64 URL-safe base64 characters in order
    const char *chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
    return (x < 64) ? chars[x] : 0;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
