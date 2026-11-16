#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    unsigned int result = 0;
    unsigned int is_upper = (c >= 'A') & (c <= 'Z');
    unsigned int is_lower = (c >= 'a') & (c <= 'z');
    unsigned int is_digit = (c >= '0') & (c <= '9');
    unsigned int is_plus = (c == '+');
    unsigned int is_slash = (c == '/');
    
    result = is_upper * (c - 'A');
    result += is_lower * (c - 'a' + 26);
    result += is_digit * (c - '0' + 52);
    result += is_plus * 62;
    result += is_slash * 63;
    
    return result;
}


int main(){
    b64_char_to_byte(0);
}
