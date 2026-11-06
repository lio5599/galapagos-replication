#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Maps a 6-bit value to its URL-safe base64 char: A-Z, a-z, 0-9, '-', '_'.
    // Approach: a plain if/else chain over the same ranges the masks select.
    // 0..25 gives x+'A', 26..51 gives x+'a'-26, 52..61 gives x+'0'-52.
    // 62 gives '-' and 63 gives '_'.
    // For 64..255 every reference mask is zero, so the result is 0, as here.
    if (x < 26) return (int) (x + 'A');
    else if (x < 52) return (int) (x + ('a' - 26));
    else if (x < 62) return (int) (x + ('0' - 52));
    else if (x == 62) return '-';
    else if (x == 63) return '_';
    return 0;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
