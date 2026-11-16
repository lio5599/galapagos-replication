#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    unsigned int x = 0;
    unsigned int upper_mask = ((unsigned int)(c >= 'A') & (unsigned int)(c <= 'Z'));
    unsigned int lower_mask = ((unsigned int)(c >= 'a') & (unsigned int)(c <= 'z'));
    unsigned int digit_mask = ((unsigned int)(c >= '0') & (unsigned int)(c <= '9'));
    unsigned int plus_mask = (unsigned int)(c == '+');
    unsigned int slash_mask = (unsigned int)(c == '/');
    
    x = upper_mask * ((unsigned int)c - (unsigned int)'A');
    x += lower_mask * ((unsigned int)c - (unsigned int)'a' + 26);
    x += digit_mask * ((unsigned int)c - (unsigned int)'0' + 52);
    x += plus_mask * 62;
    x += slash_mask * 63;
    
    return x;
}


int main(){
    b64_char_to_byte(0);
}
