#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int count = 16;
    int bits;

    count += ch * ((7 + bps + 7) / 8);
    bits = ch == 2 ? 2 * bps + 1 : ch * bps;
    count += (bits * blocksize + 7) / 8;
    count += 2;

    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
