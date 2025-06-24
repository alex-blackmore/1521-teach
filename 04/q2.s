	.text
FLAG_ROWS = 6
FLAG_COLS = 12

SIZEOF_CHAR = 1
main:

main__outer_loop_init:
	li	$t0, 0
main__outer_loop_cond:
	bge	$t0, FLAG_ROWS, main__outer_loop_end
main__outer_loop_body:

main__inner_loop_init:
	li	$t1, 0
main__inner_loop_cond:
	bge	$t1, FLAG_COLS, main__inner_loop_end
main__inner_loop_body:

	# flag + row * FLAG_COLS + col
	
	la	$t2, flag		# &flag
	mul	$t3, $t0, FLAG_COLS	# +row*FLAG_COLS
	add	$t2, $t2, $t3		# &flag[row]
	add	$t2, $t2, $t1		# &flag[row][col]
	
	lb	$a0, ($t2)		# flag[row][col]
	li	$v0, 11
	syscall
	
main__inner_loop_step:
	add	$t1, $t1, 1
	b	main__inner_loop_cond
main__inner_loop_end:
	li	$v0, 11
	li	$a0, '\n'
	syscall
main__outer_loop_step:
	add	$t0, $t0, 1
	b	main__outer_loop_cond
main__outer_loop_end:

	li	$v0,	0
	jr	$ra

	.data
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'