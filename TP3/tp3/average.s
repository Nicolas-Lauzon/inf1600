.global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

        subl $4, %esp       #r
        movl $0, -4(%ebp)

        movl $0, %eax
  		movl $0, %esi
  		movl $0, %edi
		movl 12(%ebp), %ecx
  		jmp ConditionBoucle1


  	ConditionBoucle1 : 

        movl $0, %eax
        movl -4(%ebp), %esi
  		cmpl 16(%ebp), %esi 		
 		jl ConditionBoucle2
        movl %ecx, 12(%ebp)
 		leave          /* Restore ebp and esp */
        ret            /* Return to the caller */

 	
 	ConditionBoucle2:
 		cmpl 16(%ebp), %edi
 		jl Boucle 
 		jmp FinBoucle1

 	Boucle:
  

 		movl 16(%ebp),%ebx
 		imul -4(%ebp),%ebx
 		addl %edi,%ebx
		
 		
 		movl 8(%ebp), %edx
 		
		movl (%edx,%ebx,4), %edx
		addl %edx, %eax
 		

 	    jmp FinBoucle2

 	FinBoucle1:
 		#c++
		movl 16(%ebp), %esi     #a revoir
        div %esi                #a revoir
        movl -4(%ebp),%esi
        movl %eax, (%ecx,%esi , 4)
        addl $1,-4(%ebp)
		#vérifie si i respecte toujours la condition
		movl $0, %edi
        #movl -4(%ebp), %ebx
        
        
		jmp ConditionBoucle1

	FinBoucle2:

		addl $1, %edi
		jmp ConditionBoucle2           /* return to the caller */
		
