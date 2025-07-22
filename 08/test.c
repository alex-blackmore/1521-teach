#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void) {
    FILE *dave = fopen("test.txt", "r");
    
    int byte = fgetc(dave);
    while (byte != EOF) {
        printf("'%c'\n", byte);
        byte = fgetc(dave);
    }
   
    fclose(dave);

    FILE *jake = fopen("test.txt", "r");

    char buffer[1024];
    
    while (fgets(buffer, 1024, jake) != NULL) {
        printf("%s", buffer);
    }

    fclose(jake);

    FILE *fp = fopen("test.txt", "w");

    char buffer[] = {'a', 'b', 'c', 'd'};

    for (int i = 0; i < 4; i++) {
        fputc(buffer[i], fp);
    }

    fclose(fp);

    FILE *aaron = fopen("t.txt", "r");

    if (aaron == NULL) {
        // fopen failed
        fprintf(stderr, "failed to open aaron!\n"); // custom error
        perror("fopen"); // system error
        exit(1); // terminate the program with status 1
    }

    fprintf(aaron, "%d + %d = %d\n", 1521, 1, 1522);

    fclose(aaron);


    printf("hi!\n");
    fprintf(stdout, "hi!\n");
    fprintf(stderr, "bye!\n");


    FILE *mips = fopen("test.txt", "r");
    char buf[1024];
    fgets(buf, 1024, mips);

    // where is the offset?
    long offset = ftell(mips);

    printf("offset: %ld\n", offset);

    // skip over "I LOVE"
    fseek(mips, 7, SEEK_CUR); // seek relative to current offset


    offset = ftell(mips);

    printf("new offset: %ld\n", offset);

    fgets(buf, 1024, mips);
    printf("%s", buf);

    fseek(mips, 12, SEEK_SET); // seek relative to beginning
    
    printf("new SEEK_SET offset: %ld\n", offset);

    fgets(buf, 1024, mips);
    printf("%s", buf);

    fseek(mips, -5, SEEK_END);
    printf("new SEEK_END offset: %ld\n", offset);

    fgets(buf, 1024, mips);
    printf("%s", buf);

    return 0;
}