#include <stdio.h>
#include <stdlib.h>

int main(void) {
    FILE *fp = fopen("test.txt", "w");
    
    if (fp == NULL) {
        perror("fopen (main)");
        exit(1);
    }

    char buffer[] = {'a', 'b', 'c', 'd', '\n'};

    fwrite(buffer, 1, 5, fp);

    fprintf(fp, "I LOVE MIPS\n");

    ssize_t offset = ftell(fp);

    printf("offset: %ld\n", offset);

    if (fseek(fp, -5, SEEK_END) != 0) {
        perror("fseek");
    }

    offset = ftell(fp);

    printf("offset: %ld\n", offset);

    fclose(fp);

    return 0;
}
