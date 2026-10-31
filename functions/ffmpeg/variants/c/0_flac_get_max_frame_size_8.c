#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int is_stereo = (ch == 2);
    int bits_per_sample_frame = is_stereo ? (bps + bps + 1) : (ch * bps);
    int frame_header_and_footer = 16 + 2;
    int subframe_overhead = ch * ((bps + 14) / 8);
    return frame_header_and_footer + subframe_overhead
         + (bits_per_sample_frame * blocksize + 7) / 8;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
