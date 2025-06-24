NSLICES = 4
NROWS = 4
NCOLS = 4

	.text
main:

	jr	$ra

	.data
# a bunch of 1d arrays containing 4 char
rows:
	.space NCOLS * NROWS * NSLICES

# a bunch of pointers to 1d arrays
slices:
	.word rows + 0
	.word rows + 4
	.word rows + 8
	.word rows + 12
	.word rows + 16
	.word rows + 20
	.word rows + 24
	.word rows + 28
	.word rows + 32
	.word rows + 36
	.word rows + 40
	.word rows + 44
	.word rows + 48
	.word rows + 52
	.word rows + 56
	.word rows + 60

# a bunch of pointer to 1d arrays of pointers
cube:
	.word slices + 0
	.word slices + 16
	.word slices + 32
	.word slices + 48