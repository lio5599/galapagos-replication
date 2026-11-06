#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Searches the Base64 alphabet string; the index found is the decoded value.
    // The 16-bit quirk region w >= 0xFF00 is handled first: 62 if the low byte is '/', otherwise 63.
    // That matches the reference, whose '+' and '/' equality masks wrongly fire there.
    // Every other w that is not one of the 64 alphabet characters returns 0xFF, as the reference does.
    static const char alphabet[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    const unsigned int w = (unsigned int) c & 0xFFFFU;
    unsigned int i;
    if (w >= 0xFF00U) return (w & 0xFFU) == '/' ? 62U : 63U;
    for (i = 0; i < 64U; i++)
        if ((unsigned int) (unsigned char) alphabet[i] == w) return i;
    return 0xFFU;
}


int main(){
    b64_char_to_byte(0);
}
