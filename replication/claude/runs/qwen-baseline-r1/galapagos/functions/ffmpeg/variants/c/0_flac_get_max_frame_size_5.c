#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int count;
    count = 16;
    count += ch * ((bps + 14) / 8);
    count += (ch == 2) ? ((2 * bps + 1) * blocksize + 7) / 8 : (ch * bps * blocksize + 7) / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
