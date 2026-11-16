#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Final clean implementation using nested ternaries.
    // Logic: if v < 0, return t. Else if v > t, return t. Else return v.
    return v < 0 ? t : (v > t ? t : v);
}


int main(){
    vp5_adjust(0,0);
}
