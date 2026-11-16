#include <stdint.h>

__attribute__((noinline))
static int vp5_adjust(int v, int t)
{
    // Single ternary expression combining the logic.
    // Returns t if v is negative or >= t, otherwise returns v.
    return (v < 0 || v >= t) ? t : v;
}


int main(){
    vp5_adjust(0,0);
}
