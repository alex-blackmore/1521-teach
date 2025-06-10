	.text
main:

	li	$v0, 4
	la	$a0, enter_str
	syscall

	li	$v0, 5
	syscall

	mul	$t0, $v0, $v0

	move	$a0, $t0
	li	$v0, 1
	syscall

	li	$a0, '\n'
	li	$v0, 1
	syscall


	li	$v0, 0
	jr	$ra


	.data
enter_str:
	.asciiz "Enter a number: "