#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int count;
    int header = 7 + bps;
    header += 7;
    header /= 8;
    header *= ch;
    count = 16 + header;
    if (ch == 2) {
        count += ((2 * bps + 1) * blocksize + 7) / 8;
    } else {
        count += (ch * bps * blocksize + 7) / 8;
    }
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
