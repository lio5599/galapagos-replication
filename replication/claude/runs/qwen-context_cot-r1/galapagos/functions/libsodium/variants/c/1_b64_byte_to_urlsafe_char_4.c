#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Bit manipulation approach similar to reference but simplified
    // Uses arithmetic overflow detection to select correct character set
    int c;
    c = (x < 26) ? 'A' + x : c;
    c = (x >= 26 && x <= 51) ? 'a' + x - 26 : c;
    c = (x >= 52 && x <= 61) ? '0' + x - 52 : c;
    c = (x == 62) ? '-' : c;
    c = (x == 63) ? '_' : c;
    return (x <= 63) ? c : 0;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
