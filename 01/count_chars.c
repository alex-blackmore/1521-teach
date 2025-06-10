#include <stdio.h>

int global_int;

int main(void) {
    char input = getchar();

    int count = 0;

    while (input != EOF) {
        if (input != '\n') {
            count++;
        }
        input = getchar();
    }

    printf("number of characters: %d\n", count);

    return 0;
}