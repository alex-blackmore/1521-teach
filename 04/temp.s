	.text
main:
	li	$a0, 1521
	jal func
	# observe return value
	move	$t0, $v0

	# $t0 should contain my original argument (1521)

	jr	$ra


# argument in $a0
# should return the argument
func:
	# assume user leaves an argument in $a0
	# to return, leave the value in $v0
	move	$v0, $a0

	# move	$v0, $t0