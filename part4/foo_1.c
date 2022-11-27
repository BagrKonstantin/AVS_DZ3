#include <stdio.h>

extern void funk(FILE* input, FILE* output);

int main(int argc, char * argv[]) {
    FILE *input = fopen(argv[1], "r");
    FILE *output = fopen(argv[2], "w");
    funk(input, output);
    fclose(input);
    fclose(output);
    return 0;
}
