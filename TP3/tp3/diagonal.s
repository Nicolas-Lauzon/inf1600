.globl matrix_diagonal_asm

matrix_diagonal_asm:

        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

  		movl $0, %esi
  		movl $0, %edi
		movl 12(%ebp), %ecx
  		jmp ConditionBoucle1


  	ConditionBoucle1 : 

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
 		imul %esi,%ebx
 		addl %edi,%ebx
		
        
 		movl 8(%ebp), %edx
 		
        cmpl %esi, %edi
        je Diagonale 

		movl $0, (%ecx, %ebx, 4)
        
 	    jmp FinBoucle2

 	FinBoucle1:
 		#c++
		addl $1,%esi
		#vérifie si i respecte toujours la condition
		movl $0, %edi
		jmp ConditionBoucle1

	FinBoucle2:

		addl $1, %edi
		jmp ConditionBoucle2           /* return to the caller */

    Diagonale: 
        movl (%edx,%ebx,4), %edx
		movl %edx, (%ecx, %ebx, 4)
        jmp FinBoucle2