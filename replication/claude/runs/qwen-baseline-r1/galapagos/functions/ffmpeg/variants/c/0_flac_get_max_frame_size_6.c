#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int count = 16;
    int header_size = ch * ((7 + bps + 7) / 8);
    int data_size;
    if (ch == 2) {
        data_size = ((2 * bps + 1) * blocksize + 7) / 8;
    } else {
        data_size = (ch * bps * blocksize + 7) / 8;
    }
    count += header_size + data_size + 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
