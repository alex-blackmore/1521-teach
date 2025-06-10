	.text
main:
	li	$v0, 4
	la	$a0, prompt_str
	syscall

	li	$v0, 5
	syscall

	move	$t0, $v0

check_cond1:
	bgt	$t0, 100, check_cond2
	b	condition_false
check_cond2:
	blt	$t0, 1000, condition_true
	b	condition_false
condition_true:
	la	$a0, medium_str
	li	$v0, 4
	syscall

	b	condition_end
condition_false:
	la	$a0, small_big_str
	li	$v0, 4
	syscall
condition_end:
	li	$v0, 0
	jr	$ra

	.data
prompt_str:
	.asciiz "Enter a number: "

medium_str:
	.asciiz "medium\n"

small_big_str:
	.asciiz "small/big\n"	