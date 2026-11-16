#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    int result;
    if (x <= 25) {
        result = 65 + x;
    } else if (x <= 51) {
        result = 97 + x - 26;
    } else if (x <= 61) {
        result = 48 + x - 52;
    } else if (x == 62) {
        result = 43;
    } else if (x == 63) {
        result = 47;
    } else {
        result = 0;
    }
    return result;
}


int main(){
    b64_byte_to_char(0);
}
