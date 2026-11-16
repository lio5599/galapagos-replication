#include <stdint.h>

__attribute__((noinline))
int16_t barrett_reduce(int16_t a) {
  // Same Barrett reduction with explicit constant calculation
  // v = (67108864 + 1664) / 3329 = 67110528 / 3329 = 20160... wait let me recalculate
  // Actually (1<<26) = 67108864, 3329/2 = 1664, so numerator = 67110528
  // 67110528 / 3329 = 20160.0... no, let me compute: 3329 * 20160 = 67112640 which is too big
  // 3329 * 20159 = 67109311, 67110528 - 67109311 = 1217, so v = 20159
  // Wait, the reference uses integer division, so v = 67110528 / 3329
  // Let me just use the same expression to ensure equivalence
  int16_t t;
  const int16_t v = ((1<<26) + 3329/2)/3329;
  t = ((int32_t)v*a + (1<<25)) >> 26;
  t *= 3329;
  return a - t;
}


int main(){
    barrett_reduce(0);
}
