#include <stdio.h>
char *func(void);

int main(void) {
    char *s3 = func();
    printf("%s\n", s3);

}

char *func() {
    char s2[] = "abc";
    return s2;
}