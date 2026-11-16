#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Direct lookup table approach for x in [0,63]
    // Maps each index to corresponding URL-safe base64 character
    static const char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
    if (x < 64) return table[x];
    return 0; // Undefined for x >= 64
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
