#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    unsigned int total = 16u;

    total += (unsigned int)(ch * ((7 + bps + 7) / 8));
    if (ch == 2) {
        total += (unsigned int)(((2 * bps + 1) * blocksize + 7) / 8);
    } else {
        total += (unsigned int)((ch * bps * blocksize + 7) / 8);
    }
    total += 2u;

    return (int)total;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
