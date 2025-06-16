	.text
main:
	li	$v0, 5		# $t0 contains user input
	syscall			#
	move	$t0, $v0	#

	bne	$t0, 42, label	# branch to label ONLY IF $t0 != 42

	li	$v0, 1		# if ($t0 == 42) {
	li	$a0, 7		# 
	syscall			#
				#
	li	$v0, 11		#
	li	$a0, '\n'	#
	syscall			# }


label:

	li	$v0, 0
	jr	$ra

	.data
str:
	.asciiz "hi!\n"