#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int count;
    int round_up = 7;
    int sub_bytes = (round_up + bps + round_up) / 8;

    if (ch == 2) {
        int stereo_bits = (2 * bps + 1) * blocksize;
        count = 16 + 2 * sub_bytes + (stereo_bits + round_up) / 8 + 2;
    } else {
        int bits = ch * bps * blocksize;
        count = 16 + ch * sub_bytes + (bits + round_up) / 8 + 2;
    }
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
