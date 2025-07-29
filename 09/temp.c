#include <stdio.h>
#include <sys/stat.h>

// extern char **environ;

int main(int argc, char *argv[], char *environ[]) {
    for (int i = 0; environ[i] != NULL; i++) {
        puts(environ[i]);
    }
}