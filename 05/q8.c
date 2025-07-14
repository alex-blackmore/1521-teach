#include <stdint.h>
#include <stdio.h>

uint32_t reverse_bits(uint32_t input);

int main(void) {
    uint32_t x;
    printf("gimme a number ");
    scanf("%d", &x);
    printf("%u\n", reverse_bits(x));
}

uint32_t reverse_bits(uint32_t input) {
    uint32_t output = 0;

    // loop over every bit
    for (int i = 0; i < 32; i++) {
        // consider the bit at { 1 << i }
        uint32_t bit_mask = 1 << i;

        uint32_t this_bit = input & bit_mask;
        // input    0b???????? ???????? ???????? ????????
        // bit_mask 0b00000000 00000000 00000100 00000000 (i == 10)
        // this_bit 0b00000000 00000000 00000?00 00000000

        // if the bit is 1, put a 1 in output at the opposite position
        if ((this_bit >> i) == 1) {
            // this_bit >> i = 0b00000000 00000000 00000000 00000001
            uint32_t write_bit = 1 << (31 - i);

            // write_bit = 0b00000000 00000000 00000100 00000000
            output = output | write_bit;

            // output =    0b00000000 00000000 000000?? ????????
            // write_bit = 0b00000000 00000000 00000100 00000000
            //           | 0b00000000 00000000 000001?? ????????

        }
    }

    return output;
}