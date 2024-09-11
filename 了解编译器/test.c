#include <math.h>
#include <stdio.h>

// 定义常量
#define PI 3.14159265358979323846
#define SQUARE(x) (x * x)

// 定义全局变量
double r = 4.5;

// 函数调用
double calculate_area(double radius) { return PI * SQUARE(radius); }

int main() {
  scanf("%lf", &r);
  // 调用函数
  double area = calculate_area(r);
  printf("area is %lf\n", area);

  // 增加全局变量的值
  r += 1;

  // for 循环语句
  int sum = 0;
  for (int i = 1; i <= 100; i++)
    sum += i;

  // 使用宏
  printf("10 squared is %d and its square root is %f\n", SQUARE(10), sqrt(10));

  switch (sum) {
  case 5000:
    printf("wrong answer\n");
    break;
  case 5050:
    printf("correct answer\n");
    break;
  }
  return 0;
}
