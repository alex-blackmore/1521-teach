// Print every third number from 24 to 42.
#include <stdio.h>

int main(void) {
    // This 'for' loop is effectively equivalent to a while loop.
    // i.e. it is a while loop with a counter built in.
main__print_loop_init:
        ;
        int x = 24;
main__print_loop_cond:
        if (x >= 42) goto main__print_loop_end;
main__print_loop_body:
        printf("%d\n", x);
main__print_loop_step:
        x += 3;
        goto main__print_loop_cond;
main__print_loop_end:
        return 0;
}