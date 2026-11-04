#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int subframe_header = (bps + 14) / 8;
    int count = 16 + ch * subframe_header;

    if (ch == 2) {
        int stereo_bits = bps + bps + 1;
        count += (stereo_bits * blocksize + 7) / 8;
    } else {
        int channel_bits = ch * bps;
        count += (channel_bits * blocksize + 7) / 8;
    }

    return count + 2;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
