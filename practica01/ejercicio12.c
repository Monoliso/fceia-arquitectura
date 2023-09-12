#include <stdio.h>

int main()
{

  float N1 = 100000;
  float N2 = 0.2;
  float N3 = 0.1;

  // a)
  float resA = N1 * (N2 + N3);

  // b)
  float resB = (N1 * N2) + (N1 * N3);

  // c)
  double resAd = N1 * (N2 + N3);
  double resBd = (N1 * N2) + (N1 * N3);

  printf("El resultado a en simple presicion: %f\n", resA);
  printf("El resultado a en doble presicion: %lf\n", resAd);
  printf("\n");
  printf("El resultado b en simple presicion: %f\n", resB);
  printf("El resultado b en doble presicion: %lf\n", resBd);

  printf("%d\n", resA == resAd);
  printf("%d\n", resB == resBd);

  return 0;
}