	.text
main:
main__print_loop_init:
        li	$t0, 24
main__print_loop_cond:
	bge	$t0, 42, main__print_loop_end
main__print_loop_body:
        li	$v0, 1
	move	$a0, $t0
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall
main__print_loop_step:
        add	$t0, $t0, 3
        b main__print_loop_cond
main__print_loop_end:

	li	$v0, 0
	jr	$ra