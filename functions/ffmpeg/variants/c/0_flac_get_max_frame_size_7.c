#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int result = 0;
    result += 2;
    result += (ch == 2)
            ? (((2 * bps + 1) * blocksize + 7) / 8)
            : ((ch * bps * blocksize + 7) / 8);
    result += ((7 + bps + 7) / 8) * ch;
    result += 16;
    return result;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
