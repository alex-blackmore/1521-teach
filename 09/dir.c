#include <stdio.h>
#include <dirent.h>

int main(void) {
    DIR *directory = opendir("test");

    struct dirent *entry;

    entry = readdir(directory);

    puts(entry->d_name);

    entry = readdir(directory);

    puts(entry->d_name);

    entry = readdir(directory);

    puts(entry->d_name);

    entry = readdir(directory);

    puts(entry->d_name);

    char buffer[128];

    snprintf(buffer, 128, "test/%s", entry->d_name);

    printf("read from file %s\n", buffer);
    

    entry = readdir(directory);

    puts(entry->d_name);

    entry = readdir(directory);

    puts(entry->d_name);

    closedir(directory);
}