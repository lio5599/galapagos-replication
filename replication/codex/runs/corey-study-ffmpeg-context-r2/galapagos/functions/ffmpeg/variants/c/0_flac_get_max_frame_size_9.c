#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int count = 16;
    count += ch * ((7 + bps + 7) / 8);
    if (ch == 2)
        goto stereo;
    count += (ch * bps * blocksize + 7) / 8;
    goto finish;

stereo:
    count += ((2 * bps + 1) * blocksize + 7) / 8;

finish:
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
