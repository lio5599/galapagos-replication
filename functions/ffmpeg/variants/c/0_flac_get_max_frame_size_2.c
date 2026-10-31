#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    return 16 + ch * ((7 + bps + 7) / 8)
         + (((ch == 2) ? (2 * bps + 1) : (ch * bps)) * blocksize + 7) / 8
         + 2;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
