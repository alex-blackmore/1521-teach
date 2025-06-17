N_SIZE = 10
	.text
main:
main__read_loop_init:
	li	$t0, 0
main__read_loop_cond:
	bge	$t0, N_SIZE, main__read_loop_end
main__read_loop_body:
	li	$v0, 5
	syscall
	move	$t1, $v0

	# &numbers[i] = numbers + (i * 4)

	la	$t2, numbers	# $t2 = numbers
	mul	$t3, $t0, 4	# $t3 = i * 4
	add	$t2, $t2, $t3	# $t2 = numbers + i * 4
	sw	$t1, ($t2)	# save $t1 to the address
				# numbers + i * 4

main__read_loop_step:
	add	$t0, $t0, 1
	b	main__read_loop_cond
main__read_loop_end:



	li	$v0, 0
	jr	$ra



	.data
numbers:
	.word 0:N_SIZE