.global func_s

func_s:
	flds b
	flds d
	fmulp 
	flds c
	fsubp
	fstps a
	flds f
	flds g
	fsubp 
	flds a
	fdivp 
	flds e
	faddp 
	fstps a
	flds g
	flds e
	fsubp
	flds f
	fdivrp
	flds a
	fmulp
	fstps a

	ret
