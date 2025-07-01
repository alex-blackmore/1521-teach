#include <stdint.h>

int main(void) {
    uint32_t x;
    printf("gimme a number ");
    scanf("%d", &x);
    printf("%d\n", reverse_bits(x));
}

uint32_t reverse_bits(uint32_t input) {
    uint32_t output = 0;
    // each loop iteration is for the ith bit
    for (int i = 0; i < 32; i++) {
        uint32_t mask = 1u << i;    // 0b00000000 00000000 00010000 00000000
                                    //                       i^ (12)
        uint32_t bit = input & mask;// 0b???????? ???????? ???????? ????????
                                    // 0b00000000 00000000 00010000 00000000
                                    // 0b00000000 00000000 000?0000 00000000

        bit = bit >> i;             // 0b00000000 00000000 000?0000 00000000
                                    // 0b00000000 00000000 00000000 0000000?

        if (bit == 1) {
            // put 1 in this spot in output
            bit = bit << i;         // 0b00000000 00000000 00010000 00000000
            output = output | bit;  // 0b00000000 00000000 00000000 00000000
                                    // 0b00000000 00000000 00010000 00000000
        } else {
            // its already 0
        }
    }
}