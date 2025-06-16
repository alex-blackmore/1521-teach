	.text
main:
	
	li	$v0, 4
	la	$a0, prompt_str
	syscall

	li	$v0, 5
	syscall
	move	$t0, $v0 # x in $t0

main__x_cond1:
	bgt	$t0, 100, main__x_cond2
	b	main__x_cond_false
main__x_cond2:
	blt	$t0, 1000, main__x_cond_true
	b	main__x_cond_false
main__x_cond_true:
	li	$v0, 4
	la	$a0, medium_str
	syscall
	b	main__x_end
main__x_cond_false:
	li	$v0, 4
	la	$a0, small_big_str
	syscall
main__x_end:

	li	$v0, 0
	jr	$ra

	.data
prompt_str:
	.asciiz "Enter a number: "

medium_str:
	.asciiz "medium\n"

small_big_str:
	.asciiz "small/big\n"	