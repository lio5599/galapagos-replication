#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    const char *urlsafe_b64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
    return (x < 64) ? urlsafe_b64[x] : 0;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
