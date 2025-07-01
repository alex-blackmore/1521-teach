#include <stdint.h>

int main(void) {
    uint32_t x;
    printf("gimme a number ");
    scanf("%d", &x);
    printf("%d\n", six_middle_bits(x));
}

uint32_t six_middle_bits(uint32_t input) {
    uint32_t middle_bits = input & 0b00000000000001111110000000000000;
    // 0b???????? ???????? ???????? ????????
    // 0b00000000 00000111 11100000 00000000
    // 0b00000000 00000??? ???00000 00000000
    uint32_t result = middle_bits >> 13;
    // 0b00000000 00000??? ???00000 00000000
    // 0b00000000 00000000 00000000 00??????
    return result;
}