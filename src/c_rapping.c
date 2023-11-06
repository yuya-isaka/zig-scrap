#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  uint8_t data = 255;
  printf("data = %u\n", data);

  data += 1;
  printf("data = %u\n", data);

  int8_t data2 = 127;
  printf("data2 = %d\n", data2);

  data2 += 1;
  printf("data2 = %d\n", data2);

  return EXIT_SUCCESS;
}