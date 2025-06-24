	.text
main:
main__prologue:
	push	$ra	# save the original $ra
main__body:

	li	$a0, 11
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal	sum4
	# assume return value in $v0 

	move	$a0, $v0	# print int
	li	$v0, 1
	syscall

	li	$a0, '\n'	# print '\n'
	li	$v0, 11
	syscall

	li	$v0, 0
main__epilogue:
	pop	$ra	# restore original $ra
	jr	$ra

sum4:
sum4__prologue:
	push	$ra	# save original $ra: move	$a0, $v0
	push	$s0	# not allowed to clobber $s0
	push	$s1	# not allowed to clobber $s1
	push	$s2	# not allowed to clobber $s2
sum4__body:
	# save $a2 somewhere ($s0)
	# save $a3 somewhere ($s1)
	move	$s0, $a2
	move	$s1, $a3

	# $a0 already contains a
	# $a1 already contains b
	jal	sum2
	# assume return value left in $v0
	move	$t0, $v0

	# save $t0 somewhere ($s2)
	move	$s2, $t0

	move	$a0, $s0
	move	$a1, $s1
	jal	sum2
	# assume return value in $v0
	move	$t1, $v0

	move	$a0, $s2
	move	$a1, $t1
	jal	sum2

	# assume return value already in $v0
sum4__epilogue:
	pop	$s2	# restore the original $s2
	pop	$s1	# restore the original $s1
	pop	$s0	# restore the original $s0
	pop	$ra	# restore the original $ra
	jr	$ra
sum2:
sum2__prologue:
	push	$s0	# NOT ALLOWED to clobber $s0
sum2__body:
	# assume $a0 = x
	# assume $a1 = y
	add	$t0, $a0, $a1

	# leave return value in $v0
	move	$v0, $t0

	# overwrite $s0
	li	$s0, 999999999

	# clobber (for testing)
	li	$t1, 1521
	li	$t2, 1521
	li	$a0, 1521
	li	$a1, 1521
	li	$a2, 1521
	li	$a3, 1521
sum2__epilogue:
	pop	$s0	# restore original value
	jr	$ra