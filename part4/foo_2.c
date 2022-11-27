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

int funk(FILE* input, FILE* output) {
    double l, r, a, b;
    int n;
    fscanf(input, "%lf", &a );
    fscanf(input,  "%lf", &b );
    fscanf(input,  "%lf", &l );
    fscanf(input,  "%lf", &r );
    fscanf(input, "%d", &n);
    double res = integral(a, b, l, r, n);
    fprintf(output, "%f", res );
    return 0;
}
