#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int bits = ch * bps;
    int count;

    if (ch == 2) {
        bits += 1;
    }

    count = 16;
    count += ch * ((14 + bps) / 8);
    count += (bits * blocksize + 7) / 8;
    count += 2;

    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
