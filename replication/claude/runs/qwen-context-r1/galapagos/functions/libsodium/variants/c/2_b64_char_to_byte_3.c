#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    unsigned int x = 0;
    if (c >= 'A' && c <= 'Z') {
        x = (unsigned int)c - (unsigned int)'A';
    } else if (c >= 'a' && c <= 'z') {
        x = (unsigned int)c - (unsigned int)'a' + 26;
    } else if (c >= '0' && c <= '9') {
        x = (unsigned int)c - (unsigned int)'0' + 52;
    } else if (c == '+') {
        x = 62;
    } else if (c == '/') {
        x = 63;
    }
    return x;
}


int main(){
    b64_char_to_byte(0);
}
