I am STONEpiceaBenchmark.

I try to replicate Epicea related STON encoding/decoding.
I write and read a collection of independent objects.

	| benchmark |
	benchmark := STONEpiceaBenchmark new.
	benchmark dataset.
	[ benchmark write ] timeToRun.

	| benchmark |
	benchmark := STONEpiceaBenchmark new.
	benchmark dataset.
	[ benchmark read ] timeToRun.

