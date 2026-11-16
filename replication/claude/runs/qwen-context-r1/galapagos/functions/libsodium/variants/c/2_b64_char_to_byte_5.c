#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    unsigned int val = 0;
    int in_range = 0;
    
    if (c >= 'A' && c <= 'Z') {
        val = c - 'A';
        in_range = 1;
    } else if (c >= 'a' && c <= 'z') {
        val = c - 'a' + 26;
        in_range = 1;
    } else if (c >= '0' && c <= '9') {
        val = c - '0' + 52;
        in_range = 1;
    } else if (c == '+') {
        val = 62;
        in_range = 1;
    } else if (c == '/') {
        val = 63;
        in_range = 1;
    }
    
    return val;
}


int main(){
    b64_char_to_byte(0);
}
