#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    FILE *fp = fopen(argv[1], "r");
    char buf[3];
    fread(buf, 1, 3, fp);


    // expect '1', '2', .. '8'
    char byte;
    fread(&byte, 1, 1, fp);

}

/*

4c  49  54  33  54  32  32 
'L' 'I' 'T' '3' 

0x54  0x32  0x32

0b01010100 0b00110010 0b00110010

0b00110010_00110010_01010100

3289684

uint64_t

*/