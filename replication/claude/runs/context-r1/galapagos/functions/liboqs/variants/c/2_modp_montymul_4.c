#include <stdint.h>

__attribute__((noinline))
uint32_t modp_montymul(uint32_t a, uint32_t b, uint32_t p, uint32_t p0i) {
    uint64_t z, w;
    uint32_t r, d, m;

    z = (uint64_t)a * (uint64_t)b;
    w = ((z * p0i) & (uint64_t)0x7FFFFFFF) * p;
    r = (uint32_t)((z + w) >> 31);
    d = r - p;
    m = (uint32_t)0 - (d >> 31);
    return (d & ~m) | (r & m);
}


int main(){
    modp_montymul(0,0,0,0);
}
