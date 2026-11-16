#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Uses bitwise logic for ceiling division by 8: (x + 7) / 8.
    // This is equivalent to (x + 7) >> 3 for non-negative x.
    // All inputs are non-negative in valid FLAC parameters.
    int count;
    count = 16;
    count += ch * ((bps + 14) / 8);
    int res_num;
    if (ch == 2) {
        res_num = (2 * bps + 1) * blocksize;
    } else {
        res_num = ch * bps * blocksize;
    }
    count += (res_num + 7) / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
