#include <stdio.h>

double f(double x, double a, double b) {
    return a + b * x * x * x;
}

double integral(double a, double  b, double l, double r, int n) {
    double res = 0.0;
    double h = (r - l) / n;
    for (double x = l; x <= r; x += h) {
        res += f(x - h / 2, a, b);
    }
    res *= h;
    return res;
}

int main() {
    double l, r, a, b;
    int n;
    scanf( "%lf", &a );
    scanf( "%lf", &b );
    scanf( "%lf", &l );
    scanf( "%lf", &r );
    scanf("%d", &n);
    double res = integral(a, b, l, r, n);
    printf( "%f", res );
    return 0;
}
