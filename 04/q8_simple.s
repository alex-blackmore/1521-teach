NSLICES = 4
NROWS = 4
NCOLS = 4

	.text
main:
	# index cube[1][2][3]

	# cube
	# + 1 * NROWS * NCOLS	move past 1 2d array
	# + 2 * NCOLS		move past 2 1d arrays
	# + 3			move past 3 elements
	jr	$ra

	.data
cube:
	.space NSLICES * NROWS * NCOLS
#
# +0 [
#	+0 [x, x, x, x]
#	+4 [x, x, x, x]
#	+8 [x, x, x, x]
#	+12 [x, x, x, x]
# ]	
# +16
#	+16 [x, x, x, x]
#	+20 [x, x, x, x]
#	+24 [x, x, x, x]
#	+28 [x, x, x, x]
# +32
# 
#
#
#
# +48
# 
#
#
#