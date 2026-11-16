#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    int result;
    if (x < 26) {
        result = x + 'A';
    } else if (x < 52) {
        result = x - 26 + 'a';
    } else if (x < 62) {
        result = x - 52 + '0';
    } else if (x == 62) {
        result = '+';
    } else if (x == 63) {
        result = '/';
    } else {
        result = 0;
    }
    return result;
}


int main(){
    b64_byte_to_char(0);
}
