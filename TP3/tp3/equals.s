.globl matrix_equals_asm

matrix_equals_asm:

        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

  		movl $0, %esi
  		movl $0, %edi
  		jmp ConditionBoucle1


  	ConditionBoucle1 : 
  			cmpl 16(%ebp), %esi 		
 			jl ConditionBoucle2
 			movl $1, %eax
 		  	leave          /* Restore ebp and esp */
        	ret            /* Return to the caller */

 	
 	ConditionBoucle2:
 			cmpl 16(%ebp), %edi
 			jl Boucle 
 			jmp FinBoucle1

 	Boucle:

 		movl 16(%ebp),%ebx
 		imul %esi,%ebx
 		addl %edi,%ebx
 		movl 12(%ebp), %ecx
 		movl 8(%ebp) , %edx
 		movl (%edx,%ebx,4), %edx
 		movl (%ecx, %ebx, 4), %ecx
 		cmpl %edx,%ecx
 		jne Condition
 		jmp FinBoucle2

 	Condition:
 		movl $0, %eax
 		leave
 		ret

 	FinBoucle1:
 		#c++
		addl $1,%esi
		#vérifie si i respecte toujours la condition
		movl $0, %edi
		jmp ConditionBoucle1

	FinBoucle2:

		addl $1, %edi
		jmp ConditionBoucle2