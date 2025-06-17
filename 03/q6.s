N_SIZE = 10

	.text
main:
main__read_loop_init:
	li	$t0, 0
main__read_loop_cond:
	bge	$t0, N_SIZE, main__read_loop_end
main__read_loop_body:
    # find &numbers[i]
    la  $t1, numbers    # $t1 = numbers
    mul $t2, $t0, 4     # $t2 = i * 4
    add $t1, $t1, $t2   # $t1 = numbers + i * 4

    lw      $a0, ($t1)  # $a0 = load from address
                        # numbers + i * 4
    li      $v0, 1
    syscall

    li      $a0, '\n'
    li      $v0, 11
    syscall

main__read_loop_step:
	add	$t0, $t0, 1
	b	main__read_loop_cond
main__read_loop_end:


	li	$v0, 0
	jr	$ra

	.data
numbers:
	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9