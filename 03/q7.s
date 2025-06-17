N_SIZE = 10

	.text
main:
main__read_loop_init:
	li	$t0, 0
main__read_loop_cond:
	bge	$t0, N_SIZE, main__read_loop_end
main__read_loop_body:
	la	$t1, numbers	# $t1 = numbers
	mul	$t2, $t0, 4	# $t2 = i * 4
	add	$t2, $t2, $t1
	lw	$t3, ($t2)	# $t3 = numbers[i] (load from
				# address numbers + i * 4)

	bge	$t3, 0, main__read_loop_step

	add	$t3, $t3, 42
	sw	$t3, ($t2)	# save the new $t3 to the
				# address numbers + i * 4

main__read_loop_step:
	add	$t0, $t0, 1
	b	main__read_loop_cond
main__read_loop_end:

main__print_loop_init:
	li	$t0, 0
main__print_loop_cond:
	bge	$t0, N_SIZE, main__print_loop_end
main__print_loop_body:
	la	$t1, numbers	# $t1 = numbers
	mul	$t2, $t0, 4	# $t2 = i * 4
	add	$t2, $t2, $t1
	lw	$a0, ($t2)	# $t3 = numbers[i] (load from
				# address numbers + i * 4)
	li	$v0, 1
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall
	

main__print_loop_step:
	add	$t0, $t0, 1
	b	main__print_loop_cond
main__print_loop_end:


	li	$v0, 0
	jr	$ra

	.data
numbers:
	.word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9