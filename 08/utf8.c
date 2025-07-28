#include <stdio.h>

int main(void) {
    // ascii number -> character
    // 0 -> \NUL.     -> 0b00000000
    // ...
    // 10 -> '\n'
    // 20 -> ' '      -> 0b0????????
    // ..
    // 127 -> backspace -> 0b01111111
    // range char -128->127

    // unicode 
    // 0 -> \NUL
    // ...
    // 128526 -> 😎
    // ...
    // range int -217..->217... (approx 2 billion)


    // utf32: store inside int

    // utf8: variable length encoding
    // if the first byte matches 0b0???????, refer to ascii
    // otherwise, if it matches 0b110????? expect one more byte
    // 0b10?????? = 11 (5 bits to tell us length, 11 bits store number)

    // 0b11001111, 0b100011101
    //      01111      0011101
    // 0b011110011101
    // = U+79d (1949)

    // 0b1110???? 0b10?????? 0b10??????

    
    
    // 0b11110??? 0b10?????? 0b10?????? 0b10??????
    // 0b11110000 0b10011111 0b10011000 0b10001110
    //.       000     011111.    011000.    001110
    // 0b000011111011000001110
    // U+1f60e
    
    // U+1F60E
    char buf[] = {0xF0, 0x9F, 0x98, 0x8E, '\n'};
    char *buf1 = "😎";
    printf("%s", buf);


    char str[] = {0x31, 0x32, 0x33, 0x00};
    char *str1 = "123";


}