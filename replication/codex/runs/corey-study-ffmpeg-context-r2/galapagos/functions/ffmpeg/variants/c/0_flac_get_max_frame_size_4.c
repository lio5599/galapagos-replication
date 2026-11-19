#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int count = 16;
    int numerator;
    count += ch * ((7 + bps + 7) / 8);
    if (ch == 2) {
        numerator = (2 * bps + 1) * blocksize + 7;
    } else {
        numerator = ch * bps * blocksize + 7;
    }
    count += numerator / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
