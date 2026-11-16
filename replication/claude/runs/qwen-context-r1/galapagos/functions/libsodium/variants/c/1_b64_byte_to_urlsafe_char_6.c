#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
    if (x < 64)
        return table[x];
    return '_';
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
