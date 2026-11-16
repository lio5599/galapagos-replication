#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const char *b64_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    for (int i = 0; i < 64; i++) {
        if (b64_chars[i] == c) {
            return (unsigned int)i;
        }
    }
    return 0;
}


int main(){
    b64_char_to_byte(0);
}
