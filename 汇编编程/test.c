#include <stdio.h>

float arr[4];
float sum = 0;

float add(float a, float b) { return a + b; }

int main() {
  for (int i = 0; i < 4; i++) {
    scanf("%f", &arr[i]);
  }

  for (int i = 0; i < 4; i++) {
    sum = add(sum, arr[i]);
  }
  printf("sum of arr is: %f\n", sum);
  return 0;
}