
;; Function calculate_area (calculate_area, funcdef_no=0, decl_uid=3399, cgraph_uid=1, symbol_order=1)

double calculate_area (double radius)
{
  double D.3414;

  _1 = radius * radius;
  D.3414 = _1 * 3.141592653589793115997963468544185161590576171875e+0;
  goto <D.3415>;
  <D.3415>:
  return D.3414;
}



;; Function main (main, funcdef_no=1, decl_uid=3401, cgraph_uid=2, symbol_order=2)

int main ()
{
  int i;
  int sum;
  double area;
  int D.3417;

  scanf ("%lf", &r);
  r.0_1 = r;
  area = calculate_area (r.0_1);
  printf ("area is %lf\n", area);
  r.1_2 = r;
  _3 = r.1_2 + 1.0e+0;
  r = _3;
  sum = 0;
  i = 1;
  goto <D.3411>;
  <D.3410>:
  sum = sum + i;
  i = i + 1;
  <D.3411>:
  if (i <= 100) goto <D.3410>; else goto <D.3408>;
  <D.3408>:
  printf ("10 squared is %d and its square root is %f\n", 100, 3.162277660168379522787063251598738133907318115234375e+0);
  switch (sum) <default: <D.3416>, case 5000: <D.3406>, case 5050: <D.3407>>
  <D.3406>:
  __builtin_puts (&"wrong answer"[0]);
  goto <D.3412>;
  <D.3407>:
  __builtin_puts (&"correct answer"[0]);
  goto <D.3412>;
  <D.3412>:
  <D.3416>:
  D.3417 = 0;
  goto <D.3418>;
  D.3417 = 0;
  goto <D.3418>;
  <D.3418>:
  return D.3417;
}


